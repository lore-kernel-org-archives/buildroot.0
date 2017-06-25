From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jun 2017 10:42:37 +0200
Subject: [Buildroot] [PATCH v2] support/scripts/apply-patches.sh: do not
 apply patches with renames
In-Reply-To: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
References: <20170624195936.31528-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170625084237.GA3673@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-06-24 21:59 +0200, Thomas Petazzoni spake thusly:
> Patches with renames apply properly with patch >= 2.7, but not with
> older patch versions. Since "git format-patch" by default generates
> patches with renames, Buildroot developers often don't realize that
> their patches will not apply properly on build machines that have
> patch < 2.7. In order to prevent such a situation from happening
> again, this commit adds some logic in apply-patches.sh to refuse
> applying patches that contain renames.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

A small nit below...

> ---
> Changes since v1:
>  - Use "&&" for the "grep -q && grep -q" condition, as noticed by Yann
>    E. Morin.
> ---
>  support/scripts/apply-patches.sh | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> index 7ccb39d..0c24175 100755
> --- a/support/scripts/apply-patches.sh
> +++ b/support/scripts/apply-patches.sh
> @@ -113,6 +113,11 @@ function apply_patch {
>          echo "  to be applied  : ${path}/${patch}"
>          exit 1
>      fi
> +    if grep -q "^rename from" ${path}/${patch} && \
> +       grep -q "^rename to" ${path}/${patch} ; then
> +	echo "Error: patch contains some renames, not supported by old patch versions"
> +	exit 1

This file a space-leading, but here you have a tab...

Otherwise:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +    fi
>      echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
>      ${uncomp} "${path}/$patch" | patch -g0 -p1 -E -d "${builddir}" -t -N $silent
>      if [ $? != 0 ] ; then
> -- 
> 2.9.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
