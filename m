From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 May 2018 22:43:01 +0200
Subject: [Buildroot] [PATCH 1/2] package/binutils: switch from symlinks to
 script wrappers
In-Reply-To: <cover.1527280948.git.yann.morin.1998@free.fr>
References: <cover.1527280948.git.yann.morin.1998@free.fr>
Message-ID: <edcb18ed1e8c8d8d0c436e76293d3e802bf0de3b.1527280948.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit f9cffb6af464 (binutils: replace hard-links with soft-links to
fix rpath) has a side effect that when we build for a noMMU target,
elf2flt will in turn replace some of the programs installed by
binutils, with its own wrappers.

For example, it will rename host/TUPLE/bin/ld to ld.real, and add its
own wrapper in place of the origginal. It does the same for
host/bin/TUPLE-ld and host/bin/TUPLE-ld.real.

However, we had already made ld a symlink to ../../bin/TUPLE-ld, so
host/TUPLE/bin/ld.real will still point to host/bin/TUPLE-ld when we
want it to point to ld.real instead...

This ultimately confuses gcc later on.

Of course, the culprit is also elf2flt, which also installs similar
hardlinks that would ultimately exhibit the same rpath issue as the
one fixed by f9cffb6af464. Note: we haven't had an issue so far with
that, because those tools installed by elf2flt only link with libz,
which is most often present on the host system. So, all seem well,
but is nonetheless broken; this will be fixed in a subsequent commit.

But back on topic. If we were to fix elf2flt with similar symlinks,
gcc still gets confused. The underlying reason for this confusion is
not entirely clear, though... It looks like something is trying to
dereference symlinks and gets confused by the resut somehow...

So, in an attempt to restore some sanity in all this mess, we try to
restore the previous behaviour, we switch from using symlinks to using
shell script wrappers. We ensure that the behaviour really mimicks that
of a hardlink, by telling bash to set arg[0] to the name of the script,
not to that of the wrapped executable:

    #!/usr/bin/env bash
    exec -a "${0}" "${0%/*}/../../bin/TUPLE-${0##*/}" "${@}"

"exec -a FOO" is a bashism that telss bash to use FOO as argv[0]
instead of the name of the executable.

With this trick, we're back to working conditions for building for
noMMU targets.

Fixes: #11031.

Note: the wrappers are effectively all totally identical, indeed. We
can optimise that by using hardlinks in a followup commit, if that
even makes sense...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 package/binutils/binutils.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b24e4334c2..25650b31c7 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -132,13 +132,16 @@ endif
 
 # Hardlinks between binaries in different directories cause a problem
 # with rpath fixup, so we de-hardlink those binaries, and replace them
-# with symbolic links.
+# with wrapper scripts.
 BINUTILS_TOOLS = ar as ld ld.bfd nm objcopy objdump ranlib readelf strip
 define HOST_BINUTILS_FIXUP_HARDLINKS
 	$(foreach tool,$(BINUTILS_TOOLS),\
-		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) ; \
-		ln -s ../../bin/$(GNU_TARGET_NAME)-$(tool) $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
+		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) && \
+		printf '#!/usr/bin/env bash\nexec -a "$${0}" "$${0%%/*}/%s-$${0##*/}" "$${@}"\n' \
+			../../bin/$(GNU_TARGET_NAME) \
+			>$(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
 	)
+	chmod +x $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/*
 endef
 HOST_BINUTILS_POST_INSTALL_HOOKS += HOST_BINUTILS_FIXUP_HARDLINKS
 
-- 
2.14.1
