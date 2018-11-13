From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:44:19 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] p11-kit: fix detection of
 certificates path
Message-ID: <20181113224147.90ED482B92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45852d82ea0d8a75831d94f20e0849bde38f586c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

The p11-kit configure script looked for certificates location on the
host. This doesn't work well with cross compilation. Make the
certificates patch depend on BR2_PACKAGE_CA_CERTIFICATES, and set the
right target location of the path.

Fixes:
http://autobuild.buildroot.net/results/295/295614d4aa3db9bb35bebbe56e38110f5a2de178/
http://autobuild.buildroot.net/results/0fb/0fb454ca0df74a8585cffe8f5d1f5d23cdfdbec6/
http://autobuild.buildroot.net/results/ef7/ef71f3d67afba547b5167253fb02476e59152803/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 30efa8ee7e33013aad607f7599a081e3b66a68fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p11-kit/p11-kit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index d4cf9bc09c..10b5cc0393 100644
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
