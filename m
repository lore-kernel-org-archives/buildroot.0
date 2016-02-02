From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 2 Feb 2016 11:56:49 -0500
Subject: [Buildroot] glibc and --enable-kernel
In-Reply-To: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
References: <20160127042104.GA6719@tungsten.ozlabs.ibm.com>
Message-ID: <20160202165649.GE7732@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 Jan 2016 15:21, Sam Bobroff wrote:
> 1) Unnecessary compat code: If you've built a kernel and glibc together
> (presumably this is common when using buildroot) then you have no need of any
> compat code because the only kernel you'll be using is the one you just built.
> According to the doc (above) this causes glibc to include unnecessary compat
> code which slows it down.

the overhead is not that great.  glibc is written such that it tries the
latest feature first, and if it works, it's done.  the overhead is really
just the extra return value checking, and that only applies to some cases.
i suspect profiling of pretty much every program out there wouldn't even
register this overhead.

> 2) Availability of new features: It appears from the code that the
> documentation leaves out some important information. What actually happens
> while building glibc is that the "minimum kernel version" (which is either the
> version given by "--enable-kernel=" or the oldest possible version for that
> architecture) sets both __LINUX_KERNEL_VERSION and __ABI_TAG_VERSION so that
> glibc will never use any kernel features *newer* than this version. Therefore
> you cannot get access to recent kernel features *at all* via glibc (without
> manually altering glibc.mk).

this is dangerously incorrect FUD.  i don't know why you think this, but
it is *not* correct.  when a feature requires a newer kernel version than
the minimum set, it will first attempt to use the newer feature, and if
the kernel returns an error (e.g. ENOSYS), it will cache the result and
transparently fall back to the old code.

for example, from the glibc-2.22 release:
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/wordsize-64/posix_fallocate.c;h=8ae8a2927d174a70b7de724dc82f5c040174050b

if the min kernel version is high enough, __ASSUME_FALLOCATE is set to 1,
so the code ends up being the fallocate syscall directly.  but if it is
not, the syscall is tried, and if it fails w/ENOSYS, we cache the result
in __have_fallocate before falling back to older methods.  all future
calls will then see that cached value and immediately fallback.

> (An example of a recent feature would be the sendmmsg syscall, which
> requires a kernel version of 3.0.0 but the minimum version for PowerPC 64 is
> 2.6.24.)

i don't know where you're getting this information either.  starting with
glibc-2.20, the min required kernel version has been 2.6.32 for everyone.

the sendmmsg wrapper is tricky due to having to handle cancellation end
points.  so in this case, glibc will avoid using the syscall directly
unless it can assume it exists.
https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/sendmmsg.c;h=67b7ca9bfc9d63320fde1cceb95f81336a340f33

so in the ppc case, it will use socketcall(sendmmsg) when the min kernel
is below 3.0.  otherwise it uses sendmmsg directly.  in this particular
case, we haven't found the runtime overhead significant relative to the
source code overhead of having to deal with pthread cancellation.  this
is another case i doubt you can get to show up in profiling.

> I'd like to prepare a patch to make this configurable, and it obviously
> wouldn't be difficult to add but I'm not sure of the best way to do it.

all that said, having buildroot provide an option to set the min kernel
version with the default matching the selected kernel should be fine.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160202/ca69dc10/attachment.asc>
