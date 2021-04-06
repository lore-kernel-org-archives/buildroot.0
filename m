From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Apr 2021 22:10:59 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wpa_supplicant: handle
 CONFIG_CTRL_IFACE carefully
In-Reply-To: <60bc4344-1e6d-f264-8449-2e44ee787526@aliyun.com>
References: <20210403022316.8719-1-tianyuanhao@aliyun.com>
 <20210403070130.GN24043@scaer>
 <60bc4344-1e6d-f264-8449-2e44ee787526@aliyun.com>
Message-ID: <f768f65b-c4e3-89ea-60e7-37e1a68012bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/04/2021 09:49, Tian Yuanhao via buildroot wrote:
> Hi Yann,
> 
> On 4/3/21 12:01 AM, Yann E. MORIN wrote:
>> Tian, All,
>>
>> On 2021-04-02 19:23 -0700, Tian Yuanhao via buildroot spake thusly:
>>> When BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is not set and
>>> BR2_PACKAGE_WPA_SUPPLICANT_DBUS=y, CONFIG_CTRL_IFACE_DBUS_NEW will be
>>> enabled by 's/^#\(CONFIG_CTRL_IFACE_DBUS_NEW\)/\1/' first, and then
>>> disabled by 's/^\(CONFIG_CTRL_IFACE\)/#\1/'.
>>>
>>> CONFIG_CTRL_IFACE_DBUS_NEW does not depend on CONFIG_CTRL_IFACE, except
>>> for using it as a prefix. Fix this wrong behavior by adding '\>' after
>>> CONFIG_CTRL_IFACE.
>>>
>>> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
>>> Tested-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>>> ---
>>>
>>> v1 -> v2:
>>> ?? - only handle CONFIG_CTRL_IFACE
>>>
>>> v2 -> v3:
>>> ?? - rewrite commit message
>>> ---
>>> ? package/wpa_supplicant/wpa_supplicant.mk | 2 +-
>>> ? 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/wpa_supplicant/wpa_supplicant.mk
>>> b/package/wpa_supplicant/wpa_supplicant.mk
>>> index c82db43c1c..80d75a57c7 100644
>>> --- a/package/wpa_supplicant/wpa_supplicant.mk
>>> +++ b/package/wpa_supplicant/wpa_supplicant.mk
>>> @@ -135,7 +135,7 @@ WPA_SUPPLICANT_CONFIG_EDITS +=
>>> 's/\#\(CONFIG_TLS=\).*/\1internal/'
>>> ? endif
>>> ? ? ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),)
>>> -WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE
>>> +WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_CTRL_IFACE\>
>> Yes,m this is a tchnically correct change, that will fix this once
>> issue.
>>
>> However, it singles out this one configuration item among all the
>> others, because it is the only one to have this trailing word-boundary
>> marker.
>>
>> And in fact, I think we should ensure this whole-word match for all the
>> configurationtiems in a generic way, i.e. in the expansion, later:
>>
>> ???? diff --git a/package/wpa_supplicant/wpa_supplicant.mk
>> b/package/wpa_supplicant/wpa_supplicant.mk
>> ???? index 96f0596bfe..001eccbfef 100644
>> ???? --- a/package/wpa_supplicant/wpa_supplicant.mk
>> ???? +++ b/package/wpa_supplicant/wpa_supplicant.mk
>> ???? @@ -188,8 +188,8 @@ endif
>> ????? ????? define WPA_SUPPLICANT_CONFIGURE_CMDS
>> ????????? cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
>> ???? -??? sed -i $(patsubst %,-e
>> 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
>> ???? -??????? $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
>> ???? +??? sed -i $(patsubst %,-e
>> 's/^#\(%\>\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
>> ???? +??????? $(patsubst %,-e
>> 's/^\(%\>\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
>> ????????????? $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
>> ????????????? $(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
>> ????????????? $(WPA_SUPPLICANT_CONFIG)
>>
>> Thoughts?
>>
>> Regards,
>> Yann E. MORIN.
> 
> I did this in v1 [1], but Nicolas pointed out that it is by design.

 Nicolas is right. However, it's a bad design :-)

 To fix this, we can simply use "CONFIG_EAP_[A-Z0-9_]*" to disable all the EAP
options. I think EAP is the only one in that situation, but I haven't checked
all config options. There's also CONFIG_DPP that matches CONFIG_DPP2, but I
don't think that's actually intentional...

 So I think indeed the better solution is to change the patsubst lines.

 However, that's a much bigger change which requires a bit of testing and
double-checking (and deciding what to do with e.g. DPP2). So for now, I've
applied this patch, thanks. This patch can be backported to the stable branches.
A follow-up patch that cleans up the patsubst lines would be much appreciated.

 Regards,
 Arnout


> 
> At the moment, only CONFIG_CTRL_IFACE and CONFIG_CTRL_IFACE_DBUS_??? are
> irrelevant, and other options with the same prefix are related. So only
> CONFIG_CTRL_IFACE should be handled.
> 
> [1]:
> http://patchwork.ozlabs.org/project/buildroot/patch/20210316021804.3790808-1-tianyuanhao at aliyun.com/
> 
> 
> Regards,
> Yuanhao
> 
>>
>>> ? endif
>>> ? ? ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS),y)
>>> --?
>>> 2.25.1
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
