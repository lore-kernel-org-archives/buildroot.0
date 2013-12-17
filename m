From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 17 Dec 2013 13:58:54 +0100
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
	patch dirs
In-Reply-To: <1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 17, 2013 at 10:00 AM, Ryan Barnett
<rjbarnet@rockwellcollins.com> wrote:
> Updating the documentation to reflect that multiple directories can
> now be specified for BR2_GLOBAL_PATCH_DIR. Along with giving an
> example use case of how to use multiple global patch directories.
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
>
> ---
> Changes v3 -> v4:
>   - Fixed minor spelling mistakes and wording (suggested by Arnout)
>   - Reword section about order that patches are applied along with
>     making it clearer about when to use BR2_GLOBAL_PATCH_DIR
>     (suggested by Arnout)
>
> Changes v2 -> v3:
>   - None
>
> Changes v1 -> v2:
>   - Fixed minor spelling mistakes and wording (suggested by Thomas D)
> ---
>  docs/manual/customize-packages.txt |   91 ++++++++++++++++++++++++++++++++----
>  docs/manual/patch-policy.txt       |   20 +++++---
>  2 files changed, 95 insertions(+), 16 deletions(-)
>
[..]
>
> -For a specific version <packageversion> of a specific package <packagename>,
> -patches are applied as follows.
> +For a specific version +<packageversion>+ of a specific package
> ++<packagename>+, patches are applied from +BR2_GLOBAL_PATCH_DIR+ as
> +follows:
>
> -First, the default Buildroot patch set for the package is applied.
> +. For every directory - +<global-patch-dir>+ - that exists in
> +  +BR2_GLOBAL_PATCH_DIR+, a +<package-patch-dir>+ will be determined as
> +  follows:
> ++
> +* If the directory
> +  +<global-patch-dir>/<packagename>/<packageversion>/+ exists.
> ++
> +* Otherwise, if the directory +<global-patch-dir>/<packagename>+ exists.

I find this wording strange:
'.... will be determined as follows: if the directory A exists.
Otherwise, if the directory B exists.'

What about:
'.... will be determined as follows: A, if it exists. Otherwise, B, if
it exists.'

[..]

> +
> +The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
> +specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
> ++BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
> +are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCHES+ are applied
> +after patches available in +BR2_GLOBAL_PATCH_DIR+ as it is a patch
> +post-hook step for the Linux package.

'a patch post-hook step for the Linux package' sounds odd.
What about:
..., as it is done from a post-patch hook of the Linux package.

[..]

>
> +[[patch-apply-order]]
>  How patches are applied
>  ~~~~~~~~~~~~~~~~~~~~~~~
>
> @@ -64,19 +65,24 @@ How patches are applied
>  . If +<packagename>_PATCH+ is defined, then patches from these
>    tarballs are applied;
>
> -. If there are some +*.patch+ files in the package directory or in the
> -  a package subdirectory named +<packageversion>+, then:
> +. If there are some +*.patch+ files in the package's Buildroot
> +  directory or in a package subdirectory named +<packageversion>+,
> +  then:
>  +
>  * If a +series+ file exists in the package directory, then patches are
>    applied according to the +series+ file;
>  +
>  * Otherwise, patch files matching +<packagename>-*.patch+
>    are applied in alphabetical order.
> -  So, to ensure they are applied in the right order, it is hightly
> -  recommended to named the patch files like this:
> +  So, to ensure they are applied in the right order, it is highly
> +  recommended to name the patch files like this:
>    +<packagename>-<number>-<description>.patch+, where +<number>+
>    refers to the 'apply order'.
>
> +. If +BR2_GLOABL_PATCH_DIR+ is defined, the directories will be

GLOBAL

> +  enumerated in the order they are specified. The patches are applied
> +  as described in the previous step.
> +
>  . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
>
>  If something goes wrong in the steps _3_ or _4_, then the build fails.

I think it's a pity that there is duplication between this section and
the one on BR2_GLOBAL_PATCH_DIR.
However, it seems this was an explicit request made by Arnout.

Arnout, would it not be better to remove the duplication, but rather
use hyperlinks to refer from one section to the other, with the
detailed explanation about patch order being in this 'How patches are
applied' section?

Best regards,
Thomas
