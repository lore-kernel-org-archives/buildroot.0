From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Oct 2012 20:01:39 +0200
Subject: [Buildroot] [PATCH] pkg-infra: rename <pkg>-rsync to
 <pkg>-extract
In-Reply-To: <1350225704-5693-1-git-send-email-arnout@mind.be>
References: <50768116.4000506@relinux.de>
 <1350225704-5693-1-git-send-email-arnout@mind.be>
Message-ID: <20121014200139.525802ad@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, 14 Oct 2012 16:41:44 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
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

I think I would prefer to keep the 1:1 mapping between virtual target
name and real target name, and only have aliases when it makes sense.
I.e:

$(1)-rsync:	$$($(2)_TARGET_RSYNC)

# Possibly some comment here to explain what's going on
$(1)-extract:	$(1)-rsync
$(1)-patch:	$(1)-rsync

Otherwise, I'm fine with fixing this problem using this approach, looks
good to me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
