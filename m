From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Apr 2018 19:28:15 +0200
Subject: [Buildroot] [PATCH v1] gstreamer1-editing-services: new package
In-Reply-To: <20171027174426.23753-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 27 Oct 2017 19:44:26 +0200")
References: <20171027174426.23753-1-ps.report@gmx.net>
Message-ID: <87lge6rg40.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  package/gstreamer1/Config.in                       |  1 +
 >  .../gstreamer1-editing-services/Config.in          | 18 +++++++++++++++
 >  .../gstreamer1-editing-services.hash               |  7 ++++++
 >  .../gstreamer1-editing-services.mk                 | 27 ++++++++++++++++++++++
 >  4 files changed, 53 insertions(+)
 >  create mode 100644 package/gstreamer1/gstreamer1-editing-services/Config.in
 >  create mode 100644 package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
 >  create mode 100644 package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk

 > diff --git a/package/gstreamer1/Config.in b/package/gstreamer1/Config.in
 > index aef75b55bf..6dddc276e1 100644
 > --- a/package/gstreamer1/Config.in
 > +++ b/package/gstreamer1/Config.in
 > @@ -12,4 +12,5 @@ source "package/gstreamer1/gst1-rtsp-server/Config.in"
 >  source "package/gstreamer1/gst1-validate/Config.in"
 >  source "package/gstreamer1/gst1-vaapi/Config.in"
 >  source "package/gstreamer1/gst-omx/Config.in"
 > +source "package/gstreamer1/gstreamer1-editing-services/Config.in"
 >  endif
 > diff --git a/package/gstreamer1/gstreamer1-editing-services/Config.in
 > b/package/gstreamer1/gstreamer1-editing-services/Config.in
 > new file mode 100644
 > index 0000000000..42261da358
 > --- /dev/null
 > +++ b/package/gstreamer1/gstreamer1-editing-services/Config.in
 > @@ -0,0 +1,18 @@
 > +config BR2_PACKAGE_GSTREAMER1_EDITING_SERVICES
 > +	bool "gstreamer1-editing-services"
 > +	select BR2_PACKAGE_LIBXML2
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOTESTSRC # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_IMAGEFREEZE # runtime
 > +	select BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER # runtime

You cannot select the good/bad sub options without also selecting
BR2_PACKAGE_GST1_PLUGINS_{GOOD,BAD}.

 > +
 > +	help

No empty line before the help option.

 > +GSTREAMER1_EDITING_SERVICES_VERSION = 1.12.3
 > +GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 > +GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 > +GSTREAMER1_EDITING_SERVICES_LICENSE = LGPLv2+
 > +GSTREAMER1_EDITING_SERVICES_LICENSE_FILES = COPYING COPYING.LIB
 > +GSTREAMER1_EDITING_SERVICES_INSTALL_STAGING = YES
 > +GSTREAMER1_EDITING_SERVICES_DEPENDENCIES = \
 > +	host-pkgconf \
 > +	gstreamer1 \
 > +	gst1-plugins-base \

And adding them here.

> +	$(if $(BR2_PACKAGE_GST1_VALIDATE),gst1-validate) \
 > +	libxml2
 > +
 > +GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --disable-benchmarks
 > +
 > +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 > +	GSTREAMER1_EDITING_SERVICES_CONF_OPTS = --with-gtk=3.0
 > +	GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk3
 > +endif

The --with-gtk option is only for the examples, and it can work with
gtk2 as well, so I've changed it to:

# examples need GTK2/3 with X11 backend
ifneq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3_X11),)
GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --enable-examples

ifeq ($(BR2_PACKAGE_LIBGTK2),y)
GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=2.0
GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk2
else
GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --with-gtk=3.0
GSTREAMER1_EDITING_SERVICES_DEPENDENCIES += libgtk3
endif

else
GSTREAMER1_EDITING_SERVICES_CONF_OPTS += --disable-examples
endif

Committed with these fixes, thanks.

I'll bump the version to 1.12.4 to match the other components in a
separate patch.

-- 
Bye, Peter Korsgaard
