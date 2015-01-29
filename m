From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 29 Jan 2015 12:38:45 +0100
Subject: [Buildroot] [PATCH 2/2] sigrok: new package
In-Reply-To: <54C971A4.5010409@mind.be>
References: <1422374533-11694-1-git-send-email-bgolaszewski@baylibre.com>
 <1422374533-11694-3-git-send-email-bgolaszewski@baylibre.com>
 <54C971A4.5010409@mind.be>
Message-ID: <CAMpxmJW-XG6Xe5PHnidYKP-fQ_xpTvSd3oPijYvooUa8o9A=kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-01-29 0:32 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Bartosz,
>
>  Thanks for your contribution. I haven't tested this one yet, but I have some
> remarks.
>
>
> On 27/01/15 17:02, Bartosz Golaszewski wrote:
>> Add sigrok libraries and sigrok-cli executable in a single package.
>
>  Is there a good reason to put everything in a single package? We normally make
> separate packages for everything. We also don't like putting things in a
> subdirectory very much. So I'd expect three separate packages:
>
> package/libserialport
> package/libsigrok
> package/libsigrokdecode
> package/sigrok-cli
>
>  The first three would go in the Libraries -> Hardware Handling menu, while the
> cli would go in the Packages -> Hardware Handling menu.
>
>
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  package/Config.in                                 |  1 +
>>  package/sigrok/Config.in                          | 37 +++++++++++++++++++++++
>>  package/sigrok/libserialport/libserialport.mk     | 15 +++++++++
>>  package/sigrok/libsigrok/libsigrok.mk             | 16 ++++++++++
>>  package/sigrok/libsigrokdecode/libsigrokdecode.mk | 16 ++++++++++
>>  package/sigrok/sigrok.mk                          | 10 ++++++
>>  package/sigrok/sigrokcli/sigrokcli.mk             | 14 +++++++++
>>  7 files changed, 109 insertions(+)
>>  create mode 100644 package/sigrok/Config.in
>>  create mode 100644 package/sigrok/libserialport/libserialport.mk
>>  create mode 100644 package/sigrok/libsigrok/libsigrok.mk
>>  create mode 100644 package/sigrok/libsigrokdecode/libsigrokdecode.mk
>>  create mode 100644 package/sigrok/sigrok.mk
>>  create mode 100644 package/sigrok/sigrokcli/sigrokcli.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 2d0adac..fe2f417 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -364,6 +364,7 @@ endif
>>       source "package/sdparm/Config.in"
>>       source "package/setserial/Config.in"
>>       source "package/sg3_utils/Config.in"
>> +     source "package/sigrok/Config.in"
>>       source "package/sispmctl/Config.in"
>>       source "package/smartmontools/Config.in"
>>       source "package/smstools3/Config.in"
>> diff --git a/package/sigrok/Config.in b/package/sigrok/Config.in
>> new file mode 100644
>> index 0000000..f5f52ce
>> --- /dev/null
>> +++ b/package/sigrok/Config.in
>> @@ -0,0 +1,37 @@
>> +config BR2_PACKAGE_SIGROK
>> +     bool "sigrok"
>> +     select BR2_PACKAGE_LIBSERIALPORT
>> +     select BR2_PACKAGE_LIBSIGROK
>> +     select BR2_PACKAGE_LIBSIGROKDECODE
>> +     select BR2_PACKAGE_SIGROKCLI
>> +     # libglib2 & python3:
>> +     depends on BR2_USE_WCHAR
>
>  We usually put something like:
>
>         depends on BR2_USE_WCHAR # libsigrok->libglib2, libsigrokdecode->python3
>
>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     depends on BR2_USE_MMU
>> +     help
>> +       Signal analysis software suite.
>> +
>> +       This package contains the sigrok software suite: libserialport,
>> +       libsigrok, libsigrokdecode libraries and sigrok-cli command-line
>> +       utility.
>> +
>> +       http://sigrok.org/
>> +
>> +comment "sigrok needs a toolchain w/ wchar, threads
>> +     depends on BR2_USE_MMU
>> +     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>> +
>> +config BR2_PACKAGE_LIBSERIALPORT
>> +     bool
>> +
>> +config BR2_PACKAGE_LIBSIGROK
>> +     bool
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     select BR2_PACKAGE_LIBZIP
>> +
>> +config BR2_PACKAGE_LIBSIGROKDECODE
>> +     bool
>> +     select BR2_PACKAGE_PYTHON3
>> +
>> +config BR2_PACKAGE_SIGROKCLI
>> +     bool
>> diff --git a/package/sigrok/libserialport/libserialport.mk b/package/sigrok/libserialport/libserialport.mk
>> new file mode 100644
>> index 0000000..970e1c1
>> --- /dev/null
>> +++ b/package/sigrok/libserialport/libserialport.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# libserialport
>> +#
>> +################################################################################
>> +
>> +LIBSERIALPORT_VERSION = HEAD
>
>  We want a specific version so the build is reproducible. Preferably a tag, but
> in this case I guess it would be a full commit ID:
> e31f2c6b8b8f2b7e554df911cc9a3482b99632b4
>
>  But I understand you plan to do that as soon as the ACME drivers have been
> accepted.
>
>
>  Or a tarball is even better. If you can convince upstream to create a release?
>
>  Same for the other packages of course.
>
>
>> +LIBSERIALPORT_SITE = git://sigrok.org/libserialport
>
>  If http is possible, that is preferable, because not all company firewalls
> allow git to pass.
>
>> +LIBSERIALPORT_LICENSE = LGPLv3+
>> +LIBSERIALPORT_LICENSE_FILES = COPYING
>> +LIBSERIALPORT_AUTORECONF = YES
>
>  We usually but a comment why autoreconf is needed:
>
> # git checkout has no configure script
>
>> +LIBSERIALPORT_INSTALL_STAGING = YES
>> +LIBSERIALPORT_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
>
>  Hm. I like it when code duplication is avoided, but for e.g. phpize we do
> duplicate it. Not sure...
>
>
>> +
>> +$(eval $(autotools-package))
>> diff --git a/package/sigrok/libsigrok/libsigrok.mk b/package/sigrok/libsigrok/libsigrok.mk
>> new file mode 100644
>> index 0000000..4a61f6c
>> --- /dev/null
>> +++ b/package/sigrok/libsigrok/libsigrok.mk
>> @@ -0,0 +1,16 @@
>> +################################################################################
>> +#
>> +# libsigrok
>> +#
>> +################################################################################
>> +
>> +LIBSIGROK_VERSION = HEAD
>> +LIBSIGROK_SITE = git://sigrok.org/libsigrok
>> +LIBSIGROK_LICENSE = GPLv3+
>> +LIBSIGROK_LICENSE = COPYING
>> +LIBSIGROK_AUTORECONF = YES
>> +LIBSIGROK_INSTALL_STAGING = YES
>> +LIBSIGROK_DEPENDENCIES = libglib2 libzip
>> +LIBSIGROK_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
>
>  I see a lot of optional dependencies here. We prefer to handle them explicitly,
> either disabling them:
>
> LIBSIGROK_CONF_OPTS = \
>         --disable-libftdi \
>         --disable-libusb \
>         --disable-bindings
>
> or handling them:
>
> ifeq ($(BR2_PACKAGE_LIBFTDI),y)
> LIBSIGROK_CONF_OPTS += --enable-libftdi
> LIBSIGROK_DEPENDENCIES += libftdi
> else
> LIBSIGROK_CONF_OPTS += --disable-libftdi
> endif
>
>
>  This makes sure that the build result is the same regardless of the order in
> which things are built.
>
>
>  Note that there is also an optional dependency on glibmm, but it can't be
> disabled. This should be handled like this:
>
> ifeq ($(BR2_PACKAGE_GLIBMM),y)
> LIBSIGROK_DEPENDENCIES += glibmm
> endif
>
>
>  Same for python-gobject.
>
>  Check configure.ac for more.
>
>
>> +
>> +$(eval $(autotools-package))
> [snip]
>> diff --git a/package/sigrok/sigrokcli/sigrokcli.mk b/package/sigrok/sigrokcli/sigrokcli.mk
>> new file mode 100644
>> index 0000000..3d984ef
>> --- /dev/null
>> +++ b/package/sigrok/sigrokcli/sigrokcli.mk
>> @@ -0,0 +1,14 @@
>> +################################################################################
>> +#
>> +# sigrok-cli
>> +#
>> +################################################################################
>> +
>> +SIGROKCLI_VERSION = HEAD
>> +SIGROKCLI_SITE = git://sigrok.org/sigrok-cli
>> +SIGROKCLI_LICENSE = GPLv3+
>> +SIGROKCLI_LICENSE_FILES = COPYING
>> +SIGROKCLI_AUTORECONF = YES
>> +SIGROKCLI_PRE_CONFIGURE_HOOKS += SIGROK_ADD_MISSING
>
>  The optional dependency on libsigrokdecode should definitely be handled here.
>
>
>  Regards,
>  Arnout

Hi Arnout,

thanks for the review! Please check the updated version I've just
submitted. Tested on a BeagleBone Black.

Bart
