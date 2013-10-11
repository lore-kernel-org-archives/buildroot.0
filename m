From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Oct 2013 23:23:40 +0200
Subject: [Buildroot] [PATCH 1/3] weston: improve selection of compositor
In-Reply-To: <1381525213-14034-1-git-send-email-arnout@mind.be>
References: <1381525213-14034-1-git-send-email-arnout@mind.be>
Message-ID: <20131011212340.GC29458@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-10-11 23:00 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The way the compositor was selected in Config.in was counter-intuitive,
> because the fbdev backend is selected by default even if a different one
> is available.
> 
> Instead, select the fbdev backend only if no other one was selected by
> the user.

Well, that was explictly what I wanted we I did the patch:
  - always have at least one compositor
  - have fbdev enabled by default, even if another one is selected.

But I agree this can be counter-intuitive to some, so I won't bar this
change.

> Also re-ordered the compositor options, putting fbdev last. This is more
> natural when the user wants to select both backends: after selecting the
> RPi backend, the fbdev is automatically unselected but the user can move
> one line down to select it again.

We usually put menu entries in alphabetical order. I understand what
you're trying to achieve here, but I'd prefer we be consistent in the
menu ordering.

> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/weston/Config.in | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 4532c28..fd48fb3 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -14,6 +14,8 @@ config BR2_PACKAGE_WESTON
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
>  	# Runtime dependency
>  	select BR2_PACKAGE_XKEYBOARD_CONFIG
> +	# Make sure at least one compositor is selected.
> +	select BR2_PACKAGE_WESTON_FBDEV if !BR2_PACKAGE_WESTON_HAS_COMPOSITOR

Indeed, BR2_PACKAGE_WESTON_NEEDS_ONE_COMPOSITOR is not needed, since we
can re-use BR2_PACKAGE_WESTON for the same purpose.

Except for the re-ordering, no problem for me.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
