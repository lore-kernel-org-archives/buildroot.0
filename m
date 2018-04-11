From: Andre Renaud <andre@ignavus.net>
Date: Wed, 11 Apr 2018 02:09:46 +0000
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Qualcomm video
 firmware option
In-Reply-To: <20180326233251.22f44208@windsurf.home>
References: <CAEj2-1OQaPzpLwrrzN-42WDUiRk-eWd9=GPUtUYmJXdWQp124Q@mail.gmail.com>
 <20180326233251.22f44208@windsurf.home>
Message-ID: <CAEj2-1MXk1LHVQbJ8+68rncDMEYf6GpjC5daO5GrRA9Wyf-FXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added Qualcomm video accelerator and GPU firmware option.

Signed-off-by: Andre Renaud <andre@ignavus.net>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/linux-firmware/Config.in
b/package/linux-firmware/Config.in
index 4e77a3f9a3..9d8d8b340b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -29,6 +29,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
  help
    Firmware files for AMD Radeon video cards.

+config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS
+       bool "Qualcomm Venus video codec accelerator"
+       help
+         Firmware files for Qualcomm Venus video codec accelerator
+
+config BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO
+       bool "Qualcomm Adreno GPU firmware"
+       help
+         Firmware files for Qualcomm Adreno GPU firmware
+
 endmenu # Video

 menu "Bluetooth firmware"
diff --git a/package/linux-firmware/linux-firmware.mk
b/package/linux-firmware/linux-firmware.mk
index 6f0ba53800..03c4b2c576 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -24,6 +24,16 @@ LINUX_FIRMWARE_DIRS += radeon
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.radeon
 endif

+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS),y)
+LINUX_FIRMWARE_DIRS += qcom/venus-1.8 qcom/venus-4.2
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO),y)
+LINUX_FIRMWARE_FILES += qcom/a*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
+endif
+
 # Intel Wireless Bluetooth
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IBT),y)
 LINUX_FIRMWARE_FILES += intel/ibt-*


On Tue, 27 Mar 2018 at 10:33 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Andre,
>
> Thanks for this contribution! See below for some comments.
>
> On Sun, 11 Mar 2018 21:57:15 +0000, Andre Renaud wrote:
> > Added Qualcomm video firmware option.
> >
> > Signed-off-by: Andre Renaud <andre@ignavus.net>
> > ---
> >  package/linux-firmware/Config.in         | 5 +++++
> >  package/linux-firmware/linux-firmware.mk | 5 +++++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/package/linux-firmware/Config.in
> > b/package/linux-firmware/Config.in
> > index 4e77a3f9a3..61164e101c 100644
> > --- a/package/linux-firmware/Config.in
> > +++ b/package/linux-firmware/Config.in
> > @@ -29,6 +29,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
> >         help
> >           Firmware files for AMD Radeon video cards.
> >
> > +config BR2_PACKAGE_LINUX_FIRMWARE_QCOM
> > +       bool "Qualcomm video card firmware"
> > +       help
> > +         Firmware files for Qualcomm/Snapdragon video cards.
>
> "video cards" doesn't mean much. Are you talking about GPU, VPU?
>
> And in fact, if you look at the "WHENCE" file in the linux-firmware
> project, you'll see:
>
> --------------------------------------------------------------------------
>
> Driver: venus - Qualcomm Venus video codec accelerator
>
> File: qcom/venus-1.8/venus.mdt
> File: qcom/venus-1.8/venus.b00
> File: qcom/venus-1.8/venus.b01
> File: qcom/venus-1.8/venus.b02
> File: qcom/venus-1.8/venus.b03
> File: qcom/venus-1.8/venus.b04
>
> Version: 1.8-00109
>
> File: qcom/venus-4.2/venus.mdt
> File: qcom/venus-4.2/venus.b00
> File: qcom/venus-4.2/venus.b01
> File: qcom/venus-4.2/venus.b02
> File: qcom/venus-4.2/venus.b03
> File: qcom/venus-4.2/venus.b04
>
> Version: 4.2
>
> Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
>
> Binary files supplied originally from
> https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>
> --------------------------------------------------------------------------
>
> --------------------------------------------------------------------------
>
> Driver: adreno - Qualcomm Adreno GPU firmware
>
> File: qcom/a300_pfp.fw
> Link: a300_pfp.fw -> qcom/a300_pfp.fw
> File: qcom/a300_pm4.fw
> Link: a300_pm4.fw -> qcom/a300_pm4.fw
> File: qcom/a530_pfp.fw
> File: qcom/a530_pm4.fw
> File: qcom/a530v3_gpmu.fw2
> File: qcom/a530_zap.b00
> File: qcom/a530_zap.b01
> File: qcom/a530_zap.b02
> File: qcom/a530_zap.mdt
>
> Licence: Redistributable. See LICENSE.qcom and qcom/NOTICE.txt for details
>
> Binary files supplied originally from
> https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>
> --------------------------------------------------------------------------
>
> So the files in qcom/venus/ are for a video processing unit (doing
> video encoding/decoding acceleration), while the qcom/a* files are for
> the Adreno GPUs.
>
> So, I believe we need two sub-options:
>
> BR2_PACKAGE_LINUX_FIRMWARE_QCOM_VENUS
> BR2_PACKAGE_LINUX_FIRMWARE_QCOM_ADRENO
>
> Could you rework your patch to add those two options instead ?
>
> Thanks!
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180411/73131dda/attachment.html>
