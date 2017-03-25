From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Mar 2017 11:10:31 +0100
Subject: [Buildroot] [PATCH v2,1/2] libmediaart: new package
In-Reply-To: <20170324215727.3d17fc1b@free-electrons.com>
References: <1490387931-113759-1-git-send-email-fontaine.fabrice@gmail.com>
 <20170324215727.3d17fc1b@free-electrons.com>
Message-ID: <CAPi7W83QtcZM=wEFtZ6TMmSRRK-7ewBTUs36+Bpi1=Me37gx6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2017-03-24 21:57 GMT+01:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Fri, 24 Mar 2017 21:38:50 +0100, Fabrice Fontaine wrote:
>
> > +else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_QT),y)
> > +# qt5 needs c++11 (since qt-5.7)
> > +ifeq ($(BR2_QT5_VERSION_LATEST),y)
>
> Should be:
>
>  BR2_PACKAGE_QT5_VERSION_LATEST
>
> It has been changed in commit
> https://git.buildroot.org/buildroot/commit/package/qt5/Config.in?id=
> 49a33d3a229571e22ab783cbb1e5cace06ad7b99.
>
> OK, I will update it.

> > +LIBMEDIAART_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
> > +endif
> > +LIBMEDIAART_DEPENDENCIES += \
> > +     $(if $(BR2_PACKAGE_QT),qt) \
> > +     $(if $(BR2_PACKAGE_QT5),qt5base)
> > +LIBMEDIAART_CONF_OPTS += \
> > +     --disable-gdkpixbuf \
> > +     --enable-qt
> > +else ifeq ($(BR2_PACKAGE_MEDIAART_BACKEND_NONE),y)
> > +LIBMEDIAART_CONF_OPTS += \
> > +     --disable-gdkpixbuf \
> > +     --disable-qt
> > +endif
>
> Are the backends really mutually exclusive?
>
> Yes, they're mutually exclusive. If both are enabled, configure will fail
because of the followig lines in configure.ac:
if test "x$enable_qt" == "xyes" && test "x$enable_gdkpixbuf" == "xyes";
then
AC_MSG_ERROR([Can not enable both Qt and GdkPixbuf backends, please pick
one])
fi

> Why don't we simply do:
>
> ifeq ($(BR2_PACKAGE_QT)$(BR2_PACKAGE_QT5),y)
> ... enable QT backend ...
> else
> ... disable QT backend
> endif
>
> ifeq ($(BR2_PACKAGE_GDK_PIXBUF),y)
> ... enable GDK pixbuf backend ...
> else
> ... disable GDK pixbuf backend ...
> endif
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170325/442b4914/attachment.html>
