From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Tue, 16 Mar 2021 11:02:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 WPA_SUPPLICANT_CONFIGURE_CMDS
In-Reply-To: <20210316021804.3790808-1-tianyuanhao@aliyun.com>
References: <20210316021804.3790808-1-tianyuanhao@aliyun.com>
Message-ID: <9d4e31b1-2b0b-b9e8-662f-ad4d64b083e3@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/03/2021 03:18, Tian Yuanhao via buildroot wrote:
> When "BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=n" and
> "BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y" are set,
> "CONFIG_CTRL_IFACE_DBUS_NEW" will be enabled by
> "-e 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/'" first, and then disabled
> by "-e 's/^\(CONFIG_CTRL_IFACE\)/#\1/'".
> 
> Fix it by adding an "=" at the end.
> 
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> ---
>   package/wpa_supplicant/wpa_supplicant.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index c82db43c1c..7941a00748 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -185,8 +185,8 @@ endif
>   
>   define WPA_SUPPLICANT_CONFIGURE_CMDS
>   	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
> -	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
> -		$(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
> +	sed -i $(patsubst %,-e 's/^#\(%=\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
> +		$(patsubst %,-e 's/^\(%=\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
>   		$(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
>   		$(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
>   		$(WPA_SUPPLICANT_CONFIG)

Unfortunately, this behavior is expected so that all CONFIG_EAP_* 
options can be disabled with CONFIG_DISABLE += CONFIG_EAP

I don't see any immediate solution, other that to stop relying on this 
behavior and list every wpa_supplicant option explicitly, or drop the 
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE option.
