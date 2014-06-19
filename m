From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 20 Jun 2014 00:38:11 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: Add support for Sourcery
 Codebench Standard
In-Reply-To: <20140619082704.5cda9923@free-electrons.com>
References: <1403133748-17745-1-git-send-email-romain.naour@openwide.fr>
 <20140619082704.5cda9923@free-electrons.com>
Message-ID: <53A36653.3070901@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 19/06/2014 08:27, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Thu, 19 Jun 2014 01:22:28 +0200, Romain Naour wrote:
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Thanks. Could you improve a bit the commit log to explain *why* those
> changes are needed? I don't have access to the Sourcery Codebench
> Standard toolchains (though I'm trying to arrange that), so I can't
> review the patch since I have no idea what are the differences between
> the Standard toolchains and the Lite toolchains.
> 
> Thanks,
> 
> Thomas
> 

See my reply in this thread for some explanations:
http://lists.busybox.net/pipermail/buildroot/2014-June/099767.html

The main difference (for the toolchain wrapper) is that standard edition has two
sysroot sub-directories:

$./i686-pc-linux-gnu-gcc -msgxx-glibc -print-sysroot
"i686-pc-linux-gnu/libc/sgxx-glibc": Intel Pentium Pro - Included Glibc 32bits

The command used to find the ARCH_SYSROOT_DIR works.
$./i686-pc-linux-gnu-gcc -msgxx-glibc -print-file-name=libc.a
Full/path/to/i686-pc-linux-gnu/libc/sgxx-glibc/usr/lib/libc.a

$./i686-pc-linux-gnu-gcc -print-sysroot
i686-pc-linux-gnu/libc/system32: use native system libraries (host)

The "i686-pc-linux-gnu/libc/system32" directory does not exist, there is only
"i686-pc-linux-gnu/libc/sgxx-glibc"

Here is the problem, the command used to find the SYSROOT_DIR don't work.
$./i686-pc-linux-gnu-gcc -print-file-name=libc.a
libc.a
it is normal since i686-pc-linux-gnu/libc/system32/usr/lib/libc.a is missing.

The toolchain wrapper does not handle the case where SYSROOT_DIR is not null and
it's not a directory.

That why we need to check if SYSROOT_DIR is a directory, if not ARCH_SYSROOT_DIR
is used to find it (using sed).

In the copy_toolchain_sysroot, we need to "Create a symbolic link that matches
the name of the subdirectory for the architecture variant in the original
sysroot". For that, SYSROOT_DIR and ARCH_SUBDIR must be different.

After that, toolchain_find_sysroot need the -msgxx-glibc flag to work.

Maybe check_glibc need to use ARCH_SYSROOT_DIR instead of SYSROOT_DIR ?
For now, I added ARCH_SYSROOT_DIR as second argument, but it's only used for
that case...

Tell me if you need more details, I know it's not easy for you to review
this patch without reproducing the issue.
It would be nice if you get a license too ;-)

Ok, the commit log need to be *very* more verbose.
I don't expect that this patch to be commited as is without any review since it
may break the toolchain wrapper...

PS: I'm using Sourcery CodeBench 2014.05

Best regards,
Romain
