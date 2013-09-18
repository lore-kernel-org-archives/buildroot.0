From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Sep 2013 06:45:05 +0200
Subject: [Buildroot] [PATCH 1/1] package: udev is now provided by
 systemd or eudev.
In-Reply-To: <20130917104048.GA13723@pc-eric>
References: <1378476068-25300-1-git-send-email-eric.le.bihan.dev@free.fr>
 <522F8008.1000207@mind.be> <20130917104048.GA13723@pc-eric>
Message-ID: <20130918064505.1dd63a52@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 17 Sep 2013 12:40:48 +0200, Eric Le Bihan wrote:

> >  I don't know if it is important, but I would have split the systemd
> > bump from the eudev patch. Or would systemd 44 fail to function with
> > eudev?
> 
> Next time, I will make a series of patch, but I want to keep eudev and systemd
> in sync, as the developpers of eudev do: on Friday September 13th, Systemd
> v207 was released and the next day eudev was bumped to 1.3. Systemd v44 is
> supposed to be compliant with udev v182, but there is no eudev equivalent for
> this version. In order not to provide a broken system, I suggest:
> 
>  1) first patch bumps systemd and replaces udev with a virtual package.
>  2) second patch adds eudev as a "udev provider".

I don't think it's worth the effort splitting the patch, to be honest.
If patches are split, then they should be bisectable. However, with
your suggestion, if patch (1) is applied but not patch (2), then all
configurations that use udev but not systemd would be broken.

> >  IIRC github supports URLs like
> > http://github.com/gentoo/eudev/tarball/v1.2.tar.gz
> 
> I've found the correct URL:
> https://github.com/gentoo/eudev/archive/v1.2.tar.gz
> I will use it instead of the git tree.

Strange, this doesn't match what
http://buildroot.org/downloads/manual/manual.html#github-download-url
says. But maybe it's different for eudev, I don't know.

> >  Is it really useful to have this option, rather than depending on
> > acl automatically when BR2_PACKAGE_ACL is set? Same for some of the
> > other config options below.
> 
> I was wondering what was the best for the user:
> 
>  1) offering him some fine-grained choices.
>  2) offering only one "enable all extras" option.
> 
> Besides, between Systemd extra feature and ACL, which depends on which?
> As a user, I prefer to choose explicitly the features of my system, not having
> them activated unknowingly because I selected other packages.

Right, but we have to balance that with the problem of creating
millions of configuration options to enable in each and every package
whether the SSL support should be enabled, whether the ACL support
should be enabled, etc. We had many discussions on how to draw the line
between "automatically enable a feature if the needed dependencies are
present" and "add a configuration sub-option to enable the feature",
and the conclusions had always been: there's no way to draw a strict
line, it's a matter of taste/compromise.

> Gudev, Gcrypt,
> ACL and journal compression can be grouped in "enable all extras",

I don't think that is what Arnout was suggesting, he was suggesting
that the ACL support should automatically be enabled if the ACL package
is available. I.e, instead of:

ifeq ($(BR2_PACKAGE_SYSTEMD_ACL_SUPPORT),y)
SYSTEMD_CONF_OPT += --enable-acl
SYSTEMD_DEPENDENCIES += acl
else
SYSTEMD_CONF_OPT += --disable-acl
endif

You just change this to:

ifeq ($(BR2_PACKAGE_ACL),y)
SYSTEMD_CONF_OPT += --enable-acl
SYSTEMD_DEPENDENCIES += acl
else
SYSTEMD_CONF_OPT += --disable-acl
endif

> but I'll
> keep the journal gateway as a separate option, as adding it to a firmware
> image really eat up resources (image size and memory consumption): it is a big
> feature. Enabling all extras will select Gudev, Gcrypt, ACL, xz, not the other
> way round.

See above.

> About the patches I provided to have Systemd v206 compile with uClibc:
> 
>  1) A truckload of patches for uClibc 0.9.33 has been added in
>     055f1c02d35068d0b089f3b29ffdd4fb2717bb5c: some of them are redundant
>     with the ones I provided, so I'll clean them up.
>  2) For the Signed-off-by thing: I should have read contribute.txt and
>     SubmittingPatches from Linux source code more carefully.

Ah, right, posix_fallocate() support has been added, as well as support
for %ms in scanf().

This means that I'll have to rebuild the autobuilder uClibc external
toolchains, and also that Crosstool-NG uClibc toolchains (that won't
have all the uClibc patches we apply) will fail to build. The uClibc
community should really do releases more often, it seems.

> > >+SYSTEMD_AUTORECONF = YES
> >
> >  Please add a comment why this is needed.
> I'll see if I can get rid of the reconf step, as well as the build dependency
> on libgcrypt caused by AM_PATH_LIBGCRYPT.

I believe I have already proposed a solution to this problem, if
autoreconf is still neeeded.

> >  We currently have the reverse: systemd can only be selected if udev
> > was selected.  Any specific reason why you change that?  I'm not
> > opposed to modifying that, but then the INIT choice should probably
> > come before the DEVICE_CREATION option. And it probably should be a
> > separate patch.
> 
> Yes. I'm in favor of selecting the init system first, then selecting the /dev
> management method. Also, the password encoding selection should be put before
> selecting the root password.

Ok. Please add separate patches in your patch series to do those
changes.

I'm really glad to see this patch moving forward, bumping systemd and
udev is long overdue, and it's great to have someone doing this!

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
