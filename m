From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Oct 2017 02:19:36 +0000
Subject: [Buildroot] [Bug 10361] New: python3 python-config script generates
 invalid includes
Message-ID: <bug-10361-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10361

            Bug ID: 10361
           Summary: python3 python-config script generates invalid
                    includes
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: matthew.weber at rockwellcollins.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

If building in a path that starts with /usr, the includedir=$(echo
"@includedir@" | sed "s#^$prefix_build#$prefix_real#") assignment in the
python-config.sh ends up having the path it processes ran through a path
substitution once before this line is executed because the @includedir@ in the
python-config.sh.in is set to the string '${prefix}/include'.  ${prefix} is
assigned just above includedir in python-config.sh to prefix=$(echo
"$prefix_build" | sed "s#^$prefix_build#$prefix_real#")

I believe we need to update the line ref below to 

includedir=$(echo "@includedir@")

https://git.busybox.net/buildroot/tree/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch#n43

Another option would be to rename the prefix variable in this file so that
there isn't a naming conflict......

Example build failure
http://autobuild.buildroot.net/results/dfd/dfdac93d25d5730f08aa747e615a1a1c3ac7f1c0/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
