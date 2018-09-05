From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 4 Sep 2018 20:40:10 -0500
Subject: [Buildroot] [PATCH v2 3/3] package/glibc: allow to specify
 host-make
In-Reply-To: <20180903191933.26080-3-romain.naour@gmail.com>
References: <20180903191933.26080-1-romain.naour@gmail.com>
 <20180903191933.26080-3-romain.naour@gmail.com>
Message-ID: <CANQCQpZvR4uhnzm+hRWi4=MJPjLkTu1mBo30Z+YPhdhDvzS=kg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, Sep 3, 2018 at 2:19 PM Romain Naour <romain.naour@gmail.com> wrote:
>
> Use host-make package if GNU make from the host machine is too old.
>
> Use the newly introduced BR2_MAKE_HOST_DEPENDENCY and BR2_MAKE to
> provide respectively, host-make dependency and the path to the GNU
> make binary to use for building glibc.
>
> Fixes:
> http://autobuild.buildroot.net/results/576/5760ea2635d9aecc9c789494a8b2cc73a1af1ceb
> http://autobuild.buildroot.net/results/583/58347b94884eee2db28740486eda280e8c08e22f
> http://autobuild.buildroot.net/results/dc7/dc7c8cd548409864ab0055e196c0280457a5fb5f
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/glibc/glibc.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 399cf395ce..a2eb8714b1 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -28,7 +28,12 @@ GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>
>  # Before glibc is configured, we must have the first stage
>  # cross-compiler and the kernel headers
> -GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk
> +GLIBC_DEPENDENCIES = host-gcc-initial linux-headers host-bison host-gawk \
> +       $(BR2_MAKE_HOST_DEPENDENCY)
> +
> +# glibc requires make >= 4.0 since 2.28 release.
> +# https://www.sourceware.org/ml/libc-alpha/2018-08/msg00003.html
> +GLIBC_MAKE = $(BR2_MAKE)
>
>  GLIBC_SUBDIR = build
>
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
