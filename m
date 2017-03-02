From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 2 Mar 2017 18:22:04 +0100
Subject: [Buildroot] libqeglfs.so not found on imx6
In-Reply-To: <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
References: <CAD6G_RRX2RA3KDJyayDicTL-XbSNdHWK8z7JN-_HR3T9YD=oPw@mail.gmail.com>
 <CAAMH-yvFAXjR1z_R4_+FRec2k=MEmg85hPvBLY4UT5mty7NKUg@mail.gmail.com>
 <CAD6G_RQi8Gwk1hjqxtE=RtZoKpz30aJS1GX59JAGeUu02OP=1g@mail.gmail.com>
 <CAAMH-ys=MpSuBvT=weVPKhyu5_bz4feq7ePmMN4LgHKubG_9vQ@mail.gmail.com>
 <CAD6G_RR5fC2n_JA=M1p3=0MeOwDXRVg2hQbhKDwHYmjyddu1SA@mail.gmail.com>
Message-ID: <CAAMH-ysOC01XkMWPAK4MTKnoiJYXKyHRtKyTZSQ5+kPAzp=a6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan

On Thu, Mar 2, 2017 at 6:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Hi Gary,
>
> On Thu, Mar 2, 2017 at 10:34 PM, Gary Bisson
> <gary.bisson@boundarydevices.com> wrote:
>> Hi,
>>
>> On Thu, Mar 2, 2017 at 6:00 PM, Jagan Teki <jagan@openedev.com> wrote:
>>>
>>> Hi Gary,
>>>
>>> On Thu, Mar 2, 2017 at 7:05 PM, Gary Bisson
>>> <gary.bisson@boundarydevices.com> wrote:
>>> > Hi Jagan,
>>> >
>>> > On Thu, Mar 2, 2017 at 2:15 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
>>> >>
>>> >> Hi,
>>> >>
>>> >> I'm trying to build Qt5 for imx6q sabre and enabled eglfs through
>>> >> BR2_PACKAGE_QT5BASE_EGLFS
>>> >>
>>> >> Any idea, did I miss anything?
>>> >
>>> > Here is a defconfig made for 2016.11.1 version of Buildroot for
>>> > Nitrogen6x (i.MX6Q) which has EGLFS support:
>>> > http://boundarydevices.com.commondatastorage.googleapis.com/buildroot-v2016.11.1-nitrogen6x-qt5.6.2_defconfig
>>>
>>> Thanks for the help.
>>>
>>> >
>>> > Please use that config making sure to replace the kernel and u-boot
>>> > components for your board first.
>>>
>>> Yeah, I was able to build eglfs, and finally I'm launching some demo
>>> application.
>>
>> Good.
>>
>>> # /usr/share/Qtdemo -platform eglfs
>>> QEglFSVivIntegration will set environment variable FB_MULTI_BUFFER=2
>>> to enable double buffering and vsync.
>>>  If this is not desired, you can override this via: export
>>> QT_EGLFS_IMX6_NO_FB_MULTI_BUFFER=1
>>> Could not open egl display
>>> Aborted
>>>
>>> Please let me know if have any idea about this error?
>>
>> Well have you made sure that your display was properly configured in
>> the first place?
>>
>> Are you able to launch the Vivante demos?
>> (needs BR2_PACKAGE_IMX_GPU_VIV_EXAMPLES)
>> # cd /usr/share/examples/viv_samples/vdk/
>> # ./tutorial7
>>
>> As long as the above isn't working, your Qt app won't work either.
>
> Nothing coming on the display except black screen and 4 penguins at
> left top corner.
>
> # cd  /usr/share/examples/viv_samples/vdk/
> # ./tutorial7
> # ./tutorial7
> #
>
> I've built GPU drivers as well, please see below kernel dmesg.
>
> dmesg:
> ---------
> [    1.002652] console [ttymxc3] enabled
> [    1.016395] etnaviv gpu-subsystem: bound 134000.gpu (ops gpu_ops)
> [    1.022660] etnaviv gpu-subsystem: bound 130000.gpu (ops gpu_ops)
> [    1.028828] etnaviv gpu-subsystem: bound 2204000.gpu (ops gpu_ops)
> [    1.035084] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
> [    1.093333] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
> [    1.145203] etnaviv-gpu 2204000.gpu: model: GC355, revision: 1215
> [    1.151378] etnaviv-gpu 2204000.gpu: Ignoring GPU with VG and FE2.0
> [    1.159397] [drm] Initialized etnaviv 1.0.0 20151214 for
> gpu-subsystem on minor 0
> [    1.169491] imx-ipuv3 2400000.ipu: IPUv3H probed
> [    1.176314] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    1.183005] [drm] No driver support for vblank timestamp query.
> [    1.189462] imx-drm display-subsystem: bound imx-ipuv3-crtc.2 (ops
> ipu_crtc_ops)
> [    1.197123] imx-drm display-subsystem: bound imx-ipuv3-crtc.3 (ops
> ipu_crtc_ops)
> [    1.204800] imx-drm display-subsystem: bound imx-ipuv3-crtc.6 (ops
> ipu_crtc_ops)
> [    1.212462] imx-drm display-subsystem: bound imx-ipuv3-crtc.7 (ops
> ipu_crtc_ops)
> [    1.220491] imx-drm display-subsystem: bound 2000000.aips-bus:ldb
> (ops imx_ldb_ops)
> [    1.296817] Console: switching to colour frame buffer device 100x30
> [    1.322829] imx-drm display-subsystem: fb0:  frame buffer device
> [    1.330623] [drm] Initialized imx-drm 1.0.0 20120507 for

I don't know which board you are trying to use but your defconfig is
definitely wrong.
The imx-drm driver is from the mainline kernel and can only work with
Etnaviv, not the Vivante package.

Please check your defconfig.

Regards,
Gary
