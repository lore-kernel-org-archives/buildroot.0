From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Mar 2021 10:36:01 +0000
Subject: [Buildroot] [Bug 13616] New: tar file from git repository
 generation issue
Message-ID: <bug-13616-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13616

            Bug ID: 13616
           Summary: tar file from git repository generation issue
           Product: buildroot
           Version: 2020.02.8
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: jpcartal at free.fr
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 8791
  --> https://bugs.busybox.net/attachment.cgi?id=8791&action=edit
Master branch patch

Hello,

The support/download/git script is generating tar files from git repositories
using the following command :

# Create GNU-format tarballs, since that's the format of the tarballs on
# sources.buildroot.org and used in the *.hash files
tar cf - --transform="s#^\./#${basename}/#" \
         --numeric-owner --owner=0 --group=0 --mtime="${date}" --format=gnu \
         -T "${output}.list.sorted" >"${output}.tar"

In one of our repository, the --transform option is generating unusable tar
files because of the bug described here :
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=775247

Links with the following pattern src/foo -> ./foo_bar/bar are replaced with 
src/foo -> ${basename}/foo_bar/bar and thus the generated tarball is not
usable.

As explained in the debian bug report, adding the S flag to the transform
pattern (i.e. --transform="s#^\./#${basename}/#" =>
--transform="s#^\./#${basename}/#S") solves this issue.

Attaching the corresponding patches for master and 2020.02.x branches 

Regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
