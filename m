From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:55:25 +0200
Subject: [Buildroot] [PATCH] binutils: fix bfin compile
In-Reply-To: <20160821222023.GA10105@waldemar-brodkorb.de>
References: <20160821222023.GA10105@waldemar-brodkorb.de>
Message-ID: <20160823175525.5645ceaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 00:20:24 +0200, Waldemar Brodkorb wrote:
> See gcc bug for details:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/binutils/binutils.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index 2936eb5..1defbb1 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -71,6 +71,12 @@ endif
>  BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
>  HOST_BINUTILS_CONF_ENV += ac_cv_prog_MAKEINFO=missing
>  
> +# gcc bug with Os/O2/O3
> +# error: unable to find a register to spill in class 'CCREGS'
> +ifeq ($(BR2_bfin),y)
> +BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O1"
> +endif
> +
>  # Install binutils after busybox to prefer full-blown utilities
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  BINUTILS_DEPENDENCIES += busybox

I've applied to master, after adding the gcc PR reference in the
comment.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
