From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  5 Apr 2014 18:24:43 +0200
Subject: [Buildroot] [PATCH] support/mkusers: fix warnings when adding a new
	user
Message-ID: <1396715083-20764-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

When adding a new user (or a new group), we would get warnings, like:
  [...]/support/scripts/mkusers: line 145: [: too many arguments

This is because we're checking if a UID (or a GID) is already defined,
and/or is different from the requested one, both checks in the same
test.

Of course, if a UID (or a GID) is not defined, it does not have a value,
so we can not compare it to an integer.

Fix that by splitting the test in two, so the second is only executed if
the first is sucessful.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/mkusers | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index 90d1df7..3fa0fa8 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -137,12 +137,16 @@ check_user_validity() {
         fi
 
         # check the group does not already exists with another gid
-        if [ -n "${_gid}" -a ${_gid} -ne ${gid} ]; then
+        # Need to split the check in two, otherwise '[' complains it
+        # is missing arguments when _gid is empty
+        if [ -n "${_gid}" ] && [ ${_gid} -ne ${gid} ]; then
             fail "group already exists with gid '${_gid}'\n"
         fi
 
         # check the user does not already exists with another gid
-        if [ -n "${_ugid}" -a ${_ugid} -ne ${gid} ]; then
+        # Need to split the check in two, otherwise '[' complains it
+        # is missing arguments when _ugid is empty
+        if [ -n "${_ugid}" ] && [ ${_ugid} -ne ${gid} ]; then
             fail "user already exists with gid '${_ugid}'\n"
         fi
     fi
@@ -156,7 +160,9 @@ check_user_validity() {
         fi
 
         # check the user does not already exists with another uid
-        if [ -n "${_uid}" -a ${_uid} -ne ${uid} ]; then
+        # Need to split the check in two, otherwise '[' complains it
+        # is missing arguments when _uid is empty
+        if [ -n "${_uid}" ] && [ ${_uid} -ne ${uid} ]; then
             fail "user already exists with uid '${_uid}'\n"
         fi
     fi
-- 
1.8.3.2
