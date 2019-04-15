From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Apr 2019 00:35:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/wireshark: bump to version 3.0.1
In-Reply-To: <CAPi7W80zMaCXPWu5OPVtOG8S0paGxr-w7=pkx6PJsGusY5U84g@mail.gmail.com>
References: <20190415161058.14182-1-fontaine.fabrice@gmail.com>
 <5b69b1a1-181f-278c-303d-c58772bc5a78@mind.be>
 <CAPi7W80zMaCXPWu5OPVtOG8S0paGxr-w7=pkx6PJsGusY5U84g@mail.gmail.com>
Message-ID: <b957fb76-a94e-8e0c-ee7d-c7528bb7d5b9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 22:38, Fabrice Fontaine wrote:
> Le lun. 15 avr. 2019 ? 19:59, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>>
>>
>>
>> On 15/04/2019 18:10, Fabrice Fontaine wrote:
>>> - Remove patch (already in version)
>>> - Move package to cmake infrastructure
>>
>>  I actually would have liked this to be done in a separate patch.
> If I made it in a separate patch, then I would have to test the
> current version and the new version with cmake which will take more
> time for no real advantage. I switch to cmake only because autotools
> was removed in 3.x.
>>
>>> - gtk ui is no more available
>>> - --disables-guides option is not avaiable with cmake
>>> - QT UI now requires:
>>>   - qt5multimedia and qt5svg at build time
>>>   - qt5fontconfig, qt5png and udev at runtime
>>> - Add host-python3 dependency
>>> - Add a hook to build host-lemon
>>> - Disable static build (some libraries such as
>>>   plugins/3.0/codecs/l16mono.so does not support static building)
>>
>>  This is very unfortunate. It is useful to be able to statically build a tshark
>> to copy into a system that you don't control.
>>
>>  Isn't there a way to disable those plugins?
> I'll try to find a way.

 I did apply both to master already, you can enable static again in a follow-up
patch. I've also added the # qt5 comments I asked for below.

 Regards,
 Arnout

