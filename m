From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Mar 2014 23:52:53 +0100
Subject: [Buildroot] [PATCH v3 4/4] rsyslog: bump to version 7.6.0
In-Reply-To: <1394646669-10461-4-git-send-email-clshotwe@rockwellcollins.com>
 (Clayton Shotwell's message of "Wed, 12 Mar 2014 12:51:09 -0500")
References: <1394646669-10461-1-git-send-email-clshotwe@rockwellcollins.com>
 <1394646669-10461-4-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <877g7vkray.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Clayton" == Clayton Shotwell <clshotwe@rockwellcollins.com> writes:

 > Bumping version of rsyslog and adding new dependencies of liblogging
 > and libestr.  The first patch has be submitted to the upstream mailing
 > list and the second patch is a backport from the development branch of
 > the upstream.

 > Signed-off-by: Clayton Shotwell <clshotwe@rockwellcollins.com>

 > diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
 > index 2503f71..27af88f 100644
 > --- a/package/rsyslog/Config.in
 > +++ b/package/rsyslog/Config.in
 > @@ -1,6 +1,14 @@
 >  config BR2_PACKAGE_RSYSLOG
 >  	bool "rsyslog"
 > +	select BR2_PACKAGE_ZLIB
 > +	select BR2_PACKAGE_LIBESTR
 > +	select BR2_PACKAGE_LIBLOGGING
 > +	select BR2_PACKAGE_JSON_C
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS

According to the configure script it also needs libuuid, so we need to
add util-linux / libuuid and update the toolchain dependencies.

 >  	help
 >  	  Rsyslog is a powerful and flexible syslog implementation
 
 >  	  http://www.rsyslog.com
 > +
 > +comment "libxmlrpc needs a toolchain w/ threads"

Cut'n'paste? ;)

 > +++ b/package/rsyslog/rsyslog.mk
 > @@ -4,21 +4,41 @@
 >  #
 >  ################################################################################
 
 > -RSYSLOG_VERSION = 5.8.0
 > +RSYSLOG_VERSION = 7.6.0
 >  RSYSLOG_SITE = http://rsyslog.com/files/download/rsyslog/
 > -RSYSLOG_DEPENDENCIES = zlib
 > +RSYSLOG_LICENSE = GPLv3 LGPLv3 Apache-2.0
 > +RSYSLOG_LICENSE_FILES = COPYING COPYING.LESSER COPYING.ASL20
 > +RSYSLOG_DEPENDENCIES = zlib libestr liblogging json-c

It uses pkg-config, so we need to add host-pkgconf (and util-linux).

Committed with those issues fixed, thanks.

-- 
Bye, Peter Korsgaard
