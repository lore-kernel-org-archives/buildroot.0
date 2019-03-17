From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Mar 2019 19:31:55 +0100
Subject: [Buildroot] [PATCH] package/libpcap: disable bluez to avoid
 circular dependency
In-Reply-To: <951ac67f2443cb18f758560abe96a5ae78350f63.1552841695.git.baruch@tkos.co.il>
References: <951ac67f2443cb18f758560abe96a5ae78350f63.1552841695.git.baruch@tkos.co.il>
Message-ID: <20190317183155.GG14237@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2019-03-17 18:54 +0200, Baruch Siach spake thusly:
> The optional bluez_utils dependency of libpcap creates a circular
> dependency:
> 
> $ make dbus-show-recursive-depends
> 
> Recursion detected for  : systemd
> which is a dependency of: dbus
> which is a dependency of: bluez_utils
> which is a dependency of: libpcap
> which is a dependency of: iptables
> which is a dependency of: systemd
> make: *** [package/dbus/dbus.mk:121: dbus-show-recursive-depends] Error 1
> 
> Like in the case of dbus (commit b01d463c140) the bluez_utils dependency
> looks less useful.

Sorry, but in this case I disagree: being able to actually dissect
bluetooth packets *is* very interesting.

> Disable bluetooth support unconditionally.

Sorry again, but the loop is only about bluez_utils, not bluez5_utils.
So, why can't we at the very least keep the depenency on bluez5_utils?

And if there still is a loop with that, then we do have bluez5_utils-headers
than may help.

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.net/results/9c3/9c3ee798fa6bb501a20a7892c0b085d2b279b664/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libpcap/libpcap.mk | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
> index 83188c8c4847..82461390de4d 100644
> --- a/package/libpcap/libpcap.mk
> +++ b/package/libpcap/libpcap.mk
> @@ -16,8 +16,8 @@ LIBPCAP_CONF_ENV = \
>  	CFLAGS="$(LIBPCAP_CFLAGS)"
>  LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
>  LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux --without-dag
> -# Disable dbus to break recursive dependencies
> -LIBPCAP_CONF_OPTS += --disable-dbus
> +# Disable dbus and bluez_utils to break recursive dependencies
> +LIBPCAP_CONF_OPTS += --disable-dbus --disable-bluetooth
>  LIBPCAP_CONFIG_SCRIPTS = pcap-config
>  
>  # Omit -rpath from pcap-config output
> @@ -26,14 +26,6 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
>  endef
>  LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
>  
> -ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
> -LIBPCAP_DEPENDENCIES += bluez_utils
> -else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
> -LIBPCAP_DEPENDENCIES += bluez5_utils
> -else
> -LIBPCAP_CONF_OPTS += --disable-bluetooth
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBNL),y)
>  LIBPCAP_DEPENDENCIES += libnl
>  LIBPCAP_CFLAGS += "-I$(STAGING_DIR)/usr/include/libnl3"
> -- 
> 2.20.1
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
