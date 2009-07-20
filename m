From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 20 Jul 2009 14:22:27 +0200
Subject: [Buildroot] [PATCH 1/2] target/ubifs: fix compilation
In-Reply-To: <87fxcsg41p.fsf@macbook.be.48ers.dk>
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<87fxcsg41p.fsf@macbook.be.48ers.dk>
Message-ID: <20090720122227.GW13236@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 19, 2009 at 04:06:58PM +0200, Peter Korsgaard wrote:
>  Daniel> Signed-off-by: Daniel Mack <daniel@caiaq.de>
>  Daniel> ---
>  Daniel>  target/ubifs/ubifsroot.mk |   21 +++++++++++----------
> 
> 
> We'll also need to remove the 'depends on BROKEN' from Config.in

Ok, done.

>  Daniel>  1 files changed, 11 insertions(+), 10 deletions(-)
> 
>  Daniel> diff --git a/target/ubifs/ubifsroot.mk b/target/ubifs/ubifsroot.mk
>  Daniel> index 1707e46..d14bde1 100644
>  Daniel> --- a/target/ubifs/ubifsroot.mk
>  Daniel> +++ b/target/ubifs/ubifsroot.mk
>  Daniel> @@ -5,12 +5,13 @@
>  Daniel>  #############################################################
>  Daniel>  #MKFS_UBIFS_VERSION=2582f128dad78591bc3adcc87c343c690bb82e61
>  Daniel>  #MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=$(MKFS_UBIFS_VERSION);sf=tgz
>  Daniel> -MKFS_UBIFS_VERSION=v0.4
>  Daniel> -MKFS_UBIFS_URL=http://git.infradead.org/users/dedekind/mkfs.ubifs.git?a=snapshot;h=refs/tags/mkfs.ubifs-$(MKFS_UBIFS_VERSION);sf=tgz
>  Daniel> -MKFS_UBIFS_SOURCE:=mkfs.ubifs-$(MKFS_UBIFS_VERSION).tar.gz
>  Daniel> -MKFS_UBIFS_DIR:= $(BUILD_DIR)/mkfs-ubifs-$(MKFS_UBIFS_VERSION)
>  Daniel> -MKFS_UBIFS_CAT:=$(ZCAT)
>  Daniel> -MKFS_UBIFS_NAME:=mkfs.ubifs
>  Daniel> +MKFS_UBIFS_VERSION=HEAD
>  Daniel> +MKFS_UBIFS_URL=http://git.infradead.org/mtd-utils.git?a=snapshot\;h=$(MKFS_UBIFS_VERSION)\;sf=tgz
> 
> 
> Why the backslashes? Wget here adds them to the URL:
> 
> --2009-07-19 15:54:50--
>   http://git.infradead.org/mtd-utils.git?a=snapshot%5C;h=HEAD%5C;sf=tgz
> 
> Which obviously fails.

Argh. Done, thanks.

>  Daniel> +MKFS_UBIFS_SOURCE=mtd-utils-$(MKFS_UBIFS_VERSION).tar.gz
>  Daniel> +MKFS_UBIFS_DIR=$(BUILD_DIR)/mkfs-utils-ubifs
>  Daniel> +MKFS_UBIFS_CAT=$(ZCAT)
>  Daniel> +MKFS_UBIFS_NAME=mtd-utils
>  Daniel> +MKFS_UBIFS_BINARY=$(MKFS_UBIFS_DIR)/mkfs.ubifs/mkfs.ubifs
>  
>  Daniel>  $(DL_DIR)/$(MKFS_UBIFS_SOURCE):
>  Daniel>  	$(WGET) -O $(DL_DIR)/$(MKFS_UBIFS_SOURCE) "$(MKFS_UBIFS_URL)"
>  Daniel> @@ -21,14 +22,14 @@ $(MKFS_UBIFS_DIR)/.unpacked: $(DL_DIR)/$(MKFS_UBIFS_SOURCE)
>  Daniel>  	toolchain/patch-kernel.sh $(MKFS_UBIFS_DIR) target/ubifs/ mkfs-ubifs-\*.patch
>  Daniel>  	touch $@
>  
>  Daniel> -$(MKFS_UBIFS_DIR)/mkfs.ubifs: $(MKFS_UBIFS_DIR)/.unpacked
>  Daniel> -	$(MAKE) -C $(MKFS_UBIFS_DIR)
>  Daniel> +$(MKFS_UBIFS_BINARY): $(MKFS_UBIFS_DIR)/.unpacked
>  Daniel> +	$(MAKE) -j1 -C $(MKFS_UBIFS_DIR) BUILDDIR=$(MKFS_UBIFS_DIR) WITHOUT_XATTR=1
> 
> 
> We have MAKE1 for this.

Fixed.

> The build breaks if you don't have liblzo development headers on the
> build host:
> 
> gcc -I./include   -DWITHOUT_XATTR -D_FILE_OFFSET_BITS=64 -O2 -g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -c -o /tmp/br/i686/build_i686/mkfs-utils-ubifs/compr_lzo.o compr_lzo.c -g -Wp,-MD,/tmp/br/i686/build_i686/mkfs-utils-ubifs/.compr_lzo.c.dep
> compr_lzo.c:29:23: error: lzo/lzo1x.h: No such file or directory
> compr_lzo.c: In function ?jffs2_lzo_cmpr?:
> compr_lzo.c:51: error: ?lzo_uint? undeclared (first use in this function)
> compr_lzo.c:51: error: (Each undeclared identifier is reported only once
> compr_lzo.c:51: error: for each function it appears in.)

Hmm. What's your propose to check that? We can't depend on a config flag
to be set, and building that liblzo-dev package manually doesn't seem to
be the right ay to go either.

> I really think the proper solution is to build the ubifs tools for the
> host in the mtd-utils package like we do for mkfs.jffs2. Now, if the
> mtd guys would put out a 1.3 release with all the new stuff it would
> be even better.

Which wouldn't solve the above problem, right? When there's a new
release, I'll have another look at it :)

> Care to fix this and resend?

See the patch below.

Thanks,
Daniel
