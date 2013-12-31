From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 11:57:54 +0100
Subject: [Buildroot] [git commit] civetweb: fix build for xtensa
Message-ID: <20131231105813.70EB09C2E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37084ead509fa42db39637fcb837e7a99197c6c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The civetweb package bundled sqlite3 generates an object that is too large for
the xtensa default placement of literals in a dedicated section. Use
-mtext-section-literal to place literals in the text section.

Fixes
http://autobuild.buildroot.net/results/d14/d142f3ce17ab22cc39f9117c114318c1b5cadfc5/.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/civetweb/civetweb.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 4c8f4e8..b950890 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -25,6 +25,9 @@ endif
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 	CIVETWEB_CONF_OPT += WITH_LUA=1
+ifeq ($(BR2_xtensa),y)
+	CIVETWEB_COPT += -mtext-section-literals
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
