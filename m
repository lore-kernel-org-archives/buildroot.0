From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Fri, 22 May 2015 13:28:39 -0500
Subject: [Buildroot] [PATCH v5 05/24] audit: new package
In-Reply-To: <20150521233346.35136c45@free-electrons.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-6-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150521233346.35136c45@free-electrons.com>
Message-ID: <CANn-YGSDCKRUEFB8eMkkheG2U7dBXmNkB0QsUeXFeuJHqHp+Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, May 21, 2015 at 4:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Clayton Shotwell,
>
> On Wed, 13 May 2015 16:39:18 -0500, Clayton Shotwell wrote:
>
>> Changes v4 -> v5:
>>   - Removed limitation on glibc only build (Matt W.)
>>   - Updated static lib build option variable name (Matt W.)
>>   - Upgrading audit to the latest version. Switched to a simpler
>>     cross compile support patch that should be upstreamable (Clayton
>> S.)
>>   - Cleaned up build flags and patch names (Clayton S.)
>>   - The xtensa architecture uclibc is missing the ADDR_NO_RANDOMIZE
>>     flag that is required by the audit application. Exclute the audit
>>     package from the xtensa architecture. (Clayton S.)
>
> This has probably been changed since then, because you haven't ecluded
> Xtensa, but instead did a workaround to cope with ADDR_NO_RANDOMIZE
> being not available.

That is correct. I will update the comment to reflect this solution.

>> diff --git a/package/audit/0001-Enable-cross-compiling.patch
>> b/package/audit/0001-Enable-cross-compiling.patch new file mode 100644
>> index 0000000..b2c9b4c
>> --- /dev/null
>> +++ b/package/audit/0001-Enable-cross-compiling.patch
>> @@ -0,0 +1,773 @@
>> +From c30e91c2833fb5c33a238258e5902cc2dd8586d3 Mon Sep 17 00:00:00
>> 2001 +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +Date: Thu, 26 Mar 2015 12:26:36 -0500
>> +Subject: [PATCH] Enable cross compiling
>> +
>> +During the audit build, several lookup tables are generated as header
>> +files that are then linked in with the executables. This process is
>> done +by a C application that needs to be able to be run on the host.
>> The +current Makfile structure tries to build these executables for
>> the +target instead of the host where they cannot be executed. This
>> patch +reworks the Makefile structure to build for the correct
>> platform. +
>> +This patch is a rework of a patch posted to the audit mailing list at
>> +the link below.
>> +https://www.redhat.com/archives/linux-audit/2012-November/msg00000.html
>> +
>> +The ax_prog_cc_for_build.m4 file was obtained from GNU at the link
>> +below.
>> +http://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
>> +
>> +Signed-off-by: Clayton Shotwell
>> <clayton.shotwell@rockwellcollins.com> +---
>> + auparse/Makefile.am        | 276
>> ++++++++++++++++++++++++++++++---------------
>> + configure.ac               |   1 +
>> + lib/Makefile.am            | 133 ++++++++++++++--------
>> + m4/ax_prog_cc_for_build.m4 | 125 ++++++++++++++++++++
>> + 4 files changed, 397 insertions(+), 138 deletions(-)
>> + create mode 100644 m4/ax_prog_cc_for_build.m4
>
> This patch looks OK to me. We could potentially avoid the need for
> having m4/ax_prog_cc_for_build.m4 by adding host-autoconf-archive to
> the dependencies, and passing:
>
> AUDIT_AUTORECONF_OPTS = -I $(HOST_DIR)/usr/share/autoconf-archive
>
> however I am not sure if it's really worth the effort.
>
> Other than that, this patch looks OK to me.

I am working on getting this submitted upstream. I would like to keep
the patch as is until I hear back from the audit maintainers.

