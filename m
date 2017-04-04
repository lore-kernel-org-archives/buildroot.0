From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Apr 2017 16:55:12 +0000
Subject: [Buildroot] [Bug 9791] New: Python searches for packages in the
 user site directory
Message-ID: <bug-9791-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9791

            Bug ID: 9791
           Summary: Python searches for packages in the user site
                    directory
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: scileont at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7006
  --> https://bugs.busybox.net/attachment.cgi?id=7006&action=edit
Log for `LANG=C PYTHONVERBOSE=1 make python-serial`

I receive the following error with Buildroot 2017.02:

> $ LANG=C make python-serial
> >>> python-serial 3.1 Installing to target
> (cd /home/aleontiev/projects/mcom/firmware/buildroot/output/build/python-serial-3.1//; PATH="/home/aleontiev/projects/mcom/firmware/buildroot/output/host/bin:/home/aleontiev/projects/mcom/firmware/buildroot/output/host/sbin:/home/aleontiev/projects/mcom/firmware/buildroot/output/host/usr/bin:/home/aleontiev/projects/mcom/firmware/buildroot/output/host/usr/sbin:/home/aleontiev/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin" PYTHONPATH="/home/aleontiev/projects/mcom/firmware/buildroot/output/target/usr/lib/python2.7/sysconfigdata/:/home/aleontiev/projects/mcom/firmware/buildroot/output/target/usr/lib/python2.7/site-packages/" _python_sysroot=/home/aleontiev/projects/mcom/firmware/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot _python_prefix=/usr _python_exec_prefix=/usr  /home/aleontiev/projects/mcom/firmware/buildroot/output/host/usr/bin/python setup.py install --no-compile --prefix=/home/aleontiev/projects/mcom/firmware/buildroot/output/target/usr --executable=/usr/bin/python --single-version-externally-managed --root=/ )
> usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
>    or: setup.py --help [cmd1 cmd2 ...]
>    or: setup.py --help-commands
>    or: setup.py cmd --help
> 
> error: option --executable not recognized
> make: *** [/home/aleontiev/projects/mcom/firmware/buildroot/output/build/python-serial-3.1/.stamp_target_installed] Error 1

I've found that this happens because host Python built by Buildroot is still
looking for packages in user site directiry. See full log for `LANG=C
PYTHONVERBOSE=1 make python-serial` in the attachment.

I think Python should not search user site directory to allow reproducible
builds that does not depend on user-installed packages. A possible solution
would be to export PYTHONNOUSERSITE=1 for all or just Python packages.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
