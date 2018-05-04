From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 May 2018 07:30:39 +0000
Subject: [Buildroot] [Bug 10986] New: Installing package attr when already
 supplied by busybox replaces busybox. Resulting in boot confusing boot/init
 error.
Message-ID: <bug-10986-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10986

            Bug ID: 10986
           Summary: Installing package attr when already supplied by
                    busybox replaces busybox. Resulting in boot confusing
                    boot/init error.
           Product: buildroot
           Version: unspecified
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: mzweerspenko+bugzilla at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

After clean build (no stress-ng and no attr)
user at user:/data/buildenv/buildroot$ cp output/target/bin/busybox
output/target/bin/busybox_orig
user at user:/data/buildenv/buildroot$ sha256sum output/target/bin/busybox*
fcdab0b55c09f00e85421dd1ad7249dd49a4a0f22753021ee506aa063e56e44c 
output/target/bin/busybox
fcdab0b55c09f00e85421dd1ad7249dd49a4a0f22753021ee506aa063e56e44c 
output/target/bin/busybox_orig

After adding and building with stress-ng and attr packages

user at user:/data/buildenv/buildroot$ sha256sum output/target/bin/busybox*
d088445e2aa618140b000dc1449481adb621ec6485d962bd08dc0539eac0ac84 
output/target/bin/busybox
fcdab0b55c09f00e85421dd1ad7249dd49a4a0f22753021ee506aa063e56e44c 
output/target/bin/busybox_orig

user at user:/data/buildenv/buildroot$ ls -l output/target/bin/busybox*
-rwxr-xr-x 1 remotenerd remotenerd   9800 mei  4 08:38
output/target/bin/busybox
-rwxr-xr-x 1 remotenerd remotenerd 535524 mei  4 08:38
output/target/bin/busybox_orig

<Buildlog>
Warning: target file "./bin/busybox" is touched by more than one package:
[u'busybox', u'attr']
</Buildlog>

<Symptom>

As attr uses the zero argument for its help page it results in an confusing
error message

[    2.327505] Freeing unused kernel memory: 1024K
[    2.355884] usb 2-1: new high-speed USB device number 2 using ci_hdrc
Usage: init {-n name} [-v value] [-h] file...
       init {-x name} [-h] file...
Try `init --help' for more information.
[    2.386012] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000200
[    2.386012]
[    2.386027] CPU1: stopping
[    2.386036] CPU: 1 PID: 

</Symptom>
Tested on an NXP IMX7D

<speculation>
Other packages that are also supplied by busybox may lead to similar results.
</speculation>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
