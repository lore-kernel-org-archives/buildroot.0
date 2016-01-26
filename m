From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2016 23:25:15 +0100
Subject: [Buildroot] [PATCH 18/21] glog: fix atomic built-in problem
In-Reply-To: <1453676887-31236-19-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-19-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160126222515.GD3462@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-25 00:08 +0100, Thomas Petazzoni spake thusly:
> glog can optionally use atomic __sync built-ins. However, its
> configure script only checks for the availability of the 4 bytes
> version, but the code also uses the 1 byte version. While this works

s/version/variant/ as it seems more appropriate. Applicable in the other
places you used 'version'.

Also, the usual '4-byte' adjective! ;-)

Otherwise;

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> on most architectures, it does not on architectures that implement
> only the 4 bytes version, such as Microblaze. So if the architecture
> does not implement the 1 byte version, we hint the configure script
> that atomic built-ins should not be used.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/bedebd594c283adf39374c9a9f44432e5d6cbff7/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/glog/glog.mk | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/package/glog/glog.mk b/package/glog/glog.mk
> index 8a84094..aa7cacb 100644
> --- a/package/glog/glog.mk
> +++ b/package/glog/glog.mk
> @@ -14,4 +14,15 @@ ifeq ($(BR2_PACKAGE_GFLAGS),y)
>  GLOG_DEPENDENCIES = gflags
>  endif
>  
> +# glog can optionally use atomic __sync built-ins. However, its
> +# configure script only checks for the availability of the 4 bytes
> +# version, but the code also uses the 1 byte version. While this works
> +# on most architectures, it does not on architectures that implement
> +# only the 4 bytes version, such as Microblaze. So if the architecture
> +# does not implement the 1 byte version, we hint the configure script
> +# that atomic built-ins should not be used.
> +ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_1),)
> +GLOG_CONF_ENV += ac_cv___sync_val_compare_and_swap=no
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
