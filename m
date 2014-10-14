From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 23:05:31 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
In-Reply-To: <CADCpmyO_-VD52UDJf5MpZGDnTtzJwxyXcOONYwG-rsd4K_7DLQ@mail.gmail.com>
References: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>	<543A9384.8050803@lucaceresoli.net>	<543B52A0.6060007@gmail.com>	<543BC031.60606@lucaceresoli.net>	<543D33DF.8070005@mind.be>
 <CADCpmyO_-VD52UDJf5MpZGDnTtzJwxyXcOONYwG-rsd4K_7DLQ@mail.gmail.com>
Message-ID: <543D901B.8010806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/14 19:16, Gary Bisson wrote:
> Arnout, all,
> 
> On Tue, Oct 14, 2014 at 7:31 AM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
>     [snip]
>     > # Required by gpu-viv-bin-mx6q
>     > comment "gst1-plugins-imx needs an (e)glibc toolchain"
>     >     depends on BR2_arm
>     >     depends on !BR2_TOOLCHAIN_USES_GLIBC
> 
>      That's not the right place for pointing to gpu-viv-bin-mx6q. It should be
>     something like:
> 
>     config BR2_PACKAGE_GST1_PLUGINS_IMX
>             bool "gst1-plugins-imx"
>             depends on BR2_LINUX_KERNEL
>             depends on BR2_arm # Only relevant for i.MX
>             depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
>             select BR2_PACKAGE_GPU_VIV_BIN_MX6Q
>             # Cannot select libfslvpuwrap because user must select the CPU
>             depends on BR2_PACKAGE_LIBFSLVPUWRAP
> 
>     (I added that thing about libfslvpuwrap but I'm not sure of it...)
> 
>  
> That is actually what I said in the first e-mail, I am not proud of all those
> dependencies but I couldn't find a way to select GPU_VIV_MX6Q as it is only
> selectable if  FREESCALE_IMX_PLATFORM is set to FREESCALE_IMX_PLATFORM_IMX6Q. A
> select like above would give an error but I'm open to any other solution.

 Actually, you can do
	select BR2_PACKAGE_FREESCALE_IMX
	select BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q

 I'm not entirely sure if that's good though, because if the user has selected
one of the other i.MX platforms and he thinks that he can use GStreamer with it,
he'll get something completely different from what he expected...


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
