From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jun 2016 23:00:49 +0200
Subject: [Buildroot] [PATCH] package/qt5base: add optional dependency on
 udev
In-Reply-To: <1466665515-26237-1-git-send-email-yann.morin@orange.com>
References: <1466665515-26237-1-git-send-email-yann.morin@orange.com>
Message-ID: <30f34a3e-8adb-6bf2-2f48-34ba080fe896@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-06-16 09:05, Yann E. MORIN wrote:
> Qt5 can optionally enable udev support, especially to enumerate input
> devices dynamically. Without udev, devices are not properly enumerated,
> and any device that is not present at launch time is never seen (there
> is no support for hotplug, that is).
> 
> Currently, Qt5base has no explicit dependency on udev, so it will all
> depend on the build order. Sometimes, a package that requires udev will
> be built before qt5base and Qt5 will have support for udev, sometime no
> such package is built before qt5base and Qt5 will not have support for
> udev.
> 
> Add an explicit dependency on udev, but only if it is enabled.
> 
> Note: this only really requires libudev, but we do not yet have a
> separate libudev; we still only have a udev provider (be it eudev or
> systemd).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Cedric Chedaleux <cedric.chedaleux@orange.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index c4b9a54..248abb9 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -53,6 +53,11 @@ ifneq ($(QT5BASE_CONFIG_FILE),)
>  QT5BASE_CONFIGURE_OPTS += -qconfig buildroot
>  endif
>  
> +# For libudev

 Minor nit: this comment is quite useless. The only reason why a package would
ever depend on the udev provider is for libudev. If we would ever add a libudev
(virtual) package, then all packages that currently

 Even so:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +QT5BASE_DEPENDENCIES += udev
> +endif
> +
>  # Qt5 SQL Plugins
>  ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
>  ifeq ($(BR2_PACKAGE_QT5BASE_MYSQL),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
