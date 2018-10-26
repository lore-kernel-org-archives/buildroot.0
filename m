From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 26 Oct 2018 09:29:13 +0300
Subject: [Buildroot] [PATCH] p11-kit: fix detection of certificates path
Message-ID: <345d8a4df761992cceb2890c4cd654b0553c850a.1540535353.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The p11-kit configure script looked for certificates location on the
host. This doesn't work well with cross compilation. Make the
certificates patch depend on BR2_PACKAGE_CA_CERTIFICATES, and set the
right target location of the path.

Fixes:
http://autobuild.buildroot.net/results/295/295614d4aa3db9bb35bebbe56e38110f5a2de178/
http://autobuild.buildroot.net/results/0fb/0fb454ca0df74a8585cffe8f5d1f5d23cdfdbec6/
http://autobuild.buildroot.net/results/ef7/ef71f3d67afba547b5167253fb02476e59152803/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/p11-kit/p11-kit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index d4cf9bc09c4c..10b5cc039300 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -14,4 +14,10 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_CA_CERTIFICATES),y)
+P11_KIT_CONF_OPTS += --with-trust-paths=/etc/ssl/certs/ca-certificates.crt
+else
+P11_KIT_CONF_OPTS += --without-trust-paths
+endif
+
 $(eval $(autotools-package))
-- 
2.19.1
