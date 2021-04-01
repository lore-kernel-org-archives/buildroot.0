From: Andreas Ziegler <br015@umbiko.net>
Date: Thu, 01 Apr 2021 04:06:03 +0000
Subject: [Buildroot] [PATCH v1] package/rpi-wifi-firmware: provide
 convenience links for RPi3A+, RPi3B+ and RPi4B firmware configuration files
In-Reply-To: <20210330215348.18a0920e@gmx.net>
References: <20210329184503.10514-1-ps.report@gmx.net>
 <20210330080145.23293-1-br015@umbiko.net> <20210330204922.044faee8@gmx.net>
 <20210330215348.18a0920e@gmx.net>
Message-ID: <cae66c23284b8829a288f3ce90ac1458@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 2021-03-30 19:53, Peter Seiderer wrote:
> Hello Andreas,
> 
> On Tue, 30 Mar 2021 20:49:22 +0200, Peter Seiderer <ps.report@gmx.net> 
> wrote:
> 
>> Hello Andreas,
>> 
>> thanks for the patch iteration and improvement ;-), but some 
>> comments...
>> 
>> First as it is a new iteration 'PATCH v1' is no longer valid and 
>> should be 'PATCH v2'....,
>> same for patch subject as it is now missing the added RPi0W and 
>> RPi3B...
>> 
>> On Tue, 30 Mar 2021 10:01:45 +0200, Andreas Ziegler <br015@umbiko.net> 
>> wrote:
>> 
>> > Provide convenience links for BCM43455/CYW43455 based RPi3A+, RPi3B+ and RPi4B
>> > WIFI firmware configuration files to avoid runtime firmware loading warning in
>> > the kernel logs, e.g. (RPi3B+):
>> >
>> >   brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2
>> >
>> > or (RP4B
>> >
>> >   brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt failed with error -2
>> >
>> > Changes:
>> >   added links for brcmfmac43430 based boards RPi [0w, 3b]
>> 
>> As you added some changes this should go to...
>> 
>> >
>> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>> 
>> ...here as follows:
>> 
>> [Added links for brcmfmac43430 based RPi0W and RPi3B
>> 
>> > Signed-off-by: Andreas Ziegler <br015@umbiko.net>
>> 
>> ---
>> Changes v1 -> v2:
>>   - added links for brcmfmac43430 based RPi0W and RPi3B
>> 
>> > ---
>> >  package/rpi-wifi-firmware/rpi-wifi-firmware.mk | 7 ++++++-
>> >  1 file changed, 6 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
>> > index 24ba5941b0..c3ab9be857 100644
>> > --- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
>> > +++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
>> > @@ -12,6 +12,11 @@ RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
>> >  define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
>> >  	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
>> >  	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
>> > -endef
>> > +	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi-rpi.txt
>> > +	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
>> 
>> Did not add this two ones as I was not sure about it, because [1] 
>> states
>> RPi0W and RPi3B uses BCM43143, did not know (or test) it maps to 
>> 43430...,
>> I see ([2]) contains a brcmfmac43430-sdio.raspberrypi,3-model-b.txt 
>> file...,
>> but according to [3] I would expect 'raspberrypi,model-zero-w' for the 
>> RPi0W...
> 
> And finally tested on RPi0W:
> 
> 	$ modprobe brcmfmac
> [  382.878433] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43430-sdio for chip BCM43430/1
> [  382.895123] usbcore: registered new interface driver brcmfmac
> [  382.929032] brcmfmac mmc1:0001:1: Direct firmware load for
> brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt failed with error
> -2
> [  383.155974] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43430-sdio for chip BCM43430/1
> [  383.173147] brcmfmac: brcmf_c_process_clm_blob: no clm_blob
> available (err=-2), device may have limited channels available
> [  383.198030] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43430/1
> wl0: Oct 22 2019 01:59:28 version 7.45.98.94 (r723000 CY) FWID
> 01-3b33decd

Thank you for finding the opportunity and time to test this on RPi0w!

I will prepare a new iteration with the enhancements /changes you 
proposed.

   PATCH v2
   Change log
   Adapt commit message
   Add motivation for adding files for 3B and 0w

Kind regards,
Andreas

> Regards,
> Peter
> 
>> 
>> At least some commit log explanation/reference would be help full..., 
>> all in
>> all (as already stated in the other mail thread) an additional patch 
>> (based on
>> the real v1 of this one) would be easier to review/handle...
>> 
>> Regards,
>> Peter
>> 
>> [1] https://de.wikipedia.org/wiki/Raspberry_Pi
>> [2] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/brcm
>> [3] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
>> 
>> 
>> > +	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
>> > +	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
>> > +	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>> > +	endef
>> >
>> >  $(eval $(generic-package))
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
