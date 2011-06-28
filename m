From: Benoit Mauduit <benoit.mauduit@gmail.com>
Date: Tue, 28 Jun 2011 14:07:30 +0200
Subject: [Buildroot] [PATCH] [package/config] Change behaviour of symlink
	.config
Message-ID: <1309262850-11224-2-git-send-email-benoit.mauduit@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If .config is a symlink, the target will be modified and the old
.config is saved to .config.old.
---
 package/config/confdata.c |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/package/config/confdata.c b/package/config/confdata.c
index c9f13ee..c00639f 100644
--- a/package/config/confdata.c
+++ b/package/config/confdata.c
@@ -588,7 +588,20 @@ int conf_write(const char *name)
 	} else
 		basename = conf_get_configname();
 
-	sprintf(newname, "%s%s", dirname, basename);
+	sprintf(tmpname, "%s%s", dirname, basename);
+
+	realpath(tmpname, newname);
+
+	if (strcmp(tmpname, newname)) {
+		printf(_("#\n"
+		         "# Warning: Symbolic link detected,"
+		         " the target will be overwritten\n"
+		         "#\n")
+		       );
+
+		tmpname[0] = '\0';
+	}
+
 	env = getenv("KCONFIG_OVERWRITECONFIG");
 	if (!env || !*env) {
 		sprintf(tmpname, "%s.tmpconfig.%d", dirname, (int)getpid());
-- 
1.7.5.2
