From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Sep 2015 07:45:37 +0300
Subject: [Buildroot] [PATCH v2] mtd: fix static build with uuid
In-Reply-To: <55F29C08.7040403@imgtec.com>
References: <2ee5281619493115a4a6bd865596d3d328087cd7.1441944517.git.baruch@tkos.co.il>
 <55F29C08.7040403@imgtec.com>
Message-ID: <20150913044537.GB2630@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Fri, Sep 11, 2015 at 10:16:56AM +0100, Vicente Olivert Riera wrote:
> On 09/11/2015 05:08 AM, Baruch Siach wrote:
> > The uuid library might depend on gettext. Use pkg-config to discover uuid
> > dependencies at build time, and edit Makefile accordingly to avoid missing
> > symbols when linking statically.
> > 
> > Based on a patch from Vicente Olivert Riera.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/2dd/2ddd714446d9eb75701bd48c117dc5bbbd291a76/
> > http://autobuild.buildroot.net/results/3af/3af4ef252c8cb2b22134d91ce48e5930c60ec437/
> > http://autobuild.buildroot.net/results/648/648341fce974e8f016eee57c95d7511a886eef49/
> > 
> > Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v2:
> >    * Use backticks instead of $(shell ...) make function (Arnout)
> > ---
> >  package/mtd/mtd.mk | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> > index 0fb9fc2c1acc..89cfac15756a 100644
> > --- a/package/mtd/mtd.mk
> > +++ b/package/mtd/mtd.mk
> > @@ -16,8 +16,14 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
> >  MTD_DEPENDENCIES = zlib lzo
> >  endif
> >  
> > +MTD_MKFSUBIFS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs uuid`
> > +
> >  ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
> > -MTD_DEPENDENCIES += util-linux zlib lzo
> > +MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
> > +define MTD_ADD_MISSING_LINTL
> > +	$(SED) "/^LDLIBS_mkfs\.ubifs/ s%$$% $(MTD_MKFSUBIFS_LIBS)%" $(@D)/Makefile
> > +endef
> > +MTD_POST_PATCH_HOOKS += MTD_ADD_MISSING_LINTL
> >  endif
> >  
> >  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> 
> I have tested it and it works. My mistake was using / instead of % in
> the sed command.

Also the use of single quotes instead of double quotes as Arnout has noted.

> Since this fails only for static, why don't you put your changes
> enclosed into an "ifeq ($(BR2_STATIC_LIBS),y)" clause?

$(PKG_CONFIG_HOST_BINARY) should output the correct list of libraries for both
static and dynamic builds. I think that the mtd.mk simplification and wider 
test coverage outweighs the added overhead. Are there any other drawbacks to 
running $(PKG_CONFIG_HOST_BINARY) unconditionally?

Thanks for reviewing and testing.

baruch

>  ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
>  MTD_DEPENDENCIES += util-linux zlib lzo
> +ifeq ($(BR2_STATIC_LIBS),y)
> +MTD_DEPENDENCIES += host-pkgconf
> +MTD_MKFSUBIFS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs uuid`
> +define MTD_ADD_MISSING_LINTL
> +       $(SED) "/^LDLIBS_mkfs\.ubifs/ s%$$% $(MTD_MKFSUBIFS_LIBS)%"
> $(@D)/Makefile
> +endef
> +MTD_POST_PATCH_HOOKS += MTD_ADD_MISSING_LINTL
> +endif
>  endif
> 
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
