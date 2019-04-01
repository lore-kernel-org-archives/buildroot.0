From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Apr 2019 23:47:54 +0200
Subject: [Buildroot] [PATCH v2 2/2] pkg-generic: Cleanup some redundant
 checks
In-Reply-To: <20190317212014.3831-2-nolange79@gmail.com>
References: <20190317212014.3831-1-nolange79@gmail.com>
 <20190317212014.3831-2-nolange79@gmail.com>
Message-ID: <263ce073-47e3-67a6-c43e-eb55f16dcaf8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/03/2019 22:20, Norbert Lange wrote:
> With the last change, packages will depend
> only on host-{xz,lzip} if the source archives
> have filenames requesting the corresponding compressor.
> 
> This allows using a single guard.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

 I disagree with Yann and Thomas that this makes it less clear. Except, I don't
think you should have even the single guard...

 Regarding the potential circular dependency that Yann mentioned: yes, that's
true. But conversely, by adding the filter like we have now, you remove a
potentially required dependency. So in the end it's the same thing. And for
circular dependencies we have graph-depends that detects them.

> ---
>  package/pkg-generic.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 89da43d5e5..11f16cab18 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -604,18 +604,15 @@ endif
>  
>  ifeq ($$(filter host-tar host-skeleton host-fakedate,$(1)),)

 This condition is needed because skeleton and fakedate are dependencies of tar,
but host-skeleton and host-fakedate don't actually need tar. However, since
there's nothing that detects that host-skeleton and host-fakedate don't have a
tarball to extract, we have to remove those dependencies by hand.

>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
> -endif
>  
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)

 Here, however, there is an explicit dependency. So the condition on tar,
skeleton, fakedate is not needed.

 Bottom line: I don't think the endif above should be removed.


 Regards,
 Arnout


>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
>  endif
> -endif
>  
> -ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
>  ifeq ($$(suffix $$($(2)_SOURCE)),.lz)
>  $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
>  endif
> +
>  endif
>  
>  ifeq ($$(BR2_CCACHE),y)
> 