>> diff --git a/package/audit/0002-Remove-zos-remote-plugin.patch
>> b/package/audit/0002-Remove-zos-remote-plugin.patch new file mode
>> 100644 index 0000000..1c8180d
>> --- /dev/null
>> +++ b/package/audit/0002-Remove-zos-remote-plugin.patch
>> @@ -0,0 +1,54 @@
>> +From 145a6ddfc8cfcd20bbb505637e50191655128fbb Mon Sep 17 00:00:00
>> 2001 +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +Date: Thu, 26 Mar 2015 12:33:10 -0500
>> +Subject: [PATCH] Remove zos-remote plugin
>> +
>> +The zos-remote plugin is meant to use LDAP authentication to verify a
>> +remote audit user. This is not a package that is available or
>> desired in +an embedded target. Removing the plugin from the build
>> until it is +able to be turned off from configure.
>> +
>> +Signed-off-by: Clayton Shotwell
>> <clayton.shotwell@rockwellcollins.com> +---
>> + audisp/plugins/Makefile.am | 2 +-
>> + audisp/plugins/Makefile.in | 4 ++--
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>
> Changes to the Makefile.in are not needed, since you autoreconf the
> package anyway, Makefile.in is regenerated.

Good point. Not sure why I changed that file also.

> Also, what about adding a --enable-zos-remote / --disable-zos-remote
> option, so that this patch can be submitted upstream?
>
> Something like:
>
> AC_ARG_ENABLE([zos-remote],
>               AS_HELP_STRING([--disable-zos-remote], [Disable the ZOS remote plugin (default: enabled)]),
>               [with_zos_remote_plugin=$enableval],
>               [with_zos_remote_plugin=yes])
> AM_CONDITIONAL([WITH_ZOS_REMOTE], [test "$with_zos_remote_plugin" = "yes"])

That is probably a better solution. I'll get that implemented for v6.

>> +diff --git a/audisp/plugins/Makefile.am b/audisp/plugins/Makefile.am
>> +index b0fa60a..3d6f4e6 100644
>> +--- a/audisp/plugins/Makefile.am
>> ++++ b/audisp/plugins/Makefile.am
>> +@@ -22,7 +22,7 @@
>> +
>> + CONFIG_CLEAN_FILES = *.loT *.rej *.orig
>> +
>> +-SUBDIRS = builtins zos-remote remote
>> ++SUBDIRS = builtins remote
>
> if WITH_ZOS_REMOTE
> SUBDIRS += zos-remote
> endif
>
>> a/package/audit/0004-Do-not-call-posix_fallocate-on-uClibc.patch
>> b/package/audit/0004-Do-not-call-posix_fallocate-on-uClibc.patch new
>> file mode 100644 index 0000000..87ea6a8 --- /dev/null
>> +++ b/package/audit/0004-Do-not-call-posix_fallocate-on-uClibc.patch
>> @@ -0,0 +1,45 @@
>> +From 8b65b6788140ba169edb620a2abcf438521919ed Mon Sep 17 00:00:00
>> 2001 +From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
>> +Date: Wed, 1 Apr 2015 07:49:54 -0500
>> +Subject: [PATCH] Do not call posix_fallocate() on uClibc
>> +
>> +uClibc does not implement posix_fallocate(), and posix_fallocate() is
>> +mostly only a hint to the kernel that we will need such or such
>> +amount of space inside a file. So we just don't call
>> posix_fallocate() +when building against uClibc.
>> +
>> +Patch copies functionality implemented by Thomas for the
>> +lttng-babeltrace package.
>> +
>> +Signed-off-by: Clayton Shotwell
>> <clayton.shotwell@rockwellcollins.com> +---
>
> Using a configure.ac check would actually be a lot better.
>
> AC_CHECK_FUNCS([posix_fallocate])
>
> and then #ifdef HAVE_POSIX_FALLOCATE in the C source file.

I will get this fixed and tested for v6.

