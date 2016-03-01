From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Mar 2016 15:46:09 -0300
Subject: [Buildroot] [PATCH] heirloom-mailx: disable SSLv2 support
Message-ID: <1456857969-5916-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that openssl has dropped SSLv2 support from the latest security bump
we need to patch it out here as well. Fixes:
http://autobuild.buildroot.net/results/dab/dab1629cfcb5cb33706d0c762dba57baa43299a5/

Patch status: debian upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-SSL2-support-since-it-is-no-longer-suppo.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch

diff --git a/package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
new file mode 100644
index 0000000..db5b19e
--- /dev/null
+++ b/package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
@@ -0,0 +1,42 @@
+From: Hilko Bengen <bengen@debian.org>
+Date: Wed, 27 Apr 2011 00:18:42 +0200
+Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
+
+Now that openssl has dropped SSLv2 support we need to patch it out.
+Patch picked up from debian patchseries 5.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+---
+ mailx.1   |    2 +-
+ openssl.c |    4 +---
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/mailx.1 b/mailx.1
+index 417ea04..a02e430 100644
+--- a/mailx.1
++++ b/mailx.1
+@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
+ .TP
+ .B ssl-method
+ Selects a SSL/TLS protocol version;
+-valid values are `ssl2', `ssl3', and `tls1'.
++valid values are `ssl3', and `tls1'.
+ If unset, the method is selected automatically,
+ if possible.
+ .TP
+diff --git a/openssl.c b/openssl.c
+index b4e33fc..44fe4e5 100644
+--- a/openssl.c
++++ b/openssl.c
+@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
+ 
+ 	cp = ssl_method_string(uhp);
+ 	if (cp != NULL) {
+-		if (equal(cp, "ssl2"))
+-			method = SSLv2_client_method();
+-		else if (equal(cp, "ssl3"))
++		if (equal(cp, "ssl3"))
+ 			method = SSLv3_client_method();
+ 		else if (equal(cp, "tls1"))
+ 			method = TLSv1_client_method();
-- 
2.4.10
