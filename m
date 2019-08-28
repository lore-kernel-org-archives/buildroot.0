From: =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Wed, 28 Aug 2019 13:20:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/iputils: add configs to select
 which binaries are built
In-Reply-To: <18de5619-d3df-cf38-dc4f-570498411c32@mind.be>
References: <20190826173751.13832-1-alejandro.gonzalez.correo@gmail.com>
 <afec5004-19b6-58d1-e818-e4af4303411d@mind.be>
 <f2bfc0d5-e5a5-216b-08b7-7fd5a7ceaa0f@gmail.com>
 <18de5619-d3df-cf38-dc4f-570498411c32@mind.be>
Message-ID: <d8012b8a-d547-54ff-f749-807243e5a1f9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El 27/8/19 a las 14:13, Arnout Vandecappelle escribi?:
> 
(snip)
> 
>  Yes, it's only the relative savings that are relevant. 34MB is anyway huge - a
> normal rootfs with just musl+busybox should be around 500K by itself.
> 
>  Could you mention this briefly in the commit log? E.g.:
> 
> The size of complete iputils on aarch64 is 220KiB, while ping by itself is only
> 63KiB.
> 
>  63KiB is still surprisingly large BTW.

I should mention that I'm using the full coreutils and util-linux packages instead
of Busybox, with eudev (but no HWDB) and System V init, and I'm compiling with
strong stack protection enabled. Of course, all of that adds to the final target
filesystem size, but perhaps the difference from 500 KiB to 34 MiB has other
reasons behind it too.

In any case, I hope that my numbers are consistently huge, in the sense that
relative savings still apply, although raw size numbers are in a lower scale.

>> On the other hand, I've been thinking that reducing the target filesystem size
>> would not be the only use of this patch (let's be honest, ~200 KiB are not much
>> these days :-) ). I've noticed that upstream recently disabled building tftpd by
>> default: https://github.com/iputils/iputils/commit/737d8a91e394518d2ccdaf398bb16283eb8e4a81 .
>> The day that a version with this commit in it comes to Buildroot, there might be
>> users who complain about iputils no longer shipping the tftpd implementation they
>> use for PXE booting, and that could make the updating process more difficult if
>> Buildroot doesn't enable the corresponding build flag manually. And other binaries
>> in the package may suffer the same fate; we don't know. This patch implicitly provides a
>> "line of defense" against such potentially breaking upgrades with no end user and
>> Buildroot developers effort, and my opinion is that this might be its most compelling
>> reason to apply. Moreover, the generic security advantage of reducing the attack
>> surface by only having the networking daemons you need installed apply, too. And,
>> if someone is still using the relic of RARP these days, he or she will find useful
>> being able to select the rarpd daemon for building.
>>
>> Should I edit the commit description to reflect these other potential reaasons for
>> this patch?
> 
>  Yes, it's worth mentioning this in the commit message. Briefly :-)

Okay, I will edit it then for the next version of this patch :-)

> [snip]
>>>> +	$(if $(BR2_PACKAGE_IPUTILS_ARPING),y,\
>>>
>>>  I guess you haven't tested this, because it's wrong :-) $(if ...) is not like
>>> ifeq, it can only check for non-empty. So if should be
>>>
>>> 	$(if $(BR2_PACKAGE_IPUTILS_ARPING),\
>>>
>>
>> Indeed, my tests didn't show up my mistake there. I've noticed it on other parts of the
>> code and fixed them before submitting, but I forgot about that one. Thank you for
>> pointing that out! :-)
> 
>  Actually, you had fixed it in v2, but I hadn't noticed your v2 and replied to
> the v1.

No problem, I admit that confused me a bit too. I'm not yet so used to the workflow
of sending Git patches via e-mail, so I sent two messages in quick sucession to fix
my previous mistakes in a rather confusing manner.

Regards.
