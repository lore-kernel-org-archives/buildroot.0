From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 Sep 2019 14:06:27 +0000
Subject: [Buildroot] [Bug 12181] New: dropbear: norootlogin (-w) no longer
 works when PAM is enabled
Message-ID: <bug-12181-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12181

            Bug ID: 12181
           Summary: dropbear: norootlogin (-w) no longer works when PAM is
                    enabled
           Product: buildroot
           Version: 2019.02.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jan.dumon at septentrio.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

This affects dropbear 2018.76 in 2019.02.5 and earlier.

The vanilla dropbear 2018.76 doesn't have this problem, it is introduced
(ironically) by the patch for CVE-2018-15599 in
https://git.busybox.net/buildroot/commit?id=4a3b0ba38fde05e8f8c3512d516d86803efa44c0

It only happens when PAM is enabled & used.

When invoked with the -w command line argument, root logins should be
disallowed, but when someone attempts to login as root, the following happens:

- login attempt for root
- password is asked
- norootlogin is set but pam is invoked anyway
- pam validates the password and an 'already authenticated flag' gets set
- login still fails (as is expected) and password is asked again
- regardless of input, root can log in because he was authenticated before.
  (completely unexpected !!!)

It's still required to have a proper password but the root login should not be
allowed per the -w command line argument.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
