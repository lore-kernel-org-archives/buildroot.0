From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Mar 2016 21:39:18 +0100
Subject: [Buildroot] [PATCH 1/1] overlay: Allow overlay to be a tar
	archive.
In-Reply-To: <1453763906-22220-1-git-send-email-camh@xdna.net> (Cam
 Hutchison's message of "Tue, 26 Jan 2016 10:18:26 +1100")
References: <1453763906-22220-1-git-send-email-camh@xdna.net>
Message-ID: <87pov44scp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:

 > When installing an overlay, check if the source is a directory. If it is,
 > continue to use rsync to install it to the target. If it is not a
 > directory, assume it is an archive extractable by GNU tar(1) and use
 > that to install it to the target.

 > This allows an overlay specified with BR2_ROOTFS_OVERLAY to be a tar
 > archive instead of a directory, which is useful when an external build
 > process produces rootfs archives and not directories.

 > Signed-off-by: Cam Hutchison <camh@xdna.net>
 > ---
 >  Makefile         | 14 +++++++++-----
 >  system/Config.in | 14 ++++++++------
 >  2 files changed, 17 insertions(+), 11 deletions(-)

 > diff --git a/Makefile b/Makefile
 > index 17c181b..803be0c 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -653,11 +653,15 @@ endif
 >  		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 >  	) >  $(TARGET_DIR)/etc/os-release
 
 > -	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 > -		$(call MESSAGE,"Copying overlay $(d)"); \
 > -		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 > -			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 > -			$(d)/ $(TARGET_DIR)$(sep))
 > +	@$(foreach overlay, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
 > +		$(call MESSAGE,"Copying overlay $(overlay)"); \
 > +		if test -d $(overlay); then \
 > +			rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
 > +				--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
 > +				$(overlay)/ $(TARGET_DIR); \
 > +		else \
 > +			tar -a -x -C $(TARGET_DIR) -f $(overlay); \

In concept I'm ok with this, but how portable and generic is this?

Looking at the tar homepage, -a / --auto-compress was added in tar 1.20
from early 2008, so this presumably breaks on older enterprise
distributions like RHEL 5.

Another potential issue that you assume that the tarball directly
contains the rootfs overlay content (E.G. no subdirs). This is true for
the Buildroot rootfs tarballs, but how common is this?

I'm not sure this is a common enough usecase to explicitly support
versus just adding a simple post-image script.

Anybody else having an opinion on this?

-- 
Bye, Peter Korsgaard
