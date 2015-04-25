From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 19:33:03 +0200
Subject: [Buildroot] [PATCHv3 09/18] pkg-generic: remove the
 .stamp_rsync_sourced fake stamp file
In-Reply-To: <1429972982-25495-10-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-10-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425173303.GJ4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> The only reason for the .stamp_rsync_sourced fake stamp file target to
> exist was to handle the SOURCE_CHECK operation on packages using the
> OVERRIDE_SRCDIR mechanism. Now that this is handled directly inside
> $(1)-source-check, there is no longer any need for this part of the
> code.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/pkg-generic.mk | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 5a9bcf1..05831d4 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
[--SNIP--]
> @@ -570,7 +561,7 @@ $(1)-extract:		$(1)-rsync
>  
>  $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>  
> -$(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
> +$(1)-source:

The reason that line existed was to be able to define a dependency on
the stamp file. There is now no reason to keep this line at all; all you
have above is declaring a make goal without dependency or rule, so it
is entirely useless.

Just get rid of the line altogether.

Regards,
Yann E. MORIN.

>  $(1)-external-deps:
>  	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
> @@ -652,8 +643,6 @@ $$($(2)_TARGET_BUILD):			PKG=$(2)
>  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
>  $$($(2)_TARGET_RSYNC):                  SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>  $$($(2)_TARGET_RSYNC):                  PKG=$(2)
> -$$($(2)_TARGET_RSYNC_SOURCE):		SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
> -$$($(2)_TARGET_RSYNC_SOURCE):		PKG=$(2)
>  $$($(2)_TARGET_PATCH):			PKG=$(2)
>  $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
>  $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
