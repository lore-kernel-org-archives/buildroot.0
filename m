From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 14:49:32 +0100
Subject: [Buildroot] [PATCH v3] tcfagent: new package
In-Reply-To: <20171204120912.9850-1-nolange79@gmail.com>
References: <20171204114306.28242-1-nolange79@gmail.com>
 <20171204120912.9850-1-nolange79@gmail.com>
Message-ID: <20171213144932.31025d0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Dec 2017 13:09:12 +0100, Norbert Lange wrote:
> From: Norbert Lange <norbert.lange@andritz.com>
> 
> Add tcfpackage which contains a service "tcf-agent"
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

This is getting really good. I was about to apply, but spotted a few
things that I really would like to be improved before applying. See
below.

> +N:	Norbert Lange <nolange79@gmail.com>
> +F:	package/tcfagent

Add a final / here, to be consistent with all other entries in that
file.

> diff --git a/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch b/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
> new file mode 100644
> index 0000000000..954c0d5fe3
> --- /dev/null
> +++ b/package/tcfagent/0001-agent-add-install-target-to-the-CMakeLists.patch
> @@ -0,0 +1,48 @@
> +From 4c5fb079bc06ef04d09955eebe0d93d5ebfd4cdf Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <nolange79@gmail.com>
> +Date: Mon, 4 Dec 2017 10:56:45 +0100
> +Subject: [PATCH] agent: add install target to the CMakeLists
> +
> +It is common for CMake packages to make sure that 'make install'
> +works properly, and that's what most users expect.
> +
> +More specifically, build systems such as Buildroot also expect
> +'make install' to do the right thing for CMake-based packages
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>

Did you submit this patch upstream ?


> diff --git a/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch b/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
> new file mode 100644
> index 0000000000..16b748926f
> --- /dev/null
> +++ b/package/tcfagent/0002-linux-remove-explicit-uses-of-__ptrace_request.patch
> @@ -0,0 +1,66 @@
> +From 6407e3961dba749c8e3a0ea4ae8991154520364f Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <nolange79@gmail.com>
> +Date: Fri, 1 Dec 2017 13:15:50 +0100
> +Subject: [PATCH 1/2] linux: remove explicit uses of __ptrace_request

Please generate patches with "git format-patch -N". Indeed the PATCH
1/2 doesn't make much sense here, since it's patch 0002 :)



> +
> +This type is not to be used directly, and with musl it wont build
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>

Did you submit this upstream?


> diff --git a/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch b/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
> new file mode 100644
> index 0000000000..86dc2f37a1
> --- /dev/null
> +++ b/package/tcfagent/0003-linux-provide-canonicalize_file_name-for-all-c-libs-.patch
> @@ -0,0 +1,46 @@
> +From 58cc4092495acdc0b4be8e23c3964d47989a59dd Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <nolange79@gmail.com>
> +Date: Fri, 1 Dec 2017 13:34:08 +0100
> +Subject: [PATCH 2/2] linux: provide canonicalize_file_name for all c libs
> + except glibc

Please use git format-patch -N.

> +
> +musl was not covered so far, and this library does not define a
> +macro for detection.
> +unless glibc is detected, a canonicalize_file_name implementation
> +will be provided.
> +
> +Signed-off-by: Norbert Lange <nolange79@gmail.com>
> +---
> + agent/tcf/framework/mdep.c | 2 +-
> + agent/tcf/framework/mdep.h | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/agent/tcf/framework/mdep.c b/agent/tcf/framework/mdep.c
> +index cf5771e5..530a8017 100644
> +--- a/agent/tcf/framework/mdep.c
> ++++ b/agent/tcf/framework/mdep.c
> +@@ -1086,7 +1086,7 @@ char * canonicalize_file_name(const char * path) {
> +     return strdup(res);
> + }
> + 
> +-#elif defined(__UCLIBC__)
> ++#elif defined(__UCLIBC__) || !defined(__GLIBC_)

This is really not the proper way to do that. Could you instead replace
all this mess by a CheckFunctionExists(canonicalize_file_name) check in
the CMakeLists.txt, and then use the result of this test in the code to
decide whether it should provide its own implementation of
canonicalize_file_name or not.

With such a change, the patch can be submitted upstream.


