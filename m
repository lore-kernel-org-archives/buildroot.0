From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Aug 2020 22:03:27 +0000
Subject: [Buildroot] [Bug 13141] New: Target-finalize fail with "depmod:
 ERROR: Bad version passed"
Message-ID: <bug-13141-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

            Bug ID: 13141
           Summary: Target-finalize fail with "depmod: ERROR: Bad version
                    passed"
           Product: buildroot
           Version: 2020.02.1
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: laurent at neko-labs.eu
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

I've successfully build my system up to 2020.02.

But when I started to try to build 2020.02.1 and onwards it always failed with
"depmod: ERROR: Bad version passed" message during TARGET_FINALIZE step.

I managed to find the commit that make my build fail:

8f5a610fe81676092a6960415717de731f43f8bf
linux: Allow modprobe for out-of-tree modules

When LINUX_TARGET_FINALIZE_HOOKS are call the new LINUX_RUN_DEPMOD function
fail in my case.

# Run depmod in a target-finalize hook, to encompass modules installed by
# packages.
define LINUX_RUN_DEPMOD
        $(HOST_DIR)/sbin/depmod -a -b $(TARGET_DIR) $(LINUX_VERSION_PROBED)
endef
LINUX_TARGET_FINALIZE_HOOKS += LINUX_RUN_DEPMOD

Here is my $(LINUX_VERSION_PROBED): 4.19.78-linux4sam-6.2 

I'm using a buildroot external tree for my board, still I've attached my
.config file if it can help

What I don't understand is that if I run manually the depmod command it pass
successfully :/

---> builroot log:
/home/buildroot/output/host/sbin/depmod -a -b /home/buildroot/output/target
`/usr/bin/make  HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null`

depmod: ERROR: Bad version passed make[1]:

make: *** [Makefile:747: target-finalize] Error 1


---> My manual commands (that succeed):
#/usr/bin/make  HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2
-I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib
-Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm
INSTALL_MOD_PATH=/home/buildroot/output/target
CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-"
DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C
/home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s
kernelrelease 2>/dev/null

4.19.78-linux4sam-6.2

#/home/buildroot/output/host/sbin/depmod -a -b /home/buildroot/output/target
4.19.78-linux4sam-6.2

OK

Any help appreciated!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
