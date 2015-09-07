From: Guillermo Amaral <g@maral.me>
Date: Mon, 7 Sep 2015 16:05:58 -0700
Subject: [Buildroot] [PATCH v3 1/1] bitlbee: Added package
In-Reply-To: <55EE1420.5060602@mind.be>
References: <1441653041-10620-1-git-send-email-g@maral.me>
 <55EE1420.5060602@mind.be>
Message-ID: <CAPeEpDr5QRLhq3cWsbgxQEwqy1Xmsn1BJBN8j095tQ49UBkeYQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 7, 2015 at 3:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 07-09-15 21:10, Guillermo A. Amaral wrote:
>> BitlBee brings IM (instant messaging) to IRC clients. It's a great
>> solution for people who have an IRC client running all the time and
>> don't want to run an additional MSN/AIM/whatever client.
>>
>> Bitlbee patch upstreamed:
>>
>>     https://github.com/bitlbee/bitlbee/commit/f5bbaba3b2015f039221945431f98027cb3d2d49
>>
>> Signed-off-by: Guillermo A. Amaral <g@maral.me>
>>
>> ---
>>
>> Changes v2 -> v3:
>>     - Bitlbee cross-compilation changes upstreamed.
>>
>> Changes v1 -> v2:
>>     - Bitlbee cross-compilation patch updated.
>>
>> Signed-off-by: Guillermo A. Amaral <g@maral.me>
>> ---
>>  package/Config.in                                  |  1 +
>>  .../0001-Improved-cross-compiler-support.patch     | 76 ++++++++++++++++++++++
>>  package/bitlbee/Config.in                          | 56 ++++++++++++++++
>>  package/bitlbee/bitlbee.mk                         | 57 ++++++++++++++++
>>  4 files changed, 190 insertions(+)
>>  create mode 100644 package/bitlbee/0001-Improved-cross-compiler-support.patch
>>  create mode 100644 package/bitlbee/Config.in
>>  create mode 100644 package/bitlbee/bitlbee.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 9bd4190..952596d 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1203,6 +1203,7 @@ menu "Networking applications"
>>       source "package/batctl/Config.in"
>>       source "package/bcusdk/Config.in"
>>       source "package/bind/Config.in"
>> +     source "package/bitlbee/Config.in"
>>       source "package/bluez_utils/Config.in"
>>       source "package/bluez5_utils/Config.in"
>>       source "package/bmon/Config.in"
>> diff --git a/package/bitlbee/0001-Improved-cross-compiler-support.patch b/package/bitlbee/0001-Improved-cross-compiler-support.patch
>> new file mode 100644
>> index 0000000..47d5250
>> --- /dev/null
>> +++ b/package/bitlbee/0001-Improved-cross-compiler-support.patch
>> @@ -0,0 +1,76 @@
>> +From 523cd4c5861edae31b45404272c1dc048f9484eb Mon Sep 17 00:00:00 2001
>> +From: "Guillermo A. Amaral" <g@maral.me>
>> +Date: Sun, 30 Aug 2015 15:22:58 -0700
>> +Subject: [PATCH] Improved cross compiler support.
>> +
>> +* Added a configure option for sysroot.
>> +* Prevent pkgconfig environment variables to be clobbered.
>> +* Prevent PATH environment variable pollution.
>> +* Backward compatible.
>> +
>> +Signed-off-by: Guillermo A. Amaral <g@maral.me>
>> +---
>> + configure | 31 +++++++++++++++++++++++++++----
>> + 1 file changed, 27 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/configure b/configure
>> +index 921c9b4..5a0527d 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -22,6 +22,7 @@ pidfile='/var/run/bitlbee.pid'
>> + ipcsocket=''
>> + pcdir='$prefix/lib/pkgconfig'
>> + systemlibdirs="/lib64 /usr/lib64 /usr/local/lib64 /lib /usr/lib /usr/local/lib"
>> ++sysroot=''
>> +
>> + # Set these to default-on to let it be overriden by either the user or purple
>> + #
>> +@@ -148,6 +149,7 @@ Option           Description                             Default
>> +
>> +
>> + --target=...        Cross compilation target                same as host
>> ++--sysroot=...       Cross compilation sysroot               $sysroot
>> + EOF
>> +             exit;
>> +     fi
>> +@@ -239,12 +241,33 @@ EOF
>> +
>> +
>> + if [ -n "$target" ]; then
>> +-    PKG_CONFIG_LIBDIR=/usr/$target/lib/pkgconfig
>> +-    export PKG_CONFIG_LIBDIR
>> +-    PATH=/usr/$target/bin:$PATH
>> ++    # prepend sysroot to system lib dirs
>> ++
>> ++    systemlibdirs_cross=''
>> ++    for i in $systemlibdirs; do
>> ++            systemlibdirs_cross="$systemlibdirs_cross $sysroot$i"
>> ++    done
>> ++    systemlibdirs=$systemlibdirs_cross
>> ++    unset systemlibdirs_cross
>> ++
>> ++    # backward compatibility
>> ++
>> ++    if [ -z "$PKG_CONFIG_LIBDIR" ]; then
>> ++            PKG_CONFIG_LIBDIR=/usr/$target/lib/pkgconfig
>> ++            export PKG_CONFIG_LIBDIR
>> ++    fi
>> ++
>> ++    if [ -d /usr/$target/bin ]; then
>> ++            PATH=/usr/$target/bin:$PATH
>
>  What's the point of this? We never put anything in /usr/$target/bin, so if that
> directory exists, it's certainly wrong.

