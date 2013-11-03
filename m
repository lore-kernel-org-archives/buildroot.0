From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Nov 2013 11:27:39 +0100
Subject: [Buildroot] [PATCH] libcap-ng: disable_on_avr32
In-Reply-To: <1383472408-1598-1-git-send-email-spdawson@gmail.com>
References: <1383472408-1598-1-git-send-email-spdawson@gmail.com>
Message-ID: <20131103112739.4f5c6505@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Simon,

On Sun,  3 Nov 2013 09:53:28 +0000, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
> 
> Thread-local storage is not available in the avr32 toolchain, so libcap-ng
> must be disabled on avr32. Fixed build failures such as the following.
> 
>   http://autobuild.buildroot.net/results/05f/05f73cb74ee7bfb1c337100312726de034366a7d/
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>
> ---
>  package/libcap-ng/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcap-ng/Config.in b/package/libcap-ng/Config.in
> index d1663cd..008bf51 100644
> --- a/package/libcap-ng/Config.in
> +++ b/package/libcap-ng/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBCAP_NG
>  	bool "libcap-ng"
> +	depends on !BR2_avr32 # TLS not available
>  	help
>  	  The libcap-ng library is intended to make programming with
>  	  posix capabilities much easier than the traditional libcap

Thanks! I already sent a somewhat similar patch at
http://patchwork.ozlabs.org/patch/280889/, but Peter complained that
the problem was really related to the absence of TLS support rather
than AVR32, and that the TLS support could also be disabled on other
architectures using the BR2_GCC_ENABLE_TLS option. However, the problem
is that this option only exists for internal toolchains: for external
toolchains, we have absolutely no idea whether they have TLS support or
not.

My own point of view would be to remove the possibility of configuring
out TLS support, and simply assume TLS support is always enabled when
thread support is available. What do others think about this?

Also, you forgot to propagate the dependency to the 'ofono' package,
which selects libcap-ng.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
