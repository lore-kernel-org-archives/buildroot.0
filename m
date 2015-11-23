From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 18:37:20 +0100
Subject: [Buildroot] [git commit] package/gcc: comment on why we override
	the generic configure commands
Message-ID: <20151201232121.3B7D77FD28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf23db235ca0f823b89aaf15835011ad0a52732a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The explanations given in the commit log of 7d6c79 (Compile static
versions of gcc libraries) do not explain why we have to provide custom
configure commands, instead of just adding --enable-static to the
configure options.

Add a comment in the code that explains why that is so. Add a pointer to
the ML archives with the explanations, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 0467ac2..c416b44 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -27,6 +27,15 @@ HOST_GCC_FINAL_SUBDIR = build
 
 HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
 
+# We want to always build the static variants of all the gcc libraries,
+# of which libstdc++, libgomp, libmudflap...
+# To do so, we can not just pass --enable-static to override the generic
+# --disable-static flag, otherwise gcc fails to build some of those
+# libraries, see;
+#   http://lists.busybox.net/pipermail/buildroot/2013-October/080412.html
+#
+# So we must completely override the generic commands and provide our own.
+#
 define  HOST_GCC_FINAL_CONFIGURE_CMDS
 	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
