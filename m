From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Mar 2016 22:43:29 +0000
Subject: [Buildroot] [Bug 8811] New: rp-pppoe - generated scripts commands
 use HOST pathnames, not necessarily TARGET
Message-ID: <bug-8811-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8811

            Bug ID: 8811
           Summary: rp-pppoe - generated scripts commands use HOST
                    pathnames, not necessarily TARGET
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lonnie at abelbeck.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

When building with CentOS 7 as the host, for files scripts/*.in, the @ID@ gets
mapped to /bin/id instead of /usr/bin/id since rp-pppoe uses the host paths,
not necessarily for the target.

Here is our fix...

In package/rp-pppoe/rp-pppoe.mk:
--
+define RP_PPPOE_SET_TARGET_COMMAND_PATHS
+       find $(@D)/scripts/ -name "*.in" | xargs sed -i \
+               -e 's:@ID@:/usr/bin/id:g' \
+               -e 's:@SETSID@:/usr/bin/setsid:g' \
+               -e 's:@ECHO@:/bin/echo:g' \
+               -e 's:@PPPD@:/usr/sbin/pppd:g'
+endef
+RP_PPPOE_POST_PATCH_HOOKS += RP_PPPOE_SET_TARGET_COMMAND_PATHS
--

You may ask why not eliminate the fully defined paths, but for @SETSID@ it is
tested with -x in the script so it needs a full pathname.  The rest may not
need a full pathname.

I think this fix is the lesser of the evils, and is easily tweaked if needed.

Lonnie

-- 
You are receiving this mail because:
You are on the CC list for the bug.
