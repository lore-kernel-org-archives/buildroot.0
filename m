From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 23:44:10 +0200
Subject: [Buildroot] [PATCH 10/35] pkg-generic: implement a
 <pkg>-external-deps target
In-Reply-To: <1427650429-9293-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329214410.GK4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> This commit implements a new <pkg>-external-deps target in the
> pkg-generic package infrastructure. This target simply displays the
> list of file names that are needed for <pkg> to build (source tarball,
> patches, extra downloads).
> 
> In the case of the usage of <pkg>_OVERRIDE_SRCDIR, the path to the
> overriden source directory is displayed, prepended by file://. This
> matches what the code is currently doing in .stamp_rsync_sourced.
> 
> This new target is not currently being used in this commit, but
> followup commits will make use of it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 22b3fb9..08e4cad 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -546,6 +546,11 @@ $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
>  $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
>  
>  $(1)-source:		$$($(2)_TARGET_SOURCE)
> +
> +$(1)-external-deps:
> +	@for p in $$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS) ; do \
> +		echo `basename $$$$p` ; \
> +	done
>  else
>  # In the package override case, the sequence of steps
>  #  source, by rsyncing
> @@ -564,6 +569,9 @@ $(1)-extract:		$(1)-rsync
>  $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  
>  $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
> +
> +$(1)-external-deps:
> +	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
>  endif
>  
>  $(1)-show-version:
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
