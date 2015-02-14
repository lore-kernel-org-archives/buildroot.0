From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:10:14 +0100
Subject: [Buildroot] [PATCH 3/4] br-reproduce-build: fix URL of gitid
In-Reply-To: <ca854982ed957dec6bdc523ae2974e0aa630ea75.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
 <ca854982ed957dec6bdc523ae2974e0aa630ea75.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <20150214221014.4643c5cd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Feb 2015 11:52:05 +0100, Yann E. MORIN wrote:
> Reported-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  utils/br-reproduce-build | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/br-reproduce-build b/utils/br-reproduce-build
> index c0dc530..9987684 100755
> --- a/utils/br-reproduce-build
> +++ b/utils/br-reproduce-build
> @@ -16,9 +16,11 @@ if [ $# -ne 1 ] ; then
>      exit 1 ;
>  fi
>  
> -BUILD_ID=$1
> +# BUILD_ID must be in the form xxx/xxxyyyyyyyyyy (xxxyyyyy... being the sha1)
> +BUILD_ID="${1#*/}"
> +BUILD_ID="${BUILD_ID%${BUILD_ID#???}}/${BUILD_ID}"
>  
> -BUILD_DIR=${OUTPUT_DIR}/${BUILD_ID}
> +BUILD_DIR="${OUTPUT_DIR}/${BUILD_ID#*/}"

This shell stuff is so complicated that I don't even understand what is
the behavior. When you say "BUILD_ID must be in the form
xxx/xxxyyyyyyyyyy", does it mean that the user is supposed to pass as
argument to the script a value in the form "xxx/xxxyyyyyyyyyyy" ? If
so, then it's clearly not the intended behavior: the full hash should
be sufficient.

Maybe a few more comments would be useful to understand the magic.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
