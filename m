From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 24 Apr 2020 14:47:14 +0200
Subject: [Buildroot] [PATCH v2] package/matio: new package
In-Reply-To: <20200424120545.GK5035@scaer>
References: <20200424085624.23908-1-gwenj@trabucayre.com>
 <20200424120545.GK5035@scaer>
Message-ID: <20200424144714.698b3255@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all
On Fri, 24 Apr 2020 14:05:45 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Gwenhael, All,
> 
> On 2020-04-24 10:56 +0200, Gwenhael Goavec-Merou spake thusly:
> > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > 
> > matio is an C library for reading and writing MATLAB MAT files.
> > 
> > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> > ---  
> [--SNIP--]
> > diff --git a/package/matio/Config.in b/package/matio/Config.in
> > new file mode 100644
> > index 0000000000..b6c4223e44
> > --- /dev/null
> > +++ b/package/matio/Config.in
> > @@ -0,0 +1,15 @@
> > +config BR2_PACKAGE_MATIO
> > +	bool "matio"
> > +	select BR2_PACKAGE_ZLIB
> > +	help
> > +	  matio is an C library for reading and writing MATLAB MAT
> > +	  files.
> > +
> > +	  https://sourceforge.net/projects/matio
> > +
> > +if BR2_PACKAGE_MATIO
> > +
> > +config BR2_PACKAGE_MATIO_SPARSE
> > +	bool "sparse support"  
> 
> Why do we need this top be optional? Does it increase the size
> considerably?
>
I need to check 
>
> Im intrigued, because...
> 
> [--SNIP--]
> > diff --git a/package/matio/matio.mk b/package/matio/matio.mk
> > new file mode 100644
> > index 0000000000..2ac46f10ad
> > --- /dev/null
> > +++ b/package/matio/matio.mk
> > @@ -0,0 +1,25 @@
> > +################################################################################
> > +#
> > +# matio
> > +#
> > +################################################################################
> > +
> > +MATIO_VERSION = 1.5.17
> > +MATIO_SITE =
> > http://downloads.sourceforge.net/project/matio/matio/$(MATIO_VERSION)
> > +MATIO_LICENSE = BSD-2-Clause +MATIO_LICENSE_FILES = COPYING
> > +MATIO_DEPENDENCIES = zlib
> > +MATIO_INSTALL_STAGING = YES
> > +
> > +# va_copy()
> > +MATIO_CONF_ENV = ac_cv_va_copy=yes
> > +
> > +MATIO_CONF_OPTS = --enable-mat73=no  
> 
> ... here you explicitly disable a feature.
>
This feature requires hdf5, not available. I must add a message to explain why

> 
> > +ifeq ($(BR2_PACKAGE_MATIO_SPARSE),y)
> > +MATIO_CONF_OPTS += --enable-extended-sparse=yes
> > +else
> > +MATIO_CONF_OPTS += --enable-extended-sparse=no  
> 
> Usually, we use: --enable-extended-sparse and --disable-extended-sparse=yes
> 
> Regards,
> Yann E. MORIN.
> 
> > +endif
> > +
> > +$(eval $(autotools-package))
> > -- 
> > 2.25.1
> > 
Regards,
Gwen
