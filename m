From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:01:33 +0100
Subject: [Buildroot] [PATCH 4/4] qt5webengine: only available on
 x86(-64) hosts
In-Reply-To: <20171102104520.29257-5-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-5-peter@korsgaard.com>
Message-ID: <e03d8db3-8eb4-8190-722c-07bb250a0576@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 11:45, Peter Korsgaard wrote:
> The -m32 compiler flag is used for 32bit builds and the host tools have
> limited architecture support, so limit to x86(-64) hosts.

 Same story here: there are combinations that should work, e.g. building for
x86_64 target on an aarch64 host. However, it's equally likely to break, and the
Config.in expressions would be quite complicated to allow it. So I've applied
after extending the commit message a little.

 Regards,
 Arnout

> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/qt5/qt5webengine/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
> index 6b68d1b2a8..d40b58062e 100644
> --- a/package/qt5/qt5webengine/Config.in
> +++ b/package/qt5/qt5webengine/Config.in
> @@ -3,6 +3,9 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
>  	default y if BR2_aarch64 || BR2_arm || \
>  		BR2_i386 || BR2_x86_64 || \
>  		BR2_mips || BR2_mips64
> +	# -m32 flag is used for 32bit builds and host tools have
> +	# limited architecture support
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
>  	depends on !BR2_BINFMT_FLAT # qt5base-icu
>  	depends on BR2_USE_MMU # libglib2, qt5base-dbus
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
