From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 10:04:51 +0200
Subject: [Buildroot] [PATCH 1/3] support/download/cvs: add support to
 use a date instead of a tag
In-Reply-To: <1429376067-9228-2-git-send-email-fabio.porcedda@gmail.com>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
 <1429376067-9228-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150419080451.GA4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-04-18 18:54 +0200, Fabio Porcedda spake thusly:
> This is useful when a tag is not avaiable.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Although I'm not a big fan of the [[...]] bashism, that's OK since it
makes things so much simpler.

Regards,
Yann E. MORIN.

> ---
>  support/download/cvs | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/support/download/cvs b/support/download/cvs
> index 2c3a666..6491cc8 100755
> --- a/support/download/cvs
> +++ b/support/download/cvs
> @@ -26,7 +26,15 @@ rev="${3}"
>  rawname="${4}"
>  basename="${5}"
>  
> +if [[ ${rev} =~ ^[0-9] ]]; then
> +    # Date, because a tag cannot begin with a number
> +    select="-D ${rev}"
> +else
> +    # Tag
> +    select=-"r :${rev}"
> +fi
> +
>  ${CVS} ${verbose} -z3 -d":pserver:anonymous@${repo}" \
> -       co -d "${basename}" -r ":${rev}" -P "${rawname}"
> +       co -d "${basename}" ${select} -P "${rawname}"
>  
>  tar czf "${output}" "${basename}"
> -- 
> 2.3.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
