From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 7 Sep 2018 07:44:14 -0700
Subject: [Buildroot] RISC-V Shared Library Locations
In-Reply-To: <0b94e52f-0a99-c13c-7e3d-f37383c87e32@embecosm.com>
References: <0b94e52f-0a99-c13c-7e3d-f37383c87e32@embecosm.com>
Message-ID: <CALURroR6zJ4gtK8pFGZbabnzqueUrcLO2gzUapgQnv40UJyHiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 7, 2018 at 2:39 AM Mark Corbin <mark.corbin@embecosm.com> wrote:

> Hello
>
> I've been looking at the RISC-V shared library issue reported by
> Christopher McCrory[1]
>
> For  RISC-V the glibc trusted directories for libraries are /lib64/<ABI>
> and /usr/lib64/<ABI>, so for example, /lib64/lp64/ and /usr/lib64/lp64/
> instead of the more common /lib64/ and /usr/lib64/. When you add extra
> packages that require shared libraries the libraries are installed to
> /usr/lib64/ and are therefore not found.
>
> I was wondering if anybody has any thoughts on where/how this should be
> fixed-up?
>
> ...modify package makefiles to install libraries to the 'ABI' locations?
> ...add LD_LIBRARY_PATH or ld.so.conf to the skeleton image and include
> the 'non-ABI' locations?
> ...modify the glibc build configuration to use the 'non-ABI' locations?
> ...generate a set of symbolic links for each library file to point from
> the 'ABI' locations to the '.../lib64' directories? For example,
> /usr/lib64/lp64/libncurses.so -> ../libncurses.so
>
> Any ideas would be much appreciated.
>
>
This got me thinking.  This is further down the toolchain than I am used
to. But with some poking around I came up with this:

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d34b42b831..96c41718ee 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -88,6 +88,8 @@ define GLIBC_CONFIGURE_CMDS
                ac_cv_path_BASH_SHELL=/bin/bash \
                libc_cv_forced_unwind=yes \
                libc_cv_ssp=no \
+               libc_cv_slibdir='/lib64' \
+               libc_cv_rtlddir='/lib'   \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \
                --build=$(GNU_HOST_NAME) \

I am pretty sure this is NOT the correct way and will probably break every
other arch in buildroot.  I think glibc should be looking in /lib/lp64 AND
/lib, not just /lib/lp64 or /lib, same for /usr/lib, etc.  I don't know the
correct ./configure args to get that though.


[root at buildroot ~]# uname -a
Linux buildroot 4.15.0 #1 SMP Fri Sep 7 06:01:44 PDT 2018 riscv64 GNU/Linux

[root at buildroot ~]# dmesg | head -2
OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
Linux version 4.15.0 (chrismcc at wednesday) (gcc version 7.3.0 (Buildroot
2018.11-git-00004-g327afac530-dirty)) #1 SMP Fri Sep 7 06:01:44 PDT 2018

[root at buildroot ~]# pstree
init-+-httpd---3*[httpd---26*[{httpd}]]
     |-klogd
     |-ntpd
     |-proftpd
     |-sh---pstree
     |-sshd
     |-syslogd
     |-udevd
     `-udhcpc
[root at buildroot ~]#


These all built and with limited testing (at least $BINARY -h --help) worked
[chrismcc at wednesday images]$  qemu-system-riscv64 --version
QEMU emulator version 3.0.0 (qemu-3.0.0-1.fc27)


apache-2.4.34      lsscsi-0.28     proftpd-1.3.6  tcpdump-4.9.2
bash-4.4.18        ncftp-3.2.6     psmisc-23.1    time-1.9
bridge-utils-1.6   netcat-0.7.1    radvd-2.12     usbutils-010
file-5.33          ntp-4.2.8p11    rsync-3.1.3    util-linux-2.32.1
iptables-1.6.2     openssh-7.8p1   screen-4.6.2   vim-v8.1.0133
kmod-24            pciutils-3.5.5  sudo-1.8.23    wget-1.19.5
libopenssl-1.0.2p  php-7.2.9       sysvinit-2.88

above from buildroot cloned right before the NEXT merge

<snip>
-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180907/6a46cdc3/attachment.html>
