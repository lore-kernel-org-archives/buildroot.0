From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:32 +0100
Subject: [Buildroot] [PATCH 02/51] package/gcc: comment on why we override
	the generic configure commands
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <bf2aa459bbedafa3c880f2f9586de8aaa362055a.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The explanations given in the commit log of 7d6c79 (Compile static
versions of gcc libraries) do not explain why we have to provide custom
configure commands, instead of just adding --enable-static to the
configure options.

Add a comment in the code that explains why that is so. Add a pointer to
the ML archives with the explanations, too.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: J?r?me Pouiller <jezz@sysmic.org>
---
 package/gcc/gcc-final/gcc-final.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 7802855..dbdb615 100644
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
-- 
1.9.1
