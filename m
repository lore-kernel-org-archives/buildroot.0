From: Joris Offouga <offougajoris@gmail.com>
Date: Sat, 7 Sep 2019 14:14:45 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-06
In-Reply-To: <20190907113739.GA25893@curiosity>
References: <20190907061322.CC0778821B@hemlock.osuosl.org>
 <20190907113739.GA25893@curiosity>
Message-ID: <68c7b7fe-de90-0667-8602-57ce58a8ac7d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Sergey and Thomas

Le 07/09/2019 ? 13:37, Sergey Matyukevich a ?crit?:
> Hi Thomas and all,
>
>> Hello,
>>
>> Autobuild statistics for 2019-09-06
>> ===============================
>>
>>        branch |  OK | NOK | TIM | TOT |
>>    2019.02.x  | 16  |  1  |  0  | 17  |
>>    2019.05.x  | 30  |  3  |  0  | 33  |
>>    2019.08.x  | 24  |  5  |  0  | 29  |
>>      master   | 159 | 102 |  0  | 261 |
>>
>> Results for branch 'master'
>> ===========================
> ...
>
>> Detail of defconfig failures
>> ----------------------------
>>
>>                          defconfig |                        link to the job                        | orph?
>> ----------------------------------+---------------------------------------------------------------+------
>>                  amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126211  |
>>                 arcturus_ucls1012a |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126214  |
>>                          bananapro |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126246  |
>>                     beaglebone_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126249  | ORPH
>>          engicam_imx6qdl_icore_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126255  |
>>                   imx6-sabresd_qt5 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126282  |
>>                         imx6ulpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126286  |
>>                          imx7dpico |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126288  |
>>                      licheepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126292  |
>>                 linksprite_pcduino |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126293  |
>>                      orangepi_lite |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126321  |
>>                     orangepi_lite2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126320  |
>>                   orangepi_pc_plus |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126326  |
>>                      orangepi_zero |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126331  |
>>                orangepi_zero_plus2 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126332  |
>>                     pc_x86_64_bios |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126334  |
>>                      pc_x86_64_efi |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126335  |
>>                 raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126382  | ORPH
>>                              warp7 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126413  |
>>                          warpboard |  https://gitlab.com/buildroot.org/buildroot/-/jobs/289126414  | ORPH
>  From this list, wpa_supplicant is one of the reasons of build failures
> for the following boards:
>
> - amarula_a64_relic
> - bananapro
> - imx6ulpico
> - imx7dpico
> - licheepi_zero
> - linksprite_pcduino
> - orangepi_lite
> - orangepi_lite2
> - orangepi_pc_plus
> - orangepi_zero
> - orangepi_zero_plus2
> - warp7
> - waprboard
>
> It turns out that wpa_supplicant v2.9 requires OpenSSL support for building
> WPA3 features such as DPP and SAE. Those features are now enabled by default.
> That was not the case for wpa_supplicant v2.7.
>
> One option is to force the use of WPA3 enabling it by default. This
> requires adding openssl as unconditional dependency for wpa_supplicant.
>
> Alternatively, WPA3 features can be enabled only when openssl support is
> included:
>
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index 0a7a5072dc..ef455a47bb 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -92,9 +92,15 @@ endif
>   ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>   WPA_SUPPLICANT_DEPENDENCIES += host-pkgconf libopenssl
>   WPA_SUPPLICANT_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_DPP
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SAE
> +WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_OWE
>   WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
>   else
>   WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP_PWD
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DPP
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_SAE
> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_OWE
>   WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>   endif
>   

I build with success warp7 and imx7dpico with your patch

Best regards,

Joris Offouga

> Thoughts ? Comments ?
>
> Regards,
> Sergey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
