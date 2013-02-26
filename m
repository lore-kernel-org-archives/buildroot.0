From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Feb 2013 15:41:15 -0300
Subject: [Buildroot] Proposed util-linux split
In-Reply-To: <20130226193330.04f77759@skate>
References: <512C941A.1070207@zacarias.com.ar> <20130226193330.04f77759@skate>
Message-ID: <512D01CB.3040301@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/26/2013 03:33 PM, Thomas Petazzoni wrote:

> I would suggest that we upgrade util-linux and add the necessary PAM
> dependency when needed. We already have package/linux-pam/, so it
> shouldn't be a big effort.
> 
> Of course, only the util-linux programs that actually need PAM support
> should make this library become a dependency of util-linux.

That wouldn't be hard, howerver we'll loose the busybox login
alternative for cases without PAM.

> Would it be possible instead that util-linux always uses the libuuid
> from the libuuid package?

Not without heavy patching which doesn't look so simple for 2.22+ that
did a big rewrite in the autotools fu.

> I must admit I don't really like having multiple packages for the same
> upstream tarball. Another option is to make something like:
> 
> config BR2_PACKAGE_UTIL_LINUX
> 	bool "util-linux"
> 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID if !BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING
> 
> config BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING
> 	bool
> 
> config BR2_PACKAGE_UTIL_LINUX_LIBUUID
> 	bool "libuuid"
> 
> config BR2_PACKAGE_UTIL_LINUX_LIBBLKDID
> 	bool "libblkid"
> 	select BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING
> 
> config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
> 	bool "libmount"
> 	select BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING
> 
> config BR2_PACKAGE_UTIL_LINUX_SOMEPROGA
> 	bool "program a"
> 	select BR2_PACKAGE_UTIL_LINUX_AT_LEAST_SOMETHING
> 
> This way, by default util-linux only installs libuuid.
> 
> No?

That's what my previous util-linux patch did, however if we upgrade to
newer (2.22+) util-linux the old trick (make -C libxxx) doesn't work any
longer and needs patching anyway (it uses "automodules", hence no
regular Makefile for the subdirs, those are included from the top Makefile).
The patch isn't too straightforward since i remove the automodules
includes, hence not very nice for dynamic patching via sed.
The alternative would be to remove stuff we always build since
util-linux always installs a basic set of utilities that can't be
disabled (and remember, no install-libuuid or anything similar as
targets, they're all pushed into a big variable with no useful naming by
the automodules mechanism).
Regards.
