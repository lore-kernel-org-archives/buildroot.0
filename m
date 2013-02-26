From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Feb 2013 19:33:30 +0100
Subject: [Buildroot] Proposed util-linux split
In-Reply-To: <512C941A.1070207@zacarias.com.ar>
References: <512C941A.1070207@zacarias.com.ar>
Message-ID: <20130226193330.04f77759@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 26 Feb 2013 07:53:14 -0300, Gustavo Zacarias wrote:

> The last couple of days i've been thinking and working towards a
> solution that would split out libblkid/libuuid out of the util-linux
> package.
> It's a remake of my previous "util-linux don't install binaries" patch.
> The objectives are:
> 
> * Upgrading to newer versions of the libraries - it's not required by
> any package, but it's useful for libblkid to recognize newer superblock
> types.
> 
> * We can't upgrade util-linux past 2.20.1 unless we want to drop the
> basic loginutils functionality since it requires PAM starting from 2.21.
> By splitting the libraries out i can use just the libraries from newer
> util-linux versions. Caveat is you won't get the newer libraries if
> you're installing util-linux with the library options on.

I would suggest that we upgrade util-linux and add the necessary PAM
dependency when needed. We already have package/linux-pam/, so it
shouldn't be a big effort.

Of course, only the util-linux programs that actually need PAM support
should make this library become a dependency of util-linux.

> * Reduce bloat! The most important point for me, one packages needs
> libuuid and we get a dozen util-linux binaries around as a free gift.
> 
> I've got a working not-quite-ready (needs cleanup) patchset that adds
> the libblkid and libuuid packages. These are based on a slightly patched
> (configure.ac & Makefile.am) util-linux-2.22.2 that basically reduces
> build time and keeps the original install target (you can't make -C
> libblkid install with newer util-linux versions, see
> http://karelzak.blogspot.com/2013/02/non-recursive-automake.html)
> 
> When a package needs libuuid it would now change to:
> select BR2_PACKAGE_LIBUUID if !BR2_PACKAGE_UTIL_LINUX_LIBUUID
> to avoid duplication.
> And on libuuid Config.in:
> depends on !BR2_PACKAGE_UTIL_LINUX_LIBUUID

Would it be possible instead that util-linux always uses the libuuid
from the libuuid package?

> This lets us keep util-linux around (which doesn't work with external
> libblkid/libuuid because it doesn't expect them to be so) and slimmer
> versions of the libraries when people don't want util-linux.
> 
> Another added bonus is libuuid doesn't require wchar this way.
> 
> What do you think?

I must admit I don't really like having multiple packages for the same
upstream tarball. Another option is to make something like:

config BR2_PACKAGE_UTIL_LINUX
	bool "util-linux"
	select BR2_PACKAGE_UTIL_LINUX_LIBUUID if !BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING

config BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING
	bool

config BR2_PACKAGE_UTIL_LINUX_LIBUUID
	bool "libuuid"

config BR2_PACKAGE_UTIL_LINUX_LIBBLKDID
	bool "libblkid"
	select BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING

config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
	bool "libmount"
	select BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING

config BR2_PACKAGE_UTIL_LINUX_SOMEPROGA
	bool "program a"
	select BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING

This way, by default util-linux only installs libuuid.

No?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
