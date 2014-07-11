From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Jul 2014 07:39:20 +0200
Subject: [Buildroot] [PATCH] dependencies.sh message: fix Debian renamed
 packages
In-Reply-To: <1404988617-10992-1-git-send-email-kaszak@gmail.com>
References: <1404988617-10992-1-git-send-email-kaszak@gmail.com>
Message-ID: <53BF7888.2010803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/14 12:36, Karoly Kasza wrote:
> Debian renamed the 32bit compatibility packages.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  support/dependencies/dependencies.sh |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
> index 255a07b..399bc06 100755
> --- a/support/dependencies/dependencies.sh
> +++ b/support/dependencies/dependencies.sh
> @@ -205,8 +205,8 @@ if grep -q ^BR2_HOSTARCH_NEEDS_IA32_LIBS=y $BR2_CONFIG ; then
>  		echo "Your Buildroot configuration uses pre-built tools for the x86 architecture,"
>  		echo "but your build machine uses the x86-64 architecture without the 32 bits compatibility"
>  		echo "library."
> -		echo "If you're running a Debian/Ubuntu distribution, install the libc6:i386,"
> -		echo "libstdc++6:i386, and zlib1g:i386 packages."
> +		echo "If you're running a Debian/Ubuntu distribution, install the libc6-i386,"
> +		echo "lib32stdc++6, and lib32z1 packages."

 Are you sure? With e.g. a sourcery toolchain, I get (on a Debian sid):

bash 98826$ ldd host/opt/ext-toolchain/bin/i686-pc-linux-gnu-gcc
        linux-gate.so.1 (0xf776e000)
        libm.so.6 => /lib/i386-linux-gnu/i686/cmov/libm.so.6 (0xf76eb000)
        libc.so.6 => /lib/i386-linux-gnu/i686/cmov/libc.so.6 (0xf7540000)
        /lib/ld-linux.so.2 (0xf776f000)

 /lib/i386-linux-gnu/* is part of the libc6:i386 package.


 Regards,
 Arnout

>  		echo "For other distributions, refer to the documentation on how to install the 32 bits"
>  		echo "compatibility libraries."
>  		exit 1
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
