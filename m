From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri,  7 Apr 2017 14:33:37 +0200
Subject: [Buildroot] [PATCH 1/1] automake: add patch fixing GNU bug #25299
Message-ID: <1491568417-5355-1-git-send-email-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A bug in automake makes it impossible to build in an output directory
that contains an '@' character. But this is needed if you want to build
with jenkins' pipeline plugin.

This patch was proposed by Michael Brantley but is currently not applied
in the upstream automake repository.

Refer to: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25299

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...character-in-installation-prefix-breaks-automake.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch

diff --git a/package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch b/package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch
new file mode 100644
index 0000000..3a5a571
--- /dev/null
+++ b/package/automake/0003-at-character-in-installation-prefix-breaks-automake.patch
@@ -0,0 +1,15 @@
+See bug report #25299 (https://debbugs.gnu.org/cgi/bugreport.cgi?bug=25299)
+
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+
+--- a/bin/aclocal.in
++++ b/bin/aclocal.in
+@@ -69,7 +69,7 @@
+ # ACLOCAL_PATH environment variable, and reset with the '--system-acdir'
+ # option.
+ my @user_includes = ();
+-my @automake_includes = ("@datadir@/aclocal-$APIVERSION");
++my @automake_includes = ('@datadir@/aclocal-' . $APIVERSION);
+ my @system_includes = ('@datadir@/aclocal');
+ 
+ # Whether we should copy M4 file in $user_includes[0].
-- 
2.1.4
