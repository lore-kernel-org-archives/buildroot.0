From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 May 2021 11:27:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/python-bluezero: depends on
 dbus-python and python-gobject
In-Reply-To: <20210208005546.482866-1-grzegorz@blach.pl>
References: <20210208005546.482866-1-grzegorz@blach.pl>
Message-ID: <83710b43-6ca3-814e-32db-3090feb03ecf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08/02/2021 01:55, Grzegorz Blach wrote:
> As of version 0.4.0 observer.py uses dbus-python (to comunicate with BlueZ)
> instead of python-aioblescan. Thus, all modules now depend on dbus-python.
> 
> Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

 Applied to master, thanks.

 Since this is a fix, in the future, please add something like this to the
commit message:

Fixes:
ModuleNotFoundError: No module named 'dbus'

This indicates it as a fix in patchwork, so it stands out more between the +-400
other patches. Also, it indicates to Peter that the patch should be backported
to the stable branches.

> ---
>  package/python-bluezero/Config.in | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
> index 9ea3686a2b..3a9e5df6b7 100644
> --- a/package/python-bluezero/Config.in
> +++ b/package/python-bluezero/Config.in
> @@ -1,12 +1,9 @@
>  config BR2_PACKAGE_PYTHON_BLUEZERO
>  	bool "python-bluezero"
>  	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_DBUS_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON_GOBJECT # runtime

 After pushing, I noticed that you forgot to include the recursive dependencies
of python-gobject. So I pushed a follow-up commit that adds them.

 Regards,
 Arnout

>  	help
>  	  Python library for Bluetooth Low Energy (BLE) on Linux.
>  
> -	  For central.py, peripheral.py and broadcaster.py you need
> -	  to enable the dbus-python and the bluez5-utils package.
> -	  For observer.py, you need to enable the python-aioblescan
> -	  package.
> -
>  	  https://github.com/ukBaz/python-bluezero
> 
