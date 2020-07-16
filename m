From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Thu, 16 Jul 2020 13:21:47 +0000
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: fix
 sdma support for imx8m family
In-Reply-To: <20200716130317.135841-1-gary.bisson@boundarydevices.com>
References: <20200716130317.135841-1-gary.bisson@boundarydevices.com>
Message-ID: <DB8PR04MB575531CD5B24BCDA6A7A9EE3A77F0@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>In latest patch the SDMA installation was limited to platforms whose            
>name was mentioned in the binary. That would unfortunately be too simple        
>to manage, instead the i.MX 8M family uses the same binary as the i.MX 7        
>processors [1].                                                                 
                                                                                 
Hi Gary,                                                                         
                                                                                 
Sorry about this... indeed all platforms could not be tested before merging.     
Thank you for fixing this.                                                       
>                                                                                
>Fixes: fad2df39b9 ("package/freescale-imx/firmware-imx: clarify                 
>installation of firmware files")                                                
>                                                                                
>[1]                                                                             
>https://source.codeaurora.org/external/imx/linux-imx/tree/arch/arm64/boot/dts/freescale/imx8mq.dtsi?h=imx_5.4.24_2.1.0#n519
>                                                                                
>Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>                    
>---                                                                             
> package/freescale-imx/firmware-imx/Config.in       | 3 +++                     
> package/freescale-imx/firmware-imx/firmware-imx.mk | 6 +++++-                  
> 2 files changed, 8 insertions(+), 1 deletion(-)                                
>                                                                                
>diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
>index aae552177f..3859cc1d14 100644                                             
>--- a/package/freescale-imx/firmware-imx/Config.in                              
>+++ b/package/freescale-imx/firmware-imx/Config.in                              
>@@ -20,6 +20,9 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW                 
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53                  
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q                  
>         default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7                   
>+       default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M                   
>+       default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM                  
>+       default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN                  
>                                                                                
> config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW                                   
>         bool                                                                   
>diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
>index cd299aad5e..90d9a79860 100644                                             
>--- a/package/freescale-imx/firmware-imx/firmware-imx.mk                        
>+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk                        
>@@ -107,9 +107,13 @@ endif                                                      
> #                                                                              
>                                                                                
> ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW),y)                             
>+FIRMWARE_IMX_SDMA_NAME = $(FIRMWARE_IMX_PLATFORM_LOWER)                        
                                                                                 
The same concept is used for the VPU ; would it make sense to either use the same
naming convention (i.e.: "FIRMWARE_IMX_SDMA_PLATFORM") or rename "FIRMWARE_IMX_VPU_PLATFORM"
to "FIRMWARE_IMX_VPU_NAME"?                                                    
                                                                                 
Thanks,                                                                          
Stephane.                                                                        
                                                                                 
>+ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM)$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN),y)
>+FIRMWARE_IMX_SDMA_NAME = imx7d                                                 
>+endif                                                                          
> define FIRMWARE_IMX_INSTALL_TARGET_SDMA_FW                                     
>         mkdir -p $(TARGET_DIR)/lib/firmware/imx/sdma                           
>-       cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_PLATFORM_LOWER)*.bin \    
>+       cp -r $(@D)/firmware/sdma/sdma-$(FIRMWARE_IMX_SDMA_NAME)*.bin \         
>                $(TARGET_DIR)/lib/firmware/imx/sdma/                            
> endef                                                                          
> endif                                                                          
>--                                                                              
>2.27.0                                                                          
>                                                                                
