From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 14 Oct 2015 20:58:49 +1300
Subject: [Buildroot] [PATCHv2] syslog-ng: New package
In-Reply-To: <20151014095043.74e4285c@free-electrons.com>
References: <1444808488-3387-1-git-send-email-judge.packham@gmail.com>
 <20151014095043.74e4285c@free-electrons.com>
Message-ID: <CAFOYHZAJqOSLXBLZGKwsuATW4aGbrjSuK=n+dC4LAt2AY7CKyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 14, 2015 at 8:50 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Chris Packham,
>
> Thanks for this new version, a few comments below.
>
> On Wed, 14 Oct 2015 20:41:28 +1300, Chris Packham wrote:
>
>> diff --git a/package/Config.in b/package/Config.in
>> index 8e3c64a..e191af7 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1518,6 +1518,9 @@ endif
>>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>>       source "package/sysklogd/Config.in"
>>  endif
>> +if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>> +     source "package/syslog-ng/Config.in"
>> +endif
>
> You can probably group is with the BR2_PACKAGE_BUSYBOX_SHOW_OTHERS used
> for sysklogd.
>
>> diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
>> new file mode 100644
>> index 0000000..3fa7107
>> --- /dev/null
>> +++ b/package/syslog-ng/S01logging
>> @@ -0,0 +1,36 @@
>> +#!/bin/sh
>> +
>> +start() {
>> +  echo -n "Starting syslog-ng daemon: "
>
> Indentation should be done with one tab in the init script.
>
> And use "printf" here rather than "echo -n". We changed this in all
> init scripts about a week ago or so. The reasoning is that printf is
> POSIX, while echo -n is specific to certain shells only.
>
>> +  start-stop-daemon -S -q -p /var/run/syslog-ng.pid --exec /usr/sbin/syslog-ng
>> +  [ $? = 0 ] && echo "OK" || echo "FAIL"
>
> Using echo here is fine.
>
>
>> +# Locally computed
>> +sha1 494418ca185d912e2296dccac4ca1b38924159ff syslog-ng-3.7.1.tar.gz
>
> If it's locally computed, use a sha256.
>
>> +SYSLOG_NG_VERSION = 3.7.1
>> +SYSLOG_NG_SOURCE = syslog-ng-$(SYSLOG_NG_VERSION).tar.gz
>> +SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
>> +SYSLOG_NG_LICENSE = LGPL (syslog-ng core), GPL (modules)
>
> Please indicate the version of the license (GPLv2, GPLv2+, GPLv3,
> GPLv3+, etc.).

Will do.

>
>> +SYSLOG_NG_LICENSE_FILES = COPYING
>> +SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
>> +     eventlog libglib2 openssl pcre \
>> +     $(if $(BR2_PACKAGE_PYTHON),python) \
>> +     $(if $(BR2_PACKAGE_PYTHON3),python3) \
>> +     $(if $(BR2_PACKAGE_LIBESMTP),libesmtp) \
>> +     $(if $(BR2_PACKAGE_JSON_C),json-c)
>
> When there are autoconf options associated to certain optional
> dependencies, we generally prefer to have them handled in one block
> like this:
>
> ifeq ($(BR2_PACKAGE_LIBESTMP),y)
> SYSLOG_NG_DEPENDENCIES += libesmtp
> SYSLOG_NG_CONF_OPTS += --enable-<something>
> else
> SYSLOG_NG_CONF_OPTS += --disable-<something>
> endif
>

Noted.

>> +SYSLOG_NG_CONF_OPTS = --disable-manpages
>> +
>> +ifeq ($(BR2_INIT_SYSTEMD),y)
>> +SYSLOG_NG_CONF_OPTS += \
>> +     --enable-systemd \
>> +     --with-systemdsystemunitdir=/usr/lib/systemd/system
>> +SYSLOG_NG_DEPENDENCIES += systemd
>> +else
>> +SYSLOG_NG_CONF_OPTS += --disable-systemd
>> +endif
>> +
>> +define SYSLOG_NG_INSTALL_INIT_SYSV
>> +     $(INSTALL) -m 0755 -D package/syslog-ng/S01logging \
>> +             $(TARGET_DIR)/etc/init.d/S01logging
>> +endef
>> +
>> +ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
>> +SYSLOG_NG_CONF_OPTS += --disable-python --without-python
>> +endif
>
> See above: don't only disable when not available, but also explicitly
> enable when available.
>
>> +ifeq ($(BR2_PACKAGE_LIBESMTP),)
>> +SYSLOG_NG_CONF_OPTS += --disable-smtp
>> +endif
>
> Ditto.
>
>> +
>> +ifeq ($(BR2_PACKAGE_JSON_C),)
>> +SYSLOG_NG_CONF_OPTS += --disable-json
>> +endif
>
> Ditto.
>
>> +define SYSLOG_NG_FIXUP_CONFIG
>> +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
>> +             DESTDIR=$(TARGET_DIR) scl-uninstall-local
>
> This seems a bit weird. What needs to be uninstalled ?

There are a bunch of configuration files installed by default. Some of
which rely on "optional" features (json was the one that stopped
syslog-ng from starting). Technically since I'm installing a custom
config file they won't do any harm but then they're just sitting there
in the file system doing nothing.

>
>> +     $(INSTALL) -D -m 0644 package/syslog-ng/syslog-ng.conf \
>> +             $(TARGET_DIR)/etc/syslog-ng.conf
>> +endef
>> +
>> +SYSLOG_NG_POST_INSTALL_TARGET_HOOKS = SYSLOG_NG_FIXUP_CONFIG
>> +
>> +$(eval $(autotools-package))
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
