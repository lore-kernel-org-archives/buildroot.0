From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 21 Nov 2019 16:46:55 +0000
Subject: [Buildroot] [PATCH 2/2] package/libv4l: link with libatomic
 when needed
In-Reply-To: <20191120204444.0cd0b955@gmx.net>
References: <20191030065303.22948-1-bernd.kuhls@t-online.de>
 <20191030065303.22948-2-bernd.kuhls@t-online.de>
 <20191030113040.474a31f9@windsurf> <20191030232618.5cd32feb@gmx.net>
 <d90c679a-a4f6-d825-63c8-ae90baf1ea73@codethink.co.uk>
 <20191120204444.0cd0b955@gmx.net>
Message-ID: <ecb19046-25f4-06f0-6d78-1c4c28ce7bf6@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/2019 19:44, Peter Seiderer wrote:
> On Wed, 20 Nov 2019 14:46:03 +0000, Thomas Preston <thomas.preston@codethink.co.uk> wrote:
>> On 30/10/2019 22:26, Peter Seiderer wrote:
>>> Adding the (missing?) '-L/home/seiderer/Work/Buildroot/build_sparc_qt5multimedia_001/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib'
>>> libtool command line parameter fixes the linking for the actual build...
>>>
>>> Any hint which (buildroot?) change triggered the remove of the link/library path removal?
>>>
>>
>> As previously discussed [0], the missing `-L..` is because pkgconf no longer
>> returns "system" include or library directories with -I and -L  (see [1]).
>> These are already in the compiler's default search path and were causing
>> include-order related bugs when using -isystem.
>>
>> However, it looks like that change has caused a problem here, where the output
>> from pkgconf is being passed to libtool to point it at the "system" library
>> directory in the sysroot.
>>
>> I don't know enough about libtool yet, but I think there are a few ways around
>> this:
>> 1. Tell libtool where the sysroot is by some other mechanism
>> 2. Tell pkgconf that we want to keep the system lib directories, when it is
>>    used to create arguments to libtool. The following argument will always
>>    return -L, as expected above:
>>
>>         pkg-config --keep-system-libs
> 
> The libv4l/libatomic case can be fixed by the following (hack):
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index a3bf099221..46c1ab9a48 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -16,7 +16,7 @@ LIBV4L_AUTORECONF = YES
>  LIBV4L_DEPENDENCIES += host-gettext
> 
>  # fix uclibc-ng configure/compile
> -LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
> +LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR)
> 
>  # v4l-utils components have different licences, see v4l-utils.spec for details
>  LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)
> 

This change works because the Buildroot's pkg-config wrapper script [0]
configures the following variables as relative to $(HOST_DIR)/bin:

	PKG_CONFIG_SYSROOT_DIR
	PKG_CONFIG_SYSTEM_INCLUDE_PATH
	PKG_CONFIG_SYSTEM_LIBRARY_PATH

So when you set PKG_CONFIG_SYSROOT_DIR=$(STAGING_DIR) (an absolute path),
pkgconf detects the difference and prints the sysroot system lib dirs.
These `-L` flags end up in the QT5_LIBS variable via autoconf.

	--- output/build/libv4l-1.18.0-broken/Makefile  2019-11-21 14:04:00.373262772 +0000
	+++ output/build/libv4l-1.18.0/Makefile 2019-11-21 15:53:40.388627694 +0000
	[snip]
	@@ -385,15 +385,15 @@
	[snip]
	-QT5_LIBS = -lQt5Widgets -lQt5Gui -lQt5Core
	+QT5_LIBS = -L/home/br-user/output/host/bin/../sparc-buildroot-linux-uclibc/sysroot/usr/lib -lQt5Widgets -lQt5Gui -lQt5Core
	[snip]

Which in turn, tell libtool to search `.../sysroot/usr/lib` for the .la
files, which contain the appropriate `-latomic` flag:

	$ grep latomic output/host/sparc-buildroot-linux-uclibc/sysroot/usr/lib/libQt5Widgets.la
	dependency_libs='-latomic  -lQt5Gui -lQt5Core -lpthread -lrt -lpthread -ldl'

The same effect can be achieved by telling pkgconf to keep the system 
libs:

	diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
	index a3bf099221..93edbfedd5 100644
	--- a/package/libv4l/libv4l.mk
	+++ b/package/libv4l/libv4l.mk
	@@ -16,7 +16,9 @@ LIBV4L_AUTORECONF = YES
	 LIBV4L_DEPENDENCIES += host-gettext

	 # fix uclibc-ng configure/compile
	-LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
	+LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' PKG_CONFIG_ALLOW_SYSTEM_LIBS=1

	 # v4l-utils components have different licences, see v4l-utils.spec for details
	 LIBV4L_LICENSE = GPL-2.0+ (utilities), LGPL-2.1+ (libraries)

Which I think is the right solution when we use pkgconf to generate
flags for libtool.

Thoughts?
Thomas Preston

[0] https://git.buildroot.net/buildroot/tree/package/pkgconf/pkg-config.in
