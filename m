From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 27 Feb 2014 20:09:23 +0000
Subject: [Buildroot] [PATCH] vlc: avoid that AUTORECONF renames
 configure's arguments
In-Reply-To: <1393529854-27070-1-git-send-email-arnout@mind.be>
References: <1393529854-27070-1-git-send-email-arnout@mind.be>
Message-ID: <CAHt8ZCNdQ6THULD7xkm7nc-JTjVxB8M9JHBoGvWbEgrdY_XYCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 February 2014 19:37, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> VLC defines two autoconf functions which are also defined by our own
> pkg.m4 from pkgconf. Unfortunately, they are defined in a different way:
> VLC adds --enable- options, but pkg.m4 adds --with- options. To make
> sure we use VLC's definition, rename these two functions from
> PKG_WITH_MODULES to VLC_PKG_WITH_MODULES and from PKG_HAVE_WITH_MODULES
> to VLC_PKG_HAVE_WITH_MODULES.
>
> Note that the second function (PKG_HAVE_WITH_MODULES) is in fact
> defined in exactly the same way by VLC and pkgconf, but this might no
> longer be the case when either pkgconf or VLC is updated. Therefore,
> that one is renamed as well.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I propose to apply this to next but not to master - Simon's patch 02004773
> has been applied to master and fixes it as well. However, that means that
> 02004773 has to be reverted when next is merged into master.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/vlc/vlc.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 923439d..5727193 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -12,6 +12,17 @@ VLC_LICENSE_FILES = COPYING COPYING.LIB
>  VLC_DEPENDENCIES = host-pkgconf
>  VLC_AUTORECONF = YES
>
> +# VLC defines two autoconf functions which are also defined by our own pkg.m4
> +# from pkgconf. Unfortunately, they are defined in a different way: VLC adds
> +# --enable- options, but pkg.m4 adds --with- options. To make sure we use
> +# VLC's definition, rename these two functions.
> +define VLC_OVERRIDE_PKG_M4
> +       $(SED) 's/PKG_WITH_MODULES/VLC_PKG_WITH_MODULES/g' \
> +               -e 's/PKG_HAVE_WITH_MODULES/VLC_PKG_HAVE_WITH_MODULES/g' \
> +               $(@D)/configure.ac $(@D)/m4/with_pkg.m4
> +endef
> +VLC_POST_PATCH_HOOKS += VLC_OVERRIDE_PKG_M4
> +
>  VLC_CONF_OPT += \
>         --disable-a52 \
>         --disable-shout \
> --
> 1.9.0

Nice lateral thinking; and I like that we now have explicit commentary
in the package makefile, to document the weirdness.

Acked-by: Simon Dawson <spdawson@gmail.com>
Tested-by: Simon Dawson <spdawson@gmail.com>
