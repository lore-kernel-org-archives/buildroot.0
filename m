From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@laposte.net>
Date: Sat, 22 May 2021 18:56:25 +0200
Subject: [Buildroot] [PATCH] configs/bananapi_m2_zero: bump versions and
 add WiFi support
In-Reply-To: <20210519113811.GT2268078@scaer>
References: <20210508201614.16041-1-vincent.stehle@laposte.net>
 <20210519113811.GT2268078@scaer>
Message-ID: <YKk3uXNOZ5pKsOLZ@romuald.bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 19, 2021 at 01:38:11PM +0200, Yann E. MORIN wrote:
..
> Also, if one look at armbian-firmware, there is already a brcm/
> sub-directory, and that already has brcm/brcmfmac43430-sdio.bin. Of
> course, the two are different...
> 
> Additionally, linux-firmware has brcm/brcmfmac43430a0-sdio.bin and
> brcm/brcmfmac43430-sdio.AP6212.txt, again with different content. The
> latter states "NVRAM config file for the Ampak AP6212 43430 WiFi/BT
> module".
> 
> So, this is quite a mess. Why do we have to use the armbian-fw ones,
> instead of those from linux-firmware? We are using an upstream kernel,
> and supposedly, drivers in there are supposed (as I understand it) to
> only require blobs from linux-firmware...

Hi Yann,

Thanks for the review.

You are right, there are multiple firmware candidates. I selected this Armbian
AP6212 firmware a while ago for a specific scenario of STA+AP. For the
buildroot config, I think any firmware capable of STA should do. After a quick
re-test the following combinations work fine:

linux-firmware-20201022/brcm/brcmfmac43430-sdio.AP6212.txt
+ linux-firmware-20201022/brcm/brcmfmac43430-sdio.bin

armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e/brcm/brcmfmac43430-sdio.bin
+ armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e/brcm/brcmfmac43430-sdio.txt

armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e/ap6212/fw_bcm43438a1.bin
+ armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e/ap6212/nvram.txt

armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e/ap6212/fw_bcm43438a1_apsta.bin
+ armbian-firmware-70a08503ac9e765f5d1ccf4fa3e825db0751e53e/ap6212/nvram.txt

(No working combination with rpi-wifi-firmware.)

I will re-post an updated configuration using linux-firmware instead. Let's see
if I can submit a patch to the linux-firmware WHENCE file for the symlinks.

> By the way, where does the weird 'brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt'
> name comes from? Is that a 'compatible' string from the DT?

Peter explained the naming in another e-mail already but FWIW the driver also
considers the more generic brcmfmac43430-sdio.txt as second choice. Not sure if
that helps us here.

Best regards,
Vincent.
