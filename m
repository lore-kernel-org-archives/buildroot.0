From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:39:23 +0100
Subject: [Buildroot] [PATCH 1/1] mono: remove copy of host etc files on
 install
In-Reply-To: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
References: <20170315022458.14160-1-dustin.r.johnson@gmail.com>
Message-ID: <20170318153923.56903d45@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Angelo, could you comment on this patch touching the Mono package?

Copying $(HOST_DIR)/etc/mono to $(TARGET_DIR)/etc has been there since
you contributed the package, but apparently causes some issues. It
would be nice if you could have a look at the patch proposed by Dustin.

Thanks a lot!

Thomas

On Tue, 14 Mar 2017 22:24:58 -0400, Dustin Johnson wrote:
> When the mono package is installed, the autotools installer installs
> the /etc/mono files to the target. A post_install hook then copies
> over the mono libraries to the target as well as the host /etc/mono
> files which overrides the target files. The target specific mono
> configuration file (/etc/mono/config) is overridden with the host
> settings. This causes mono on the target to be unable to locate target
> specific .so files as it overrides the changes enacted by the patches
> for the package.
> 
> Signed-off-by: Dustin Johnson <dustin.r.johnson@gmail.com>
> ---
>  package/mono/mono.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/mono/mono.mk b/package/mono/mono.mk
> index 20b920568..4996b7c60 100644
> --- a/package/mono/mono.mk
> +++ b/package/mono/mono.mk
> @@ -31,7 +31,6 @@ MONO_CONF_OPTS = --disable-gtk-doc \
>  define MONO_INSTALL_LIBS
>  	rsync -av --exclude=*.so --exclude=*.mdb \
>  		$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
> -	rsync -av $(HOST_DIR)/etc/mono $(TARGET_DIR)/etc
>  endef
>  
>  MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
