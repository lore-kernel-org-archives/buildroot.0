From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 21 Oct 2012 15:10:22 +0300
Subject: [Buildroot] [PATCH 9/9] firefox: GNU gnash flash,
 an open source Adobe Flash player & plugin
In-Reply-To: <5082C97A.4090207@mind.be>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-10-git-send-email-stefan.froberg@petroprogram.com>
 <5082C97A.4090207@mind.be>
Message-ID: <5083E62E.80705@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

20.10.2012 18:55, Arnout Vandecappelle kirjoitti:
> On 05/09/12 16:29, Stefan Fr?berg wrote:
>>
>> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>
>
>  Finally got 'round to reviewing this patch.  Review only, no testing.
>
>> ---
>>   package/gnash/Config.in                            |   20 +++
>>   package/gnash/gnash-0.8.10-amf-include.patch       |   45 +++++
>>   package/gnash/gnash-0.8.10-cve-2012-1175.patch     |   63 +++++++
>>   package/gnash/gnash-0.8.10-external-dejagnu.patch  |   24 +++
>>   package/gnash/gnash-0.8.10-gettext-macro.patch     |  170
>> ++++++++++++++++++++
>>   package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch |   52 ++++++
>>   package/gnash/gnash-0.8.10-kde4-libdir.patch       |   12 ++
>>   package/gnash/gnash-0.8.10-klash.patch             |   12 ++
>>   package/gnash/gnash-0.8.10-npapi-sdk.patch         |   29 ++++
>>   package/gnash/gnash.mk                             |   45 +++++
>>   10 files changed, 472 insertions(+), 0 deletions(-)
>>   create mode 100644 package/gnash/Config.in
>>   create mode 100644 package/gnash/gnash-0.8.10-amf-include.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-cve-2012-1175.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-external-dejagnu.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-gettext-macro.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-jemalloc-aslr-fix.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-kde4-libdir.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-klash.patch
>>   create mode 100644 package/gnash/gnash-0.8.10-npapi-sdk.patch
>>   create mode 100644 package/gnash/gnash.mk
>>
>> diff --git a/package/gnash/Config.in b/package/gnash/Config.in
>> new file mode 100644
>> index 0000000..437b8d8
>> --- /dev/null
>> +++ b/package/gnash/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_GNASH
>> +    bool "Enable Adobe Flash support with GNU gnash"
>> +    select BR2_PACKAGE_AGG
>> +    select BR2_PACKAGE_BOOST
>> +    select BR2_PACKAGE_GST_FFMPEG
>> +    select BR2_PACKAGE_GCONF
>> +    select BR2_PACKAGE_GIFLIB
>> +    select BR2_PACKAGE_OPENSSL
>> +    depends on BR2_PACKAGE_FIREFOX
>
>  Gnash is a stand-alone executable, no?  It can also run without
> firefox, right?
>

Hmmm...
Yes, but I haven't much bothered of using or testing playing
flash-files  outside of Firefox
 
>> diff --git a/package/gnash/gnash-0.8.10-kde4-libdir.patch
>> b/package/gnash/gnash-0.8.10-kde4-libdir.patch
>> new file mode 100644
>> index 0000000..b327944
>> --- /dev/null
>> +++ b/package/gnash/gnash-0.8.10-kde4-libdir.patch
>> @@ -0,0 +1,12 @@
>
>  Missing explanation + SOB.
>
>  Is this patch relevant?  We don't have KDE in buildroot, so why would
> we want patches for it?
>

Sorry, my bad.
I "borrowed" almost all those gnash patches from my Gentoo Linux
installation and that's why it got
accidentally included.


