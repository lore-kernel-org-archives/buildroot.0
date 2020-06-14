From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Sun, 14 Jun 2020 12:20:20 +0200
Subject: [Buildroot] [PATCH] fs: squashfs: Add config option to pass
 mksquashfs cmdln paramters.
In-Reply-To: <20200614075725.GD2346@scaer>
References: <20200612133249.4127906-1-heiko@sntech.de>
 <20200614075725.GD2346@scaer>
Message-ID: <2569767.EKUIr981zW@diego>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Sonntag, 14. Juni 2020, 09:57:25 CEST schrieb Yann E. MORIN:
> Heiko, All,
> 
> On 2020-06-12 15:32 +0200, Heiko Stuebner spake thusly:
> > From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> > 
> > This can be use to specify additional command line argument to
> > mksquashfs (e.g. -nopad). The implementation is inspired by
> > a similar mechanism for ext file system images.
> 
> What kind of options do you expect to need to pass?

In our case it is "-nopad" to omit padding to the
next 4k boundary.


> Usually, I'd prefer we have common options directly mapped to entries in
> the menuconfig, and keep this kind of "pass-through" options for more
> exotic options.
> 
> For example, if we are looking at the compression options, I'd like we
> add a config option like
> 
>     config BR2_TARGET_ROOTFS_SQUASHFS_EXTRA_COMPRESS
>         bool "high-compression"
>         depends on !BR2_TARGET_ROOTFS_SQUASHFS4_LZMA # No option
>         help
>           Say 'y' to compress even further, at the expense of
>           compression time.
> 
>           For example:
>             - for gzip, this enables all the -Xstrategy
>             - for lz4, this enables -Xhc
>             - for lzo, this enables -Xcompression-level 9
>             - for xz, this chooses appropriate -Xbcj filters
>             - for zstd, this enables -Xcompression-level 22
> 
> And maybe a few other such options, eventually adding the
> BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS for corner-cases only.

ok, so if I'm reading you correctly, I should probably
just introduce a 
	config BR2_TARGET_ROOTFS_SQUASHFS_NOPAD
option, right?


> > Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > ---
> >  fs/squashfs/Config.in   | 11 +++++++++++
> >  fs/squashfs/squashfs.mk |  8 +++++++-
> >  2 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> > index dde2097cb7..789b2cd24a 100644
> > --- a/fs/squashfs/Config.in
> > +++ b/fs/squashfs/Config.in
> > @@ -5,6 +5,16 @@ config BR2_TARGET_ROOTFS_SQUASHFS
> >  
> >  if BR2_TARGET_ROOTFS_SQUASHFS
> >  
> > +config BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS
> > +	string "additional mksquashfs options"
> > +	default ""
> > +	help
> > +	  Specify a space-separated list of mksquashfs options, including
> > +	  any squashfs filesystem features.
> > +
> > +	  For more information about the mke2fs options, see the manual
> 
> s/mke2fs/mksquashfs/

ok


> > +	  page mksquashfs(1).
> > +
> >  choice
> >  	prompt "Compression algorithm"
> >  	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
> > @@ -31,4 +41,5 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
> >  	bool "zstd"
> >  
> >  endchoice
> > +
> >  endif
> > diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> > index 34ab048603..4bc6b338b0 100644
> > --- a/fs/squashfs/squashfs.mk
> > +++ b/fs/squashfs/squashfs.mk
> > @@ -6,7 +6,13 @@
> >  
> >  ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
> >  
> > -ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
> > +SQUASHFS_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))
> 
> Keep the vairalbes prefixed with ROOTFS_ here, to avoid clashing with
> the package namespace: SQUASHFS_MKFS_OPTS by name would be a variable of
> the "squashfs" package.

ok, I wasn't sure here what the correct naming is, a lot of file-systems
seem to use their options without ROOTFS_*

So I'll change this to ROOTFS_* then.


> > +ROOTFS_SQUASHFS_ARGS = \
> > +	-noappend \
> > +	-processors \
> > +	$(PARALLEL_JOBS) \
> 
> $(PARALLEL_JOBS) is a parameter to the --processor option, so it should
> be on the same line.
> 
> However, I don;t think you need to introduce an intermediate variable:
> 
>     ROOTFS_SQUASHFS_ARGS = \
>         -noappend \
>         -processors $(PARALLEL_JOBS) \
>         $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))

this was a bit "modelled" after (aka stolen from) how the extfs does this ;-)
But yeah, we can make this nicer .


Heiko
