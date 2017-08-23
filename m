From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 14:32:47 +0200
Subject: [Buildroot] [PATCH 1/1] Add option to the gst1-plugins-bad
 package to enable/disable the qt plugin.
In-Reply-To: <CADujc4owoQzFY-7exkd5EBe1m=YMhpfa=-KFsV_k0dffhBgUdA@mail.gmail.com>
References: <CADujc4qKisW=6QyDZjDSUo50Yj+_H4-+7V=2KW32cAzRB_d2Qw@mail.gmail.com>
 <20170721112225.748ac7a5@windsurf>
 <CADujc4owoQzFY-7exkd5EBe1m=YMhpfa=-KFsV_k0dffhBgUdA@mail.gmail.com>
Message-ID: <20170823143247.716c0162@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 14:19:04 +0800, Glenn Coombs wrote:
> I think the code needs Qt5 rather than Qt4 as it uses the scene graph
> rendering model that only exists in Qt5.  The code in the
> output/build/gst1-plugins-bad-1.12.1/ext/qt/ directory needs the following
> Qt header files in order to compile:

Correct, it uses Qt5.

> I've changed the gst1-plugins-bad/Config.in file like this:
> 
> config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
>     bool "qt"
>         depends on BR2_PACKAGE_QT5

It probably needs a bunch more options here:

	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE
	select BR2_PACKAGE_QT5BASE
	select BR2_PACKAGE_QT5BASE_GUI
	select BR2_PACKAGE_QT5BASE_XML
	select BR2_PACKAGE_QT5DECLARATIVE_QUICK

> which only allows the gst-plugins-bad/qt option to be selected if the Qt5
> package has already been selected.  I'm not sure how to handle the
> dependencies in the gst1-plugins-bad.mk file.  I think you're right that if
> I add a dependency on Qt5 then it will introduce a circular dependency as
> the qt5base.mk file has this section:
> 
> ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>     # gstreamer 0.10 support is broken in qt5multimedia
>     ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
>         QT5BASE_CONFIGURE_OPTS += -gstreamer 1.0
>         QT5BASE_DEPENDENCIES   += gst1-plugins-base
>     else
>         QT5BASE_CONFIGURE_OPTS += -no-gstreamer
>     endif
> endif
> 
> Any thoughts on how best to break that circular dependency ?

In fact there is no circular dependency I believe:

qt5base (for Qt 5.6) or qt5multimedia (for Qt 5.9) depend on
gst1-plugins-base. But the dependency you're adding is in
gst1-plugins-bad.

Therefore, the following build order is perfectly fine, and has no
circular dependency:

gstreamer1
gst1-plugins-base
qt5base / qt5multimedia / qt5declarative
gst1-plugins-bad

Could you cook a patch adding the appropriate logic in
gst1-plugins-bad ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
