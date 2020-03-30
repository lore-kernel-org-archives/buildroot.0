From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Mar 2020 22:40:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/tinyproxy: disable a2x
Message-ID: <20200330204030.133514-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If a2x is found, tinyproxy won't touch the configuration files and will
try to regenerate them which will result in the following build failure:

make[4]: Entering directory `/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output/build/tinyproxy-1.10.0/docs/man5'
  GEN      tinyproxy.conf.5
  File "/accts/mlweber1/bin/a2x", line 76
    print '%s: %s' % (PROG,msg)
          ^
SyntaxError: invalid syntax

Fixes:
 - http://autobuild.buildroot.org/results/fbd81c05f37a3db6df1cbc3495a89957c6587d25

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyproxy/tinyproxy.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index 305be922f5..6120d183cc 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -9,5 +9,6 @@ TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINY
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.bz2
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
+TINYPROXY_CONF_ENV = ac_cv_path_A2X=no
 
 $(eval $(autotools-package))
-- 
2.25.1