Those two checks, as well as the one below are for backward
compatibility with the way they used to handle cross-compilation, they
used to expect the toolchain to be under /usr/$target. :-S

>> ++    fi
>> ++
>> ++    if [ -d /usr/$target/lib ]; then
>> ++            systemlibdirs="$systemlibdirs /usr/$target/lib"
>> ++    fi
>> ++
>> +     CC=$target-cc
>> +     LD=$target-ld
>
>  This part is also wrong, since we should use $(TARGET_CC) and $(TARGET_LD). In
> addition, TARGET_CC could include ccache so it has to be quoted in the shell script.
>
>  Actually, this whole condition breaks things rather than making them
> cross-compilable.

ccache, right, I forgot to take that into consideration. I'll test it Tonight.

>  If upstream is so stupid to use their own configure script instead of an
> actually working system, I think it's better to completely skip the configure
> stuff and instead just create config.h manually.

Yeah, you're right, that's a good idea actually.

>> +-    systemlibdirs="/usr/$target/lib"
>> ++    STRIP=$target-strip
>> + fi
>> +
>> + if [ "$asan" = "1" ]; then
>> +--
>> +2.4.6
>> +
>> diff --git a/package/bitlbee/Config.in b/package/bitlbee/Config.in
>> new file mode 100644
>> index 0000000..29abb78
>> --- /dev/null
>> +++ b/package/bitlbee/Config.in
>> @@ -0,0 +1,56 @@
>> +config BR2_PACKAGE_BITLBEE
>> +     bool "bitlbee"
>> +     select BR2_PACKAGE_LIBGLIB2
>> +     depends on BR2_USE_MMU # fork()
>
>  You have to propagate the dependencies of libglib2:
>
>         depends on BR2_USE_WCHAR # gettext -> libglib2
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>
>  For these two, you also need a comment at the beginning or end of the file:
>
> comment "bitlbee needs a toolchain w/ wchar, threads"
>         depends on BR2_USE_MMU
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>
>
>> +     help
>> +       An IRC to other chat networks gateway
>
>  Missing . at the end of the sentence.
>
>> +
>> +       http://www.bitlbee.org/
>> +
>> +if BR2_PACKAGE_BITLBEE
>> +
>> +config BR2_PACKAGE_BITLBEE_MSN
>> +     bool "Enable MSN Part"
>> +     help
>> +       MSN Messenger support.
>> +
>> +config BR2_PACKAGE_BITLBEE_JABBER
>> +     bool "Enable Jabber Part"
>> +     help
>> +       Jabber/XMPP support.
>> +
>> +config BR2_PACKAGE_BITLBEE_OSCAR
>> +     bool "Enable Oscar Part"
>> +     help
>> +       OSCAR/ICQ support.
>> +
>> +config BR2_PACKAGE_BITLBEE_YAHOO
>> +     bool "Enable Yahoo Part"
>> +     help
>> +       Yahoo Messenger support.
>> +
>> +config BR2_PACKAGE_BITLBEE_TWITTER
>> +     bool "Enable Twitter Part"
>> +     help
>> +       Twitter support.
>> +
>> +choice
>> +     prompt "SSL Backend"
>> +     help
>> +       Select an SSL backend.
>> +
>> +config BR2_PACKAGE_BITLBEE_OPENSSL
>> +     bool "OpenSSL"
>> +     select BR2_PACKAGE_OPENSSL
>> +     help
>> +       Use OpenSSL backend.
>> +
>> +config BR2_PACKAGE_BITLBEE_GNUTLS
>> +     bool "GnuTLS"
>> +     select BR2_PACKAGE_GNUTLS
>
>  GnuTLS depends on WCHAR, but you have that already.
>
>> +     help
>> +       Use GnuTLS backend.
>> +
>> +endchoice
>> +
>> +endif
>> diff --git a/package/bitlbee/bitlbee.mk b/package/bitlbee/bitlbee.mk
>> new file mode 100644
>> index 0000000..86c26c0
>> --- /dev/null
>> +++ b/package/bitlbee/bitlbee.mk
>> @@ -0,0 +1,57 @@
>> +################################################################################
>> +#
>> +# bitlbee
>> +#
>> +################################################################################
>> +
>> +BITLBEE_VERSION = 3.4.1
>> +BITLBEE_SITE = $(call github,bitlbee,bitlbee,$(BITLBEE_VERSION))
>> +BITLBEE_LICENSE = GPL-2.0
>
>  GPLv2
>
>  However, most of the code is GPLv2+, except for the twitter stuff which is
> LGPL2.1 and bitlbeed which is GPL but that's not built.
>
>  So I'd say
>
> BITLBEE_LICENSE = GPLv2+, LGPLv2.1 (twitter), GPL (bitlbeed)
>
>> +BITLBEE_LICENSE_FILES = COPYING
>> +BITLBEE_DEPENDENCIES = libglib2
>> +BITLBEE_CONF_OPTS = --doc=0
>> +
>> +BITLBEE_CONF_OPTS += --msn=$(if $(BR2_PACKAGE_BITLBEE_MSN),1,0)
>> +BITLBEE_CONF_OPTS += --jabber=$(if $(BR2_PACKAGE_BITLBEE_JABBER),1,0)
>> +BITLBEE_CONF_OPTS += --oscar=$(if $(BR2_PACKAGE_BITLBEE_OSCAR),1,0)
>> +BITLBEE_CONF_OPTS += --yahoo=$(if $(BR2_PACKAGE_BITLBEE_YAHOO),1,0)
>> +BITLBEE_CONF_OPTS += --twitter=$(if $(BR2_PACKAGE_BITLBEE_TWITTER),1,0)
>> +
>> +ifeq ($(BR2_PACKAGE_BITLBEE_OPENSSL),y)
>> +BITLBEE_CONF_OPTS += --ssl=openssl
>> +BITLBEE_DEPENDENCIES += openssl
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_BITLBEE_GNUTLS),y)
>> +BITLBEE_CONF_OPTS += --ssl=gnutls
>> +BITLBEE_DEPENDENCIES += gnutls
>> +endif
>> +
>> +define BITLBEE_CONFIGURE_CMDS
>> +     (cd $(@D); \
>> +             PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>> +             PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
>> +             PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>
>  Better pass in $(TARGET_CONFIGURE_OPTS), so CC is set. But actually, the
> configure script overrides it again :-(
>
>  I didn't manage to build anything because of the missing CC.

Cool, I'll fix it up then, thank for the notes Arnout! :)

>
>  Regards,
>  Arnout
>
>
>> +             MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \
>> +             ./configure \
>> +             --cpu=$(ARCH) \
>> +             --arch=$(TARGET_OS) \
>> +             --prefix=/usr \
>> +             --etcdir=/etc/bitlbee \
>> +             --target=$(GNU_TARGET_NAME) \
>> +             --sysroot=$(STAGING_DIR) \
>> +             $(BITLBEE_CONF_OPTS) \
>> +     )
>> +endef
>> +
>> +define BITLBEE_BUILD_CMDS
>> +     PATH="$(PATH):$(HOST_DIR)/usr/bin" \
>> +     $(MAKE) -C $(@D)
>> +endef
>> +
>> +define BITLBEE_INSTALL_TARGET_CMDS
>> +     $(INSTALL) -d $(TARGET_DIR)/var/lib/bitlbee
>> +     $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-etc install
>> +endef
>> +
>> +$(eval $(generic-package))
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF



-- 
gamaral
http://about.me/gamaral
