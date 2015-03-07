From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sat, 7 Mar 2015 18:19:25 +0100
Subject: [Buildroot] [PATCH 5/5] package/libungif: deprecate package
In-Reply-To: <1422300260-5361-5-git-send-email-bernd.kuhls@t-online.de>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-5-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHkwnC-oVX3gwSuNcZGprZCPm2sPQia0micJ9jTMVHVUOJq6pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 26, 2015 at 8:24 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> To be replaced with giflib.

Can you respin this patch?

It's important to deprecate libungif because it's incompatible with
libgif so if both are installed, the headers get overwritten, right
now we don't have build problems because we are lucky and they are
overwritten in right order :)

But using top-parallel make i get build failures because the order is changed.

Example:
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_FBV=y
BR2_PACKAGE_LIBUNGIF=y

The following command build fine:
make clean libungif giflib fbv

But fbv fail to build with the following command:
make clean giflib libungif fbv

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libungif/Config.in |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/libungif/Config.in b/package/libungif/Config.in
> index e8c301c..012ef76 100644
> --- a/package/libungif/Config.in
> +++ b/package/libungif/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_LIBUNGIF
>         bool "libungif"
> +       depends on !BR2_PACKAGE_GIFLIB
> +       depends on BR2_DEPRECATED_SINCE_2015_02 # giflib
>         help
>           libungif is a library for handling the uncompressed GIF image format.
>
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Fabio Porcedda
