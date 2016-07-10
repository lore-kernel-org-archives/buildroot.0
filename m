From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jul 2016 18:56:18 +0200
Subject: [Buildroot] [PATCH 1/1] acpica: needs threads
In-Reply-To: <20160710174305.18872-1-nunes.erico@gmail.com>
References: <20160710174305.18872-1-nunes.erico@gmail.com>
Message-ID: <20160710165618.GD3688@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erico, Allm

On 2016-07-10 19:43 +0200, Erico Nunes spake thusly:
> Fixes:
>   http://autobuild.buildroot.net/results/53e/53e38f278ad6d1a7d0a48bce74976f59475b1a99/
>   http://autobuild.buildroot.net/results/a7c/a7cc6187451f944e6846d3f6b5cd3aac700796dd/
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I was surprised that semaphores would require threads, since it is
possible to use semaphores across processes (we'd just need a shared
memory segment to share the semaphore), but indeed, one needs to link
against -pthread to get the semaphores.

Regards,
Yann E. MORIN.

> ---
>  package/acpica/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/acpica/Config.in b/package/acpica/Config.in
> index 74d1f26..c5ffb00 100644
> --- a/package/acpica/Config.in
> +++ b/package/acpica/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_ACPICA
>  	bool "acpica"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  The ACPI Component Architecture (ACPICA) project provides an
>  	  operating system (OS)-independent reference implementation
> @@ -7,3 +8,6 @@ config BR2_PACKAGE_ACPICA
>  	  Specification (ACPI).
>  
>  	  https://www.acpica.org
> +
> +comment "acpica needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 2.9.0
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
