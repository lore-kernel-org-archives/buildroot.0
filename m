From: James Knight <james.knight@rockwellcollins.com>
Date: Sat, 23 May 2015 13:51:37 -0400
Subject: [Buildroot] [PATCH 1/1 v2] scripts/mkusers: allow users with no
	password value set
Message-ID: <1432403497-4132-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following allows a user definition to specify that a created user
entry should not have a password value set. Original implementation
allowed a user definition to provide a password value of "=" (no quotes)
to generate a crypt-encoded empty string value. In some cases, it may be
desired to have no value specified for a user's password. By using a
value "-" for a password, no value will be set in the shadow value.

An example when this can be used is when logging into a terminal.
Logging into a session with an encoded empty password will prompt a user
to enter a password since it does not know the password is empty. If the
password field blank, a login session will not prompt for a password.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - Correct error in commit message.
  - More explicit example in commit message (suggested by Yann).
   
 docs/manual/makeusers-syntax.txt | 3 ++-
 support/scripts/mkusers          | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index ffdb961..467e596 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -31,7 +31,8 @@ Where:
   then login is disabled. If prefixed with +=+, then it is interpreted
   as clear-text, and will be crypt-encoded (using MD5). If prefixed with
   +!=+, then the password will be crypt-encoded (using MD5) and login
-  will be disabled. If set to +*+, then login is not allowed.
+  will be disabled. If set to +*+, then login is not allowed. If set to 
+  +-+, then no password value will be set.
 - +home+ is the desired home directory for the user. If set to '-', no
   home directory will be created, and the user's home will be +/+.
   Explicitly setting +home+ to +/+ is not allowed.
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 026519e..9c5c4dc 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -318,6 +318,9 @@ add_one_user() {
         *)  fail "home must be an absolute path\n";;
     esac
     case "${passwd}" in
+        -)
+            _passwd=""
+            ;;
         !=*)
             _passwd='!'"$( encode_password "${passwd#!=}" )"
             ;;
-- 
1.9.5.msysgit.1
