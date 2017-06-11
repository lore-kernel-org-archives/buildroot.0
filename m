From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Jun 2017 15:52:06 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/mkusers: allow
 /etc/shadow to be symlinked
In-Reply-To: <20170608152622.30019-1-mail@jens-maus.de>
References: <20170608152622.30019-1-mail@jens-maus.de>
Message-ID: <20170611135206.GB3480@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens, All,

On 2017-06-08 17:26 +0200, Jens Maus spake thusly:
> This commit fixes a problem where it was not possible to replace
> /etc/shadow with a symlink to a e.g. a user partition where the
> shadow file is placed. This is required, e.g. for systems where the
> rootfs is mounted read-only but users should still be able to be
> added. Thus, if within an filesystem overlay setup a user tries
> to replace /etc/shadow with a symlink to the real file on a user
> partition a buildroot build stops with an error message because
> sed is called on the symlink instead of following the symlink.
> This commit fixes this shortcoming.
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  support/scripts/mkusers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index 2ac76f986..e83aff6e0 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -303,7 +303,7 @@ add_one_user() {
>  
>      # Remove any previous instance of this user
>      for _f in "${PASSWD}" "${SHADOW}"; do
> -        sed -r -i -e '/^'"${username}"':.*/d;' "${_f}"
> +        sed -r -i --follow-symlinks -e '/^'"${username}"':.*/d;' "${_f}"

By the way, you missed a few occurences:
  - line 222
  - line 227
  - line 266

Care to fix those as well and respin, please?

Regards,
Yann E. MORIN.

>      done
>  
>      _gid="$( get_gid "${group}" )"
> -- 
> 2.11.0
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