> diff --git a/package/tcfagent/Config.in b/package/tcfagent/Config.in
> new file mode 100644
> index 0000000000..81affce6c1
> --- /dev/null
> +++ b/package/tcfagent/Config.in
> @@ -0,0 +1,25 @@
> +config BR2_PACKAGE_TCFAGENT
> +	bool "tcfagent"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be \
> +			|| BR2_i386 || BR2_x86_64 \
> +			|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +	help
> +	  Target Communication Framework Agent is an example application
> +	  using the Target Communication Framework Library.
> +
> +	  Target Communication Framework is universal, extensible, simple,
> +	  lightweight, vendor agnostic framework for tools and targets to
> +	  communicate for purpose of debugging, profiling, code patching
> +	  and other device software development needs.
> +
> +	  tcf-agent is a daemon, which provides TCF services that can be
> +	  used by local and remote clients.
> +
> +comment "tcfagent needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be \
> +		|| BR2_i386 || BR2_x86_64 \
> +		|| BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le

For the architecture, I'd like to have something a bit better to:

 1. Avoid duplicating the list of architectures between the main option
    and the Config.in comment

 2. Avoid the matching on the architecture in the .mk file.

So, something like this

config BR2_PACKAGE_TCFAGENT_ARCH
	string
	default "arm" if BR2_arm || BR2_armeb
	default "a64" if BR2_aarch64 || BR2_aarch64be
	default "i386" if ...
	...

config BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS
	bool
	default y if BR2_PACKAGE_TCFAGENT_ARCH != ""

config BR2_PACKAGE_TCFAGENT
	bool "tcfagent"
	depends on BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS

comment "tcfagent needs ..."
	depends on BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS



> diff --git a/package/tcfagent/S55tcfagent b/package/tcfagent/S55tcfagent
> new file mode 100755
> index 0000000000..2243b5a4c7
> --- /dev/null
> +++ b/package/tcfagent/S55tcfagent
> @@ -0,0 +1,40 @@
> +#!/bin/sh
> +
> +DAEMON_PATH=/usr/sbin/tcf-agent
> +DAEMON_NAME=tcf-agent
> +DAEMON_ARGS="-L- -l0"
> +
> +PIDFILE=/var/run/$DAEMON_NAME.pid
> +[ -r /etc/default/$DAEMON_NAME ] && . /etc/default/$DAEMON_NAME
> +
> +start() {
> +      printf "Starting $DAEMON_NAME: "
> +      start-stop-daemon -S -o -q -p $PIDFILE -m -b \
> +      -x $DAEMON_PATH -- $DAEMON_ARGS

Continuation line should be indented compared to the first line.

> +
> +      [ $? = 0 ] && echo "OK" || echo "FAIL"

You indent with 8 spaces here, it should be one tab.

> +}
> +
> +stop() {
> +  printf "Stopping $DAEMON_NAME: "
> +  start-stop-daemon -K -o -q -p $PIDFILE \
> +        -x $DAEMON_PATH
> +
> +  [ $? = 0 ] && echo "OK" || echo "FAIL"

You intend with two spaces here, not consitent with what is done above.

> +}
> +
> +case "$1" in
> +    start)
> +  start
> +  ;;
> +    stop)
> +  stop
> +  ;;
> +    restart|reload)
> +  stop
> +  start

Indentation is not good here.

> +# supported arch strings: a64 arm i386 i686 powerpc ppc64 x86_64
> +_TCFAGENT_BRARCH = $(patsubst "%",%,$(BR2_ARCH))
> +ifneq ($(filter arm armeb,$(_TCFAGENT_BRARCH)),)
> + 	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=arm
> +else ifneq ($(filter aarch64 aarch64_be,$(_TCFAGENT_BRARCH)),)
> + 	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=a64
> +else ifneq ($(filter i386 i486 i586,$(_TCFAGENT_BRARCH)),)
> +	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=i386
> +else ifneq ($(filter i686 x86_64 powerpc,$(_TCFAGENT_BRARCH)),)
> +	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=$(_TCFAGENT_BRARCH)
> +else ifneq ($(filter powerpc64 powerpc64le,$(_TCFAGENT_BRARCH)),)
> +	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=ppc64
> +# only supported in trunk as of 1.5_oxygen
> +# else ifneq ($(filter microblaze microblazeel,$(_TCFAGENT_BRARCH)),)
> +# 	TCFAGENT_CONF_OPTS += -DTCF_MACHINE=microblaze
> +else
> +$(warning "Unsupported architecture $(_TCFAGENT_BRARCH)")
> +endif

The warning is useless (the package cannot be selected on unsupported
architectures) and actually harmful because it will be printed on
configurations using unsupported architectures: all .mk files are
parsed, even when the package is not enabled, and the $(warning ...)
call is evaluated at the time of the .mk file parsing.

Replace all this by:

TCFAGENT_ARCH = $(call qstrip,$(BR2_PACKAGE_TCFAGENT_ARCH))

> +
> +_TCFAGENT_BRARCH =

Unneeded variable.

Could you rework your submission according to this review, and submit
an updated version ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
