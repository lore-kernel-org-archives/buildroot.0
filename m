From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 17 Mar 2017 12:51:36 +0200
Subject: [Buildroot] [PATCH 1/2] acl: add host variant
In-Reply-To: <402ef173-377c-e717-c882-bd31b91f2d87@andin.de>
References: <20170316223840.23007-1-arnout@mind.be>
 <402ef173-377c-e717-c882-bd31b91f2d87@andin.de>
Message-ID: <20170317105136.ibrj6tg3bgmi5pcl@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andreas,

On Fri, Mar 17, 2017 at 09:59:24AM +0100, Andreas Naumann wrote:
> However, when I run it I get a
> acl_get_fd.c:26:24: fatal error: attr/xattr.h: No such file or directory
> 
> I find this file in
> output/host/usr/include/attr/xattr.h
> 
> but that's outside the sysroot, so probably not included, right?

This is the host variant of acl, so don't expect it to be in the target 
sysroot.

> When I install
> apt-get install libattr1-dev
> on the host it works.
> 
> But we shouldnt depend on that, should we?

We should. Something went wrong with the host headers search path.

baurch

> Am 16.03.2017 um 23:38 schrieb Arnout Vandecappelle (Essensium/Mind):
> > We need host-acl to fix issues with fakeroot.
> > 
> > Unfortunately, all the hacks have to be repeated again.
> > 
> > Cc: Yegor Yefremov <yegorslists@googlemail.com>
> > Cc: Andreas Naumann <dev@andin.de>
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > ---
> >  package/acl/acl.mk | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/package/acl/acl.mk b/package/acl/acl.mk
> > index cbe5e93961..b38cc4c0c3 100644
> > --- a/package/acl/acl.mk
> > +++ b/package/acl/acl.mk
> > @@ -37,4 +37,13 @@ endef
> > 
> >  ACL_POST_INSTALL_STAGING_HOOKS += ACL_FIX_LIBTOOL_LA_LIBDIR
> > 
> > +HOST_ACL_DEPENDENCIES = host-attr
> > +HOST_ACL_CONF_OPTS = --enable-gettext=no
> > +HOST_ACL_INSTALL_OPTS = \
> > +	prefix=$(HOST_DIR)/usr \
> > +	exec_prefix=$(HOST_DIR)/usr \
> > +	PKG_DEVLIB_DIR=$(HOST_DIR)/usr/lib \
> > +	install-dev install-lib
> > +
> >  $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
