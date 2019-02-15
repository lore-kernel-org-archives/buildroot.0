From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Feb 2019 21:43:43 +0100
Subject: [Buildroot] [PATCH v1] package/qwt: needs qt5base gui support
In-Reply-To: <20190215202504.24205-1-ps.report@gmx.net>
References: <20190215202504.24205-1-ps.report@gmx.net>
Message-ID: <20190215214343.68c0b057@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Fri, 15 Feb 2019 21:25:04 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes the following qt5base configure error ([1]):
> 
>   ERROR: Feature 'widgets' was enabled, but the pre-condition 'features.gui' failed.
> 
> [1] http://autobuild.buildroot.net/results/c771c2d5aac3e21f908e5a118f3755dbc9301a47
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qwt/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qwt/Config.in b/package/qwt/Config.in
> index f4132c8638..2e9cec19d7 100644
> --- a/package/qwt/Config.in
> +++ b/package/qwt/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_QWT
>  	bool "qwt"
>  	depends on BR2_PACKAGE_QT5
>  	select BR2_PACKAGE_QT5BASE
> +	select BR2_PACKAGE_QT5BASE_GUI

Hm, the build error happens in qt5base, and to me reads as "if you have
widgets support enabled in qt5base, you must have gui support enabled
in qt5base". If that is what is happening, then what you want to do is
have BR2_PACKAGE_QT5BASE_WIDGETS sleect BR2_PACKAGE_QT5BASE_GUI, and
not touch qwt.

Indeed, to me, it seems like any other package that uses qt5 widgets
without selecting qt5 gui would fall into the same build failure.

Also, any idea why this is popping up only now ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
