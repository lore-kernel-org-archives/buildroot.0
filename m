From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:36:19 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <20210601143422.25064-3-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
Message-ID: <20210601203619.GD168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-01 16:34 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
> it is set, then the assert statement is compiled away.
> 
> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
> default case).
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

However, see a little nit, below...

> ---
> v4: reintroduced patch on suggestion of Arnout. I had previously dropped it from
> the series based on an incorrect conclusion.
> 
> 
>  package/Makefile.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 86db62ba5b..955e6a8e8c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -148,6 +148,9 @@ endif
>  ifeq ($(BR2_DEBUG_3),y)
>  TARGET_DEBUGGING = -g3

Here, we have a simple assignment in a conditional block, while...

>  endif
> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
> +TARGET_DEBUGGING += -DNDEBUG

... here we have an append-assignment in a conditional.

In this case the order ensures it works, but this is inconsistent and
prone to errors should we need to expand TARGET_DEBUGGING futher...

Regards,
Yann E. MORIN.

> +endif
>  
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>  
> -- 
> 2.26.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
