From: Gao Xiang <hsiangkao@aol.com>
Date: Fri, 20 Mar 2020 15:13:15 +0800
Subject: [Buildroot] [PATCH v2 2/2] fs/erofs: add support for creating
 EROFS rootfs image
In-Reply-To: <20200319174942.GF10025@scaer>
References: <20200316015838.15183-1-hsiangkao@aol.com>
 <20200316015838.15183-2-hsiangkao@aol.com>
 <20200319174942.GF10025@scaer>
Message-ID: <20200320071302.GB1975@hsiangkao-HP-ZHAN-66-Pro-G1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Mar 19, 2020 at 06:49:42PM +0100, Yann E. MORIN wrote:
> Gao, All,
> 
> On 2020-03-16 09:58 +0800, Gao Xiang spake thusly:
> > This patch makes possible to create rootfs image using
> > EROFS filesystem.
> > 
> > Signed-off-by: Gao Xiang <hsiangkao@aol.com>
> > ---
> [--SNIP--]
> > diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
> > new file mode 100644
> > index 0000000000..dad2498a15
> > --- /dev/null
> > +++ b/fs/erofs/Config.in
> > @@ -0,0 +1,24 @@
> > +config BR2_TARGET_ROOTFS_EROFS
> > +	bool "erofs root filesystem"
> > +	select BR2_PACKAGE_HOST_EROFS_UTILS
> > +	help
> > +	  Build a EROFS root filesystem. If you enable this option,
> > +	  you probably want to enable the erofs-utils package too.
> 
> Since erofs is a read-only filesystem, and since erofs-utils only
> provide an mkfs tool, I don't see how erofs-utils would be useful on the
> target. So I've dropped that part from the help text.

Currently I agree with you. So that's fine. :)

> 
> > +if BR2_TARGET_ROOTFS_EROFS
> > +
> > +choice
> > +	prompt "Compression algorithm"
> > +	default BR2_TARGET_ROOTFS_EROFS_LZ4HC
> > +	help
> > +	  Select the primary compression algorithm to use when
> > +	  generating EROFS filesystem image.
> > +
> > +config BR2_TARGET_ROOTFS_EROFS_NONE
> > +	bool "none"
> > +
> > +config BR2_TARGET_ROOTFS_EROFS_LZ4HC
> > +	bool "lz4hc"
> 
> Do you envision adding other compression schemes? As far as I can see,
> the erofs-utils as well as the linux driver only ever supports lz4 (and
> I think you are well aware of that ;-) ).

I have been still working on support LZMA algorithm (a lot of work to
achieve LZMA fixed-sized output compression) in my spare time.

> 
> I know the other filesystems (squashfs, jffs2...) have a choice about
> the compression method, but for those ther are two or more such
> possibilities, so it makes sense they have a choice. For erofs, not so
> much.
> 
> As such, I have dropped the choice altogether, and just kept the single
> boolean to enable compression.

Currently, I'm fine with that as well. After LZMA algorithm is ready
upstream, I could submit another patch then.

> 
> Applied to master with the above changes. Thanks!

Thank you very much!

Thanks,
Gao Xiang

> 
> Regards,
> Yann E. MORIN.
> 
