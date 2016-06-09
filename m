From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 10:51:01 +0200
Subject: [Buildroot] [git commit] package/nodejs: remove icu support from
	0.10.x
Message-ID: <20160609085544.1B10C80258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a08bddc388c0d56ead16d4e827de8c33abdea35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

icu support was added to nodejs in commit 7d0702a, however, 0.10.x does
not have support for icu. The 0.10.x configure script will error
if it is passed the --with-intl option.  This commit removes icu support
from 0.10.x.

Fixes:
 http://autobuild.buildroot.net/results/932e4ec24623592255f234a098f7a90ef2ad8063

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/nodejs.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index efd9308..d6f115a 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -27,12 +27,15 @@ else
 NODEJS_CONF_OPTS += --without-ssl
 endif
 
+# 0.10.x does not have icu support
+ifeq ($(findstring 0.10.,$(NODEJS_VERSION)),)
 ifeq ($(BR2_PACKAGE_ICU),y)
 NODEJS_DEPENDENCIES += icu
 NODEJS_CONF_OPTS += --with-intl=system-icu
 else
 NODEJS_CONF_OPTS += --with-intl=none
 endif
+endif
 
 ifneq ($(BR2_PACKAGE_NODEJS_NPM),y)
 NODEJS_CONF_OPTS += --without-npm
