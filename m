From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 23:29:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/qt5enginio: needs ssl
In-Reply-To: <20190309222953.7785-1-fontaine.fabrice@gmail.com>
References: <20190309222953.7785-1-fontaine.fabrice@gmail.com>
Message-ID: <20190312232910.5c88999a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sat,  9 Mar 2019 23:29:53 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Remove select on BR2_PACKAGE_QT5BASE and BR2_PACKAGE_OPENSSL to avoid a
> circular dependency

I don't really understand where the "circular dependency" is.

To me it seems like the problem is rather:

"""
Qt 5.6 SSL support is no longer available with OpenSSL since the bump
of OpenSSL to 1.1.x. Therefore selecting Qt5 and OpenSSL does not
guarantee that qt5base will be built with SSL support. Due to this, the
build of qt5enginio currently fails on Qt 5.6.
"""

> diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
> index 102058e7c5..cce0f2a1cb 100644
> --- a/package/qt5/qt5enginio/Config.in
> +++ b/package/qt5/qt5enginio/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_QT5ENGINIO
>  	bool "qt5enginio"
> -	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_QT5BASE
> +	depends on BR2_PACKAGE_QT5BASE_OPENSSL

Either we do this, or:

	select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_QT5_VERSION_LATEST
	select BR2_PACKAGE_LIBRESSL if BR2_PACKAGE_QT5_VERSION_5_6

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
