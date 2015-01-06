From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 22:01:03 +0100
Subject: [Buildroot] [PATCH v3] python-tornado: bump to 4.0.2
In-Reply-To: <1420477207-14637-1-git-send-email-yegorslists@googlemail.com>
References: <1420477207-14637-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150106220103.1fe958ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Mon,  5 Jan 2015 18:00:07 +0100, Yegor Yefremov wrote:

> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
> index 870a3de..9bbfc55 100644
> --- a/package/python-tornado/Config.in
> +++ b/package/python-tornado/Config.in
> @@ -1,7 +1,10 @@
>  config BR2_PACKAGE_PYTHON_TORNADO
>  	bool "python-tornado"
> -	depends on BR2_PACKAGE_PYTHON
> -	select BR2_PACKAGE_PYTHON_ZLIB
> +	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON_CERTIFI # runtime

Are you sure SSL and certifi are mandatory dependencies? I see the
following things in the source code:

try:
    import ssl
except ImportError:
    # ssl is not available on Google App Engine.
    ssl = None

try:
    import certifi
except ImportError:
    certifi = None

Which seem to indicate that those Python packages are not mandatory for
python-tornado. They are only needed if you want to do https://
connexions, no?

> +# Locally computed:
> +sha1    6152ea61b4cdf9566f3974f30603ff51b527dd87                          tornado-4.0.2.tar.gz
> +sha256  900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa  tornado-4.0.2.tar.gz

sha256 is sufficient, no need to have sha1 in addition to it.

Could you look at the dependency issue above?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
