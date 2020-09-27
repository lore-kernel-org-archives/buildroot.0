From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 27 Sep 2020 08:08:29 +0300
Subject: [Buildroot] [PATCH] package/bison: disable libtextstyle
Message-ID: <2768149d816c4106d4fe2c1b8753c3487555901b.1601183309.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recent bison versions added support for fancy error output using gettext
provided libtextstyle. The Buildroot gettext version does not provided
all needed features. However host-bison might detect host installed
libtextstyle at configure time, but fail at run time because of missing
symbols in Buildroot provided libtextstyle.

We don't really need fancy output of host packages, so just disable
libtextstyle support.

Fixes (libpcap):
http://autobuild.buildroot.net/results/058e8ec90da3c06e31b31eb94541331cced44db3/
http://autobuild.buildroot.net/results/d99dda99722c53730b5964bd4ff1e1281c4ad759/
http://autobuild.buildroot.net/results/056fd1246554fe7def416429620175e86530c0a7/

Cc: Xogium <contact@xogium.me>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
Hi Xogium,

Can you verify that this indeed fixes libpcap configure on your builder?

Thanks,
baruch
---
 package/bison/bison.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 45364e3cd5e6..70111a8d6297 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -13,5 +13,6 @@ BISON_LICENSE_FILES = COPYING
 BISON_MAKE = $(MAKE1)
 HOST_BISON_DEPENDENCIES = host-m4
 HOST_BISON_CONF_OPTS = --enable-relocatable
+HOST_BISON_CONF_ENV = ac_cv_libtextstyle=no
 
 $(eval $(host-autotools-package))
-- 
2.28.0
