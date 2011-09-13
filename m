From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 13 Sep 2011 10:42:07 +0200
Subject: [Buildroot] [PATCH 1/2] samba: bump to 3.5.11
In-Reply-To: <1315903328-20842-1-git-send-email-s.neumann@raumfeld.com>
References: <87zki95urn.fsf@macbook.be.48ers.dk>
 <1315903328-20842-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1315903328-20842-2-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 3.5.11 and also update the download location.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/samba-00CVE-2011-2694.patch          |   55 --
 package/samba/samba-01CVE-2011-2522.patch          |  749 --------------------
 package/samba/samba-add-check-for-__use_bsd.patch  |   18 -
 .../samba/samba-do-not-check-glibc-version.patch   |  104 ---
 package/samba/samba-fix-client-mtab.patch          |   11 -
 package/samba/samba-fix-mount.cifs.patch           |   35 +-
 package/samba/samba-getgrouplist.patch             |   41 --
 package/samba/samba-remove-legacy-index.patch      |    4 +-
 package/samba/samba.mk                             |    7 +-
 9 files changed, 24 insertions(+), 1000 deletions(-)
 delete mode 100644 package/samba/samba-00CVE-2011-2694.patch
 delete mode 100644 package/samba/samba-01CVE-2011-2522.patch
 delete mode 100644 package/samba/samba-add-check-for-__use_bsd.patch
 delete mode 100644 package/samba/samba-do-not-check-glibc-version.patch
 delete mode 100644 package/samba/samba-fix-client-mtab.patch
 delete mode 100644 package/samba/samba-getgrouplist.patch

