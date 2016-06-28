From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Tue, 28 Jun 2016 15:14:15 +0900
Subject: [Buildroot] qt5wayland: new package
In-Reply-To: <20160627203819.GB3714@free.fr>
References: <20160626055917.3371-1-akihiko.odaki.4i@stu.hosei.ac.jp>
 <20160627203819.GB3714@free.fr>
Message-ID: <36dee109-2377-f34b-2cc3-160bf0193ce2@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Morin, Peter,

Thank you for your review. I'm going to submit a revised patch after I 
confirm my patch works on my device. For your information, I'm using 
Raspberry Pi B+ with kernel 4.7-rc4, which has VC4 DRM driver.

On 2016-06-28 05:38, Yann E. MORIN wrote:
> Akihiko, All,
>
> On 2016-06-26 14:59 +0900, Akihiko Odaki spake thusly:
>> Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
>
> Thanks for this submission; that's very much appreciated.
>
> Sorry for the delay it takes to review your patches, but as you can see,
> we have a lot of still pending patches:
>     https://patchwork.ozlabs.org/project/buildroot/list/
>
> Now, for the proper review...
 >
> You should add some explanations in your commit log. There are things in
> your patch that are not trivial (I'll point them below), so you need to
> explain them.

I'll write about the changes to other files (qt5base/*) to the commit 
log. I also write comments in the package files (qt5wayland/*) if it 
seems necessary.

> [--SNIP--]
>> diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
>> index 64a7f65..2b8e278 100644
>> --- a/package/qt5/qt5base/Config.in
>> +++ b/package/qt5/qt5base/Config.in
>> @@ -122,7 +122,8 @@ config BR2_PACKAGE_QT5BASE_GUI
>>  	select BR2_PACKAGE_QT5BASE_LINUXFB if \
>>  	       !BR2_PACKAGE_QT5BASE_DIRECTFB && \
>>  	       !BR2_PACKAGE_QT5BASE_XCB && \
>> -	       !BR2_PACKAGE_QT5BASE_EGLFS
>> +	       !BR2_PACKAGE_QT5BASE_EGLFS && \
>> +	       !BR2_PACKAGE_QT5WAYLAND
>
> So, when we have qt5wayland, we need no other backend, right?
>
> What if the compositor itself is a Qt5 application? Surely in that case,
> it really needs another backend (probably eglfs)?
>
> This above is probably OK for clients written in Qt5 and a compositor
> written without qt5wayland; but a compositor written in Qt5 *will* need
> a backend.
>
> But I'm neither a Qt5 nor a wayland expert... :-/

QtWayland has a feature to allow to make compositors, so I assume that 
Qt-based compositors should be written using it. However, the package 
doesn't enable the option to provide the feature.

> At least, explain this (maybe just a single sentence is enough).
>
>>  	help
>>  	  This option enables the Qt5Gui library.

Qt5Gui allows to make GUI applications (i.e. using graphic feature), and 
it depends on QPA (Qt Platform Abstraction, graphic backend). That's it.

>> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
>> index 783cf3c..1d4750b 100644
>> --- a/package/qt5/qt5base/qt5base.mk
>> +++ b/package/qt5/qt5base/qt5base.mk
>> @@ -122,6 +122,10 @@ else
>>  QT5BASE_CONFIGURE_OPTS += -no-eglfs
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_QT5WAYLAND),y)
>> +QT5BASE_CONFIGURE_OPTS += -no-qpa-platform-guard
>> +endif
>
> Why? This is a case where you need to provide explanations in the commit
> log.

Because qpa-platform-guard in Qt Base doesn't know that Qt Wayland is 
available, it emits an error while building. This option prevents that.
Maybe I should write that in the line before as a comment.

>>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
>>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
>>
>> diff --git a/package/qt5/qt5wayland/Config.in b/package/qt5/qt5wayland/Config.in
>> new file mode 100644
>> index 0000000..acfff15
>> --- /dev/null
>> +++ b/package/qt5/qt5wayland/Config.in
>> @@ -0,0 +1,16 @@
>> +config BR2_PACKAGE_QT5WAYLAND
>> +	bool "qt5wayland"
>> +	select BR2_PACKAGE_QT5BASE
>> +	select BR2_PACKAGE_QT5DECLARATIVE
>> +	select BR2_PACKAGE_QT5JSBACKEND
>> +	select BR2_PACKAGE_LIBXKBCOMMON
>> +	select BR2_PACKAGE_XKEYBOARD_CONFIG
>> +	depends on BR2_PACKAGE_WAYLAND
>> +	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
>
> First, we prefer depends before select; it's more logical:
>   - first, what do I require?  --> depends on
>   - then when all I require is available, what do I need?  --> select
>
> Also, as Peter and I replied onyour previous iteration, you probably
> need to depend on a libegl provider. But libegl is not enough, you also
> need a wayland-egl provider, for which we currently have only mesa3d as
> a provider.
>
> So, please, could you first add a new virtual package, named
> libwayland-egl, that can act as a midddle-man between the providers and
> qt5waylnd?
>
>  1- add the libwayland-egl virtual package
>  2- make mesa3d a p[rovider of it (when the correct options are enabled
>     in mesa3d)
>  3- add qt5wayland which depends on libwayland-egl.
>
> But as Peter found, qt5wayland has backends for non wayland-egl
> providers, like the Raspberry Pi. So we'd need ad-hoc dependencies in
> this case.
>
> However, for the specific case of the RPi, the global directions is now
> to use the VC4 driver in mesa3d and drop specific code in upstream
> projects. This will take a bit of time before VC4 is up to the job,
> though, so we'll probably need to carry thos specific ad-hoc
> dependencies. They can be added in later patches, though; it is not
> necessary that your submission covers all the cases from the onset.
>
> So I would be perfectly fine with a qt5wayland that only supports a
> libwayland-egl for now.
>
> Concerning dependencies, please see Peter's comments on your previous
> iteration, too.

It doesn't seem to depend on libwayland-egl. Probably you can use 
wayland-generic QPA. So you may pass `-platform wayland-generic` for 
your application or set `wayland-generic` to 
BR2_PACKAGE_QT5BASE_DEFAULT_QPA.

By the way, I found that the package depends on 
BR2_PACKAGE_QT5BASE_OPENGL while investigating the issue. I'll add the 
dependency to BR2_PACKAGE_QT5WAYLAND.

>> +	help
>> +	  Qt is a cross-platform application and UI framework for
>> +	  developers using C++.
>> +
>> +	  This package corresponds to the qt5wayland module.
>> +
>> +	  http://qt.io
>> diff --git a/package/qt5/qt5wayland/qt5wayland.hash b/package/qt5/qt5wayland/qt5wayland.hash
>> new file mode 100644
>> index 0000000..9de278f
>> --- /dev/null
>> +++ b/package/qt5/qt5wayland/qt5wayland.hash
>> @@ -0,0 +1,4 @@
>> +# Hashes from: https://download.qt.io/official_releases/qt/5.6/5.6.1-1/submodules/qtwayland-opensource-src-5.6.1-1.tar.xz.mirrorlist
>> +sha256 8489b2b96f1e383ee11a00a686b9cd65418893ec3fc604d5d08dc644e27ddbba qtwayland-opensource-src-5.6.1-1.tar.xz
>> +sha1   f56d654aae2223fb012a86a3f69e1b7564fd07f4                         qtwayland-opensource-src-5.6.1-1.tar.xz
>> +md5    ec57727a3b485b35cc3948f9e64af9d2                                 qtwayland-opensource-src-5.6.1-1.tar.xz
>
> As explained in my previous reply, all those hashes are fine. :-)

Ok. I'll keep as it is.

>> diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
>> new file mode 100644
>> index 0000000..be6cf8f
>> --- /dev/null
>> +++ b/package/qt5/qt5wayland/qt5wayland.mk
>> @@ -0,0 +1,34 @@
>> +################################################################################
>> +#
>> +# qt5wayland
>> +#
>> +################################################################################
>> +
>> +QT5WAYLAND_VERSION = $(QT5_VERSION)
>> +QT5WAYLAND_SITE = $(QT5_SITE)
>> +QT5WAYLAND_SOURCE = qtwayland-opensource-src-$(QT5WAYLAND_VERSION).tar.xz
>> +QT5WAYLAND_DEPENDENCIES = qt5base qt5declarative wayland libxkbcommon xkeyboard-config
>> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
>> +QT5WAYLAND_DEPENDENCIES += libegl

> So, what if there is no libegl provider enabled? I don't think this is
> optional.
>
> After you add the libwayland-egl virtual package, you'll have to depend
> on it here, too.

Probably it's optional as I wrote in the above.

>> +endif
>> +QT5WAYLAND_INSTALL_STAGING = YES
>> +
>> +define QT5WAYLAND_CONFIGURE_CMDS
>> +	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
>
> Parenthesis are not needed.
>
> You should use $(QT5_QMAKE) instead:
>
>     define QT5WAYLAND_CONFIGURE_CMDS
>         cd $(@D) && $(QT5_QMAKE)
>     endef
>
>> +endef
>> +
>> +define QT5WAYLAND_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>> +endef
>> +
>> +define QT5WAYLAND_INSTALL_STAGING_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>
> As Peter said, please also use $(QT5_LA_PRL_FILES_FIXUP) here.
> See package/qt5/qt5declarative/qt5declarative.mk for example.
>
> (Note: I was very surprised that we do not specify where to install, but
> it seems we're doign magic in our qmake installation

I'll follow the advice.

>> +endef
>> +
>> +define QT5WAYLAND_INSTALL_TARGET_CMDS
>> +	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
>> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland-*-client $(TARGET_DIR)/usr/lib/qt/plugins
>> +	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland-*.so $(TARGET_DIR)/usr/lib/qt/plugins/platforms
>
> I'm not a fan of all those cp commands, but that's how the other qt5
> modules do, so that's fine by me.

Actually I made this package by following the way that other packages do.

Thank you for reviewing.

Regards,
Akihiko Odaki.

> Otherwise, I'll repeast myself, but please provide explanations on your
> commit log. There are non-trivial stuff in this patch, and they really
> warrant be explained.
>
> Thanks for working on this! :-)
>
> Regards,
> Yann E. MORIN.
>
>> +endef
>> +
>> +$(eval $(generic-package))
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
