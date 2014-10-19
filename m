From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 20:59:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipset: Fix compile error
Message-ID: <1413745147-12299-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Error occured with an allyespackageconfig setup:

In file included from print.c:19:0:
print.c: In function 'ipset_print_ip':
../include/libipset/data.h:150:1: error: inlining failed in call to 'ipset_data_test': call is unlikely and code size would grow [-Werror=inline]
 ipset_data_test(const struct ipset_data *data, enum ipset_opt opt)
 ^
print.c:273:21: error: called from here [-Werror=inline]
  if (ipset_data_test(data, cidropt)) {

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ipset/ipset.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ipset/ipset.mk b/package/ipset/ipset.mk
index d3dbc67..b1518f4 100644
--- a/package/ipset/ipset.mk
+++ b/package/ipset/ipset.mk
@@ -13,4 +13,6 @@ IPSET_AUTORECONF = YES
 IPSET_LICENSE = GPLv2
 IPSET_LICENSE_FILES = COPYING
 
+IPSET_CONF_ENV = ax_cv_cflags_gcc_option__Winline=""
+
 $(eval $(autotools-package))
-- 
1.7.10.4
