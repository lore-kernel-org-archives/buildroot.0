From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Jan 2015 16:32:30 +0100
Subject: [Buildroot] [PATCH v4 05/27] audit: new package
In-Reply-To: <1420816288-8750-6-git-send-email-matthew.weber@rockwellcollins.com>
References: <1420816288-8750-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1420816288-8750-6-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20150109163230.0f7acc59@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Fri,  9 Jan 2015 09:11:06 -0600, Matt Weber wrote:

> diff --git a/package/audit/0001-cross-compile-header-creation-fix.patch b/package/audit/0001-cross-compile-header-creation-fix.patch
> new file mode 100644
> index 0000000..65d98d5
> --- /dev/null
> +++ b/package/audit/0001-cross-compile-header-creation-fix.patch
> @@ -0,0 +1,1424 @@
> +Rework the build system to generate the required header files using a 
> +Python script rather than compiling executables.  This change has
> +to be made because the executables that are generated are built for
> +the target architecture and are generally not compilable on the host
> +build machine.  
> +
> +The code has been submitted to the audit maintainers for review.
> +The first of three patches can be seen at the following link.
> +https://www.redhat.com/archives/linux-audit/2013-August/msg00043.html

Have you received some feedback from the maintainers?

This stuff looks really, really scary. Please include in the patch
description an explanation of why a rewrite in Python is needed instead
of using a C version. I remember we had this discussion a while ago,
but I don't remember the reason.

In general, whenever something is weird/unusual, please add comments.
Either in the code (preferred) or in the commit log. This will help
review immensely, as it will answer questions that reviewers will have.

> diff --git a/package/audit/Config.in b/package/audit/Config.in
> new file mode 100644
> index 0000000..c51b6e4
> --- /dev/null
> +++ b/package/audit/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_AUDIT
> +	bool "audit"
> +	help
> +	  The audit package contains the user space utilities for
> +	  storing and searching the audit records generate by
> +	  the audit subsystem in the Linux 2.6 kernel
> +
> +	  Note: The z/OS remote plugin is disabled in this package
> +
> +	  http://people.redhat.com/sgrubb/audit/
> diff --git a/package/audit/S01auditd b/package/audit/S01auditd
> new file mode 100644
> index 0000000..23a7761
> --- /dev/null
> +++ b/package/audit/S01auditd
> @@ -0,0 +1,172 @@
> +#!/bin/sh
> +#
> +# auditd        This starts and stops auditd
> +#
> +# description: This starts the Linux Auditing System Daemon, \
> +#              which collects security related events in a dedicated \
> +#              audit log. If this daemon is turned off, audit events \
> +#              will be sent to syslog.
> +#
> +# processname: /sbin/auditd
> +# config: /etc/sysconfig/auditd
> +# config: /etc/audit/auditd.conf
> +# pidfile: /var/run/auditd.pid
> +#
> +# Return values according to LSB for all commands but status:
> +# 0 - success
> +# 1 - generic or unspecified error
> +# 3 - unimplemented feature (e.g. "reload")
> +# 4 - insufficient privilege
> +# 5 - program is not installed
> +# 6 - program is not configured
> +# 7 - program is not running

We don't have this error code stuff in any other Buildroot init script.

