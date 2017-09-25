From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 25 Sep 2017 13:57:50 +0000
Subject: [Buildroot] [Bug 10331] New: kmsxx,
 host installation fails with BR2_SHARED_STATIC_LIBS=y
Message-ID: <bug-10331-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10331

            Bug ID: 10331
           Summary: kmsxx, host installation fails with
                    BR2_SHARED_STATIC_LIBS=y
           Product: buildroot
           Version: 2017.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: frederic.mathieu at dualis.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi

kmsxx makefile try to install host static library, but no exists.

>>> kmsxx cb0786049f960f2bd383617151b01318e02e9ff9 Installing to staging directory
/usr/bin/install -D -m 0755
/home/dev01/data/projects/buildroot-2017.08_X86_64/output/build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/lib/libkms++.so
/home/dev01/data/toolchain/2017.08_X86_64/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libkms++.so
/usr/bin/install -D -m 0755
/home/dev01/data/projects/buildroot-2017.08_X86_64/output/build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/lib/libkms++.a
/home/dev01/data/toolchain/2017.08_X86_64/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libkms++.a
/usr/bin/install: cannot stat
'/home/dev01/data/projects/buildroot-2017.08_X86_64/output/build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/lib/libkms++.a':
No such file or directory
package/pkg-generic.mk:266: recipe for target
'/home/dev01/data/projects/buildroot-2017.08_X86_64/output/build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/.stamp_staging_installed'
failed
make[1]: ***
[/home/dev01/data/projects/buildroot-2017.08_X86_64/output/build/kmsxx-cb0786049f960f2bd383617151b01318e02e9ff9/.stamp_staging_installed]
Error 1
Makefile:79: recipe for target '_all' failed
make: *** [_all] Error 2



Installation works if i comment these lines in makefile kmsxx.mk :

define KMSXX_INSTALL_STAGING_CMDS
        $(foreach l,$(KMSXX_LIBS),\
                $(if $(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),
                        $(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).so \
                                $(STAGING_DIR)/usr/lib/lib$(l).so)
#               $(if $(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),
#                       $(INSTALL) -D -m 0755 $(@D)/lib/lib$(l).a \
#                               $(STAGING_DIR)/usr/lib/lib$(l).a)
                mkdir -p $(STAGING_DIR)/usr/include/$(l)
                cp -dpfr $(@D)/$(l)/inc/$(l)/* $(STAGING_DIR)/usr/include/$(l)/
        )
endef


founds on version 2017.08, 2017.05.x

regards
Frederic MATHIEU

-- 
You are receiving this mail because:
You are on the CC list for the bug.
