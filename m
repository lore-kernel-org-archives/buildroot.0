From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2015 09:49:10 +0200
Subject: [Buildroot] [PATCH 1/1] yad: new package
In-Reply-To: <20150703053105.GL2391@tarshish>
References: <1435874967-6416-1-git-send-email-james.knight@rockwellcollins.com>
 <20150703053105.GL2391@tarshish>
Message-ID: <20150703094910.750481b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 3 Jul 2015 08:31:05 +0300, Baruch Siach wrote:

> > +
> > +if BR2_PACKAGE_YAD
> > +
> > +config BR2_PACKAGE_YAD_FORCE_LIBGTK2
> > +	bool "Force libgtk2"
> > +	depends on BR2_PACKAGE_LIBGTK2 && BR2_PACKAGE_LIBGTK3
> 
> You need both gtk2 and gtk3?

No, I think James idea here is that if the user has gtk2 *or* gtk3
enabled, then we don't need anything special: we'll use either of them.

However, if the user has enabled *both* gtk2 and gtk3, then we need to
know which one the user wants to use. This option therefore appears in
such a situation, and allows the user to either opt for gtk3 (option
disabled) or gtk2 (option enabled).

> > diff --git a/package/yad/yad.hash b/package/yad/yad.hash
> > new file mode 100644
> > index 0000000..b86b815
> > --- /dev/null
> > +++ b/package/yad/yad.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256 c7b79ff8189222a642e90052590e3ceb6c3d70623346096c1987f695ebf694b1 yad-0.28.1.tar.xz
> > diff --git a/package/yad/yad.mk b/package/yad/yad.mk
> > new file mode 100644
> > index 0000000..630d3b3
> > --- /dev/null
> > +++ b/package/yad/yad.mk
> > @@ -0,0 +1,24 @@
> > +################################################################################
> > +#
> > +# yad
> > +#
> > +################################################################################
> > +
> > +YAD_VERSION = 0.28.1
> > +YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
> > +YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
> > +YAD_LICENSE = GPLv3
> > +YAD_LICENSE_FILES = COPYING
> > +YAD_DEPENDENCIES = host-intltool host-pkgconf libglib2
> > +
> > +YAD_CONF_OPTS = --enable-html=no
> > +
> > +ifeq ($(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_YAD_FORCE_LIBGTK2),y)
> 
> This condition is true if either gtk3 or gtk2 are selected...

No, this condition is true if gtk3 is there *and*
BR2_PACKAGE_YAD_FORCE_LIBGTK2 is disabled, which means that we want to
use gtk3, because we are in one of the two possible situations:

 * only gtk3 is enabled -> we want to use it

 * both gtk3 and gtk2 are enabled, but since
   BR2_PACKAGE_YAD_FORCE_LIBGTK2 is enabled, it means the user wants to
   use gtk3

Since there is no way for BR2_PACKAGE_YAD_FORCE_LIBGTK2 to be true
without BR2_PACKAGE_LIBGTK3 being true, it works fine.

But I agree it's a bit tricky. James, what do you think instead to have
a simpler (though admittedly somewhat less flexible) solution, as
proposed by Baruch:

	select BR2_PACKAGE_LIBGTK3 if !BR2_PACKAGE_LIBGTK2

and then use gtk3 if available, otherwise gtk2 if available. Thanks to
the select, you're sure at least one of the two will be available. The
only thing you give up is that the user cannot select to use gtk2 if he
has both gtk2 and gtk3 in the same system. But:

	1/ situations with both gtk2 and gtk3 are pretty unlikely

	2/ if you have both, why would you *not* want to use gtk3 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
