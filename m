From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 Apr 2021 09:01:30 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
In-Reply-To: <20210403022316.8719-1-tianyuanhao@aliyun.com>
References: <20210403022316.8719-1-tianyuanhao@aliyun.com>
Message-ID: <20210403070130.GN24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tian, All,

On 2021-04-02 19:23 -0700, Tian Yuanhao via buildroot spake thusly:
> When BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is not set and
> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y, CONFIG_CTRL_IFACE_DBUS_NEW will be
> enabled by 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/' first, and then
> disabled by 's/^\(CONFIG_CTRL_IFACE\)/#\1/'.
> 
> CONFIG_CTRL_IFACE_DBUS_NEW does not depend on CONFIG_CTRL_IFACE, except
> for using it as a prefix. Fix this wrong behavior by adding '\>' after
> CONFIG_CTRL_IFACE.
> 
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
> 
> v1 -> v2:
>   - only handle CONFIG_CTRL_IFACE
> 
> v2 -> v3:
>   - rewrite commit message
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index c82db43c1c..80d75a57c7 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -135,7 +135,7 @@ WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>  endif
>  
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),)
> -WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE\>

Yes,m this is a tchnically correct change, that will fix this once
issue.

However, it singles out this one configuration item among all the
others, because it is the only one to have this trailing word-boundary
marker.

And in fact, I think we should ensure this whole-word match for all the
configurationtiems in a generic way, i.e. in the expansion, later:

    diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
    index 96f0596bfe..001eccbfef 100644
    --- a/package/wpa_supplicant/wpa_supplicant.mk
    +++ b/package/wpa_supplicant/wpa_supplicant.mk
    @@ -188,8 +188,8 @@ endif
     
     define WPA_SUPPLICANT_CONFIGURE_CMDS
     	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
    -	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
    -		$(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
    +	sed -i $(patsubst %,-e 's/^#\(%\>\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
    +		$(patsubst %,-e 's/^\(%\>\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
     		$(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
     		$(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
     		$(WPA_SUPPLICANT_CONFIG)

Thoughts?

Regards,
Yann E. MORIN.

>  endif
>  
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
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
