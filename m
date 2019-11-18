From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Nov 2019 15:44:13 +0000
Subject: [Buildroot] [Bug 12321] New: host-generic-package: PKG_DL_OPTS not
 used for host package
Message-ID: <bug-12321-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12321

            Bug ID: 12321
           Summary: host-generic-package: PKG_DL_OPTS not used for host
                    package
           Product: buildroot
           Version: 2019.02.7
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: porto.rio at gmx.net
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

I have a custom .mk file with some PKG_DL_OPTS defined (username and password
for wget download). The .mk file contains the classical rules for target and
host package:

$(eval $(generic-package))
$(eval $(host-generic-package))

When I trigger a download of the host package first (e.g. make host-PKG-source)
I detected that PKG_DL_OPTS is not passed to the dl-wrapper script that
buildroot uses to download the src. I explicitly have to define a
HOST_PKG_DL_OPTS = $(PKG_DL_OPTS) in my .mk file for the download to be
successful for the host package.

I've looked into the sources and I found the following comment in
pkg-generic.mk which seems to be related to this question:

[...]
# Define default values for various package-related variables, if not
# already defined. For some variables (version, source, site and
# subdir), if they are undefined, we try to see if a variable without
# the HOST_ prefix is defined. If so, we use such a variable, so that
# this information has only to be specified once, for both the
# target and host packages of a given .mk file.
[...]

Maybe some handling similar to the other variables has to be added for _DL_OPTS
(i.e. if HOST_PKG_DL_OPTS is undefined set it to the value of PKG_DL_OPTS)?

Kind regards,
Matthias

-- 
You are receiving this mail because:
You are on the CC list for the bug.
