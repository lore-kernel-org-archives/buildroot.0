From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2018 17:33:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: Fix
 show-build-order stdout pollution
In-Reply-To: <20181115154542.29277-1-serj.kalichev@gmail.com>
References: <20181115154542.29277-1-serj.kalichev@gmail.com>
Message-ID: <20181115163336.GI10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serj, All,

On 2018-11-15 18:45 +0300, Serj Kalichev spake thusly:
> The commands like  "make show-build-order" or "make <package>-show-build-order" show
> the build order and then print "make[1]: Nothing to be done for 'show-build-order'" to
> stdout. It pollutes output. Technically this message is true but it's not true for user
> because he gets an information.
> 
> The <package>-show-build-order targets use $(info) for package name printing.
> The make utility doesn't consider the internal directive as a command so it
> think that it's "Nothing to be done". The patch adds the empty command to
> <package>-show-build-order to inform make utility that taget makes some real
> actions.
> 
> Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
> ---
>  package/pkg-generic.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f34f46afc8..74f3c55394 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -819,6 +819,7 @@ $(1)-show-recursive-rdepends:
>  
>  $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPENDENCIES))
>  	$$(info $(1))
> +	@:

The other places where we use that construct, we put the command first,
and the info last, for example:
    https://git.buildroot.org/buildroot/tree/Makefile#n1001

With that fixed (which a maintainer may do when applying, no need to
resend), or even as-is (if the maintainers prefer this way):

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  $(1)-graph-depends: graph-depends-requirements
>  	$(call pkg-graph-depends,$(1),--direct)
> -- 
> 2.17.1
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
