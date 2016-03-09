From: Cam Hutchison <camh@xdna.net>
Date: Wed, 9 Mar 2016 13:31:42 +1100
Subject: [Buildroot] [PATCH 1/1] overlay: Allow overlay to be a tar
	archive.
In-Reply-To: <87pov44scp.fsf@dell.be.48ers.dk>
References: <1453763906-22220-1-git-send-email-camh@xdna.net>
 <87pov44scp.fsf@dell.be.48ers.dk>
Message-ID: <CABa6e=o7BoB-YYSfCs3Q8LnTHk_GUYxxjt50ztnsZM-HuaL+7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 March 2016 at 07:39, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Cam" == Cam Hutchison <camh@xdna.net> writes:
>
>  > When installing an overlay, check if the source is a directory. If it is,
>  > continue to use rsync to install it to the target. If it is not a
>  > directory, assume it is an archive extractable by GNU tar(1) and use
>  > that to install it to the target.
>
>  > This allows an overlay specified with BR2_ROOTFS_OVERLAY to be a tar
>  > archive instead of a directory, which is useful when an external build
>  > process produces rootfs archives and not directories.
>
>  > Signed-off-by: Cam Hutchison <camh@xdna.net>
>  > ---
>  >  Makefile         | 14 +++++++++-----
>  >  system/Config.in | 14 ++++++++------
>  >  2 files changed, 17 insertions(+), 11 deletions(-)
>
>  > diff --git a/Makefile b/Makefile
>  > index 17c181b..803be0c 100644
>  > --- a/Makefile
>  > +++ b/Makefile
>  > @@ -653,11 +653,15 @@ endif
>  >              echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
>  >      ) >  $(TARGET_DIR)/etc/os-release
>
>  > -    @$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  > -            $(call MESSAGE,"Copying overlay $(d)"); \
>  > -            rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  > -                    --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  > -                    $(d)/ $(TARGET_DIR)$(sep))
>  > +    @$(foreach overlay, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  > +            $(call MESSAGE,"Copying overlay $(overlay)"); \
>  > +            if test -d $(overlay); then \
>  > +                    rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
>  > +                            --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  > +                            $(overlay)/ $(TARGET_DIR); \
>  > +            else \
>  > +                    tar -a -x -C $(TARGET_DIR) -f $(overlay); \
>
> In concept I'm ok with this, but how portable and generic is this?
>
> Looking at the tar homepage, -a / --auto-compress was added in tar 1.20
> from early 2008, so this presumably breaks on older enterprise
> distributions like RHEL 5.

I did check when -a went in, but I figured 8 years ago was old enough.
I don't know much about the release dates of various distros or what
buildroot wants to support. Is there a guide as to what the cutoff should
be for host features?

> Another potential issue that you assume that the tarball directly
> contains the rootfs overlay content (E.G. no subdirs). This is true for
> the Buildroot rootfs tarballs, but how common is this?

My use case is for using buildroot rootfs tarballs from other phases of
a larger build, both where some developers are responsible for some
parts (kernel/bootloader, common rootfs, specific applications,
integration), and where there are multiple boards to develop for that
have a large amount of commonality for which it is wasteful to rebuild
the same parts over and over.

However, it strikes me now as I write this reply that the patch is wrong.
Any of the parts done under fakeroot that is captured in the tarball will
be lost when merged as an overlay tarball as the extraction is not done
under the fakeroot. I have no direct need for this but it was my intention
that this work - the rootfs in the tarball would be faithfully represented in
the enclosing rootfs.

> I'm not sure this is a common enough usecase to explicitly support
> versus just adding a simple post-image script.

Probably not. I've been carrying this patch or a variant for the last 6 years,
so I thought I'd submit the simplest version of it I have. But given the
questionable use case and that it is subtly wrong as noted above, I'd
suggest you just drop this patch.

>
> Anybody else having an opinion on this?
>
> --
> Bye, Peter Korsgaard
