From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 23 Jan 2019 21:51:10 +0100
Subject: [Buildroot] imx6 solo VPU support in Buildroot
In-Reply-To: <CAE58QoP-N7wbKjAiZtLgdcVXrmJO6BhwQ0yNFihXyuLLk8MEpg@mail.gmail.com>
References: <CAE58QoON4RUMgNdtUjBQDpYrmUSqTzjTyxJ+3LGPa=V=Q8kTRw@mail.gmail.com>
 <CAOMZO5Aso5o=qeRWYcXoQfQb714APBi7ZgR3aszXgvxEmx8UJA@mail.gmail.com>
 <CAE58QoOdeCvOVNBVx=oWzYLgiO-R8A-S2zC1ZtR4-3wGbUVCJw@mail.gmail.com>
 <CAAMH-ytuk2w9Tj19TzrXyU4R1qCqS-=CfLRyGnicJw_dOYK=fQ@mail.gmail.com>
 <CAE58QoM4dqY37hHdoRctcXRg3bnK1RsVHg2g58AixyN-p2qT=g@mail.gmail.com>
 <CAE58QoP-N7wbKjAiZtLgdcVXrmJO6BhwQ0yNFihXyuLLk8MEpg@mail.gmail.com>
Message-ID: <20190123215110.52c721d4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Juan,

On Wed, 23 Jan 2019 16:15:03 +0000, "Juan A. Rubio" <jarubio2001@gmail.com> wrote:

> Hi,
> 
> I'm still chasing the issue of hw-accelerated video playback on my
> imx6 solo custom board.
> 
> I'm now using the IMX6Q platform in my Buildroot config but I have not
> switched to a mainline kernel, and I'm still using the nxp kernel
> (imx6dl-sabresd.dts device tree with a few modifications, none of them
> related to the VPU or GPU).
> 
> In the BSP I can see that the VPU firmware files are in the expected location:
> # ls /lib/firmware/vpu/
> vpu_fw_imx27_TO1.bin  vpu_fw_imx51.bin      vpu_fw_imx6d.bin
> vpu_fw_imx27_TO2.bin  vpu_fw_imx53.bin      vpu_fw_imx6q.bin
> 
> I've verified that video decoding works using a software decoder with
> this pipeline:
> '$ gst-launch-1.0 filesrc location=video.mp4 ! qtdemux ! avdec_h264 !
> imxeglvivsink'
> 
> However, when I use the hw decoder, I get errors:
> '$ gst-launch-1.0 filesrc location=video.mp4 ! qtdemux ! imxvpudec !
> imxeglvivsink'
> 
>  'failed delayed linking some pad of GstQTDemux named qtdemux0 to some
> pad of GstImxVpuDecoder named imxvpudecoder0'

Try 'GST_DEBUG=*:3 gst-launch-1.0 ...' to gain more error info...

> 
> Someone on #gstreamer told me that the 'h264parse' should have been
> added before 'imxvpudec', but 'h264parse' is not present in the
> gstreamer1 Buildroot package (I can see it is there in the gstreamer
> 0.x package).

Try to enable

BR2_PACKAGE_GST1_PLUGINS_BAD=y
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VIDEOPARSERS=y

the gst1-plugins-bad h264parse element is hidden there...

Regards,
Peter
