From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue,  9 Oct 2018 10:28:31 +0200
Subject: [Buildroot] [PATCH] docs/manual: document the new get-developers -e
 option
Message-ID: <20181009082831.31918-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explain how this can be used with git send-email, and how git can be
configured to use it automatically.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 22 ++++++++++++++++++++++
 docs/manual/developers.txt |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index b531ea987e..60bfb961f0 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -308,6 +308,28 @@ Use the output of +get-developers+ to send your patches:
 $ git send-email --to buildroot at buildroot.org --cc bob --cc alice outgoing/*
 ---------------------
 
+Alternatively, +get-developers -e+ can be used directly with the
++--cc-cmd+ argument to +git send-email+ to automatically CC the
+affected developers:
+
+---------------------
+$ git send-email --to buildroot at buildroot.org \
+      --cc-cmd './utils/get-developers -e' origin/master
+---------------------
+
++git+ can be configured to automatically do this out of the box with:
+
+---------------------
+$ git config sendemail.to buildroot at buildroot.org
+$ git config sendemail.ccCmd "$(pwd)/utils/get-developers -e"
+---------------------
+
+And then just do:
+
+---------------------
+$ git send-email origin/master
+---------------------
+
 Note that +git+ should be configured to use your mail account.
 To configure +git+, see +man git-send-email+ or google it.
 
diff --git a/docs/manual/developers.txt b/docs/manual/developers.txt
index a0a3668dbc..0da499e100 100644
--- a/docs/manual/developers.txt
+++ b/docs/manual/developers.txt
@@ -31,7 +31,8 @@ the +DEVELOPERS+ file for various tasks:
 
 - When passing one or several patches as command line argument,
   +get-developer+ will return the appropriate +git send-email+
-  command.
+  command. If the +-e+ option is passed, only the email addresses are
+  printed in a format suitable for +git send-email --cc-cmd+.
 
 - When using the +-a <arch>+ command line option, +get-developer+ will
   return the list of developers in charge of the given architecture.
-- 
2.11.0
