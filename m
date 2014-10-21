From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 11:26:36 -0300
Subject: [Buildroot] [PATCH 1/4] scripts/mkusers: allow the creation of
	groups alone
Message-ID: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let mkusers create groups alone, useful for supplementary permissions in
udev/systemd for example where users can be added to later at runtime.
Use a magic string "-" to signal that user creation should be skipped.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 support/scripts/mkusers | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/mkusers b/support/scripts/mkusers
index ffd192d..5e5a5d9 100755
--- a/support/scripts/mkusers
+++ b/support/scripts/mkusers
@@ -397,6 +397,7 @@ main() {
     # Now, add users whose uid is *not* automatic
     while read username uid group gid passwd home shell groups comment; do
         [ -n "${username}" ] || continue    # Package with no user
+        [ "${username}" != "-" ] || continue # Magic string to skip user creation
         [ ${uid} -ge 0     ] || continue    # Automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
@@ -405,6 +406,7 @@ main() {
     # Finally, add users whose uid *is* automatic
     while read username uid group gid passwd home shell groups comment; do
         [ -n "${username}" ] || continue    # Package with no user
+        [ "${username}" != "-" ] || continue # Magic string to skip user creation
         [ ${uid} -eq -1    ] || continue    # Non-automatic uid
         add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
                      "${home}" "${shell}" "${groups}" "${comment}"
-- 
2.0.4
