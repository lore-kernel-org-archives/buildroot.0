From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 May 2014 12:39:35 +0200
Subject: [Buildroot] [git commit] httping: fix static linking when
	libintl+libiconv are enabled
Message-ID: <20140523104310.EDB409CCF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76bd097b4006316ca2e84a21a23416908439a065
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/365/365d6be787c5560aa1daa28065668261e1171d24/

If libiconv is enabled, libintl will contain references to it, so we need to
explicitly link against it when statically linking against libintl.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/httping/httping.mk |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 610cecb..ca636c0 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -9,9 +9,12 @@ HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
 HTTPING_LICENSE_FILES = license.txt
-HTTPING_LDFLAGS = $(if $(BR2_NEEDS_GETTEXT),-lintl) $(TARGET_LDFLAGS)
+HTTPING_LDFLAGS = $(TARGET_LDFLAGS) \
+	$(if $(BR2_NEEDS_GETTEXT),-lintl) \
+	$(if $(BR2_PACKAGE_LIBICONV),-liconv)
 HTTPING_DEPENDENCIES = host-gettext \
 	$(if $(BR2_NEEDS_GETTEXT),gettext) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw)
 HTTPING_MAKE_OPT = $(TARGET_CONFIGURE_OPTS) \
