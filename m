From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Oct 2018 09:43:33 +0200
Subject: [Buildroot] [PATCH] utils/get-developers: add -e flag to only list
 email addresses for git send-email
Message-ID: <20181008074333.1582-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When called with a list of patches, get-developers prints the entire git
send-email invocation line:

./utils/get-developers 0001-git-security-bump-to-version-2.16.5.patch
git send-email --to buildroot at buildroot.org --cc "Matt Weber <matthew.weber@rockwellcollins.com>"

This may be handy when creating an entire patch series and editing a cover
letter, but it does mean that this has to be explicitly executed and
get-developers cannot be used directly by the --cc-cmd option of git
send-email to automatically CC affected developers.

So add an -e flag to only let get-developers print the email addresses of
the affected developers in the one-email-per-line format expected by git
send-email, similar to how get_maintainer.pl works in the Linux kernel.

With this and a suitable git configuration:

git config sendemail.to buildroot at buildroot.org
git config sendemail.ccCmd "$(pwd)/utils/get-developers -e"

You can simply do:

git send-email master

To automatically mail the buildroot list and CC affected developers on
patches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/get-developers | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/utils/get-developers b/utils/get-developers
index f525ff2226..9135b41662 100755
--- a/utils/get-developers
+++ b/utils/get-developers
@@ -18,6 +18,8 @@ def parse_args():
                         help='find developers in charge of these files')
     parser.add_argument('-c', dest='check', action='store_const',
                         const=True, help='list files not handled by any developer')
+    parser.add_argument('-e', dest='email', action='store_const',
+                        const=True, help='only list affected developer email addresses')
     return parser.parse_args()
 
 
@@ -90,12 +92,16 @@ def __main__():
                 if i in dev.infras:
                     matching_devs.add(dev.name)
 
-        result = "--to buildroot at buildroot.org"
-        for dev in matching_devs:
-            result += " --cc \"%s\"" % dev
+        if args.email:
+            for dev in matching_devs:
+                print dev
+        else:
+            result = "--to buildroot at buildroot.org"
+            for dev in matching_devs:
+                result += " --cc \"%s\"" % dev
 
-        if result != "":
-            print("git send-email %s" % result)
+            if result != "":
+                print("git send-email %s" % result)
 
 
 __main__()
-- 
2.11.0
