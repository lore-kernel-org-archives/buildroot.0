From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 22:20:46 +1300
Subject: [Buildroot] [git commit] pure-ftpd: Added pure-ftpd quotas config
	option
Message-ID: <20170124092152.40F3781A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a25798cafddfa597a45f4d7a7a1d51b9db28e27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added the pure-ftp quotas option.  When selected, the --with-quotas
compiler option is passed which enables the quota feature

Note that this increases the size of the pure-ftpd executable by
about 20%.

Signed-off-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pure-ftpd/Config.in    | 8 ++++++++
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
index 85fdef3..57b78d1 100644
--- a/package/pure-ftpd/Config.in
+++ b/package/pure-ftpd/Config.in
@@ -20,4 +20,12 @@ config BR2_PACKAGE_PURE_FTPD_FTPWHO
 	  client sessions.  Only the system administrator may run this.  Output
 	  can be text (default), HTML, XML data and parser-optimized.
 
+config BR2_PACKAGE_PURE_FTPD_QUOTAS
+	bool "quotas"
+	help
+	  Enable virtual quotas. With virtual quotas, restrictions can
+	  be placed on the maximum number of files a user can store in
+	  his account. In addition, restrictions can also be placed
+	  on the total size.
+
 endif
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 80e432a..95e7065 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -49,4 +49,8 @@ ifeq ($(BR2_PACKAGE_PURE_FTPD_FTPWHO),y)
 PURE_FTPD_CONF_OPTS += --with-ftpwho
 endif
 
+ifeq ($(BR2_PACKAGE_PURE_FTPD_QUOTAS),y)
+PURE_FTPD_CONF_OPTS += --with-quotas
+endif
+
 $(eval $(autotools-package))
