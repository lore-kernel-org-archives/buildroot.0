From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 17:57:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/attr: bump to version 2.4.48
In-Reply-To: <20180628201228.GA23513@scaer>
References: <20180628142953.12048-1-ghn@certi.org.br>
 <20180628201228.GA23513@scaer>
Message-ID: <20180630155736.GB2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2018-06-28 22:12 +0200, Yann E. MORIN spake thusly:
> On 2018-06-28 11:29 -0300, Gustavo Henrique Nihei spake thusly:
> > attr had its build system modernized in this release, making the package
> > build/install like every other autotools package. Patches 0001 and 0004
> > are no longer needed. Patches 0002 and 0003 are already upstream in
> > commit IDs 667137acaffb8d0cc62b47821a67a52ba0637d5c and
> > 92247401984dd9a80d9d0c8c030692323f980678, respectively.
> This is not enough, becaus the latest attr version no longer installs
> its legacy xattr.h header, as it has been provided by the C libray for
> ages now.
> I initially sent a 6-patch series, nit sure why it's not in Patchwork
> anymore:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/bump-attr

I've now respun this series. Sorry, I forgot to Cc you in that series...

    https://patchwork.ozlabs.org/project/buildroot/list/?series=53025

t is very close to what you submitted., since upstream attr and acl have
both made a release, and made a tarball of it.

However, I have a comment about your original submission, see below...

> > diff --git a/package/attr/attr.mk b/package/attr/attr.mk
> > index 8d250608b7..a558f4c742 100644
> > --- a/package/attr/attr.mk
> > +++ b/package/attr/attr.mk
> > @@ -4,43 +4,12 @@
> >  #
> >  ################################################################################
> >  
> > -ATTR_VERSION = 2.4.47
> > -ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
> > +ATTR_VERSION = 2.4.48
> >  ATTR_SITE = http://download.savannah.gnu.org/releases/attr
> >  ATTR_INSTALL_STAGING = YES
> > -ATTR_CONF_OPTS = --enable-gettext=no
> > -HOST_ATTR_CONF_OPTS = --enable-gettext=no
> > +ATTR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)

This is a change in behaviour: previously, NLS support was forcibly
disabled by way of --enable-gettext=no, but your change adds support for
NLS. This should have been a separate patch.

The new option to disable NLS is, you guessed it, --disable-nls. ;-)
That's what I did in my series.

If you need attr (and acl) with NLS support, then please send a patch
that does just that (supposedly, based on the series I just sent).

Thanks! :-)

Regards,
Yann E. MORIN.

> >  ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
> >  ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
> >  
> > -# While the configuration system uses autoconf, the Makefiles are
> > -# hand-written and do not use automake. Therefore, we have to hack
> > -# around their deficiencies by passing installation paths.
> > -ATTR_INSTALL_STAGING_OPTS = \
> > -	prefix=$(STAGING_DIR)/usr \
> > -	exec_prefix=$(STAGING_DIR)/usr \
> > -	PKG_DEVLIB_DIR=$(STAGING_DIR)/usr/lib \
> > -	install-dev install-lib
> > -
> > -ATTR_INSTALL_TARGET_OPTS = \
> > -	prefix=$(TARGET_DIR)/usr \
> > -	exec_prefix=$(TARGET_DIR)/usr \
> > -	install install-lib
> > -
> > -HOST_ATTR_INSTALL_OPTS = \
> > -	prefix=$(HOST_DIR) \
> > -	exec_prefix=$(HOST_DIR) \
> > -	install-dev install-lib
> > -
> > -# The libdir variable in libattr.la is empty, so let's fix it. This is
> > -# probably due to attr not using automake, and not doing fully the
> > -# right thing with libtool.
> > -define ATTR_FIX_LIBTOOL_LA_LIBDIR
> > -	$(SED) "s,libdir=.*,libdir='$(STAGING_DIR)'," \
> > -		$(STAGING_DIR)/usr/lib/libattr.la
> > -endef
> > -
> > -ATTR_POST_INSTALL_STAGING_HOOKS += ATTR_FIX_LIBTOOL_LA_LIBDIR
> > -
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> > -- 
> > 2.16.2.windows.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
