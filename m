From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 May 2015 00:15:22 +0200
Subject: [Buildroot] [PATCH 1/1] scripts/mkusers: allow users with no
 password value set
In-Reply-To: <1432308977-1284-1-git-send-email-james.knight@rockwellcollins.com>
References: <1432308977-1284-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <20150522221522.GD5153@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2015-05-22 11:36 -0400, James Knight spake thusly:
> The following allows a user definition to specify that a created user
> entry should not have a password value set. Original implementation
> allowed a user definition to provide a password value of "-" (no quotes)
> to generate a crypt-encoded empty string value. In some cases, it may be
> desired to have no value specified for a user's password. By using a
> value "-" for a password, no value will be set in the shadow value.

I fail to see how that is different from using an empty password as
(without quotes): "="

From man 5 passwd:

    The encrypted password field may be blank, in which case no password
    is required to authenticate as the specified login name. However,
    some applications which read the /etc/passwd file may decide not to
    permit any access at all if the password field is blank.

Thus, I believe it is safest to store an encoded empty password rather
than set the password field empty.

Did I miss something?

Of course, the manual could be updated to reflect that a password-less
account should use "=" in the password field.

Regards,
Yann E. MORIN.

> Signed-off-by: James Knight <james.knight@rockwellcollins.com>
> ---
>  docs/manual/makeusers-syntax.txt | 3 ++-
>  support/scripts/mkusers          | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
> index ffdb961..467e596 100644
> --- a/docs/manual/makeusers-syntax.txt
> +++ b/docs/manual/makeusers-syntax.txt
> @@ -31,7 +31,8 @@ Where:
>    then login is disabled. If prefixed with +=+, then it is interpreted
>    as clear-text, and will be crypt-encoded (using MD5). If prefixed with
>    +!=+, then the password will be crypt-encoded (using MD5) and login
> -  will be disabled. If set to +*+, then login is not allowed.
> +  will be disabled. If set to +*+, then login is not allowed. If set to 
> +  +-+, then no password value will be set.
>  - +home+ is the desired home directory for the user. If set to '-', no
>    home directory will be created, and the user's home will be +/+.
>    Explicitly setting +home+ to +/+ is not allowed.
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index 026519e..9c5c4dc 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -318,6 +318,9 @@ add_one_user() {
>          *)  fail "home must be an absolute path\n";;
>      esac
>      case "${passwd}" in
> +        -)
> +            _passwd=""
> +            ;;
>          !=*)
>              _passwd='!'"$( encode_password "${passwd#!=}" )"
>              ;;
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
