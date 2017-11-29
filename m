From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 22:45:24 +0100
Subject: [Buildroot] [PATCH 1/1] Add TCF Agent package
In-Reply-To: <20171114145442.16734-1-norbert.lange@andritz.com>
References: <20171114145442.16734-1-norbert.lange@andritz.com>
Message-ID: <20171129224524.1f8022b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 15:54:42 +0100, Norbert Lange wrote:
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>

Thanks a lot for this contribution! This looks pretty good, there are
just a few things that should be improved. See below for my comments.

First a pedantic comment: the commit title should be "tcf-agent: new
package".

> ---
>  package/Config.in                                  |  1 +
>  ...add-CMake-install-target-for-agent-binary.patch | 35 ++++++++++++++++
>  package/tcfagent/Config.in                         | 16 ++++++++
>  package/tcfagent/S55tcfagent                       | 47 ++++++++++++++++++++++
>  package/tcfagent/tcfagent.hash                     |  4 ++
>  package/tcfagent/tcfagent.mk                       | 38 +++++++++++++++++
>  package/tcfagent/tcfagent.service                  | 10 +++++

Please add yourself to the DEVELOPERS file. This way, we will know who
to contact when there are issues with this package :-)

> diff --git a/package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch b/package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch
> new file mode 100644
> index 0000000000..bb9c334d91
> --- /dev/null
> +++ b/package/tcfagent/0001-add-CMake-install-target-for-agent-binary.patch
> @@ -0,0 +1,35 @@
> +From 9140c630085833acfe565f27195a876c6656f068 Mon Sep 17 00:00:00 2001
> +From: Norbert Lange <norbert.lange@andritz.com>
> +Date: Mon, 30 Oct 2017 16:22:40 +0100
> +Subject: [PATCH] add CMake install target for agent binary
> +
> +allows use in automated buildsystems like Buildroot

Buildroot could technically do without it, but it would be annoying
indeed. Perhaps a better phrasing would be: "It is common for CMake
packages to make sure that 'make install' works properly, and that's
what most users expect. More specifically, build systems such as
Buildroot also expect 'make install' to do the right thing for
CMake-based packages".

Also, please add your Signed-off-by line to this patch, and submit it
upstream for inclusion.

> + agent/CMakeLists.txt | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/agent/CMakeLists.txt b/agent/CMakeLists.txt
> +index aef15b96..7868987a 100644
> +--- a/agent/CMakeLists.txt
> ++++ b/agent/CMakeLists.txt
> +@@ -1,6 +1,7 @@
> + # -*- cmake -*-
> + 
> + cmake_minimum_required(VERSION 2.8)
> ++include(GNUInstallDirs)

I'm not super familiar with CMake, but why is this needed?

> diff --git a/package/tcfagent/Config.in b/package/tcfagent/Config.in
> new file mode 100644
> index 0000000000..1374fdf88d
> --- /dev/null
> +++ b/package/tcfagent/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_TCFAGENT
> +	bool "tcfagent"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # snmp++

You're not using snmp++, so the comment here doesn't make much sense.

> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID

You should also select BR2_PACKAGE_UTIL_LINUX then.

> +	help
> +	  Target Communication Framework Agent is an example application
> +	  using the Target Communication Framework Library.
> +
> +	  Target Communication Framework is universal, extensible, simple,
> +	  lightweight, vendor agnostic framework for tools and targets to
> +	  communicate for purpose of debugging, profiling, code patching and
> +	  other device software development needs. tcf-agent is a daemon,
> +	  which provides TCF services that can be used by local and remote clients.

Please wrap lines at 72 characters (where the first tab counts for 8
characters).

> +comment "tcfagent needs a toolchain w/ threads, C++, dynamic library"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS

So, the message says that you need threads, C++ and dynamic library...
but the dependency is only about thread. Which one is correct ? :-)

> diff --git a/package/tcfagent/S55tcfagent b/package/tcfagent/S55tcfagent
> new file mode 100755
> index 0000000000..b022d5eb92
> --- /dev/null
> +++ b/package/tcfagent/S55tcfagent
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +#
> +# Start tcf-agent....

Not very useful comment.

> +#
> +
> +DAEMON_PATH=/usr/sbin/tcf-agent
> +DAEMON_NAME=tcf-agent
> +DAEMON_ARGS="-d -L- -l0"
> +
> +PIDFILE=/var/run/$DAEMON_NAME.pid
> +[ ! -r /etc/default/$DAEMON_NAME ] || . /etc/default/$DAEMON_NAME

Positive logic here would be better:

[ -r /etc/default/$DAEMON_NAME ] && . /etc/default/$DAEMON_NAME

