From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Jun 2017 21:27:17 +0200
Subject: [Buildroot] [PATCH v2] support/scripts: allow /etc/shadow to be
 symlinked
In-Reply-To: <20170612133554.24995-1-mail@jens-maus.de>
References: <20170608152622.30019-1-mail@jens-maus.de>
 <20170612133554.24995-1-mail@jens-maus.de>
Message-ID: <20170617192717.GA17548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jens, All,

On 2017-06-12 15:35 +0200, Jens Maus spake thusly:
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

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - extended follow-symlinks use (requested by Yann)
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  support/scripts/mkusers | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index 2ac76f986..5bbec3e10 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -219,12 +219,12 @@ add_one_group() {
>      fi
>  
>      # Remove any previous instance of this group, and re-add the new one
> -    sed -i -e '/^'"${group}"':.*/d;' "${GROUP}"
> +    sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GROUP}"
>      printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
>  
>      # Ditto for /etc/gshadow if it exists
>      if [ -f "${GSHADOW}" ]; then
> -        sed -i -e '/^'"${group}"':.*/d;' "${GSHADOW}"
> +        sed -i --follow-symlinks -e '/^'"${group}"':.*/d;' "${GSHADOW}"
>          printf "%s:*::\n" "${group}" >>"${GSHADOW}"
>      fi
>  }
> @@ -263,7 +263,8 @@ add_user_to_group() {
>  
>      for _f in "${GROUP}" "${GSHADOW}"; do
>          [ -f "${_f}" ] || continue
> -        sed -r -i -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
> +        sed -r -i --follow-symlinks \
> +                  -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
>                    -e 's/^('"${group}"':.*)$/\1,'"${username}"'/;'                           \
>                    -e 's/,+/,/'                                                              \
>                    -e 's/:,/:/'                                                              \
> @@ -303,7 +304,7 @@ add_one_user() {
>  
>      # Remove any previous instance of this user
>      for _f in "${PASSWD}" "${SHADOW}"; do
> -        sed -r -i -e '/^'"${username}"':.*/d;' "${_f}"
> +        sed -r -i --follow-symlinks -e '/^'"${username}"':.*/d;' "${_f}"
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
