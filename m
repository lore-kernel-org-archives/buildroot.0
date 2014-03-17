From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Mar 2014 22:56:58 +0100
Subject: [Buildroot] [PATCH] systemd: bump to version 210.
In-Reply-To: <1395066342-20668-1-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Mon, 17 Mar 2014 15:25:42 +0100")
References: <1395066342-20668-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <87bnx45w0l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This patch bumps systemd to version 210. Systemd 209 introduced some majors
 > changes, which generated a lot of feedback and bugfixes. This lead to
 > version 210 a few days later.

And 211 last week. Any reason to not go for 211 right away?

 > Notable changes in 210:

 > - dropped dependency on libdbus in favor of internal sd-bus library.
 > - experimental support for kdbus.
 > - introduction of systemd-networkd, a simple network configuration manager.
 > - merge of libsystemd-*.so libraries into libsystemd.so.
 > - changes in Gudev API.

Another change mentioned in the announcement is:

Oh, and one reminder that kinda got lost when we announced 209: you have
to enable CONFIG_FHANDLE in your kernel to use systemd >= 209
successfully, otherwise udev won't find any devices.

But I see we already document and handle that in linux.mk


 > +++ b/package/systemd/systemd.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -SYSTEMD_VERSION = 208
 > +SYSTEMD_VERSION = 210
 >  SYSTEMD_SITE = http://www.freedesktop.org/software/systemd/
 >  SYSTEMD_SOURCE = systemd-$(SYSTEMD_VERSION).tar.xz
 >  SYSTEMD_LICENSE = GPLv2+
 > @@ -13,7 +13,6 @@ SYSTEMD_INSTALL_STAGING = YES
 >  SYSTEMD_DEPENDENCIES = \
 >  	host-intltool \
 >  	libcap \
 > -	dbus \
 >  	util-linux \
 >  	kmod \
 >  	host-gperf
 > @@ -44,6 +43,7 @@ SYSTEMD_CONF_OPT += \
 >  	--disable-myhostname \
 >  	--disable-tcpwrap \
 >  	--disable-tests \
 > +	--disable-dbus \

I guess from this and the list of changes above that dbus is now only a
runtime dependency, so I added a comment about that in Config.in.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