> +start() {
> +      printf "Starting $DAEMON_NAME: "
> +      start-stop-daemon -S -q -o \
> +      -x $DAEMON_PATH -- $DAEMON_ARGS &&
> +        PPID=$(pidof $(basename $DAEMON_PATH)) &&
> +        echo $PPID > $PIDFILE

What you're doing here for the pidfile is quite weird. Why don't you
let start-stop-daemon create the PID file in the first place ? Is it
because tcf-agent daemonizes itself ? If so, I see two options:

 - Ask tcf-agent to not daemonize itself (sometimes there's a -f or
   --foreground option)

 - Ask tcf-agent to create the PID file if it supports that.

> +      [ $? = 0 ] && echo "OK" || echo "FAIL"
> +}
> +
> +stop() {
> +  printf "Stopping $DAEMON_NAME: "
> +  start-stop-daemon -K -o -s HUP -q -p $PIDFILE \

Why the HUP signal ?

> +        -x $DAEMON_PATH &&
> +        rm -f $PIDFILE

We generally don't remove the PID file.

> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
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
> +  ;;
> +  *)
> +  echo "Usage: $0 {start|stop|restart}"
> +  exit 1
> +esac
> +
> +exit $?

This last "exit" is not needed.

> diff --git a/package/tcfagent/tcfagent.hash b/package/tcfagent/tcfagent.hash
> new file mode 100644
> index 0000000000..ffed5dcb19
> --- /dev/null
> +++ b/package/tcfagent/tcfagent.hash
> @@ -0,0 +1,4 @@
> +# Locally computed:
> +sha256  47d34c0778aa8b9e2c26132c9bb03d643bfb8e44d03ce862d06f2f93edcb63ae  org.eclipse.tcf.agent-1.3.0.tar.gz
> +sha256  34188fd2daeadf6574071f5004f9a7a55b3ac73efe9db203a01559ee1013b2db  org.eclipse.tcf.agent-1.4_neon.tar.gz
> +sha256  4b6c757e2bed92a0a791d0687425d462c974abe4c79f80e27e362fdaa59107f5  org.eclipse.tcf.agent-1.5_oxygen.tar.gz

Please keep the hash only for the current version being used.

However, you could add the hash for the license file.

> diff --git a/package/tcfagent/tcfagent.mk b/package/tcfagent/tcfagent.mk
> new file mode 100644
> index 0000000000..30bd366137
> --- /dev/null
> +++ b/package/tcfagent/tcfagent.mk
> @@ -0,0 +1,38 @@
> +################################################################################
> +#
> +# TCFAGENT
> +#
> +################################################################################
> +
> +TCFAGENT_VERSION = 1.5_oxygen
> +# the tar.xz link was broken the time this file got authored
> +TCFAGENT_SOURCE = org.eclipse.tcf.agent-$(TCFAGENT_VERSION).tar.gz
> +TCFAGENT_SITE = http://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/snapshot
> +# see https://wiki.spdx.org/view/Legal_Team/License_List/Licenses_Under_Consideration

Thanks for adding this explanation, definitely useful!

> +TCFAGENT_LICENSE = BSD-3-Clause
> +TCFAGENT_LICENSE_FILES = agent/edl-v10.html
> +
> +TCFAGENT_DEPENDENCIES = util-linux
> +TCFAGENT_SUBDIR = agent
> +TCFAGENT_CONF_OPTS = -DBUILD_SHARED_LIBS=Off

Why do you disable shared library build ?

> +
> +define TCFAGENT_RENAME_AGENT
> +	mv $(TARGET_DIR)/usr/bin/agent $(TARGET_DIR)/usr/sbin/tcf-agent
> +endef
> +
> +TCFAGENT_POST_INSTALL_TARGET_HOOKS += TCFAGENT_RENAME_AGENT

This is a bit annoying because you have already overwritten the "agent"
file if there was one in $(TARGET_DIR)/usr/bin/agent. So perhaps it
should be patched in the upstream CMake build logic instead ?

> +
> +define TCFAGENT_INSTALL_INIT_SYSTEMD
> +	$(INSTALL) -D -m 644 package/tcfagent/tcfagent.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/tcfagent.service
> +	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> +	ln -fs ../../../../usr/lib/systemd/system/tcfagent.service \
> +		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/tcfagent.service
> +endef
> +
> +define TCFAGENT_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 755 package/tcfagent/S55tcfagent \
> +		$(TARGET_DIR)/etc/init.d/S55tcfagent
> +endef
> +
> +$(eval $(cmake-package))
> diff --git a/package/tcfagent/tcfagent.service b/package/tcfagent/tcfagent.service
> new file mode 100644
> index 0000000000..2f57fca3c8
> --- /dev/null
> +++ b/package/tcfagent/tcfagent.service
> @@ -0,0 +1,10 @@
> +[Unit]
> +Description=Target Communication Framework Agent
> +After=network.target
> +
> +[Service]
> +Type=forking
> +ExecStart=@SBINDIR@/tcf-agent -L- -l0

What is replacing @SBINDIR@ by the correct value? Note: I'm not super
familiar with systemd, so maybe it's an obvious functionality of
systemd. But I don't think I've already seen that in systemd units.

Could you look at the different issues I pointed out and submit an
updated version of your patch ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