>>
>> [snip]
>>> -config BR2_PACKAGE_WIRESHARK_QT
>>> -     bool
>>> +config BR2_PACKAGE_WIRESHARK_GUI
>>> +     bool "Qt5 GUI"
>>>       default y
>>> -     depends on BR2_PACKAGE_QT5BASE_WIDGETS
>>> -     depends on BR2_PACKAGE_QT5TOOLS
>>> +     depends on BR2_INSTALL_LIBSTDCPP
>>> +     depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>> +     depends on BR2_PACKAGE_HAS_UDEV
>>
>>  Could you add # reason markers here?
> Yes, I can add "# runtime" (without it, Qt does not manage
> keyboard/mouse events). Actually, I hesitated to add a reason as I saw
> that most packages having udev dependency didn't have a reason.
>>
>>> +     select BR2_PACKAGE_QT5
>>> +     select BR2_PACKAGE_QT5BASE
>>> +     select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
>>> +     select BR2_PACKAGE_QT5BASE_PNG # runtime
>>> +     select BR2_PACKAGE_QT5BASE_WIDGETS
>>> +     select BR2_PACKAGE_QT5MULTIMEDIA
>>> +     select BR2_PACKAGE_QT5SVG
>>> +     select BR2_PACKAGE_QT5TOOLS
>>
>>  This deprecation of gtk gui and conversion from depends into select could have
>> been in a separate patch, but OK.
>>
>>>       select BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
>>> +     help
>>> +       Enable Qt5 GUI
>>>
>>> -config BR2_PACKAGE_WIRESHARK_GUI
>>> -     bool
>>> -     default y if BR2_PACKAGE_LIBGTK2
>>> -     default y if BR2_PACKAGE_LIBGTK3
>>> -     default y if BR2_PACKAGE_WIRESHARK_QT
>>> +comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
>>> +     depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
>>> +             !BR2_TOOLCHAIN_HAS_THREADS_NPTL
>>>
>>>  endif # BR2_PACKAGE_WIRESHARK
>>>
>>> -comment "wireshark needs a toolchain w/ wchar, threads"
>>> +comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
>>>       depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
>>>       depends on BR2_USE_MMU
>>> -     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>>> +     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>>> +             BR2_STATIC_LIBS
>>> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
>>> index 071940e1c1..99aa433bb4 100644
>>> --- a/package/wireshark/wireshark.hash
>>> +++ b/package/wireshark/wireshark.hash
>>> @@ -1,4 +1,4 @@
>>> -# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.6.7.txt
>>> -sha256 747b3e7a37414942959f76f198be49dcbcca936bda538c4408942ce71bfd2b71  wireshark-2.6.7.tar.xz
>>> +# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.1.txt
>>> +sha256 86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c  wireshark-3.0.1.tar.xz
>>>  # Locally calculated
>>>  sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
>>> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
>>> index a917efb5f6..691f0140b5 100644
>>> --- a/package/wireshark/wireshark.mk
>>> +++ b/package/wireshark/wireshark.mk
>>> @@ -4,152 +4,141 @@
>>>  #
>>>  ################################################################################
>>>
>>> -WIRESHARK_VERSION = 2.6.7
>>> +WIRESHARK_VERSION = 3.0.1
>>>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
>>>  WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
>>>  WIRESHARK_LICENSE = wireshark license
>>>  WIRESHARK_LICENSE_FILES = COPYING
>>> -WIRESHARK_DEPENDENCIES = host-pkgconf libgcrypt libpcap libglib2
>>> -WIRESHARK_CONF_ENV = \
>>> -     LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
>>> -     PCAP_CONFIG=$(STAGING_DIR)/usr/bin/pcap-config
>>> +WIRESHARK_DEPENDENCIES = host-pkgconf host-python3 libgcrypt libpcap libglib2
>>> +
>>> +WIRESHARK_MAKE_ENV = \
>>> +     $(TARGET_MAKE_ENV) \
>>> +     PATH="$(@D)/bin:$(BR_PATH)"
>>>
>>>  WIRESHARK_CONF_OPTS = \
>>> -     --disable-guides \
>>> -     --enable-static=no \
>>> -     --with-libsmi=no \
>>> -     --with-pcap=yes
>>> -
>>> -# wireshark GUI options
>>> -ifeq ($(BR2_PACKAGE_LIBGTK3),y)
>>> -WIRESHARK_CONF_OPTS += --with-gtk=3
>>> -WIRESHARK_DEPENDENCIES += libgtk3
>>> -else ifeq ($(BR2_PACKAGE_LIBGTK2),y)
>>> -WIRESHARK_CONF_OPTS += --with-gtk=2
>>> -WIRESHARK_DEPENDENCIES += libgtk2
>>> -else
>>> -WIRESHARK_CONF_OPTS += --with-gtk=no
>>> -endif
>>> +     -DENABLE_PCAP=ON \
>>> +     -DENABLE_SMI=OFF \
>>> +     -DENABLE_STATIC=OFF \
>>> +     -DBUILD_sdjournal=OFF
>>> +
>>> +# wireshark needs the host version of lemon during compilation.
>>> +# This binrary is provided by sqlite-src (which is different from
>>> +# sqlite-autotools that is currently packaged in buildroot) moreover wireshark
>>> +# adds several patches.
>>> +# So, instead of creating a separate host package and installing lemon to
>>> +# $(HOST_DIR), this binary is compiled on-the-fly
>>> +define WIRESHARK_BUILD_LEMON_TOOL
>>> +     cd $(@D); \
>>> +     mkdir -p $(@D)/bin; \
>>> +     $(HOSTCC) $(HOST_CFLAGS) -o $(@D)/bin/lemon tools/lemon/lemon.c
>>> +endef
>>
>>  Ah nice, I was struggling with this when I tried to do the CMake conversion.
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> -# Qt4 needs accessibility, we don't support it
>>> -ifeq ($(BR2_PACKAGE_WIRESHARK_QT),y)
>>> -WIRESHARK_CONF_OPTS += --with-qt=5
>>> -WIRESHARK_DEPENDENCIES += qt5base qt5tools
>>> -WIRESHARK_CONF_ENV += ac_cv_path_QTCHOOSER=""
>>> -# Seems it expects wrappers and passes a -qt=X parameter for version
>>> -WIRESHARK_MAKE_OPTS += \
>>> -     MOC="$(HOST_DIR)/bin/moc" \
>>> -     RCC="$(HOST_DIR)/bin/rcc" \
>>> -     UIC="$(HOST_DIR)/bin/uic"
>>> -else
>>> -WIRESHARK_CONF_OPTS += --with-qt=no
>>> -endif
>>> +WIRESHARK_PRE_BUILD_HOOKS += WIRESHARK_BUILD_LEMON_TOOL
>>>
>>> -# No GUI at all
>>> -ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
>>> -WIRESHARK_CONF_OPTS += --disable-wireshark
>>> +ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),y)
>>> +WIRESHARK_CONF_OPTS += -DBUILD_wireshark=ON
>>> +WIRESHARK_DEPENDENCIES += qt5base qt5multimedia qt5svg qt5tools
>>> +else
>>> +WIRESHARK_CONF_OPTS += -DBUILD_wireshark=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_BCG729),y)
>>> -WIRESHARK_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_BCG729=ON
>>>  WIRESHARK_DEPENDENCIES += bcg729
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-bcg729
>>> +WIRESHARK_CONF_OPTS += -DENABLE_BCG729=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_C_ARES),y)
>>> -WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_CARES=ON
>>>  WIRESHARK_DEPENDENCIES += c-ares
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-c-ares
>>> +WIRESHARK_CONF_OPTS += -DENABLE_CARES=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_GNUTLS),y)
>>> -WIRESHARK_CONF_OPTS += --with-gnutls=yes
>>> +WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=ON
>>>  WIRESHARK_DEPENDENCIES += gnutls
>>>  else
>>> -WIRESHARK_CONF_OPTS += --with-gnutls=no
>>> +WIRESHARK_CONF_OPTS += -DENABLE_GNUTLS=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_LIBKRB5),y)
>>> -WIRESHARK_CONF_OPTS += --with-krb5=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=ON
>>>  WIRESHARK_DEPENDENCIES += libkrb5
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-krb5
>>> +WIRESHARK_CONF_OPTS += -DENABLE_KERBEROS=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
>>> -WIRESHARK_CONF_OPTS += --with-maxminddb=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DBUILD_mmdbresolve=ON
>>>  WIRESHARK_DEPENDENCIES += libmaxminddb
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-maxminddb
>>> +WIRESHARK_CONF_OPTS += -DBUILD_mmdbresolve=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_LIBNL),y)
>>> -WIRESHARK_CONF_OPTS += --with-libnl
>>> +WIRESHARK_CONF_OPTS += -DENABLE_NETLINK=ON
>>>  WIRESHARK_DEPENDENCIES += libnl
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-libnl
>>> +WIRESHARK_CONF_OPTS += -DENABLE_NETLINK=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_LIBSSH),y)
>>> -WIRESHARK_CONF_OPTS += --with-libssh=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LIBSSH=ON
>>>  WIRESHARK_DEPENDENCIES += libssh
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-libssh
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LIBSSH=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_LIBXML2),y)
>>> -WIRESHARK_CONF_OPTS += --with-libxml2
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=ON
>>>  WIRESHARK_DEPENDENCIES += libxml2
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-libxml2
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LIBXML2=OFF
>>>  endif
>>>
>>>  # no support for lua53 yet
>>>  ifeq ($(BR2_PACKAGE_LUA_5_1),y)
>>> -WIRESHARK_CONF_OPTS += --with-lua
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LUA=ON
>>>  WIRESHARK_DEPENDENCIES += lua
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-lua
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LUA=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_LZ4),y)
>>> -WIRESHARK_CONF_OPTS += --with-lz4=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LZ4=ON
>>>  WIRESHARK_DEPENDENCIES += lz4
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-lz4
>>> +WIRESHARK_CONF_OPTS += -DENABLE_LZ4=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_NGHTTP2),y)
>>> -WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=ON
>>>  WIRESHARK_DEPENDENCIES += nghttp2
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-nghttp2
>>> +WIRESHARK_CONF_OPTS += -DENABLE_NGHTTP2=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_SBC),y)
>>> -WIRESHARK_CONF_OPTS += --with-sbc=yes
>>> +WIRESHARK_CONF_OPTS += -DENABLE_SBC=ON
>>>  WIRESHARK_DEPENDENCIES += sbc
>>>  else
>>> -WIRESHARK_CONF_OPTS += --with-sbc=no
>>> +WIRESHARK_CONF_OPTS += -DENABLE_SBC=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_SNAPPY),y)
>>> -WIRESHARK_CONF_OPTS += --with-snappy=$(STAGING_DIR)/usr
>>> +WIRESHARK_CONF_OPTS += -DENABLE_SNAPPY=ON
>>>  WIRESHARK_DEPENDENCIES += snappy
>>> -ifeq ($(BR2_STATIC_LIBS),y)
>>> -WIRESHARK_CONF_ENV += LIBS=-lstdc++
>>> -endif
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-snappy
>>> +WIRESHARK_CONF_OPTS += -DENABLE_SNAPPY=OFF
>>>  endif
>>>
>>>  ifeq ($(BR2_PACKAGE_SPANDSP),y)
>>> -WIRESHARK_CONF_OPTS += --with-spandsp
>>> +WIRESHARK_CONF_OPTS += -DENABLE_SPANDSP=ON
>>>  WIRESHARK_DEPENDENCIES += spandsp
>>>  else
>>> -WIRESHARK_CONF_OPTS += --without-spandsp
>>> +WIRESHARK_CONF_OPTS += -DENABLE_SPANDSP=OFF
>>>  endif
>>>
>>>  define WIRESHARK_REMOVE_DOCS
>>> @@ -159,4 +148,4 @@ endef
>>>
>>>  WIRESHARK_POST_INSTALL_TARGET_HOOKS += WIRESHARK_REMOVE_DOCS
>>>
>>> -$(eval $(autotools-package))
>>> +$(eval $(cmake-package))
>>>
> Best Regards,
> 
> Fabrice
> 
