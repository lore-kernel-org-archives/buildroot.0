From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 09:56:34 +0100
Subject: [Buildroot] [PATCH 10/10] gst1-imx: bump to version 0.12.0
In-Reply-To: <CAAMH-yvxXLP4SOiZLs9PR2wiFjf7L0-DTk81G9SJvNDLhYzv-Q@mail.gmail.com>
References: <1454154357-31625-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454154357-31625-11-git-send-email-gary.bisson@boundarydevices.com>
 <20160201214437.66ddff9e@free-electrons.com>
 <CAAMH-yufkAQV7p50daw=VYTGeM41RvtpYKsZGzRwZ2K_vKVbxQ@mail.gmail.com>
 <20160201232711.1e2c85a6@free-electrons.com>
 <CAAMH-yvxXLP4SOiZLs9PR2wiFjf7L0-DTk81G9SJvNDLhYzv-Q@mail.gmail.com>
Message-ID: <56B06F42.6050503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 23:49, Gary Bisson wrote:
> Thomas, All,
> 
> On Mon, Feb 1, 2016 at 11:27 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Mon, 1 Feb 2016 22:20:36 +0100, Gary Bisson wrote:
>>
>>>> So it no longer depends on the GPU stuff ?
>>>
>>> No, you can build this package without the GPU backend which implies
>>> the GPU sinks won't be built. The end goal is for i.MX7 which doesn't
>>> have any GPU, right now I have to include the GPU binaries just to
>>> build the pxp/v4l plugins.
>>
>> ACK, makes sense.
>>
>>>>> -     depends on BR2_PACKAGE_LIBFSLVPUWRAP
>>>>>       select BR2_PACKAGE_GST1_PLUGINS_BASE
>>>>> +     select BR2_PACKAGE_GST1_IMX_IPU_PLUGIN
>>>>> +     select BR2_PACKAGE_GST1_IMX_PXP_PLUGIN
>>>>
>>>> This is weird. If you "select" these options here, it means that there
>>>> is no way to disable those options. So why are they options in the
>>>> first place ?
>>>
>>> I just wanted to make it explicit that the package will at least build
>>> those two plugins. Then leaving it up to the user to select whichever
>>> plugin he wants. There actually is no option to disable plugins from
>>> the packages, it's all a question of dependency. As soon as the i.MX
>>> linux kernel is built, PXP and IPU will be. As soon as the GPU
>>> libraries are includes, GPU sink plugins will be built.
>>
>> Hum, then it is not good, because it means that even if you disable the
>> GPU sink plugin options, but still have the GPU libraries enabled, the
>> GPU sink plugins will be installed on your target. This is very
>> confusing.
> 
> Yes, I understand, is it really a big deal? There's going to be more
> plugins than expected in the rootfs, it's free!

 We don't consider rootfs size to be for free.

> 
>> I think you should remove the sub-options, and then simply expand the
>> Config.in help text of the main option to say:
>>
>>  - The IPU and PXP plugins are always built.
>>  - The GPU sink plugin is built when ... is enabled.
>>  - The ... plugin is built when ... is enabled.
> 
> This would be ever more confusing in my opinion. It means that when
> you select gstreamer-imx you have no idea of what is going to be
> built. Then when you realize you need the graphics libraries you have
> to browse to select it yourself.

 That's why it should be mentioned in the help text.

> 
> Wouldn't it be possible to force the option value when the IMX_GPU_VIV
> package is selected? I guess that would bring a circular dependency
> but at least someone wouldn't be able to remove the option without
> removing the graphics binaries.

 Yes, that is possible. But we only do that in situations where it is not
obvious which other package you should select. The idea is to avoid a
proliferation of Config.in options.

 But in this case, you _anyway_ still have to manually select the imx-gpu-viv
package... So I don't think there is much point in adding the sub-options.
Except if you can convert all the depends into selects (except for the glibc one
of course).

 Regards,
 Arnout
> 
> Regards,
> Gary
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
