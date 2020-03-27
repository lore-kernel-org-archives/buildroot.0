From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Mar 2020 18:36:20 +0100
Subject: [Buildroot] [PATCH 1/3] package/gstreamer1/gst1-python: fix
 libpython-dir path
In-Reply-To: <20200324173855.747054-1-aduskett@gmail.com>
References: <20200324173855.747054-1-aduskett@gmail.com>
Message-ID: <20200327173620.GZ22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-24 10:38 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Due to the CONF_ENV options set in the gst1-python.mk file, libpython-dir
> must be set manually or else the error:
> "Python dynamic library path could not be determined" occurs.
> 
> Previously the libpython-dir option was set to
> $(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR), however, this breaks the
> resulting .so because the above full path is baked into the resulting .so.
> which results in the error:
> 
> Couldn't g_module_open libpython. Reason:
> /full/path/to/host/lib/python3.8/libpython3.8.so: cannot open shared object
> file: No such file or directory
> 
> To fix this error, set the libpython-dir to /usr/lib.
> Because we provide PYTHONPATH=$(PYTHON3_PATH) in the GST1_PYTHON_CONF_ENV,
> the logic in the meson file uses the above python3 provided by the PYTHONPATH
> variable to determine /usr/lib/ has the proper
> python$(PYTHON3_VERSION_MAJOR).so file.
> 
> Because Buildroot provides the appropriate paths, the meson file finds
> the correct .so file and the resulting compiled library has the appropriate
> path of /usr/lib/python3.$(PYTHON3_VERSION_MAJOR).so
> 
> This change has been tested on the following distributions:
>   - Debian 9 and 10
>   - Debian 9 without python3 installed on the host.
>   - Centos7
>   - Fedora 31
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Thanks for the fixes. I've all three to master, but I also did meld
patches two and three together because they are doing a single thing:
fix the test case.

Thanks!
Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-python/gst1-python.mk | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
> index 23b4bbd900..122c3dd997 100644
> --- a/package/gstreamer1/gst1-python/gst1-python.mk
> +++ b/package/gstreamer1/gst1-python/gst1-python.mk
> @@ -23,10 +23,16 @@ GST1_PYTHON_CONF_ENV += \
>  	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
>  	PYTHONPATH=$(PYTHON3_PATH)
>  
> -# Due to the CONF_ENV options, libpython-dir must be set to the host directory
> +# Due to the CONF_ENV options, libpython-dir must be set manually
>  # or else the error: "Python dynamic library path could not be determined"
> -# will occure
> +# occurs. We set the libpython-dir to /usr/lib as this path is hard-coded
> +# into the resulting .so file as /usr/lib/python3.$(PYTHON3_VERSION_MAJOR).so.
> +# Because we provide PYTHONPATH=$(PYTHON3_PATH) above, the logic in the meson
> +# file uses the above python path to determine if /usr/lib/ has the proper .so
> +# file. Because Buildroot provides the appropriate paths, the meson file finds
> +# the correct .so file, and the resulting compiled library has the appropriate
> +# path of /usr/lib/python3.$(PYTHON3_VERSION_MAJOR).so
>  GST1_PYTHON_CONF_OPTS += \
> -	-Dlibpython-dir=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)
> +	-Dlibpython-dir=/usr/lib/
>  
>  $(eval $(meson-package))
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