>> +diff -ur a/macros/kde4.m4 b/macros/kde4.m4
>> +--- a/macros/kde4.m4    2011-02-26 19:11:08.000000000 +0100
>> ++++ b/macros/kde4.m4    2011-11-25 18:09:25.000000000 +0100
>> +@@ -198,7 +198,7 @@
>> +       if test -d ${KDE4_PREFIX}/lib64 -a -f /etc/redhat-release; then
>> +         KDE4_PLUGINDIR="${KDE4_PREFIX}/lib64/kde4"
>> +       else
>> +-        KDE4_PLUGINDIR="${KDE4_PREFIX}/lib/kde4"
>> ++        KDE4_PLUGINDIR="${KDE4_PREFIX}/${acl_libdirstem}/kde4"
>> +       fi
>> +     fi
>> +     if test x"${with_kde4_servicesdir}" != x ; then
>> diff --git a/package/gnash/gnash-0.8.10-klash.patch
>> b/package/gnash/gnash-0.8.10-klash.patch
>> new file mode 100644
>> index 0000000..e6afec0
>> --- /dev/null
>> +++ b/package/gnash/gnash-0.8.10-klash.patch
>> @@ -0,0 +1,12 @@
>> +diff -ur a/macros/kde4.m4 b/macros/kde4.m4
>> +--- a/macros/kde4.m4    2011-02-26 19:11:08.000000000 +0100
>> ++++ b/macros/kde4.m4    2011-03-21 00:04:38.845997945 +0100
>> +@@ -210,7 +210,7 @@
>> +       KDE4_CONFIGDIR="${KDE4_PREFIX}/share/kde4/config"
>> +     fi
>> +     if test x"${KDE4_APPSDATADIR}" = x ; then
>> +-      KDE4_APPSDATADIR="${KDE4_PREFIX}/share/kde4/apps/klash"
>> ++      KDE4_APPSDATADIR="${KDE4_PREFIX}/share/apps/klash"
>> +     fi
>> +
>> +   if test x"${ac_cv_path_kde4_incl}" != x ; then
>> diff --git a/package/gnash/gnash-0.8.10-npapi-sdk.patch
>> b/package/gnash/gnash-0.8.10-npapi-sdk.patch
>> new file mode 100644
>> index 0000000..eb54295
>> --- /dev/null
>> +++ b/package/gnash/gnash-0.8.10-npapi-sdk.patch
>> @@ -0,0 +1,29 @@
>> +From 983a675c94ecec54ae14593744aa9a2198466499 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?=<mgorny@gentoo.org>
>> +Date: Thu, 15 Sep 2011 12:59:55 +0200
>> +Subject: [PATCH] Support building against NPAPI-SDK as well.
>
>  Add your SOB.
>
>> +
>> +---
>> + macros/npapi.m4 |    6 +++++-
>> + 1 files changed, 5 insertions(+), 1 deletions(-)
>> +
>> +diff --git a/macros/npapi.m4 b/macros/npapi.m4
>> +index e3bde2f..522bbb1 100644
>> +--- a/macros/npapi.m4
>> ++++ b/macros/npapi.m4
>> +@@ -34,7 +34,11 @@ AC_DEFUN([GNASH_PATH_NPAPI],
>> +
>> +   if test x$cross_compiling = xno; then
>> +     if test x"$PKG_CONFIG" != x -a x"${ac_cv_path_npapi_incl}" = x;
>> then
>> +-      $PKG_CONFIG --exists mozilla-plugin&& 
>> NPAPI_CFLAGS="`$PKG_CONFIG --cflags mozilla-plugin`"
>> ++      if $PKG_CONFIG --exists npapi-sdk; then
>> ++        NPAPI_CFLAGS="`$PKG_CONFIG --cflags npapi-sdk`"
>> ++      elif $PKG_CONFIG --exists mozilla-plugin; then
>> ++        NPAPI_CFLAGS="`$PKG_CONFIG --cflags mozilla-plugin`"
>> ++      fi
>> +     fi
>> +   fi
>> +
>> +--
>> +1.7.3.4
>> +
>> diff --git a/package/gnash/gnash.mk b/package/gnash/gnash.mk
>> new file mode 100644
>> index 0000000..7a2dd8e
>> --- /dev/null
>> +++ b/package/gnash/gnash.mk
>> @@ -0,0 +1,45 @@
>> +#############################################################
>> +#
>> +# gnash
>> +#
>> +#############################################################
>> +
>> +GNASH_VERSION = 0.8.10
>> +GNASH_SOURCE = gnash-$(GNASH_VERSION).tar.gz
>> +
>> +# GNU tarball from:
>> +# http://ftp.gnu.org/pub/gnu/gnash/$(GNASH_VERSION)/
>> +# is broken. It is missing GnashVaapiTexture.h so you
>> +# can't even try to build VA API Hardware Accelerated Flash player.
>> +# (note that it is not working ... yet)
>> +#
>> +# http://savannah.gnu.org/bugs/?35612
>> +#
>> +# That's why we use gentoo one from one of the mirrors.
>> +GNASH_SITE = http://ftp.uni-erlangen.de/pub/mirrors/gentoo/distfiles/
>> +GNASH_DEPENDENCIES = agg boost gst-ffmpeg firefox gconf giflib openssl
>> +GNASH_AUTORECONF = YES
>> +
>> +GNASH_CONF_ENV = PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>> +         PKG_CONFIG_DIR= \
>> +        
>> PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"
>> \
>> +         PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
>> +         PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>
>  All this shouldn't be necessary.
>
>> +         CPPFLAGS="`$(PKG_CONFIG_HOST_BINARY) --cflags
>> gdk-pixbuf-2.0`" \
>> +         LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs gdk-pixbuf-2.0`
>> `$(PKG_CONFIG_HOST_BINARY) --libs libva-x11`"
>
>  Better define GNASH_CPPFLAGS and GNASH_LIBS separately and use
> those variables here.
>
>> +
>> +GNASH_CONF_OPT +=  --enable-gui=gtk --enable-media=ffmpeg
>> --with-sysroot=$(STAGING_DIR)/usr \
>> +           --with-npapi-incl=$(STAGING_DIR)/usr/include/npapi \
>> +          
>> --with-npapi-plugindir=$(TARGET_DIR)/usr/lib/mozilla/plugins \
>> +           --enable-renderer=agg,cairo --enable-doublebuf
>> --enable-visibility --enable-offscreen --enable-ssl
>
>  Shouldn't cairo be a dependency as well?
>

My mistake, it's optional. Or actually it's only one of the supported
renderers.
I intended to later make subconfig option where user could select what
renderer to use (agg, cairo,opengl or all).

If I understanded correctly from the Gnash website, the agg renderer is
the fastest and preferred way and only
after that comes the rest.

>  Can ssl be made optional with
> ifeq ($(BR2_PACKAGE_OPENSSL),y)
> GNASH_CONF_OPT += --enable-ssl
> GNASH_CONF_DEPENDENCES += openssl
> else
> GNASH_CONF_OPT += --disable-ssl
> endif
>
> ?
>
Yes it can. I will add it

>> +
>> +define GNASH_INSTALL_TARGET_CMDS
>> +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
>> +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install-plugin
>
>  I would add the install-plugin only if firefox is selected.
>
>> +endef
>> +
>> +$(eval $(autotools-package))
>> +
>> +
>> +
>> +
>
>  Redundant empty lines.
>
>  Regards,
>  Arnout

Thank you. To tell the truth I was in a little hurry to kick this patch
out before my vacation and didn't give it as much tought as
I did for Firefox itself and it's dependencies.

I was just happy to get it to play YouTube videos :)

Anyway, I have now finally managed to build basic ARM-image (for
versatile board) that boot's under qemu and can now continue building
xorg and the rest of the stuff.
And then Im going to fetch that arm-patch for Firefox you mentioned in
your previous posting.


Tell me Arnout, is the ARM-world really this ... complicated ?

I mean, there at least two dozens of defconfig files for various arm
vendor boards under linux source tree arch/arm/config.
And those config-files are just for boards right ??

Am I correct to presume that there are at least almost hundred of
different vendor board + arm cpu compinations that
are more or less incompatible with each other ?

And in addition to that, I must take into account if the arm-cpu Im
cross-compiling stuff for has softfp or hardfp and the type of fp (vpf,
neon etc....) ?



Regards
Stefan
