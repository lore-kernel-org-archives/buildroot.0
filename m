From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 16:31:59 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
In-Reply-To: <543BC031.60606@lucaceresoli.net>
References: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>
 <543A9384.8050803@lucaceresoli.net> <543B52A0.6060007@gmail.com>
 <543BC031.60606@lucaceresoli.net>
Message-ID: <543D33DF.8070005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/10/14 14:06, Luca Ceresoli wrote:
> Dear Gary,
> 
> Gary Bisson wrote:
>> Hi Luca,
>>
>> Thanks for your feedback, below are my comments.
>> Sorry Peter I didn't see your patch from March.
>>
>> On 10/12/2014 07:43 AM, Luca Ceresoli wrote:
[snip]
>>> According to Gary, (e)glibc is needed. Peter, did you build-test with
>>> uClibc (or musl)?
>> Actually this dependency is not required as it is implicit, the real
>> eglibc dependency comes from the GPU_VIV package.
> 
> I see. A brief comment would be helpful, as it is for all inherited
> dependencies. Example:
> 
> # Required by gpu-viv-bin-mx6q
> comment "gst1-plugins-imx needs an (e)glibc toolchain"
>     depends on BR2_arm
>     depends on !BR2_TOOLCHAIN_USES_GLIBC

 That's not the right place for pointing to gpu-viv-bin-mx6q. It should be
something like:

config BR2_PACKAGE_GST1_PLUGINS_IMX
	bool "gst1-plugins-imx"
	depends on BR2_LINUX_KERNEL
	depends on BR2_arm # Only relevant for i.MX
	depends on BR2_TOOLCHAIN_USES_GLIBC # gpu-viv-bin-mx6q
	select BR2_PACKAGE_GPU_VIV_BIN_MX6Q
	# Cannot select libfslvpuwrap because user must select the CPU
	depends on BR2_PACKAGE_LIBFSLVPUWRAP

(I added that thing about libfslvpuwrap but I'm not sure of it...)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
