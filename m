From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 7 Jan 2013 23:10:37 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
	pointing to our .config
In-Reply-To: <fd01d05b62a384b43722e790e3e491f87c818797.1357595083.git.yann.morin.1998@free.fr>
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <fd01d05b62a384b43722e790e3e491f87c818797.1357595083.git.yann.morin.1998@free.fr>
Message-ID: <201301072310.37077.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

On Monday 07 January 2013 Yann E. MORIN wrote:
> Support scripts (in support/) may need to parse the .config file,
> so give them an easy access to it, by exporting CONFIG_FILE with
> the fully-qualified path to .config.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4b09437..7a2902d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -91,6 +91,10 @@ EXTRAMAKEARGS = O=$(O)
>  NEED_WRAPPER=y
>  endif
>  
> +# Scripts in support/ may need to parse out .config, so give
> +# them easy access
> +export BR2_CONFIG_FILE=$(CONFIG_DIR)/.config
> +
>  # Pull in the user's configuration file
>  ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
>  -include $(CONFIG_DIR)/.config

There are a few other places in this file where we use:
    $(CONFIG_DIR)/.config

I was not sure how to handle these, especially since they are associated
with:
    $(CONFIG_DIR)/.config.nopkg

Using $(BR2_CONFIG_FILE).nopkg looks a bit ugly to me. Instead, I went to
reason that we're in the top-level Makefile, and that we know what we're
doing. BR2_CONFIG_FILE is our /API/ and although it would be nice to use
it internally too, it does not fit properly, so I did not change it.

Comments welcome. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
