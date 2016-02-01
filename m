From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 08:02:00 +0100
Subject: [Buildroot] [git commit] package/makedevs: use the rooted
	/etc/passwd and /etc/group
Message-ID: <20160201224704.156A47F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95dda394d9f2487d54c6ec529c3f9a7fd341a582
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, makedevs will query the host's /etc/passwd and /etc/group to
resolve usernames and group names. This is inherently flawed, as we can
never guarantee that the UIDs will be the same on the target as on the
host, or even whether a particular user does exist on the host.

This is because getpwnam() and getgrnam() will forcibly read the
system's /etc/passwd and /etc/group, and there is no way to tell them to
look anywhere else.

However, we can use fgetpwent() and fgetgrent() instead, for which
we can pass a FILE* stream to read from to get the entries. This means
we must implement the scanning-loop ourselves, but fortunately, that's
pretty trivial to do.

[Peter: swap errno / return value check, use bb_perror_msg_and_die, code style]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedevs/makedevs.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
index 53ff6fe..e5ef164 100644
--- a/package/makedevs/makedevs.c
+++ b/package/makedevs/makedevs.c
@@ -40,6 +40,8 @@ const char *bb_applet_name;
 uid_t recursive_uid;
 gid_t recursive_gid;
 unsigned int recursive_mode;
+#define PASSWD_PATH "etc/passwd"  /* MUST be relative */
+#define GROUP_PATH "etc/group"  /* MUST be relative */
 
 void bb_verror_msg(const char *s, va_list p)
 {
@@ -255,10 +257,20 @@ char *bb_get_chomped_line_from_file(FILE *file)
 long my_getpwnam(const char *name)
 {
 	struct passwd *myuser;
-
-	myuser  = getpwnam(name);
-	if (myuser==NULL)
-		bb_error_msg_and_die("unknown user name: %s", name);
+	FILE *stream;
+
+	stream = bb_xfopen(PASSWD_PATH, "r");
+	while(1) {
+		errno = 0;
+		myuser = fgetpwent(stream);
+		if (myuser == NULL)
+			bb_error_msg_and_die("unknown user name: %s", name);
+		if (errno)
+			bb_perror_msg_and_die("fgetpwent");
+		if (!strcmp(name, myuser->pw_name))
+			break;
+	}
+	fclose(stream);
 
 	return myuser->pw_uid;
 }
@@ -266,12 +278,22 @@ long my_getpwnam(const char *name)
 long my_getgrnam(const char *name)
 {
 	struct group *mygroup;
+	FILE *stream;
+
+	stream = bb_xfopen(GROUP_PATH, "r");
+	while(1) {
+		errno = 0;
+		mygroup = fgetgrent(stream);
+		if (mygroup == NULL)
+			bb_error_msg_and_die("unknown group name: %s", name);
+		if (errno)
+			bb_perror_msg_and_die("fgetgrent");
+		if (!strcmp(name, mygroup->gr_name))
+			break;
+	}
+	fclose(stream);
 
-	mygroup  = getgrnam(name);
-	if (mygroup==NULL)
-		bb_error_msg_and_die("unknown group name: %s", name);
-
-	return (mygroup->gr_gid);
+	return mygroup->gr_gid;
 }
 
 unsigned long get_ug_id(const char *s, long (*my_getxxnam)(const char *))
