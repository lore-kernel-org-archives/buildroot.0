From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 5 Mar 2018 09:54:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/kodi: remove imx support
In-Reply-To: <20180304150606.32748-2-bernd.kuhls@t-online.de>
References: <20180304150606.32748-1-bernd.kuhls@t-online.de>
 <20180304150606.32748-2-bernd.kuhls@t-online.de>
Message-ID: <20180305085452.GA20775@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Mar 04, 2018 at 04:06:06PM +0100, Bernd Kuhls wrote:
> https://git.buildroot.net/buildroot/commit/?id=266208972192f1e0869f89d7be941de6294a810a
> broke imx support in Kodi because previously the G2D libraries were
> part of the imx-gpu-viv package:
> 
> CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
>   Could NOT find IMX (missing: G2D_LIBRARY)

How could it build before since it never explicitely depended on G2D?

> Adjusting the Kodi package to use the imx-gpu-g2d as well still does
> not provide a working build:
> 
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp: In member function 'void CIMX::Deinitialize()':
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:79:21: error: 'DCIC_IOC_STOP_VSYNC' was not declared in this scope
>      ioctl(m_fddcic, DCIC_IOC_STOP_VSYNC, 0);
>                      ^~~~~~~~~~~~~~~~~~~
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp: In member function 'bool CIMX::UpdateDCIC()':
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:109:19: error: 'DCIC_IOC_STOP_VSYNC' was not declared in this scope
>    ioctl(m_fddcic, DCIC_IOC_STOP_VSYNC, 0);
>                    ^~~~~~~~~~~~~~~~~~~
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:115:21: error: 'DCIC_IOC_START_VSYNC' was not declared in this scope
>      ioctl(m_fddcic, DCIC_IOC_START_VSYNC, 0);
>                      ^~~~~~~~~~~~~~~~~~~~
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp: In member function 'virtual void CIMX::Process()':
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:125:19: error: 'DCIC_IOC_START_VSYNC' was not declared in this scope
>    ioctl(m_fddcic, DCIC_IOC_START_VSYNC, 0);
>                    ^~~~~~~~~~~~~~~~~~~~
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/linux/imx/IMX.cpp:131:19: error: 'DCIC_IOC_STOP_VSYNC' was not declared in this scope
>    ioctl(m_fddcic, DCIC_IOC_STOP_VSYNC, 0);
>                    ^~~~~~~~~~~~~~~~~~~
> 
> Although it might be possible to fix these bugs with something like
> 
> 	#define DCIC_IOC_CONFIG_DCIC    _IO('D', 12)
> 	#define DCIC_IOC_START_VSYNC    _IO('D', 15)
> 	#define DCIC_IOC_STOP_VSYNC     _IO('D', 16)
> 
> as done in
> https://raw.githubusercontent.com/LibreELEC/LibreELEC.tv/libreelec-7.0/projects/imx6/patches/kodi/imx6-jarvis.patch

Wow I never paid attention to Kodi support but I'm not surprised it's
not working since those ioctl are Kodi-specific, not available in NXP
default tree (checked 3.10, 3.14 and 4.1.15):
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/video/mxc/mxc_dcic.c?h=imx_3.10.53_1.1.0_ga_caf#n386
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/video/mxc/mxc_dcic.c?h=imx_3.14.52_1.1.0_ga#n386
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/video/mxc/mxc_dcic.c?h=imx_3.14.52_1.1.0_ga#n386

Seems to need that patch:
https://github.com/osmc/vero-linux/commit/ac572b2d2b

> we would still try to ride a dead horse. The upcoming Kodi version
> 18.0-Leia will remove imx support completely, see upstream PR 12990.

Yes I believe they are switching to mainline kernel support (using
Etnaviv + standard V4L2 CODA support).

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
