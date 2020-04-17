From: Romain Naour <romain.naour@smile.fr>
Date: Fri, 17 Apr 2020 13:24:51 +0200
Subject: [Buildroot] compilation issue with a uboot-tools / ubootenv
 client program
In-Reply-To: <790fd2c10c690f6e5df1c312c709b2c136d75a74.camel@orolia.com>
References: <790fd2c10c690f6e5df1c312c709b2c136d75a74.camel@orolia.com>
Message-ID: <7af4b2f6-543d-86ba-d392-9101cf7e14ce@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,

Le 17/04/2020 ? 12:17, Nicolas Carrier a ?crit?:
> Hello,
> I'm upgrading the buildroot version we're shipping in our products,
> from buildroot 2019.02.5 to 2020.02.1.
> 
> My issue is that I have a program which interacts with the u-boot
> environment and thus, uses the headers of the ubootenv library provided
> by uboot-tools, which doesn't compile anymore.
> 
> Concretely during the compilation, gcc complains of a missing env.h
> header, which is included by the fw_env.h that my program is using.
> Exact error:
> 
> [ 50%] Building C object CMakeFiles/fw-env-reproducer.dir/main.o
> In file included from
> /home/ncarrier/workspace/buildroot/output/build/fw-env-
> reproducer/main.c:2:
> /home/ncarrier/workspace/buildroot/output/host/arm-buildroot-linux-
> uclibcgnueabihf/sysroot/usr/include/fw_env.h:7:10: fatal error: env.h:
> No such file or directory
>  #include <env.h>
>           ^~~~~~~
> compilation terminated.

This is an upstream change from uboot, see :
https://gitlab.denx.de/u-boot/u-boot/-/commit/9fb625ce05539fe6876a59ce1dcadb76b33c6f6e

Maybe you should ask on their mailing list too.

Can you check if the include path to env.h is present in your gcc command line ?
-I/path/to/the/directory containing env.h ?

Best regards,
Romain


> 
> 
> You'll find attached a patch, which can be applied on top of both the 
> 2020.02.1 and 2019.02.5 tags, adding a minimal reproducer code which
> shows the problem.
> 
> The steps I take to reproduce it are:
> 
> rm -rf output
> git checkout 2020.02.1
> git am 0001-fw_env.h-issue-reproducer-example.patch
> make raspberrypi0_defconfig
> ./utils/config --enable fw-env-reproducer
> make fw-env-reproducer
> 
> -> the compilation fails.
> 
> rm -rf output
> git checkout 2019.02.5
> git am 0001-fw_env.h-issue-reproducer-example.patch
> make raspberrypi0_defconfig
> ./utils/config --enable fw-env-reproducer
> make fw-env-reproducer
> 
> -> the compilation succeeds.
> 
> 
> Am I doing something wrong?
> My current workaround is to revert back the uboot-tools package to the
> state it had in the 2019.02.5 but my instinct is telling me that it's
> not the right thing to do :)
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