> +#
> +prog="auditd"
> +
> +# Check that we are root ... so non-root users stop here
> +test $EUID=0  ||  exit 4
> +
> +# Check config
> +test -f /etc/sysconfig/auditd && . /etc/sysconfig/auditd
> +
> +RETVAL=0
> +LOCK=/var/lock/subsys/auditd
> +
> +start(){
> +   echo -n "Initializing $prog: "
> +
> +   if [ ! -e $LOCK ]; then
> +      test -x /sbin/auditd  || exit 5
> +      test -f /etc/audit/auditd.conf  || exit 6
> +   
> +      # Create dir to store log files in if one doesn't exist
> +      test -d /var/log/audit || mkdir -p /var/log/audit && /sbin/restorecon /var/log/audit
> +   
> +      # Run audit daemon executable
> +      $prog
> +      RETVAL=$?
> +      if test $RETVAL = 0 ; then
> +         test -d /var/lock/subsys || mkdir -p /var/lock/subsys
> +         touch $LOCK
> +         # Load the default rules
> +         test -f /etc/audit/audit.rules && /sbin/auditctl -R /etc/audit/audit.rules >/dev/null
> +         echo "OK"
> +      else
> +         echo "FAILED: auditd failed to start"
> +      fi
> +   else
> +      echo "FAILED: auditd already started, stop first"
> +      RETVAL=1
> +   fi
> +   return $RETVAL
> +}
> +
> +stop(){
> +   echo -n "Uninitializing $prog: "
> +   if [ -e $LOCK ]; then
> +      killall -TERM $prog
> +      RETVAL=$?
> +      if [ $RETVAL ]; then
> +         rm -f $LOCK
> +         # Remove watches so shutdown works cleanly
> +         if test x"$AUDITD_CLEAN_STOP" != "x" ; then
> +            if test "`echo $AUDITD_CLEAN_STOP | tr 'NO' 'no'`" != "no"
> +            then
> +               /sbin/auditctl -D >/dev/null
> +            fi
> +         fi
> +         if test x"$AUDITD_STOP_DISABLE" != "x" ; then
> +            if test "`echo $AUDITD_STOP_DISABLE | tr 'NO' 'no'`" != "no"
> +            then
> +               /sbin/auditctl -e 0 >/dev/null
> +            fi
> +         fi
> +         echo "OK"
> +      else
> +         echo "FAILED: auditd not stopped"
> +      fi
> +   else
> +      echo "FAILED: auditd not started"
> +      RETVAL=1
> +   fi
> +   return $RETVAL
> +}

Can we use start-stop-daemon and make the whole initscript look more
like other Buildroot provided init scripts?

> +rotate(){
> +   echo -n "Rotating auditd logs: "  
> +   if [ -e $LOCK ]; then
> +      killall -USR1 $prog
> +      RETVAL=$?
> +      if [ $RETVAL ]; then
> +         echo "OK"
> +      else
> +         echo "FAILED"
> +      fi
> +   else
> +      echo "FAILED: auditd not started"
> +      RETVAL=1
> +   fi
> +   return $RETVAL
> +}

We don't have this in any other Buildroot init script.

Can you make this more Buildroot-looking?


> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
> new file mode 100644
> index 0000000..c8576b2
> --- /dev/null
> +++ b/package/audit/audit.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# audit
> +#
> +################################################################################
> +
> +AUDIT_VERSION:=2.3.2
> +AUDIT_SITE:=http://people.redhat.com/sgrubb/audit/

No :=, please use =.

> +AUDIT_DEPENDENCIES = host-python-pyparsing

I think explicitly depending on host-python here would be good.

> +AUDIT_LICENSE = GPLv2
> +AUDIT_LICENSE_FILES = COPYING
> +
> +AUDIT_INSTALL_STAGING = YES
> +
> +AUDIT_AUTORECONF = YES
> +AUDIT_AUTORECONF_OPTS = -i -s -I m4
> +AUDIT_LIBTOOL_PATCH = NO

Please add comments about why autoreconf is needed, and while the
libtool patch needs to be disabled.

> +
> +# Audit will be looking for applications to be in the root
> +# /sbin folder rather than in /usr/sbin folder
> +AUDIT_CONF_OPTS = --sbindir=/sbin
> +
> +AUDIT_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)"
> +AUDIT_CONF_OPTS += --with-python=no

This seems crazy: you're saying to not use python, but you're passing
some -I flags to the Python headers. Please add more comments to
explain what's going on.

> +
> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
> +	AUDIT_DEPENDENCIES += libcap-ng
> +	AUDIT_CONF_OPTS += --with-libcap-ng=yes

We typically don't intend those lines anymore.

> +else
> +	AUDIT_CONF_OPTS += --with-libcap-ng=no
> +endif
> +
> +ifeq ($(BR2_armeb),y)
> +	AUDIT_CONF_OPT += --with-armeb
> +endif
> +ifeq ($(BR2_arm),y)
> +	AUDIT_CONF_OPT += --with-armeb
> +endif
> +ifeq ($(BR2_aarch64),y)
> +	AUDIT_CONF_OPT += --with-aarch64
> +endif

What happens for the other architectures? Why only armeb, arm and
aarch64 have special handling?

> +
> +ifeq ($(BR2_STATIC_LIBS),y)
> +	AUDIT_CONF_OPTS += --enable-shared=no
> +endif

Buildroot is already passing --disable-shared when BR2_STATIC_LIBS=y,
which is the same as --enable-shared=no with the autotools. So this
looks unneeded.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
