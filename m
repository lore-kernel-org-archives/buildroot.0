From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 21:39:12 +0200
Subject: [Buildroot] [git commit] scripts/mkusers: allow the creation of
	groups alone
Message-ID: <20141022201338.923E2B0429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ff8f54e7930b029ea6cdf6037af7437f2cc1919
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let mkusers create groups alone, useful for supplementary permissions in
udev/systemd for example where users can be added to later at runtime.
Use a magic string "-" to signal that user creation should be skipped.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/mkusers |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
