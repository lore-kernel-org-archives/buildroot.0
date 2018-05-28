From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 22:33:47 +0200
Subject: [Buildroot] [git commit] package/binutils: switch from symlinks to
 copies to fix rpath
Message-ID: <20180528203623.D1ACF82A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb0164a8b191e5cbf656a4a6b4c5491d4fc167b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f9cffb6af464 (binutils: replace hard-links with soft-links to fix
rpath) has a side effect that when we build for a noMMU target, elf2flt
will in turn replace some of the programs installed by binutils, with
its own wrappers.

For example, it will rename host/TUPLE/bin/ld to ld.real, and add its
own wrapper in place of the original. It does the same for
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
dereference symlinks and gets confused by the result somehow...

So, in an attempt to restore some sanity in all this mess, we try to
restore the previous behaviour, we no longer use symlinks but just copy
the individual tools.

Fixes: #11031.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index be9e652e10..1c05958f9c 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -132,12 +132,13 @@ endif
 
 # Hardlinks between binaries in different directories cause a problem
 # with rpath fixup, so we de-hardlink those binaries, and replace them
-# with symbolic links.
+# with copies instead.
 BINUTILS_TOOLS = ar as ld ld.bfd nm objcopy objdump ranlib readelf strip
 define HOST_BINUTILS_FIXUP_HARDLINKS
 	$(foreach tool,$(BINUTILS_TOOLS),\
-		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) ; \
-		ln -s ../../bin/$(GNU_TARGET_NAME)-$(tool) $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
+		rm -f $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool) && \
+		cp -a $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-$(tool) \
+			$(HOST_DIR)/$(GNU_TARGET_NAME)/bin/$(tool)
 	)
 endef
 HOST_BINUTILS_POST_INSTALL_HOOKS += HOST_BINUTILS_FIXUP_HARDLINKS
