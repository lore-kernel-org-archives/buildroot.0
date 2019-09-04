From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Sep 2019 20:02:43 +0000
Subject: [Buildroot] [Bug 12181] dropbear: norootlogin (-w) no longer works
 when PAM is enabled
In-Reply-To: <bug-12181-163@https.bugs.busybox.net/>
References: <bug-12181-163@https.bugs.busybox.net/>
Message-ID: <bug-12181-163-sqswDrMilm@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12181

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Jan Dumon from comment #1)
So that presumably means that it has gotten fixed upstream. Looking at the git
history:

git shortlog DROPBEAR_2018.76..DROPBEAR_2019.78 -- svr-authpam.c
Matt Johnston (1):
      Wait to fail invalid usernames

vincentto13 (1):
      Fix for issue successfull login of disabled user (#78)

Presumably this is fixed by the 2nd patch. Can you try applying this patch to
the 2019.02.x version and test:

commit a0aa2749813331134452f80bb8a808bdc871ba41
Author: vincentto13 <33652988+vincentto13@users.noreply.github.com>
Date:   Wed Mar 20 15:03:40 2019 +0100

This commit introduces fix for scenario:
1. Root login disabled on dropbear
2. PAM authentication model enabled

While login as root user, after prompt for password
user is being notified about login failrue, but
after second attempt of prompt for password within
same session, login becames succesfull.

Signed-off-by: Pawel Rapkiewicz <pawel.rapkiewicz@gmail.com>
---
 svr-authpam.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/svr-authpam.c b/svr-authpam.c
index d201bc9..e236db4 100644
--- a/svr-authpam.c
+++ b/svr-authpam.c
@@ -275,6 +275,7 @@ void svr_auth_pam(int valid_user) {
                /* PAM auth succeeded but the username isn't allowed in for
another reason
                (checkusername() failed) */
                send_msg_userauth_failure(0, 1);
+               goto cleanup;
        }

        /* successful authentication */

-- 
You are receiving this mail because:
You are on the CC list for the bug.
