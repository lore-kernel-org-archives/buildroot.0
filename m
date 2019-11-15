From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:14:13 +0100
Subject: [Buildroot] [git commit] package/gettext-tiny: fix prefix in
 autopoint
Message-ID: <20191115210824.251988F002@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75a257f45e1f1da2c9ba4f5c4d1598234d0961a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gettext-tiny also installs a fake autopoint, but it still needs to be
pointed at the m4 macros, which the template autopoint expects to be in
@datadir@, where datadir is the traditional autotools datadir, derived
from datarootdir, itself derived from prefix.

So, pass prefix so all the locations are properly pointing to HOST_DIR,
instead of the default /usr/local.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Vadim Kochan <vadim4j@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
