From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2016 16:56:00 +0100
Subject: [Buildroot] [PATCH 1/1] pkg-utils: mask tput failure for
 non-interactive sessions
In-Reply-To: <BLU436-SMTP6377F2EEAE54E32A4A6DDDA0A20@phx.gbl>
References: <BLU436-SMTP6377F2EEAE54E32A4A6DDDA0A20@phx.gbl>
Message-ID: <20160221155600.GC3456@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2016-02-21 10:40 -0500, James Knight spake thusly:
> When invoking a build from a non-interactive session (for example, a
> Jenkins build), there is no terminal session to modify. When preparing
> variables to track the bold and boldoff mode sequences, the `tput`
> command will always fail as there is no terminal to query. The following
> change masks the error message when `tput` fails; leaving the TERM_BOLD
> and TERM_RESET variables empty.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/pkg-utils.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 44bd2c9..12447fc 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -84,8 +84,8 @@ suitable-extractor = $(INFLATE$(suffix $(1)))
>  
>  # MESSAGE Macro -- display a message in bold type
>  MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(call qstrip,$(1))$(TERM_RESET)"
> -TERM_BOLD := $(shell tput smso)
> -TERM_RESET := $(shell tput rmso)
> +TERM_BOLD := $(shell tput smso 2> /dev/null)
> +TERM_RESET := $(shell tput rmso 2> /dev/null)

No space between 2> and /dev/null, please:  2>/dev/null

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  # Utility functions for 'find'
>  # findfileclauses(filelist) => -name 'X' -o -name 'Y'
> -- 
> 1.9.5.msysgit.1
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
