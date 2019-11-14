From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 20:22:08 +0100
Subject: [Buildroot] [PATCH 1/3] package/gettext-tiny: fix prefix in
 autopoint
In-Reply-To: <cover.1573759321.git.yann.morin.1998@free.fr>
References: <cover.1573759321.git.yann.morin.1998@free.fr>
Message-ID: <65fdd6f7c3a5900df8ab25d291fe29293f95b43c.1573759321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gettext-tiny also installs a fake autopoint, but it still needs to be
pointed at the m4 macros, which the template autopoint expects to be in
@datadir@, where datadir is the traditional autotools datadir, derived
from datarootdir, itself derived from prefix.

So, pass prefix so all the locations are properly pointing to HOST_DIR,
instead of the default /usr/local.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gettext-tiny/gettext-tiny.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 23a9d9a057..6ee6269e09 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -52,6 +52,7 @@ HOST_GETTEXT_TINY_POST_PATCH_HOOKS += HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 define HOST_GETTEXT_TINY_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
+		prefix=$(HOST_DIR) \
 		CFLAGS="$(HOST_CFLAGS) -fPIC" \
 		LIBINTL=NONE
 
-- 
2.20.1
