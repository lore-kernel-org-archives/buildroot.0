From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 23:08:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/kodi: remove imx support
In-Reply-To: <20180304150606.32748-2-bernd.kuhls@t-online.de>
References: <20180304150606.32748-1-bernd.kuhls@t-online.de>
 <20180304150606.32748-2-bernd.kuhls@t-online.de>
Message-ID: <20180331230852.169d6da8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  4 Mar 2018 16:06:06 +0100, Bernd Kuhls wrote:
> https://git.buildroot.net/buildroot/commit/?id=266208972192f1e0869f89d7be941de6294a810a
> broke imx support in Kodi because previously the G2D libraries were
> part of the imx-gpu-viv package:
> 
> CMake Error at /usr/share/cmake-3.7/Modules/FindPackageHandleStandardArgs.cmake:138 (message):
>   Could NOT find IMX (missing: G2D_LIBRARY)
> 
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
> 
> we would still try to ride a dead horse. The upcoming Kodi version
> 18.0-Leia will remove imx support completely, see upstream PR 12990.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/kodi.mk | 6 ------
>  1 file changed, 6 deletions(-)

I've kept an unconditional and explicit -DENABLE_IMX=OFF in
KODI_CONF_OPTS, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
