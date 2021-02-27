From: GA K <guyarkam@gmail.com>
Date: Fri, 26 Feb 2021 21:46:02 -0600 (CST)
Subject: [Buildroot] /bin/ld: skipping incompatible //lib/libpam.so when
 searching for -lpam
In-Reply-To: <CAEYXRPmmUFFCzSudFX3qqKTRq4=QSBe-eijKvB92HTXJYaNfZw@mail.gmail.com>
References: <CAEYXRPmmUFFCzSudFX3qqKTRq4=QSBe-eijKvB92HTXJYaNfZw@mail.gmail.com>
Message-ID: <1614397562997-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The problem is related to the linking of runuser during the  build of
host-util-linux. 

On the first system, the build process completes successfully because the
host-util-linux configuration script fails to locate PAM header files among
other things and issues the following warning:

configure: WARNING: ncursesw, ncurses or slang library not found; not
building irqtop
configure: WARNING: linux/blkzoned.h header not found; not building blkzone
checking for LIBUSER... no
configure: WARNING: PAM header file not found; not building runuser
checking for ECONF... no
configure: WARNING: libpython not found; not building pylibmount
checking that generated files are newer than configure... done

On the second system, the host-util-linux configuration script finds the PAM
header (I have these lines) 
checking for LIBUSER... no
checking for ECONF... no
 and proceeds with the build of runuser. However, on this system (64-bit
machine)  /lib/libpam.so points to the file libpam.so.0.83.1 which is a
32-bit ELF file. 

$ file libpam.so.0.83.1
libpam.so.0.83.1: ELF 32-bit LSB shared object, Intel 80386, version 1
(SYSV), dynamically linked,
BuildID[sha1]=75203587ca0241a766a756b1cec17c0fc54dd479, stripped


I have no root access to the second machine so my only solution is to skip
runuser during the host-util-linux build process. I see that
package/util-linux/Config.in defines BR2_PACKAGE_UTIL_LINUX_RUNUSER and
automatically selects it when BR2_PACKAGE_LINUX_PAM is selected. In my
particular case, I am not selecting BR2_PACKAGE_LINUX_PAM and yet runuser
gets selected. I am hence wondering what would be the safest way to skip
runuser while building host-util-linux. 

Thanks for any hint




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
