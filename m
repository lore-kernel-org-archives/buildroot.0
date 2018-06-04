From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jun 2018 17:56:45 +0200
Subject: [Buildroot] [PATCH 2/2] dl-wrapper: Fix support for URIs
 containing '+'
In-Reply-To: <1528119150-28659-2-git-send-email-bbeckett@netvu.org.uk>
References: <1528119150-28659-1-git-send-email-bbeckett@netvu.org.uk>
 <1528119150-28659-2-git-send-email-bbeckett@netvu.org.uk>
Message-ID: <20180604155645.GB3700@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2018-06-04 14:32 +0100, Robert Beckett spake thusly:
> '+' is a valid character in a url. The current dl-wrapper gets the
> URI scheme by dropping everything after the last '+' character, with
> the intension of finding 'git' from e.g. 'git+https://uri'.
> 
> If a uri has a '+' anywhere in it, it ends up using too much of the
> string as a scheme, and fails to match the handler properly.
> 
> An example of where this form of URI is used is when using deploy tokens
> in gitlab. It uses a form like https://<username>:<password>@gitlab.com/<group>/<repo.git>
> where username for deploy token is of the form 'gitlab+deploy-token-<number>'.
> 
> Use the %% operator to search backwards until the last '+' character when
> dropping the rest of the string as we know that the first '+'
> in the string should be the scheme.
> 
> Signed-off-by: Robert Beckett <bbeckett@netvu.org.uk>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index 8d6365e..4059c37 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -88,7 +88,7 @@ main() {
>      download_and_check=0
>      rc=1
>      for uri in "${uris[@]}"; do
> -        backend=${uri%+*}
> +        backend=${uri%%+*}
>          case "${backend}" in
>              git|svn|cvs|bzr|file|scp|hg) ;;
>              *) backend="wget" ;;
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
