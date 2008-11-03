From: hartleys <hartleys@visionengravers.com>
Date: Mon, 3 Nov 2008 10:52:51 -0500
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <20081103093110.13e43438@surf>
References: <20081030094501.66983ff9@surf><BD79186B4FD85F4B8E60E381CAEE1909C2916F@mi8nycmail19.Mi8.com>
	<20081103093110.13e43438@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91465@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, November 03, 2008 1:31 AM, Thomas Petazzoni wrote:
>> What are the side effects if you use an external toolchain that was 
>> built with a given kernel version, say 2.6.20.4, but use a newer 
>> kernel, say 2.6.27.3?
>
> The kernel <-> userspace interface is backward compatible. So if you
> use a toolchain that was compiled against the headers of kernel
> 2.6.20.4 and run the binaries under 2.6.27.3, them it will work
> perfectly fine. The only thing is that you won't be able to use the
> new system calls, data structures, headers, defines, that have been
> added in the kernel between 2.6.20.4 and 2.6.27.3.
>
> The reverse side: if you generate binaries with a toolchain that has
> been compiled against the headers of kernel 2.6.27.3 and run it on a
> 2.6.20.4 kernel, then there are two cases :
>
>  * You don't use any of the new features of the kernel <-> userspace
>    interface added between 2.6.20.4 and 2.6.27.3 : everything will
work
>    correctly ;
>
>  * You use one of these new features: your binary might fail to run
>    properly (for example if they use a new system call, that isn't
>    available in your kernel).

Thanks for the clarification.

BTW, something is now broken with svn revision 23911 using an external
toolchain.

I just did a "svn up; make menuconfig; make" and I get the following
errors right when the build starts.

Checking build system dependencies:
BUILDROOT_DL_DIR clean:                         Ok
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
awk installed:                                  Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok

rm -rf
/home/bigguiness/buildroot/project_build_arm/ep9307/buildroot-config
mkdir -p /home/bigguiness/buildroot/project_build_arm/ep9307
cp -dpRf package/config/buildroot-config
/home/bigguiness/buildroot/project_build_arm/ep9307/buildroot-config
wget --passive-ftp -nd   -P /home/bigguiness/buildroot/dl
"http://www.kernel.org/pub/"/linux/kernel/v2.6//linux-...tar.bz2
--08:47:11--
http://www.kernel.org/pub//linux/kernel/v2.6//linux-...tar.bz2
           => `/home/bigguiness/buildroot/dl/linux-...tar.bz2'
Resolving www.kernel.org... 204.152.191.5, 204.152.191.37
Connecting to www.kernel.org|204.152.191.5|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
08:47:11 ERROR 404: Not Found.

make: *** [/home/bigguiness/buildroot/dl/linux-...tar.bz2] Error 1


I can't figure out what .mk is trying to download "linux-...tar.bz2".
Any ideas?

Thanks,
Hartley
