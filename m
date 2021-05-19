From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 10:46:28 +0200
Subject: [Buildroot] [PATCH v2] support/dependencies,
 scripts: accept patches with renames
In-Reply-To: <20210519083405.326909-1-pojiro.jp@gmail.com>
References: <20210519083405.326909-1-pojiro.jp@gmail.com>
Message-ID: <20210519084628.GK2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryota, All,

On 2021-05-19 17:34 +0900, pojiro.jp at gmail.com spake thusly:
> From: Ryota Kinukawa <pojiro.jp@gmail.com>
> 
> Currently, patches with renames are refused, as they reqire patch >= 2.7.
> So far, we did not require that version because it was too recent to be widely available.
> 
> But patch 2.7 has been released in 2012, almost 9 years ago now;
> it is old enough that we can start relying on it.
> 
> Add a check that patch is 2.7 or newer, and drop the check about
> renames in apply-patches.sh.
> 
> Signed-off-by: Ryota Kinukawa <pojiro.jp@gmail.com>

Thanks for the respin! However, there must have been a misunderstanding
:I already applied your previous patch with the few tweaks I pointed
out. See the git tree:

    https://git.buildroot.org/buildroot/commit/?h=next&id=f46e13f05fa04a180a416876cf1dd4252dd841ad

Thanks again for following up on this! :-)

Regards,
Yann E. MORIN.

> ---
>  support/dependencies/dependencies.sh | 16 ++++++++++++----
>  support/scripts/apply-patches.sh     |  5 -----
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 1954f038be..91e7cd60f9 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -163,7 +163,7 @@ fi
>  
>  # Check that a few mandatory programs are installed
>  missing_progs="no"
> -for prog in patch perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
> +for prog in perl tar wget cpio unzip rsync bc ${DL_TOOLS} ; do
>  	if ! which $prog > /dev/null ; then
>  		echo "You must install '$prog' on your build machine";
>  		missing_progs="yes"
> @@ -183,11 +183,19 @@ if test "${missing_progs}" = "yes" ; then
>  	exit 1
>  fi
>  
> -# apply-patches.sh needs patch with --no-backup-if-mismatch support (GNU, busybox w/DESKTOP)
> -if ! patch --no-backup-if-mismatch </dev/null 2>/dev/null; then
> -	echo "Your patch program does not support the --no-backup-if-mismatch option. Install GNU patch"
> +PATCH_VERSION="$(patch -v 2> /dev/null | sed -n 's/^GNU patch \(.*\)/\1/p')"
> +if [ -z "${PATCH_VERSION}" ] ; then
> +	echo
> +	echo "You must install GNU patch"
>  	exit 1
>  fi
> +PATCH_MAJOR="$(echo "${PATCH_VERSION}" | cut -d . -f 1)"
> +PATCH_MINOR="$(echo "${PATCH_VERSION}" | cut -d . -f 2)"
> +if [ "${PATCH_MAJOR}" -lt 2 ] || [ "${PATCH_MAJOR}" -eq 2 -a "${PATCH_MINOR}" -lt 7 ] ; then
> +	echo
> +	echo "You have GNU patch "${PATCH_VERSION}" installed. GNU patch >=2.7 is required"
> +	exit 1;
> +fi
>  
>  if grep ^BR2_NEEDS_HOST_UTF8_LOCALE=y $BR2_CONFIG > /dev/null; then
>  	if ! which locale > /dev/null ; then
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 9fb488c570..e5a2fdd09e 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -113,11 +113,6 @@ function apply_patch {
>          echo "  to be applied  : ${path}/${patch}"
>          exit 1
>      fi
> -    if ${uncomp} "${path}/$patch" | grep -q "^rename from" && \
> -       ${uncomp} "${path}/$patch" | grep -q "^rename to" ; then
> -        echo "Error: patch contains some renames, not supported by old patch versions"
> -        exit 1
> -    fi
>      echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
>      ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
>      if [ $? != 0 ] ; then
> -- 
> 2.25.1
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
