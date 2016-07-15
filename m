From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 22:56:11 +0200
Subject: [Buildroot] [v3 1/1] package/nginx: Add naxsi module option.
In-Reply-To: <1468604712-1264-1-git-send-email-aduskett@codeblue.com>
References: <1468604712-1264-1-git-send-email-aduskett@codeblue.com>
Message-ID: <20160715225611.434ecec8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 13:45:12 -0400, Adam Duskett wrote:
> Naxsi is a third party nginx module reads a small subset of simple rules
> containing a list of known patterns involved in website vulnerabilities.
> This module behaves like a DROP-by-default firewall for nginx.
> 
> The reason for the changes to the make file was because naxsi is listed
> on github, and even though there is a option to specify a url for a 3rd party
> module, this option only seems to work for a local file url.
> 
> As such a new comment was added to the menu for external modules, and a new
> package that downloads and extracts the module was added under
> package/nginx-naxsi.  This is then used with a pre-configure hook to create
> a soft symbolic link to the source inside of the nginx-source tree.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

I've applied, after doing a number of changes. First of all, your
commit log was wrong: you're no longer doing a pre-configure hook and a
symbolic link. See below for more issues.

> diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
> new file mode 100644
> index 0000000..bdcd16d
> --- /dev/null
> +++ b/package/nginx-naxsi/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_NGINX_NAXSI
> +	bool "ngx_http_naxsi_module"

Changed to:

	bool "nginx-naxsi"

> +	help
> +	  Enable ngx_http_naxsi_module

This is really short, I've replaced with some more details copy/pasted
from the Github description.

Also, there should have been one empty line between the description and
the upstream URL below.

> +	  https://github.com/nbs-system/naxsi
> diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
> new file mode 100644
> index 0000000..6949f30
> --- /dev/null
> +++ b/package/nginx-naxsi/nginx-naxsi.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# nginx-naxsi
> +#
> +################################################################################
> +
> +NGINX_NAXSI_VERSION = 0.54
> +NGINX_NAXSI_SOURCE = $(NGINX_NAXSI_VERSION).tar.gz

Wrong for packages fetched from Github.

> +NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_SOURCE))

Last argument should have been NGINX_NAXSI_VERSION

> +NGINX_NAXSI_LICENSE = GPLv3

The license as indicated by the source code is "GPLv2+ with OpenSSL
exception". I know there is a LICENSE file in the latest master that
indicates GPLv3, but this LICENSE file is not in the 0.54 tag we're
currently packaging. It would be good to report upstream a bug to tell
the maintainer about the discrepancy between the LICENSE file (GPLv3)
and the source code itself (GPLv2+ with OpenSSL exception).

> +NGINX_NAXSI_LICENSE_FILES = LICENSE

This file does not exist in 0.54. Please test with "make legal-info"
when you create a new package, to make sure the legal information files
actually exist.

> +comment "external modules"
> +	source "package/nginx-naxsi/Config.in"

I've moved this to package/Config.in.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
