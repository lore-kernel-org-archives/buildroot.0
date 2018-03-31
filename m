From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 08:38:21 +0200
Subject: [Buildroot] [PATCH 15/36] check-package: enable for toolchain/
In-Reply-To: <20180331022301.27501-16-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
 <20180331022301.27501-16-ricardo.martincoski@gmail.com>
Message-ID: <20180331083821.37eb87bd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Mar 2018 23:22:40 -0300, Ricardo Martincoski wrote:
> The toolchain directory can benefit from this script to prevent common
> mistakes when submitting patches.
> 
> In order to accomplish this:
> Do not ignore anymore files from the toolchain/ directory.
> Accept toolchain-common.in as a valid Config.in name.
> Ignore this symbol:
>  - BR_LIBC: defined by the buildroot toolchain, used by gcc-final.mk.
> But do not ignore this symbol:
>  - GCONV_LIBS: it is used only inside the file that defines it.

You're not actually ignoring this variable in this patch, and you
instead fixed it in PATCH 14/36 to have a TOOLCHAIN_ prefix.

> Ignore toolchain/toolchain-external/pkg-toolchain-external.mk as it
> declares a package infra and not a package itself.
> Ignore toolchain/helpers.mk as it contains only helper functions.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> ---
>  utils/check-package             | 5 ++++-
>  utils/checkpackagelib/lib_mk.py | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/check-package b/utils/check-package
> index a5f5dc44c0..35a4a70858 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -44,7 +44,7 @@ def parse_args():
>      return parser.parse_args()
>  
>  
> -CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
> +CONFIG_IN_FILENAME = re.compile("/Config\.\S*$|/toolchain-common.in$")

Not directly related to your series, but I believe this
toolchain-common.in file is silly. It is just included by
toolchain/Config.in, and toolchain/Config.in is not that long. We
should bring back the toolchain-common.in contents in
toolchain/Config.in, and stop having this odd toolchain-common.in.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
