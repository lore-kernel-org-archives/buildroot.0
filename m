From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 00:19:07 +0200
Subject: [Buildroot] [PATCH 1/1] replace invocation of tempfile w/
 mktemp in try-run
In-Reply-To: <20180629214012.26644-1-joseph.kogut@gmail.com>
References: <20180629214012.26644-1-joseph.kogut@gmail.com>
Message-ID: <20180629221907.GA1969@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joseph, All,

On 2018-06-29 14:40 -0700, Joseph Kogut spake thusly:
> mktemp is included in GNU Coreutils, and its usage is preferred over
> tempfile.
> 
> http://lists.gnu.org/archive/html/bug-coreutils/2007-10/msg00134.html
> 
> Additionally, some distributions no longer package tempfile, and
> this patch fixes try-run in that case.

See also cmmit 91a08ecc998 (package/Makefile.in: add host-cc-option
macro) which introduced that initial code, explcitly to add -no-pie when
needed.

> Fixes:
> http://autobuild.buildroot.net/results/db5/db50f4415d18441f94b641ef6dc5a3672678b8b9/
> http://autobuild.buildroot.net/results/76d/76d73f767d3aab3c97d61188f5666899d72ed82d/
> http://autobuild.buildroot.net/results/6aa/6aa9031962603354086b49bc49add92fde496ec2/
> http://autobuild.buildroot.net/results/33d/33d22f4d96fb439be8551355290896ef6d3649df/
> http://autobuild.buildroot.net/results/eee/eeec2ed80e147c172ec2d50958b12cfa38b2cc8d/
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a268016cdf..f2962767cc 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -239,7 +239,7 @@ HOST_LDFLAGS  += -L$(HOST_DIR)/lib -Wl,-rpath,$(HOST_DIR)/lib
>  # Exit code chooses option. "$$TMP" is can be used as temporary file and
>  # is automatically cleaned up.
>  try-run = $(shell set -e;               \
> -	TMP="$$(tempfile)";             \
> +	TMP="$$(mktemp)";               \
>  	if ($(1)) >/dev/null 2>&1;      \
>  	then echo "$(2)";               \
>  	else echo "$(3)";               \
> -- 
> 2.18.0
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