diff --git a/package/samba/samba-00CVE-2011-2694.patch b/package/samba/samba-00CVE-2011-2694.patch
deleted file mode 100644
index 167accf..0000000
--- a/package/samba/samba-00CVE-2011-2694.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From d401ccaedaec09ad6900ec24ecaf205bed3e3ac1 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Thu, 7 Jul 2011 10:03:33 +0200
-Subject: [PATCH] s3 swat: Fix possible XSS attack (bug #8289)
-
-Nobuhiro Tsuji of NTT DATA SECURITY CORPORATION reported a possible XSS attack
-against SWAT, the Samba Web Administration Tool. The attack uses reflection to
-insert arbitrary content into the "change password" page.
-
-This patch fixes the reflection issue by not printing user-specified content on
-the website anymore.
-
-Signed-off-by: Kai Blin <kai@samba.org>
-
-CVE-2011-2694.
----
- source/web/swat.c |   14 ++------------
- 1 files changed, 2 insertions(+), 12 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 9c7294a..434b1ac 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -1120,11 +1120,9 @@ static void chg_passwd(void)
- 	if(cgi_variable(CHG_S_PASSWD_FLAG)) {
- 		printf("<p>");
- 		if (rslt == True) {
--			printf(_(" The passwd for '%s' has been changed."), cgi_variable_nonull(SWAT_USER));
--			printf("\n");
-+			printf("%s\n", _(" The passwd has been changed."));
- 		} else {
--			printf(_(" The passwd for '%s' has NOT been changed."), cgi_variable_nonull(SWAT_USER));
--			printf("\n");
-+			printf("%s\n", _(" The passwd has NOT been changed."));
- 		}
- 	}
- 	
-@@ -1138,14 +1136,6 @@ static void passwd_page(void)
- {
- 	const char *new_name = cgi_user_name();
- 
--	/* 
--	 * After the first time through here be nice. If the user
--	 * changed the User box text to another users name, remember it.
--	 */
--	if (cgi_variable(SWAT_USER)) {
--		new_name = cgi_variable_nonull(SWAT_USER);
--	} 
--
- 	if (!new_name) new_name = "";
- 
- 	printf("<H2>%s</H2>\n", _("Server Password Management"));
--- 
-1.7.1
-
diff --git a/package/samba/samba-01CVE-2011-2522.patch b/package/samba/samba-01CVE-2011-2522.patch
deleted file mode 100644
index 7d48b55..0000000
--- a/package/samba/samba-01CVE-2011-2522.patch
+++ /dev/null
@@ -1,749 +0,0 @@
-From b610e0cee563465c6b970647b215f8ae4d0c6599 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 12:56:21 +0200
-Subject: [PATCH 01/12] s3 swat: Allow getting the user's HTTP auth password
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/cgi.c        |    9 +++++++++
- source/web/swat_proto.h |    1 +
- 2 files changed, 10 insertions(+), 0 deletions(-)
-
-diff --git a/source/web/cgi.c b/source/web/cgi.c
-index 72aa11c..ccdc3a7 100644
---- a/source/web/cgi.c
-+++ b/source/web/cgi.c
-@@ -42,6 +42,7 @@ static char *query_string;
- static const char *baseurl;
- static char *pathinfo;
- static char *C_user;
-+static char *C_pass;
- static bool inetd_server;
- static bool got_request;
- 
-@@ -388,6 +389,7 @@ static bool cgi_handle_authorization(char *line)
- 			
- 			/* Save the users name */
- 			C_user = SMB_STRDUP(user);
-+			C_pass = SMB_STRDUP(user_pass);
- 			TALLOC_FREE(pass);
- 			return True;
- 		}
-@@ -422,6 +424,13 @@ char *cgi_user_name(void)
-         return(C_user);
- }
- 
-+/***************************************************************************
-+return a ptr to the users password
-+  ***************************************************************************/
-+char *cgi_user_pass(void)
-+{
-+        return(C_pass);
-+}
- 
- /***************************************************************************
- handle a file download
-diff --git a/source/web/swat_proto.h b/source/web/swat_proto.h
-index 0f84e4f..76f9c3c 100644
---- a/source/web/swat_proto.h
-+++ b/source/web/swat_proto.h
-@@ -31,6 +31,7 @@ const char *cgi_variable(const char *name);
- const char *cgi_variable_nonull(const char *name);
- bool am_root(void);
- char *cgi_user_name(void);
-+char *cgi_user_pass(void);
- void cgi_setup(const char *rootdir, int auth_required);
- const char *cgi_baseurl(void);
- const char *cgi_pathinfo(void);
--- 
-1.7.1
-
-
-From 3806fec53dcf3b6e5c3fd71917f9d67d47c65e32 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 12:57:43 +0200
-Subject: [PATCH 02/12] s3 swat: Add support for anti-XSRF token
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c       |   54 +++++++++++++++++++++++++++++++++++++++++++++++
- source/web/swat_proto.h |    5 ++++
- 2 files changed, 59 insertions(+), 0 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 434b1ac..e7d84e5 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -29,6 +29,7 @@
- 
- #include "includes.h"
- #include "web/swat_proto.h"
-+#include "../lib/crypto/md5.h"
- 
- static int demo_mode = False;
- static int passwd_only = False;
-@@ -50,6 +51,7 @@ static int iNumNonAutoPrintServices = 0;
- #define DISABLE_USER_FLAG "disable_user_flag"
- #define ENABLE_USER_FLAG "enable_user_flag"
- #define RHOST "remote_host"
-+#define XSRF_TOKEN "xsrf"
- 
- #define _(x) lang_msg_rotate(talloc_tos(),x)
- 
-@@ -138,6 +140,58 @@ static char *make_parm_name(const char *label)
- 	return parmname;
- }
- 
-+void get_xsrf_token(const char *username, const char *pass,
-+		    const char *formname, char token_str[33])
-+{
-+	struct MD5Context md5_ctx;
-+	uint8_t token[16];
-+	int i;
-+
-+	token_str[0] = '\0';
-+	ZERO_STRUCT(md5_ctx);
-+	MD5Init(&md5_ctx);
-+
-+	MD5Update(&md5_ctx, (uint8_t *)formname, strlen(formname));
-+	if (username != NULL) {
-+		MD5Update(&md5_ctx, (uint8_t *)username, strlen(username));
-+	}
-+	if (pass != NULL) {
-+		MD5Update(&md5_ctx, (uint8_t *)pass, strlen(pass));
-+	}
-+
-+	MD5Final(token, &md5_ctx);
-+
-+	for(i = 0; i < sizeof(token); i++) {
-+		char tmp[3];
-+
-+		snprintf(tmp, sizeof(tmp), "%02x", token[i]);
-+		strncat(token_str, tmp, sizeof(tmp));
-+	}
-+}
-+
-+void print_xsrf_token(const char *username, const char *pass,
-+		      const char *formname)
-+{
-+	char token[33];
-+
-+	get_xsrf_token(username, pass, formname, token);
-+	printf("<input type=\"hidden\" name=\"%s\" value=\"%s\">\n",
-+	       XSRF_TOKEN, token);
-+
-+}
-+
-+bool verify_xsrf_token(const char *formname)
-+{
-+	char expected[33];
-+	const char *username = cgi_user_name();
-+	const char *pass = cgi_user_pass();
-+	const char *token = cgi_variable_nonull(XSRF_TOKEN);
-+
-+	get_xsrf_token(username, pass, formname, expected);
-+	return (strncmp(expected, token, sizeof(expected)) == 0);
-+}
-+
-+
- /****************************************************************************
-   include a lump of html in a page 
- ****************************************************************************/
-diff --git a/source/web/swat_proto.h b/source/web/swat_proto.h
-index 76f9c3c..e66c942 100644
---- a/source/web/swat_proto.h
-+++ b/source/web/swat_proto.h
-@@ -67,5 +67,10 @@ void status_page(void);
- /* The following definitions come from web/swat.c  */
- 
- const char *lang_msg_rotate(TALLOC_CTX *ctx, const char *msgid);
-+void get_xsrf_token(const char *username, const char *pass,
-+		    const char *formname, char token_str[33]);
-+void print_xsrf_token(const char *username, const char *pass,
-+		      const char *formname);
-+bool verify_xsrf_token(const char *formname);
- 
- #endif /*  _SWAT_PROTO_H_  */
--- 
-1.7.1
-
-
-From 3f38cf42facc38c19e0448cbae3078b9606b08e4 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 12:58:53 +0200
-Subject: [PATCH 03/12] s3 swat: Add XSRF protection to status page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/statuspage.c |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
-diff --git a/source/web/statuspage.c b/source/web/statuspage.c
-index 8070ae7..fe545e4 100644
---- a/source/web/statuspage.c
-+++ b/source/web/statuspage.c
-@@ -247,9 +247,14 @@ void status_page(void)
- 	int nr_running=0;
- 	bool waitup = False;
- 	TALLOC_CTX *ctx = talloc_stackframe();
-+	const char form_name[] = "status";
- 
- 	smbd_pid = pid_to_procid(pidfile_pid("smbd"));
- 
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
-+
- 	if (cgi_variable("smbd_restart") || cgi_variable("all_restart")) {
- 		stop_smbd();
- 		start_smbd();
-@@ -326,9 +331,11 @@ void status_page(void)
- 
- 	initPid2Machine ();
- 
-+output_page:
- 	printf("<H2>%s</H2>\n", _("Server Status"));
- 
- 	printf("<FORM method=post>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
- 
- 	if (!autorefresh) {
- 		printf("<input type=submit value=\"%s\" name=\"autorefresh\">\n", _("Auto Refresh"));
--- 
-1.7.1
-
-
-From ba996f0ae87f6bf4f19a4918e44dbd6d44a96561 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:02:53 +0200
-Subject: [PATCH 04/12] s3 swat: Add XSRF protection to viewconfig page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index e7d84e5..647126f 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -664,13 +664,20 @@ static void welcome_page(void)
- static void viewconfig_page(void)
- {
- 	int full_view=0;
-+	const char form_name[] = "viewconfig";
-+
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
- 
- 	if (cgi_variable("full_view")) {
- 		full_view = 1;
- 	}
- 
-+output_page:
- 	printf("<H2>%s</H2>\n", _("Current Config"));
- 	printf("<form method=post>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
- 
- 	if (full_view) {
- 		printf("<input type=submit name=\"normal_view\" value=\"%s\">\n", _("Normal View"));
--- 
-1.7.1
-
-
-From 94f8482607a175c44436fae456fbda3624629982 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:03:15 +0200
-Subject: [PATCH 05/12] s3 swat: Add XSRF protection to wizard_params page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 647126f..b7eec4a 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -697,18 +697,25 @@ output_page:
- static void wizard_params_page(void)
- {
- 	unsigned int parm_filter = FLAG_WIZARD;
-+	const char form_name[] = "wizard_params";
- 
- 	/* Here we first set and commit all the parameters that were selected
-  	   in the previous screen. */
- 
- 	printf("<H2>%s</H2>\n", _("Wizard Parameter Edit Page"));
- 
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
-+
- 	if (cgi_variable("Commit")) {
- 		commit_parameters(GLOBAL_SECTION_SNUM);
- 		save_reload(0);
- 	}
- 
-+output_page:
- 	printf("<form name=\"swatform\" method=post action=wizard_params>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
- 
- 	if (have_write_access) {
- 		printf("<input type=submit name=\"Commit\" value=\"Commit Changes\">\n");
--- 
-1.7.1
-
-
-From eb22fd73060534700d514ec295985549131c7569 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:03:44 +0200
-Subject: [PATCH 06/12] s3 swat: Add XSRF protection to wizard page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |    9 ++++++++-
- 1 files changed, 8 insertions(+), 1 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index b7eec4a..b6e0c0f 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -751,6 +751,11 @@ static void wizard_page(void)
- 	int have_home = -1;
- 	int HomeExpo = 0;
- 	int SerType = 0;
-+	const char form_name[] = "wizard";
-+
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
- 
- 	if (cgi_variable("Rewrite")) {
- 		(void) rewritecfg_file();
-@@ -841,10 +846,12 @@ static void wizard_page(void)
- 		winstype = 3;
- 
- 	role = lp_server_role();
--	
-+
-+output_page:
- 	/* Here we go ... */
- 	printf("<H2>%s</H2>\n", _("Samba Configuration Wizard"));
- 	printf("<form method=post action=wizard>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
- 
- 	if (have_write_access) {
- 		printf("%s\n", _("The \"Rewrite smb.conf file\" button will clear the smb.conf file of all default values and of comments."));
--- 
-1.7.1
-
-
-From 8fb3064eeaa3640af6c8b91aa5859d8bfb6d0888 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:04:12 +0200
-Subject: [PATCH 07/12] s3 swat: Add XSRF protection to globals page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index b6e0c0f..5d11685 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -920,9 +920,14 @@ static void globals_page(void)
- {
- 	unsigned int parm_filter = FLAG_BASIC;
- 	int mode = 0;
-+	const char form_name[] = "globals";
- 
- 	printf("<H2>%s</H2>\n", _("Global Parameters"));
- 
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
-+
- 	if (cgi_variable("Commit")) {
- 		commit_parameters(GLOBAL_SECTION_SNUM);
- 		save_reload(0);
-@@ -935,7 +940,9 @@ static void globals_page(void)
- 	if ( cgi_variable("AdvMode"))
- 		mode = 1;
- 
-+output_page:
- 	printf("<form name=\"swatform\" method=post action=globals>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
- 
- 	ViewModeBoxes( mode );
- 	switch ( mode ) {
--- 
-1.7.1
-
-
-From ef457a20422cfa8231e25b539d2cd87f299686b9 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:04:48 +0200
-Subject: [PATCH 08/12] s3 swat: Add XSRF protection to shares page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |   18 +++++++++++++-----
- 1 files changed, 13 insertions(+), 5 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 5d11685..4544c31 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -982,11 +982,17 @@ static void shares_page(void)
- 	int mode = 0;
- 	unsigned int parm_filter = FLAG_BASIC;
- 	size_t converted_size;
-+	const char form_name[] = "shares";
-+
-+	printf("<H2>%s</H2>\n", _("Share Parameters"));
-+
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
- 
- 	if (share)
- 		snum = lp_servicenumber(share);
- 
--	printf("<H2>%s</H2>\n", _("Share Parameters"));
- 
- 	if (cgi_variable("Commit") && snum >= 0) {
- 		commit_parameters(snum);
-@@ -1012,10 +1018,6 @@ static void shares_page(void)
- 		}
- 	}
- 
--	printf("<FORM name=\"swatform\" method=post>\n");
--
--	printf("<table>\n");
--
- 	if ( cgi_variable("ViewMode") )
- 		mode = atoi(cgi_variable_nonull("ViewMode"));
- 	if ( cgi_variable("BasicMode"))
-@@ -1023,6 +1025,12 @@ static void shares_page(void)
- 	if ( cgi_variable("AdvMode"))
- 		mode = 1;
- 
-+output_page:
-+	printf("<FORM name=\"swatform\" method=post>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
-+
-+	printf("<table>\n");
-+
- 	ViewModeBoxes( mode );
- 	switch ( mode ) {
- 		case 0:
--- 
-1.7.1
-
-
-From 4850456845d2da5e3451716a5ad4ca0ef034e01f Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:05:38 +0200
-Subject: [PATCH 09/12] s3 swat: Add XSRF protection to password page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |   11 ++++++++---
- 1 files changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 4544c31..5242484 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -1225,12 +1225,15 @@ static void chg_passwd(void)
- static void passwd_page(void)
- {
- 	const char *new_name = cgi_user_name();
-+	const char passwd_form[] = "passwd";
-+	const char rpasswd_form[] = "rpasswd";
- 
- 	if (!new_name) new_name = "";
- 
- 	printf("<H2>%s</H2>\n", _("Server Password Management"));
- 
- 	printf("<FORM name=\"swatform\" method=post>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), passwd_form);
- 
- 	printf("<table>\n");
- 
-@@ -1270,14 +1273,16 @@ static void passwd_page(void)
- 	 * Do some work if change, add, disable or enable was
- 	 * requested. It could be this is the first time through this
- 	 * code, so there isn't anything to do.  */
--	if ((cgi_variable(CHG_S_PASSWD_FLAG)) || (cgi_variable(ADD_USER_FLAG)) || (cgi_variable(DELETE_USER_FLAG)) ||
--	    (cgi_variable(DISABLE_USER_FLAG)) || (cgi_variable(ENABLE_USER_FLAG))) {
-+	if (verify_xsrf_token(passwd_form) &&
-+	   ((cgi_variable(CHG_S_PASSWD_FLAG)) || (cgi_variable(ADD_USER_FLAG)) || (cgi_variable(DELETE_USER_FLAG)) ||
-+	    (cgi_variable(DISABLE_USER_FLAG)) || (cgi_variable(ENABLE_USER_FLAG)))) {
- 		chg_passwd();		
- 	}
- 
- 	printf("<H2>%s</H2>\n", _("Client/Server Password Management"));
- 
- 	printf("<FORM name=\"swatform\" method=post>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), rpasswd_form);
- 
- 	printf("<table>\n");
- 
-@@ -1310,7 +1315,7 @@ static void passwd_page(void)
- 	 * password somewhere other than the server. It could be this
- 	 * is the first time through this code, so there isn't
- 	 * anything to do.  */
--	if (cgi_variable(CHG_R_PASSWD_FLAG)) {
-+	if (verify_xsrf_token(passwd_form) && cgi_variable(CHG_R_PASSWD_FLAG)) {
- 		chg_passwd();		
- 	}
- 
--- 
-1.7.1
-
-
-From 407ae61fbfc8ee1643a4db8ea9b104f031b32e0f Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Fri, 8 Jul 2011 15:06:13 +0200
-Subject: [PATCH 10/12] s3 swat: Add XSRF protection to printer page
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c |   28 ++++++++++++++++++----------
- 1 files changed, 18 insertions(+), 10 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 5242484..4582a63 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -1332,18 +1332,15 @@ static void printers_page(void)
- 	int i;
- 	int mode = 0;
- 	unsigned int parm_filter = FLAG_BASIC;
-+	const char form_name[] = "printers";
-+
-+	if (!verify_xsrf_token(form_name)) {
-+		goto output_page;
-+	}
- 
- 	if (share)
- 		snum = lp_servicenumber(share);
- 
--        printf("<H2>%s</H2>\n", _("Printer Parameters"));
-- 
--        printf("<H3>%s</H3>\n", _("Important Note:"));
--        printf("%s",_("Printer names marked with [*] in the Choose Printer drop-down box "));
--        printf("%s",_("are autoloaded printers from "));
--        printf("<A HREF=\"/swat/help/smb.conf.5.html#printcapname\" target=\"docs\">%s</A>\n", _("Printcap Name"));
--        printf("%s\n", _("Attempting to delete these printers from SWAT will have no effect."));
--
- 	if (cgi_variable("Commit") && snum >= 0) {
- 		commit_parameters(snum);
- 		if (snum >= iNumNonAutoPrintServices)
-@@ -1372,8 +1369,6 @@ static void printers_page(void)
- 		}
- 	}
- 
--	printf("<FORM name=\"swatform\" method=post>\n");
--
- 	if ( cgi_variable("ViewMode") )
- 		mode = atoi(cgi_variable_nonull("ViewMode"));
-         if ( cgi_variable("BasicMode"))
-@@ -1381,6 +1376,19 @@ static void printers_page(void)
-         if ( cgi_variable("AdvMode"))
-                 mode = 1;
- 
-+output_page:
-+        printf("<H2>%s</H2>\n", _("Printer Parameters"));
-+
-+        printf("<H3>%s</H3>\n", _("Important Note:"));
-+        printf("%s",_("Printer names marked with [*] in the Choose Printer drop-down box "));
-+        printf("%s",_("are autoloaded printers from "));
-+        printf("<A HREF=\"/swat/help/smb.conf.5.html#printcapname\" target=\"docs\">%s</A>\n", _("Printcap Name"));
-+        printf("%s\n", _("Attempting to delete these printers from SWAT will have no effect."));
-+
-+
-+	printf("<FORM name=\"swatform\" method=post>\n");
-+	print_xsrf_token(cgi_user_name(), cgi_user_pass(), form_name);
-+
- 	ViewModeBoxes( mode );
- 	switch ( mode ) {
- 		case 0:
--- 
-1.7.1
-
-
-From 11e281228f334bf3d384df5655136f0b4b4068aa Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Sat, 9 Jul 2011 09:52:07 +0200
-Subject: [PATCH 11/12] s3 swat: Add time component to XSRF token
-
-Signed-off-by: Kai Blin <kai@samba.org>
----
- source/web/swat.c       |   28 ++++++++++++++++++++++++----
- source/web/swat_proto.h |    2 +-
- 2 files changed, 25 insertions(+), 5 deletions(-)
-
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 4582a63..50df66e 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -52,6 +52,8 @@ static int iNumNonAutoPrintServices = 0;
- #define ENABLE_USER_FLAG "enable_user_flag"
- #define RHOST "remote_host"
- #define XSRF_TOKEN "xsrf"
-+#define XSRF_TIME "xsrf_time"
-+#define XSRF_TIMEOUT 300
- 
- #define _(x) lang_msg_rotate(talloc_tos(),x)
- 
-@@ -141,7 +143,7 @@ static char *make_parm_name(const char *label)
- }
- 
- void get_xsrf_token(const char *username, const char *pass,
--		    const char *formname, char token_str[33])
-+		    const char *formname, time_t xsrf_time, char token_str[33])
- {
- 	struct MD5Context md5_ctx;
- 	uint8_t token[16];
-@@ -152,6 +154,7 @@ void get_xsrf_token(const char *username, const char *pass,
- 	MD5Init(&md5_ctx);
- 
- 	MD5Update(&md5_ctx, (uint8_t *)formname, strlen(formname));
-+	MD5Update(&md5_ctx, (uint8_t *)&xsrf_time, sizeof(time_t));
- 	if (username != NULL) {
- 		MD5Update(&md5_ctx, (uint8_t *)username, strlen(username));
- 	}
-@@ -173,11 +176,13 @@ void print_xsrf_token(const char *username, const char *pass,
- 		      const char *formname)
- {
- 	char token[33];
-+	time_t xsrf_time = time(NULL);
- 
--	get_xsrf_token(username, pass, formname, token);
-+	get_xsrf_token(username, pass, formname, xsrf_time, token);
- 	printf("<input type=\"hidden\" name=\"%s\" value=\"%s\">\n",
- 	       XSRF_TOKEN, token);
--
-+	printf("<input type=\"hidden\" name=\"%s\" value=\"%lld\">\n",
-+	       XSRF_TIME, (long long int)xsrf_time);
- }
- 
- bool verify_xsrf_token(const char *formname)
-@@ -186,8 +191,23 @@ bool verify_xsrf_token(const char *formname)
- 	const char *username = cgi_user_name();
- 	const char *pass = cgi_user_pass();
- 	const char *token = cgi_variable_nonull(XSRF_TOKEN);
-+	const char *time_str = cgi_variable_nonull(XSRF_TIME);
-+	time_t xsrf_time = 0;
-+	time_t now = time(NULL);
-+
-+	if (sizeof(time_t) == sizeof(int)) {
-+		xsrf_time = atoi(time_str);
-+	} else if (sizeof(time_t) == sizeof(long)) {
-+		xsrf_time = atol(time_str);
-+	} else if (sizeof(time_t) == sizeof(long long)) {
-+		xsrf_time = atoll(time_str);
-+	}
-+
-+	if (abs(now - xsrf_time) > XSRF_TIMEOUT) {
-+		return false;
-+	}
- 
--	get_xsrf_token(username, pass, formname, expected);
-+	get_xsrf_token(username, pass, formname, xsrf_time, expected);
- 	return (strncmp(expected, token, sizeof(expected)) == 0);
- }
- 
-diff --git a/source/web/swat_proto.h b/source/web/swat_proto.h
-index e66c942..424a3af 100644
---- a/source/web/swat_proto.h
-+++ b/source/web/swat_proto.h
-@@ -68,7 +68,7 @@ void status_page(void);
- 
- const char *lang_msg_rotate(TALLOC_CTX *ctx, const char *msgid);
- void get_xsrf_token(const char *username, const char *pass,
--		    const char *formname, char token_str[33]);
-+		    const char *formname, time_t xsrf_time, char token_str[33]);
- void print_xsrf_token(const char *username, const char *pass,
- 		      const char *formname);
- bool verify_xsrf_token(const char *formname);
--- 
-1.7.1
-
-
-From 3973cfa50024983618a44ffdb9f756b642b85be7 Mon Sep 17 00:00:00 2001
-From: Kai Blin <kai@samba.org>
-Date: Tue, 12 Jul 2011 08:08:24 +0200
-Subject: [PATCH 12/12] s3 swat: Create random nonce in CGI mode
-
-In CGI mode, we don't get access to the user's password, which would
-reduce the hash used so far to parameters an attacker can easily guess.
-To work around this, read the nonce from secrets.tdb or generate one if
-it's not there.
-Also populate the C_user field so we can use that for token creation.
-
-Signed-off-by: Kai Blin <kai@samba.org>
-
-The last 12 patches address bug #8290 (CSRF vulnerability in SWAT).
-This addresses CVE-2011-2522 (Cross-Site Request Forgery in SWAT).
----
- source/web/cgi.c  |   18 +++++++++++++++++-
- source/web/swat.c |    1 -
- 2 files changed, 17 insertions(+), 2 deletions(-)
-
-diff --git a/source/web/cgi.c b/source/web/cgi.c
-index ccdc3a7..890ac8e 100644
---- a/source/web/cgi.c
-+++ b/source/web/cgi.c
-@@ -19,6 +19,7 @@
- 
- #include "includes.h"
- #include "web/swat_proto.h"
-+#include "secrets.h"
- 
- #define MAX_VARIABLES 10000
- 
-@@ -321,7 +322,22 @@ static void cgi_web_auth(void)
- 		exit(0);
- 	}
- 
--	setuid(0);
-+	C_user = SMB_STRDUP(user);
-+
-+	if (!setuid(0)) {
-+		C_pass = secrets_fetch_generic("root", "SWAT");
-+		if (C_pass == NULL) {
-+			char *tmp_pass = NULL;
-+			tmp_pass = generate_random_str(16);
-+			if (tmp_pass == NULL) {
-+				printf("%sFailed to create random nonce for "
-+				       "SWAT session\n<br>%s\n", head, tail);
-+				exit(0);
-+			}
-+			secrets_store_generic("root", "SWAT", tmp_pass);
-+			C_pass = SMB_STRDUP(tmp_pass);
-+		}
-+	}
- 	setuid(pwd->pw_uid);
- 	if (geteuid() != pwd->pw_uid || getuid() != pwd->pw_uid) {
- 		printf("%sFailed to become user %s - uid=%d/%d<br>%s\n", 
-diff --git a/source/web/swat.c b/source/web/swat.c
-index 50df66e..146f1cf 100644
---- a/source/web/swat.c
-+++ b/source/web/swat.c
-@@ -29,7 +29,6 @@
- 
- #include "includes.h"
- #include "web/swat_proto.h"
--#include "../lib/crypto/md5.h"
- 
- static int demo_mode = False;
- static int passwd_only = False;
--- 
-1.7.1
-
diff --git a/package/samba/samba-add-check-for-__use_bsd.patch b/package/samba/samba-add-check-for-__use_bsd.patch
deleted file mode 100644
index a4c7109..0000000
--- a/package/samba/samba-add-check-for-__use_bsd.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- a/source/client/mount.cifs.c	2009-04-01 13:48:54.000000000 +0200
-+++ b/source/client/mount.cifs.c	2009-04-20 12:59:57.000000000 +0200
-@@ -100,6 +100,7 @@
- 
- /* glibc doesn't have strlcpy, strlcat. Ensure we do. JRA. We
-  * don't link to libreplace so need them here. */
-+#if defined(__GLIBC__) && !(defined(__UCLIBC__) && defined(__USE_BSD))
- 
- /* like strncpy but does not 0 fill the buffer and always null
-  *    terminates. bufsize is the size of the destination buffer */
-@@ -181,6 +182,7 @@
- 	SAFE_FREE(mountpassword);
- 	exit(EX_USAGE);
- }
-+#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* caller frees username if necessary */
- static char * getusername(void) {
diff --git a/package/samba/samba-do-not-check-glibc-version.patch b/package/samba/samba-do-not-check-glibc-version.patch
deleted file mode 100644
index c5e3cd4..0000000
--- a/package/samba/samba-do-not-check-glibc-version.patch
+++ /dev/null
@@ -1,104 +0,0 @@
---- a/source/configure	2009-04-01 14:19:36.000000000 +0200
-+++ b/source/configure	2009-04-20 13:05:12.000000000 +0200
-@@ -44061,90 +44061,8 @@
- 
- rm -f core conftest.err conftest.$ac_objext conftest.$ac_ext
- 
--#
--#
--#
--case "$host_os" in
--    *linux*)
--       # glibc <= 2.3.2 has a broken getgrouplist
--       if test "$cross_compiling" = yes; then
--  { { $as_echo "$as_me:$LINENO: error: in \`$ac_pwd':" >&5
--$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
--{ { $as_echo "$as_me:$LINENO: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&5
--$as_echo "$as_me: error: cannot run test program while cross compiling
--See \`config.log' for more details." >&2;}
--   { (exit 1); exit 1; }; }; }
--else
--  cat >conftest.$ac_ext <<_ACEOF
--/* confdefs.h.  */
--_ACEOF
--cat confdefs.h >>conftest.$ac_ext
--cat >>conftest.$ac_ext <<_ACEOF
--/* end confdefs.h.  */
--
--#include <unistd.h>
--#include <sys/utsname.h>
--main() {
--       /* glibc up to 2.3 has a broken getgrouplist */
--#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
--       int libc_major = __GLIBC__;
--       int libc_minor = __GLIBC_MINOR__;
--
--       if (libc_major < 2)
--              exit(1);
--       if ((libc_major == 2) && (libc_minor <= 3))
--              exit(1);
--#endif
--       exit(0);
--}
--
--_ACEOF
--rm -f conftest$ac_exeext
--if { (ac_try="$ac_link"
--case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_link") 2>&5
--  ac_status=$?
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); } && { ac_try='./conftest$ac_exeext'
--  { (case "(($ac_try" in
--  *\"* | *\`* | *\\*) ac_try_echo=\$ac_try;;
--  *) ac_try_echo=$ac_try;;
--esac
--eval ac_try_echo="\"\$as_me:$LINENO: $ac_try_echo\""
--$as_echo "$ac_try_echo") >&5
--  (eval "$ac_try") 2>&5
--  ac_status=$?
--  $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
--  (exit $ac_status); }; }; then
--  linux_getgrouplist_ok=yes
--else
--  $as_echo "$as_me: program exited with status $ac_status" >&5
--$as_echo "$as_me: failed program was:" >&5
--sed 's/^/| /' conftest.$ac_ext >&5
--
--( exit $ac_status )
--linux_getgrouplist_ok=no
--fi
--rm -rf conftest.dSYM
--rm -f core *.core core.conftest.* gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
--fi
--
--
--       if test x"$linux_getgrouplist_ok" = x"yes"; then
--
--cat >>confdefs.h <<\_ACEOF
--#define HAVE_GETGROUPLIST 1
--_ACEOF
--
--       fi
--       ;;
--    *)
-+# Stripped glibc test which is not needed for uClibc
-+linux_getgrouplist_ok=yes
- 
- for ac_func in getgrouplist
- do
-@@ -44246,8 +44164,6 @@
- fi
- done
- 
--       ;;
--esac
- 
- #
- # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
diff --git a/package/samba/samba-fix-client-mtab.patch b/package/samba/samba-fix-client-mtab.patch
deleted file mode 100644
index 21e7158..0000000
--- a/package/samba/samba-fix-client-mtab.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/source/client/mtab.c
-+++ b/source/client/mtab.c
-@@ -31,6 +31,8 @@
- #include <unistd.h>
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/types.h>
-+#include <sys/stat.h>
- #include <sys/time.h>
- #include <time.h>
- #include <fcntl.h>
diff --git a/package/samba/samba-fix-mount.cifs.patch b/package/samba/samba-fix-mount.cifs.patch
index 90bff23..9c235ea 100644
--- a/package/samba/samba-fix-mount.cifs.patch
+++ b/package/samba/samba-fix-mount.cifs.patch
@@ -1,18 +1,21 @@
---- a/source/client/mount.cifs.c
-+++ b/source/client/mount.cifs.c
-@@ -138,6 +138,7 @@ static size_t strlcat(char *d, const cha
- 	return ret;
- }
- #endif
-+#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* BB finish BB
+--- a/client/mount.cifs.c	2011-09-13 10:26:21.000000000 +0200
++++ b/client/mount.cifs.c	2011-09-13 10:27:16.000000000 +0200
+@@ -39,7 +39,6 @@
+ #include <mntent.h>
+ #include <fcntl.h>
+ #include <limits.h>
+-#include <fstab.h>
+ #include "mount.h"
  
-@@ -178,7 +179,6 @@ static void mount_cifs_usage(void)
- 	SAFE_FREE(mountpassword);
- 	exit(EX_USAGE);
+ #define MOUNT_CIFS_VERSION_MAJOR "1"
+@@ -255,6 +254,10 @@
+ 	return 0;
  }
--#endif /* __GLIBC__ && !(__UCLIBC__ && __USE_BSD) */
- 
- /* caller frees username if necessary */
- static char * getusername(void) {
+ #else /* CIFS_LEGACY_SETUID_CHECK */
++
++#ifndef _PATH_FSTAB
++#define _PATH_FSTAB "/etc/fstab"
++#endif
+ static int
+ check_fstab(const char *progname, char *mountpoint, char *devname,
+ 	    char **options)
diff --git a/package/samba/samba-getgrouplist.patch b/package/samba/samba-getgrouplist.patch
deleted file mode 100644
index e98d9cd..0000000
--- a/package/samba/samba-getgrouplist.patch
+++ /dev/null
@@ -1,41 +0,0 @@
---- a/source/configure.in	2009-04-01 13:48:54.000000000 +0200
-+++ b/source/configure.in	2009-04-20 13:08:42.000000000 +0200
-@@ -1219,38 +1219,6 @@
- AC_DEFINE(HAVE_PRCTL, 1, [Whether prctl is available]),[])
- 
- #
--#
--#
--case "$host_os" in
--    *linux*)
--       # glibc <= 2.3.2 has a broken getgrouplist
--       AC_TRY_RUN([
--#include <unistd.h>
--#include <sys/utsname.h>
--main() {
--       /* glibc up to 2.3 has a broken getgrouplist */
--#if defined(__GLIBC__) && defined(__GLIBC_MINOR__)
--       int libc_major = __GLIBC__;
--       int libc_minor = __GLIBC_MINOR__;
--
--       if (libc_major < 2)
--              exit(1);
--       if ((libc_major == 2) && (libc_minor <= 3))
--              exit(1);
--#endif
--       exit(0);
--}
--], [linux_getgrouplist_ok=yes], [linux_getgrouplist_ok=no])
--       if test x"$linux_getgrouplist_ok" = x"yes"; then
--          AC_DEFINE(HAVE_GETGROUPLIST, 1, [Have good getgrouplist])
--       fi
--       ;;
--    *)
--       AC_CHECK_FUNCS(getgrouplist)
--       ;;
--esac
--
--#
- # stat64 family may need <sys/stat.h> on some systems, notably ReliantUNIX
- #
- 
diff --git a/package/samba/samba-remove-legacy-index.patch b/package/samba/samba-remove-legacy-index.patch
index 49a3b7d..855bca7 100644
--- a/package/samba/samba-remove-legacy-index.patch
+++ b/package/samba/samba-remove-legacy-index.patch
@@ -1,5 +1,5 @@
---- a/source/registry/reg_perfcount.c
-+++ b/source/registry/reg_perfcount.c
+--- a/source3/registry/reg_perfcount.c
++++ b/source3/registry/reg_perfcount.c
 @@ -616,14 +616,14 @@ static bool _reg_perfcount_add_counter(P
  	obj = NULL;
  	memset(buf, 0, PERFCOUNT_MAX_LEN);
diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 621d13c..f36da85 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -3,12 +3,11 @@
 # samba
 #
 #############################################################
-
-SAMBA_VERSION = 3.3.15
+SAMBA_VERSION = 3.5.11
 SAMBA_SOURCE = samba-$(SAMBA_VERSION).tar.gz
-SAMBA_SITE = http://samba.org/samba/ftp/stable/
+SAMBA_SITE = http://ftp.samba.org/pub/samba/stable/
 
-SAMBA_SUBDIR = source
+SAMBA_SUBDIR = source3
 SAMBA_AUTORECONF = NO
 
 SAMBA_INSTALL_STAGING = YES
-- 
1.7.4.1
