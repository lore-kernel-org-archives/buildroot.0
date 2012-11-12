From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 12 Nov 2012 09:27:58 +0100
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to
	<pkg>-extract
In-Reply-To: <1350225704-5693-1-git-send-email-arnout@mind.be>
References: <1350225704-5693-1-git-send-email-arnout@mind.be>
Message-ID: <50A0B30E.3090308@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 14.10.2012 16:41, schrieb Arnout Vandecappelle (Essensium/Mind):
> The legal-info target (and possibly others as well) depends on
> <pkg>-extract to make sure the license file is available.  However,
> when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
> doesn't exist.
>
> To solve this, we just call the target that rsyncs the source
> <pkg>-extract.
>
> While we're at it, also add a <pkg>-patch target (which is equivalent
> to <pkg>-extract).  That avoids the same problem in the future if
> something starts depending on <pkg>-patch.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> ---
>  package/pkg-generic.mk |    6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ffe7dfb..c2c1b06 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -378,9 +378,11 @@ else
>  $(1)-configure:		$(1)-depends \
>  			$$($(2)_TARGET_CONFIGURE)
>  
> -$(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
> +$(1)-depends:		$(1)-extract $$($(2)_DEPENDENCIES)
>  
> -$(1)-rsync:		$$($(2)_TARGET_RSYNC)
> +$(1)-patch:		$(1)-extract
> +
> +$(1)-extract:		$$($(2)_TARGET_RSYNC)
>  
>  $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>  endif
Hello,

this does not fix my issue, not even after doing a "make clean".

> LANG=C make legal-info
> mkdir -p /home/stephan/Dokumente/BeagleBone/buildroot/output/target
> if ! [ -d
> "/home/stephan/Dokumente/BeagleBone/buildroot/output/target/bin" ]; then \
>                 if [ -d
> "/home/stephan/Dokumente/BeagleBone/buildroot/fs/skeleton" ]; then \
>                         cp -fa
> /home/stephan/Dokumente/BeagleBone/buildroot/fs/skeleton/*
> /home/stephan/Dokumente/BeagleBone/buildroot/output/target/; \
>                 fi; \
>         fi
> find /home/stephan/Dokumente/BeagleBone/buildroot/output/target -type
> d -name CVS -print0 -o -name .svn -print0 | xargs -0 rm -rf
> find /home/stephan/Dokumente/BeagleBone/buildroot/output/target -type
> f \( -name .empty -o -name '*~' \) -print0 | xargs -0 rm -rf
> touch /home/stephan/Dokumente/BeagleBone/buildroot/output/build/.root
> >>>   Collecting legal info
<snip>
> >>> linux custom Syncing from source dir
> /home/stephan/Dokumente/BeagleBone/kernel/kernel
> rsync -au /home/stephan/Dokumente/BeagleBone/kernel/kernel/
> /home/stephan/Dokumente/BeagleBone/buildroot/output/build/linux-custom
> cp: cannot stat `/home/stephan/Dokumente/dl/linux-custom.tar.gz': No
> such file or directory
> make: *** [linux-legal-info] Error 1

Regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121112/c4961bf1/attachment.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: local.mk
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121112/c4961bf1/attachment-0001.ksh>
