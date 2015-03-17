From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 10:30:06 -0300
Subject: [Buildroot] [PATCH 0/5] Add ILP32 support in aarch64
In-Reply-To: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
References: <1426500013-1276-1-git-send-email-bamvor.zhangjian@huawei.com>
Message-ID: <55082C5E.1070906@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/16/2015 07:00 AM, Zhang Jian(Bamvor) wrote:
> LP64 is the default ABI on arm64(Implies -mabi=lp64 while compiling), and the
> kernel remains in LP64 no matter ILP32 enables or not.
> 
> These series patches introduce the big endian support in aarch64 and then add
> ILP32 special filename and menuconfig step by step.
> 
> The test of build is based on linaro kernel [1] and toolchain built by linaro
> ABE environment[2].
> 
> This is my first time I try to contribute the buildroot, feedback is very
> appreciated. Sorry if there are some coding style issues.

Hi.
A couple of issues i've discovered with this patchset are:

1) You're using -mabi unconditionally.
Current default gcc is 4.8.x which doesn't understand -mabi for aarch64.

2) You're not taking care of the internal toolchain backend for ILP32.
Currently we default to gcc 4.8.x which doesn't handle ilp32 at all
hence errors out for aarch64 in that configuration (doesn't understand
-mabi, point 1).
The proper action would be to lock down available versions in
package/gcc/Config.in.host via "depends on !BR2_AARCH64_ILP32"
(basically just for 4.8.x since previous versions are already locked out
for aarch64 in general).
This will only fix the ILP32 problem, doesn't help for -mabi=lp64 though
(point 1).

3) ILP32 little endian doesn't build with gcc 4.9.x/binutils 2.25/glibc
2.20: it results in an internal compiler error while building glibc, so
very likely gcc's fault. This should be handled as well, by fixing it or
disabling the internal toolchain backend for this combination.

3) Big endian support is broken for the internal toolchain.
The glibc package isn't enabled for aarch64 BE, so basically it builds a
toolchain without a libc, not nice.
Fix in toolchain/toolchain-buildroot/Config.in - add appropiate
BR2_aarch64_be depends.

4) We don't know/have any external toolchains to test this.
Suggestions? :)

5) You're not setting KERNEL_ARCH appropiately for big endian, right now
the regex is: -e s/aarch64/arm64/
It should be: -e s/aarch64.*/arm64/
Otherwise we end up with KERNEL_ARCH being arm64_be which obviously
fails badly, not only for kernel builds, but also for internal
toolchains builds (headers), possibly some packages and linux extensions.
Fix in top Makefile.

There are probably other details missing, these are the quick/big ones i
could see.

Regards.
