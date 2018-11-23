From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 13:46:53 +0100
Subject: [Buildroot] [PATCH next v5 6/9] package/pkg-generic: adjust
 config scripts tweaks for per-package folders
In-Reply-To: <20181120205357.GK2601@scaer>
References: <20181120163522.4281-1-thomas.petazzoni@bootlin.com>
 <20181120163522.4281-7-thomas.petazzoni@bootlin.com>
 <20181120205357.GK2601@scaer>
Message-ID: <20181123134653.2097fa9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Tue, 20 Nov 2018 21:53:57 +0100, Yann E. MORIN wrote:

> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 309fd8cd48..9b4db845b6 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -275,12 +275,13 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
> >  	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
> >  	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
> >  		$(call MESSAGE,"Fixing package configuration files") ;\
> > -			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
> > -				-e "s,$(STAGING_DIR), at STAGING_DIR@,g" \
> > +			$(SED)  "s,$(HOST_DIR), at HOST_DIR@,g" \
> > +				-e "s,$(BASE_DIR), at BASE_DIR@,g" \  
> 
> Previously, BASE_DIR was the very first thing replaced, but now it no
> longer is.

Correct.

> I'm not sure if I follow it all, but is the reason for that inversion
> hidden behhinde notes [0] and [1], being the need to create relative
> symlinks?

We're not creating symlinks here, we replacing absolute paths with
relative paths using the $(dirname $0) trick. But I guess that's what
you meant.

> As far as I understand, if BASE_DIR is kept as the first replacement,
> then we lose HOST_DIR as it (usually) is a subdir of BASE_DIR, so we end
> up with just @BASE_DIR@/host and thus can't easily replace it with
> relative paths anymore.

Exactly: if we replace $(BASE_DIR) by @BASE_DIR@, we can't easily
replace $(HOST_DIR) by @HOST_DIR@ anymore and then do the necessary
fixup.

The reason why the $(BASE_DIR) -> @BASE_DIR@ and then @BASE_DIR@ ->
$(BASE_DIR) replacement was added in commit
7701fc53d19be7cab8bddba72046a39e8421fd9e was to support the case where
build takes place in /usr.

The problem was that:

	s,-L/usr,-L at STAGING_DIR@/usr,g

would continuously re-add @STAGING_DIR@ if the build happens in a
sub-dir of /usr, because -L/usr will always match, even if the path has
already been fixed up.

The replacement of $(HOST_DIR) to @HOST_DIR@ before the $(BASE_DIR) to
@BASE_DIR@ replacement doesn't break this logic. If the path is in
$(HOST_DIR), it will have been replaced by @HOST_DIR@ and will not
match -L/usr, and then if the path is somewhere else in $(BASE_DIR), it
will be replaced by @BASE_DIR@, and the existing logic will continue to
work.

> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

So, I'll take your Reviewed-by, but let me know if you're still
unconvinced for some reason.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