>> diff --git a/package/audit/Config.in b/package/audit/Config.in
>> new file mode 100644
>> index 0000000..5cf1c26
>> --- /dev/null
>> +++ b/package/audit/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_AUDIT
>> +     bool "audit"
>> +     # needs memory fences for internal libev
>> +     depends on !BR2_bfin
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     help
>> +       The audit package contains the user space utilities for
>> +       storing and searching the audit records generated by
>> +       the audit subsystem in the Linux 2.6 kernel
>> +
>> +       Note: The z/OS remote plugin is disabled in this package
>> +
>> +       http://people.redhat.com/sgrubb/audit/
>> +
>> +comment "audit needs a toolchain w/ threads"
>> +     depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_bfin
>
> This should be:
>
>         depends on !BR2_bfin
>         depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> so that the comment never appears on Blackfin, and appears on other
> architectures than Blackfin when thread support is not available.
>
> With your solution, the comment always appears on Blackfin.

Good catch. I'll make that change.

>> diff --git a/package/audit/S01auditd b/package/audit/S01auditd
>> new file mode 100644
>> index 0000000..9083bfe
>> --- /dev/null
>> +++ b/package/audit/S01auditd
>
> I am not sure about this script, it seems quite complicated compared to
> other init scripts in Buildroot.
>
>> @@ -0,0 +1,169 @@
>> +#!/bin/sh
>> +#
>> +# auditd        This starts and stops auditd
>> +#
>> +# description: This starts the Linux Auditing System Daemon, \
>> +#              which collects security related events in a dedicated
>> \ +#              audit log. If this daemon is turned off, audit
>> events \ +#              will be sent to syslog.
>> +#
>> +# processname: /usr/sbin/auditd
>> +# config: /etc/sysconfig/auditd
>> +# config: /etc/audit/auditd.conf
>> +# pidfile: /var/run/auditd.pid
>> +#
>> +# Return values according to LSB for all commands but status:
>> +# 0 - success
>> +# 1 - generic or unspecified error
>> +# 3 - unimplemented feature (e.g. "reload")
>> +# 4 - insufficient privilege
>> +# 5 - program is not installed
>> +# 6 - program is not configured
>> +# 7 - program is not running
>
> Do we care about LSB conformance of our init scripts?
>
>> +#
>> +prog="auditd"
>> +
>> +# Check that we are root ... so non-root users stop here
>> +test $EUID=0  ||  exit 4
>
> We typically don't do such checks in other init scripts.
>
>> +
>> +# Check config
>> +test -f /etc/sysconfig/auditd && . /etc/sysconfig/auditd
>
> /etc/sysconfig is clearly not something standard in Buildroot.
>
>> +
>> +RETVAL=0
>> +LOCK=/var/lock/subsys/auditd
>> +
>> +start(){
>> +   echo -n "Initializing $prog: "
>> +
>> +   if [ ! -e $LOCK ]; then
>> +      test -x /usr/sbin/auditd  || exit 5
>> +      test -f /etc/audit/auditd.conf  || exit 6
>> +
>> +      # Create dir to store log files in if one doesn't exist
>> +      test -d /var/log/audit || mkdir /var/log/audit -Z
>> `matchpathcon /var/log/audit | cut -f 2` +
>> +      # Run audit daemon executable
>> +      $prog
>
> start-stop-daemon?
>
>> +      RETVAL=$?
>> +      if test $RETVAL = 0 ; then
>> +         test -d /var/lock/subsys || mkdir -p /var/lock/subsys
>> +         touch $LOCK
>> +         # Load the default rules
>> +         test -f /etc/audit/rules.d/audit.rules
>> && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
>> +         echo "OK"
>> +      else
>> +         echo "FAILED: auditd failed to start"
>> +      fi
>> +   else
>> +      echo "FAILED: auditd already started, stop first"
>> +      RETVAL=1
>> +   fi
>> +   return $RETVAL
>> +}
>> +
>> +stop(){
>> +   echo -n "Uninitializing $prog: "
>> +   if [ -e $LOCK ]; then
>> +      killall -TERM $prog
>
> so that we can avoid this horrible killall.
>
>> +      RETVAL=$?
>> +      if [ $RETVAL ]; then
>> +         rm -f $LOCK
>> +         # Remove watches so shutdown works cleanly
>> +         if test x"$AUDITD_CLEAN_STOP" != "x" ; then
>> +            if test "`echo $AUDITD_CLEAN_STOP | tr 'NO' 'no'`" !=
>> "no"
>> +            then
>> +               /usr/sbin/auditctl -D >/dev/null
>> +            fi
>> +         fi
>> +         if test x"$AUDITD_STOP_DISABLE" != "x" ; then
>> +            if test "`echo $AUDITD_STOP_DISABLE | tr 'NO' 'no'`" !=
>> "no"
>> +            then
>> +               /usr/sbin/auditctl -e 0 >/dev/null
>> +            fi
>
> what is AUDITD_CLEAN_STOP and AUDITD_STOP_DISABLE ? These tests look
> weird.
>
>> +         fi
>> +         echo "OK"
>> +      else
>> +         echo "FAILED: auditd not stopped"
>> +      fi
>> +   else
>> +      echo "FAILED: auditd not started"
>> +      RETVAL=1
>> +   fi
>> +   return $RETVAL
>> +}
>> +
>> +reload(){
>> +   echo -n "Reloading auditd configuration: "
>> +   if [ -e $LOCK ]; then
>> +      test -f /etc/audit/auditd.conf  || exit 6
>> +      echo -n "Reloading configuration: "
>> +      killall -HUP $prog
>
> start-stop-daemon also allows to send a SIGHUP.
>
>> +rotate(){
>> +   echo -n "Rotating auditd logs: "
>> +   if [ -e $LOCK ]; then
>> +      killall -USR1 $prog
>
> Ditto, with start-stop-daemon you can send all signals you want.
>
> So overall, a simplified, more Buildroot style init script would be appreciated.

I'll rework for v6. This is pulled from the example auditd startup
script from inside the package and only slightly tweaked.

>> b/package/audit/audit.mk new file mode 100644 index 0000000..b1ebd0e
>> --- /dev/null
>> +++ b/package/audit/audit.mk
>> @@ -0,0 +1,47 @@
>> +################################################################################
>> +#
>> +# audit
>> +#
>> +################################################################################
>> +
>> +AUDIT_VERSION = 2.4.1
>> +AUDIT_SITE = http://people.redhat.com/sgrubb/audit/
>> +AUDIT_LICENSE = GPLv2
>> +AUDIT_LICENSE_FILES = COPYING
>> +
>> +AUDIT_INSTALL_STAGING = YES
>> +AUDIT_AUTORECONF = YES
>
> Add comment about the fact that we have AUTORECONF = YES because we're
> patching configure.ac/Makefile.am.

Will fix for v6.

>> +
>> +AUDIT_CONF_OPTS = --without-python
>> +
>> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
>> +     AUDIT_DEPENDENCIES += libcap-ng
>> +     AUDIT_CONF_OPTS += --with-libcap-ng=yes
>> +else
>> +     AUDIT_CONF_OPTS += --with-libcap-ng=no
>> +endif
>
> Don't indent inside conditions.

Will fix for v6.

>> +
>> +ifeq ($(BR2_armeb),y)
>> +     AUDIT_CONF_OPTS += --with-arm
>> +endif
>> +ifeq ($(BR2_arm),y)
>> +     AUDIT_CONF_OPTS += --with-arm
>> +endif
>> +ifeq ($(BR2_aarch64),y)
>> +     AUDIT_CONF_OPTS += --with-aarch64
>> +endif
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +     AUDIT_CONF_OPTS += --enable-shared=no
>> +endif
>
> Why is this needed? We already pass --disable-shared when
> BR2_STATIC_LIBS=y, and --disable-shared should be identical to
> --enable-shared=no.

Good point. I'll remove this for v6.

Thanks,
Clayton
