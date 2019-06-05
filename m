From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 4 Jun 2019 19:47:33 -0700
Subject: [Buildroot] [PATCH v2] package/coreutils: allow building
 individual binaries
In-Reply-To: <20190411185658.57ea2a38@windsurf.home>
References: <20190410201746.14678-1-mmayer@broadcom.com>
 <20190411185658.57ea2a38@windsurf.home>
Message-ID: <CAGt4E5t2OntaMm_cFL_GVJOXnZyEphaqrMBaOFXOVyotOvrOtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

It's been a while, but I had a chance to look at this again.

On Thu, 11 Apr 2019 at 09:56, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 10 Apr 2019 13:17:46 -0700
> Markus Mayer <mmayer@broadcom.com> wrote:
>
> > We add configuration option BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES
> > so that coreutils can be built and installed as individual binaries.
> > It can be used if the target file system doesn't support symlinks or
> > symlinks are undesirable.
> >
> > The approach is modelled after Busybox's similarly named configuration
> > option.
> >
> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>
> I tested this, with BR2_ROOTFS_MERGED_USR and got some broken symlinks
> in /bin. I believe your patch is not sufficient. Indeed, it doesn't
> take care of the following parts of coreutils.mk:
>
> ifeq ($(BR2_ROOTFS_MERGED_USR),)
> define COREUTILS_CLEANUP_BIN
>         # some things go in /bin rather than /usr/bin
>         $(foreach f,$(COREUTILS_BIN_PROGS), \
>                 rm -f $(TARGET_DIR)/usr/bin/$(f) && \
>                 ln -sf ../usr/bin/coreutils $(TARGET_DIR)/bin/$(f)
>         )
> endef
> COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CLEANUP_BIN
> endif

You are saying above that you tried it *with* BR2_ROOTFS_MERGED_USR
and got broken links, but the above seems to be a problem if
BR2_ROOTFS_MERGED_USR is *disabled*, because the macro won't be
executed if it is enabled.

> This probably needs to be changed to move applets from /usr/bin to /bin
> rather than changing the symlinks.

I am not sure I am following. Why would we need to move applets from
/usr/bin to /bin? Shouldn't we let coreutils install its applets where
it sees fit? Or is the idea here that Buildroot wants to install
binaries in a different location than coreutils would? If the latter
is the case, yes, it would make sense to move the binaries rather than
creating symlinks.

> define COREUTILS_CLEANUP
>         # link for archaic shells
>         ln -fs coreutils $(TARGET_DIR)/usr/bin/[
>         # gnu thinks chroot is in bin, debian thinks it's in sbin
>         rm -f $(TARGET_DIR)/usr/bin/chroot
>         ln -sf ../bin/coreutils $(TARGET_DIR)/usr/sbin/chroot
> endef
>
> The symlink logic here also needs to be adjusted I guess.

Yes. Creating a symlink [ -> coreutils definitely won't work if we are
using individual binaries. It'll have to point to "test" instead. And
the solution for chroot would be similar to the symlinks above where
we move the binary instead of creating the link.

Does the proposed solution make sense?

Thanks,
-Markus




> Could you fix this and retest ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
