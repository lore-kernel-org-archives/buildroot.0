From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 Nov 2019 18:56:33 +0000
Subject: [Buildroot] [Bug 12316] New: tzdata fails to install with empty
 "default local time"
Message-ID: <bug-12316-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12316

            Bug ID: 12316
            Target: aarch64 on Nvidia TX2
           Summary: tzdata fails to install with empty "default local
                    time"
           Product: buildroot
           Version: 2019.02.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: andrew.trapani at ontera.bio
                CC: buildroot at uclibc.org
  Target Milestone: ---

Option #1:

Under menuconfig
System configuration  --->
-*- Install timezone info
 (default) timezone list
 ()    default local time 

My understanding after doing internet searches was that an empty "default local
time" field would be set to Etc/UTC.


However, the build failed here:
>>> host-tzdata 2018e Installing to host directory
>>> tzdata 2018e Extracting
>>> tzdata 2018e Patching
>>> tzdata 2018e Configuring
>>> tzdata 2018e Building
>>> tzdata 2018e Installing to target
Error: '' is not a valid timezone, check your BR2_TARGET_LOCALTIME setting
package/pkg-generic.mk:331: recipe for target
'/build/output/tx2_basecamp/build/tzdata-2018e/.stamp_target_installed' failed
make[1]: ***
[/build/output/tx2_basecamp/build/tzdata-2018e/.stamp_target_installed] Error 1
Makefile:23: recipe for target '_all' failed
make: *** [_all] Error 2
Could not create rootfs... not building image
Makefile:89: recipe for target 'docker_build_image' failed


Option #2:
Then Under menuconfig

 -*- Install timezone info
 (default) timezone list
 (Etc/UTC) default local time 

Then tzdata works and the build continues.



Do a symsearch for TZDATA to find out what is required:
Symbol: BR2_PACKAGE_TZDATA [=y]
Type  : bool
  Defined at package/tzdata/Config.in:4
  Selected by [y]:
  - BR2_TARGET_TZ_INFO [=y] && BR2_TOOLCHAIN_USES_GLIBC [=y]
  Selected by [n]:
  - BR2_TARGET_TZ_INFO [=y] && BR2_TOOLCHAIN_USES_MUSL [=n] 


The config is attached, but please be warned that it references local paths to
local things and won't build for you.

It also has Etc/UTC set as the "default local time". This is how I got tzdata
to complete.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
