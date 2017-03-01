From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:46:00 +0100
Subject: [Buildroot] [PATCH] libsidplay2: disable on powerpc64le
In-Reply-To: <1488319173-18452-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488319173-18452-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170301214600.4b2351bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 22:59:33 +0100, Thomas Petazzoni wrote:
> The libsidplay2 package build system is completely broken. It is made
> of a top-level configure script, which calls into sub-configure
> scripts in sub-directories. However, since it doesn't use the autoconf
> provided AC_CONFIG_SUBDIRS() mechanism, an "autoreconf" doesn't
> recurse into the subdirectories.
> 
> Due to this, the aclocal.m4 in the libsidplay/ subdirectory doesn't
> get re-generated when Buildroot autoreconfs the package. However,
> since we patch one of the .m4 files in this subdirectory, when build
> time comes, the package notices its aclocal.m4 is older than one of
> the .m4 file, and triggers an automatic autoreconf.
> 
> Since <pkg>_AUTORECONF = YES is enabled, this automatic autoreconf
> works fine: host-autoconf and host-automake are available.
> 
> Expect that on powerpc64le, we patch the configure script itself to
> make it recognize powerpc64le. But this patching of the configure
> script itself gets overwritten by the automatic autoreconf at the
> beginning of the build step, causing the build to fail on powerpc64le.
> 
> Switching to AC_CONFIG_SUBDIRS() would allow to fix this, but
> libsidplay2 needs to pass custom configure options to each of the
> sub-configure scripts, something that AC_CONFIG_SUBDIRS() doesn't
> support. And since libsidplay2 upstream looks completely dead, the
> incentive to fix the whole thing is very limited.
> 
> Hence, even though powerpc64le is not to blame here, we take the
> simple solution of disabling this package on powerpc64le.

In the end, I found a different approach, I posted a new patch at
https://patchwork.ozlabs.org/patch/734360/ and marked this one as
superseded.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
