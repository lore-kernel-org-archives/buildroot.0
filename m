From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 19 Jun 2014 01:22:23 +0200
Subject: [Buildroot] Sourcery Codebench standard edition
Message-ID: <53A21F2F.8010603@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 16/06/2014 17:19, Romain Naour a ?crit :
> Hi all,
> 
> Someone has already tried to use Sourcery CodeBench standard edition with Buildroot ?
> (I guess not since it don't work as is ;-) )
> I'm using buildroot 2013.08, but I think problems remain in the latest version.
> 
> I had several issue with the external-toolchain wrapper, since this toolchain need the -msgxx-glibc flag in CFLAGS.

Ok, I can use the Sourcery Codebench standard but I did some hack in
toolchain-external.mk and helper.mk

The first problem is that the main sysroot can't be found with this toolchain
because "-print-file-name=libc.a" don't work as expected:
$./i686-pc-linux-gnu-gcc -print-file-name=libc.a
libc.a
The path to libc.a is not returned, we have only the file name (which is useless...)
So the toolchain check fail because $PWD/libc.a is used as SYSROOT_DIR

Compared to light version (and all other toolchain):
$./i686-pc-linux-gnu-gcc -print-file-name=libc.a
Full/path/to/i686-pc-linux-gnu/libc/usr/lib/libc.a

Here is what we need to do:
$./i686-pc-linux-gnu-gcc -msgxx-glibc -print-file-name=libc.a
Full/path/to/i686-pc-linux-gnu/libc/sgxx-glibc/usr/lib/libc.a

(The flag "-msgxx-glibc" is given by BR2_TARGET_OPTIMIZATION as config option)

But we have only the "ARCH_SYSROOT_DIR" not the "SYSROOT_DIR"...
To find the main sysroot, I added a test on SYSROOT_DIR (if is a directory) then
I filterout the path to remove the last element.

Then the check "check_glibc" fail because ld-linux*.so.* or ld.so.* are not
found since maxdepth = 2. It is fixed with maxdepth = 3.

Sourcery toolchain support rpc feature but the check_glibc_rpc_feature fail
because it look at the main sysroot.
We need to look at the ARCH_SYSROOT_DIR to find rpc.h
It is fixed by adding a second argument which is used to pass the
ARCH_SYSROOT_DIR to check_glibc_rpc_feature.

I'will send a patch to show all the trick,
Any comments are welcome :)

Best regards,
Romain Naour
