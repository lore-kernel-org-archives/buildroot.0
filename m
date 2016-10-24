From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Oct 2016 14:49:41 +0200
Subject: [Buildroot] [PATCH v2 1/1] php: rework selection of interfaces
In-Reply-To: <1473715867-17245-1-git-send-email-fabrice.fontaine@orange.com>
References: <1473715867-17245-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161024144941.7a2a0e1d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 23:31:07 +0200, Fabrice Fontaine wrote:
> Following suggestion of Yann Morin, rework selection of php interfaces:
> use booleans instead of choice to be able to select multiple interfaces
> as they are not exclusive
> 
> The choice was introduced in commit fcdc9f891 to make sure at least one
> SAPI option was selected. Here, we use an auxiliary symbol
> BR2_PACKAGE_PHP_HAS_SAPI and CGI will be selected if this symbol is not
> set.
> 
> It should be noted that previously CGI and FPM could not be selected at
> the same time. This is now possible. Bug that prevented compilation of
> CGI and FPM binaries at the same time has been fixed since PHP 5.4
> (https://github.com/php-build/php-build/issues/101)
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

I've applied, after changing one thing, see below.


> -config BR2_PACKAGE_PHP_CLI
> +# Helper to make sure at least one interface is selected.
> +# All SAPI options except CGI will select this symbol.
> +config BR2_PACKAGE_PHP_HAS_SAPI
>  	bool

This is really not needed. It was much simpler to just do:

	select BR2_PACKAGE_PHP_SAPI_CGI if \
		!BR2_PACKAGE_PHP_SAPI_CLI && \
		!BR2_PACKAGE_PHP_SAPI_FPM

in the main BR2_PACKAGE_PHP option. I've adjusted the commit log
accordingly before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
