From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Sep 2019 15:58:40 -0500
Subject: [Buildroot] [PATCH v2 3/3] package/wpa_supplicant: fix AP mode
 settings
In-Reply-To: <20190909202034.27508-4-geomatsi@gmail.com>
References: <20190909202034.27508-1-geomatsi@gmail.com>
 <20190909202034.27508-4-geomatsi@gmail.com>
Message-ID: <CANQCQpYK66d-K9sxFMmR7ych=WFyKO7EG1S9BJ5RL+v62Vd1WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergey,


On Mon, Sep 9, 2019 at 3:18 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> New wpa_supplicant v2.9 enables by default AP, P2P, WIFI_DISPLAY
> features in defconfig. However these features make sense only for
> wpa_supplicant drivers supporting AP mode.
>
> That is why, for consistent configuration, these features should
> be explicitely disabled in wpa_supplicant .config file unless
> they are requested by Config.in options.
>
> Note that at the moment AP support in Buildroot can be enabled
> only for NL80211 driver.
>

Fixes
http://autobuild.buildroot.net/results/d37672374db935ac29953263ec68a2786ee65cc2/

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>


> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 283c006052..9dcebca9bf 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -67,10 +67,16 @@ ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
>  WPA_SUPPLICANT_CONFIG_ENABLE += \
>         CONFIG_AP \
>         CONFIG_P2P
> +else
> +WPA_SUPPLICANT_CONFIG_DISABLE += \
> +       CONFIG_AP \
> +       CONFIG_P2P
>  endif
>
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY),y)
>  WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WIFI_DISPLAY
> +else
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_WIFI_DISPLAY
>  endif
>
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
> --
> 2.23.0
>


--

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
