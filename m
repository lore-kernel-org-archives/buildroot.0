From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Jun 2012 00:20:31 +0200
Subject: [Buildroot] [git commit] beecrypt: fix build failure of C++ code
	with g++ 4.7
Message-ID: <20120604222054.DA44896E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74da2cca30852cc12c5f6e83be39e301aff74d62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes
http://autobuild.buildroot.org/results/5c1e904b201676275465c902ba3c09951973755c/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/beecrypt/beecrypt.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index a0187ce..7642c1b 100644
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -7,6 +7,13 @@ BEECRYPT_VERSION = 4.2.1
 BEECRYPT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/beecrypt
 BEECRYPT_AUTORECONF = YES
 BEECRYPT_INSTALL_STAGING = YES
+
+# beecrypt contains C++ code that g++ 4.7 doesn't really
+# like. Upstream does not seem to be really active, so workaround this
+# by passing -fpermissive.
+BEECRYPT_CONF_ENV = \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -fpermissive"
+
 BEECRYPT_CONF_OPT = \
 		--without-java \
 		--without-python
