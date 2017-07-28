From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Fri, 28 Jul 2017 22:41:07 +0200
Subject: [Buildroot] [PATCH 00/20] system: properly handle systemd as
 init system
In-Reply-To: <45bb5a90-e48a-3edc-43ff-8cf9eefd20e6@cartelsol.com>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <CAAkeqgVMVSspUdMnPNWi_RQyLPhyf-1bys=d2btKrStEk34VMg@mail.gmail.com>
 <20170719225332.560a9a06@windsurf>
 <CAAkeqgWk1ywyCT027eGPtXfQO_qd5b7dEJSOZek8eMx1R1Ey+Q@mail.gmail.com>
 <20170720093228.19139327@windsurf>
 <45bb5a90-e48a-3edc-43ff-8cf9eefd20e6@cartelsol.com>
Message-ID: <18557b86-2ac3-9545-064c-a54d025de773@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

On 22.07.2017 00:15, Marcus Hoffmann wrote:
> Hey,
> 
> On 20.07.2017 09:32, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Wed, 19 Jul 2017 15:17:21 -0700, Andrey Yurovsky wrote:
>>
>>>> Thanks a lot for testing, very useful to get some feedback!
>>>>
>>>> Can you confirm that it fixes the journald issue reported in bug
>>>> https://bugs.busybox.net/show_bug.cgi?id=7892 ?  
>>>
>>> It does.
>>
>> Awesome, thanks.
>>
>>>> Also, it would be useful if someone interested in systemd could look at
>>>> bugs https://bugs.busybox.net/show_bug.cgi?id=9881 and  
>>>
>>> I did an ARMv7 build with networkd+resolvd and couldn't reproduce the
>>> described problem with these patches applied.
>>
>> Can you reproduce the problem *without* the patches ?
> 
> We are experiencing this problem. I'll try to test it with this patch
> series on Monday.


I tested this with Yanns latest series on top of master (well, a few
days back, where it applied cleanly.) and I still see this problem.

/etc/resolv.conf -> ../run/systemd/resolve/resolv.conf

And there is no /run/systemd/resolve because systemd-resolved is not
selected.

I guess in packages/systemd/systemd.mk:292

define SYSTEMD_INSTALL_RESOLVCONF_HOOK
	ln -sf ../run/systemd/resolve/resolv.conf \
		$(TARGET_DIR)/etc/resolv.conf
endef

This should be in the BR2_PACKAGE_SYSTEMD_RESOLVED and not in the
BR2_PACKAGE_SYSTEMD_NETWORKD branch? Will test what happens in that case.


> 
>>
>>> /etc/resolv.conf points
>>> to ../tmp/resolv.conf which in turn is properly populated and names do
>>> resolve. systemd-hostnamed is acting like it does on Fedora (for what
>>> it's worth), I'm still learning about how to test it properly (that
>>> is, I just have a static hostname at the moment).
>>>
>>>> https://bugs.busybox.net/show_bug.cgi?id=9926.  
>>>
>>> Ok, I'll do a clean rebuild without networkd and with NetworkManager.
>>
>> Thanks a lot!
>>
>> BTW, for these bugs, if there is something easy we can add to the
>> testing infrastructure to make sure it keeps working, it would be nice!

I'm not yet familiar with the the testing infrastructure. Would that be
something like providing a certain set of defconfigs, booting into the
generated filesystems and testing if dns works?

>>
>> Best regards,
>>
>> Thomas
>>
> 

Best wishes,
Marcus
