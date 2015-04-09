From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 Apr 2015 00:12:29 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-generic: support patching local
 source code
In-Reply-To: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
References: <1428539284-5957-1-git-send-email-nic.dade@mistsys.com>
Message-ID: <20150409221228.GC4192@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2015-04-08 17:28 -0700, Nicolas S. Dade spake thusly:
> Signed-off-by: Nicolas S. Dade <nic.dade@mistsys.com>

Thanks for your patch!

However, we're explicitly not allowing patching local sources, on
purpose.

The use-case for using local sources is to allow people to use a
development version of the package, one they are hacking on. Thus, we
believe that in most cases, the patches bundled with Buildroot would
most certainly fail to apply on local sources.

So, we think that, if those patches are still needed, the developper
will have to carry them in its local sources.

Also, your commit log is not explaining the issue you are facing, so it
is hard to udnerstand why you would need bundled patches to be applied,
and the use-case that would cover.

I'm leaving this open for now, for others to speak up, but I'd be
tempted to say "no" for the aforementioned reasons.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f77aab2..09f2405 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -555,15 +555,18 @@ else
>  # In the package override case, the sequence of steps
>  #  source, by rsyncing
>  #  depends
> +#  patch
>  #  configure
>  
>  # Use an order-only dependency so the "<pkg>-clean-for-rebuild" rule
>  # can remove the stamp file without triggering the configure step.
> -$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
> +$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_PATCH)
>  
>  $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
>  
> -$(1)-patch:		$(1)-rsync
> +$(1)-patch:		$$($(2)_TARGET_PATCH)
> +$$($(2)_TARGET_PATCH):	$$($(2)_TARGET_RSYNC)
> +
>  $(1)-extract:		$(1)-rsync
>  
>  $(1)-rsync:		$$($(2)_TARGET_RSYNC)
> -- 
> 1.9.1
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
