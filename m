From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 23:17:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/fakedate: Skip other fakedates
 in PATH
In-Reply-To: <E260DE97-5F54-42B7-96EB-80FFABAD9775@cerebras.net>
References: <E260DE97-5F54-42B7-96EB-80FFABAD9775@cerebras.net>
Message-ID: <20200420211724.GM5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2020-04-20 18:56 +0000, Mark Huang spake thusly:
> If multiple buildroot SDKs are in PATH before /usr/bin (usually accidentally,
> but there may be some valid use cases for this), the first two copies of
> fakedate will go into a loop calling each other without ever finding
> /usr/bin/date. Grep for SOURCE_DATE_EPOCH in the candidate date binary, for
> additional verification that it's not another copy of fakedate.
> 
> Signed-off-by: Mark Huang <mark.huang@cerebras.net>
> ---
>  package/fakedate/fakedate | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
> index a64d9b9..7b04568 100755
> --- a/package/fakedate/fakedate
> +++ b/package/fakedate/fakedate
> @@ -23,7 +23,7 @@ DATE_BIN=false
>  # Instead, find path of true `date' binary.
>  for P in `echo $PATH | tr ':' ' '`; do
>      if [ -x "$P/date" ]; then
> -        if ! [ "$P/date" -ef "$0" ]; then
> +        if ! [ "$P/date" -ef "$0" ] && ! grep -q SOURCE_DATE_EPOCH "$P/date" ; then

Thanks for this patch. I don't think this to be reliable enough, though.

Instead, what you want is iterate over PATH until you find ${0}, and
then take the next 'date' that matches, something like (to be tested!):

    # Find the 'date' executable that comes *after* us in PATH, to avoid
    # inifinite recursion:
    found_self=false
    for P in `echo $PATH | tr ':' ' '`; do
        if [ -x "$P/date"]; then
            ${found_self} && { DATE_BIN="$P/date"; break; }
            [ "$P/date" -ef "$0" ] && found_self=true
        fi
    done

Can you lok into tht, and respin, please? In the meantime, I've marked
the patch as chagnes requested in patchwork.

Regards,
Yann E. MORIN.

>              DATE_BIN="$P/date"
>              break;
>          fi
> --
> 1.8.3.1
> 
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
