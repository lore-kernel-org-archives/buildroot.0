From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 21:12:13 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: test for the used
 packages, not for the MM option
In-Reply-To: <20200505120720.258993-1-aleksander@aleksander.es>
References: <20200505120720.258993-1-aleksander@aleksander.es>
Message-ID: <20200727211213.070edbbb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 May 2020 14:07:20 +0200
Aleksander Morgado <aleksander@aleksander.es> wrote:

> This allows user to either explicitly select the libraries it
> needs (e.g. libqmi and/or libmbim) and otherwise explicitly configure
> to request the QMI/MBIM features in ModemManager.
> 
> This simplifies the build logic, and we avoid possible issues where a
> user that did select the library forgot to select the MM feature.
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  package/modem-manager/modem-manager.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 75fc5811db..6b4e9b6250 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -13,7 +13,7 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
>  MODEM_MANAGER_INSTALL_STAGING = YES
>  MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
>  
> -ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
> +ifeq ($(BR2_PACKAGE_LIBQMI),y)

I don't remember if we had discuss this, and where this patch comes
from, but I disagree with it.

When a package has sub-options to enable optional features, the
optional features should really be disabled when the option is
disabled, regardless of whether the needed dependencies are present or
not.

Overall, we have two ways of handling optional features:

 - "Automatic handling": when the dependencies are available, enable
   optional features. Doesn't require any explicit Config sub-options.

 - "Explicit handling": explicit Config.in sub-options are added, which
   select the appropriate dependencies, and make sure the optional
   feature is enabled.

Here you're kind of mixing both, which isn't good IMO.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
