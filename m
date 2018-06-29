From: =?utf-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@theobroma-systems.com>
Date: Fri, 29 Jun 2018 13:59:05 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: Fix ld.so copying for
 multilib toolchains.
In-Reply-To: <20180629134058.2fde536c@windsurf>
References: <20180629113339.59102-1-christoph.muellner@theobroma-systems.com>
 <20180629134058.2fde536c@windsurf>
Message-ID: <B380D19B-4AE5-4711-A115-3BD4140C6C16@theobroma-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On 29.06.2018, at 13:40, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> Hello Christoph,
> 
> Thanks for this contribution!
> 
> On Fri, 29 Jun 2018 13:33:39 +0200, Christoph Muellner wrote:
>> Multilib toolchains can have more than one ld.so files in lib/.
>> Typically one for each lib* directory.
>> However the current copy_toolchain_sysroot implemenation does
>> not support more than one ld.so.
>> 
>> This patch addresses this by iterating over all ld.so files
>> in the lib/ directory and choose the one, which has a symlink
>> into $ARCH_LIB_DIR/.
>> 
>> An example is a multilib toolchain for aarch64 (LP64 and ILP32),
>> which includes the following entries in lib/:
>> 
>> $ ls -l lib/
>> lrwxrwxrwx 1 user group ld-linux-aarch64_ilp32.so.1 -> ../libilp32/ld-2.27.so
>> lrwxrwxrwx 1 user group ld-linux-aarch64.so.1 -> ../lib64/ld-2.27.so
>> 
>> $ARCH_LIB_DIR/ will be detected as lib64.
>> Without the patch no ld.so will be copied.
>> With the patch the second ld.so (the one for LP64) will be copied.
>> 
>> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
>> Signed-off-by: Philipp Tomsich <philipp.tomsich@theobroma-systems.com>
> 
> Is it possible to access the problematic toolchain ?

Toolchain can be downloaded here:

https://www.theobroma-systems.com/go/amp-7.3.0

I've been building an aarch64 image on an x86_64 host with
the amp-7.3.0-20180630-crosstools toolchain.

Among other things, this toolchain has LP64 and ILP32 support for aarch64.
The LP64 loader can be found here: $sysroot/lib/ld-linux-aarch64.so.1
The ILP64 loader can be found here: $sysroot/lib/ld-linux-aarch64_ilp32.so.1

Infos about aarch64 ILP32 can be found here:
https://wiki.linaro.org/Platform/arm64-ilp32

In my particular use case I'm building for LP64 (compiler default).
Buildroot detects this correctly ($ARCH_LIB_DIR will be "$sysroot/lib64")

The $sysroot is located here: amp-7.3.0-20180630/aarch64-amp-linux-gnu/sysroot
The loaders are in $sysroot/lib:

  ld-linux-aarch64_ilp32.so.1 -> ../libilp32/ld-2.27.so #ILP32
  ld-linux-aarch64.so.1 -> ../lib64/ld-2.27.so #LP64

Now the test "[ -e $${ARCH_SYSROOT_DIR}/lib/ld*.so.* ]" triggers
a syntax error, because "[ -e ld1.so ld2.so ];" is invalid syntax.

What the patch does here is to iterate over all ld*.so* files in $sysroot/lib
and checks if the given LD_SO is a symlink into $ARCH_LIB_DIR,
which is true for "ld-linux-aarch64.so.1 -> ../lib64/ld-2.27.so" in the LP64 case.

Thanks,
Christoph

> It would be useful to understand better the problem, and potentially
> add some test cases to verify that future changes in the external
> toolchain logic does not break this special situation.
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 874 bytes
Desc: Message signed with OpenPGP
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180629/9f6c5af7/attachment.asc>
