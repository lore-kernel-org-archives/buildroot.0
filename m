From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 21 Mar 2012 10:33:11 +0100
Subject: [Buildroot] [PATCH 2/6] Add the systemd package
In-Reply-To: <201203201919.39532.arnout@mind.be>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200032.19236.arnout@mind.be> <4F68416B.50604@free-electrons.com>
 <201203201919.39532.arnout@mind.be>
Message-ID: <4F69A057.9010905@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 20/03/2012 19:19, Arnout Vandecappelle a ?crit :
> On Tuesday 20 March 2012 09:35:55 Maxime Ripard wrote:
> [snip]
>>>> diff --git a/package/systemd/getty at .service b/package/systemd/getty at .service
>>> [snip]
>>>> diff --git a/package/systemd/serial-getty at .service b/package/systemd/serial-getty at .service
>>>
>>>  AFAICS the only difference between these two files and the upstream 
>>> version is that it's getty instead of agetty.  Wouldn't it be simpler
>>> and more future-safe to patch the upstream files?
>>
>> Probably. I'll send a patch and see how it turns out.
>> In the meantime, maybe I can just put a patch here instead of the whole
>> file.
> 
>  That's what I meant.  I doubt that upstream would accept a patch that
> removes agetty.  Maybe a patch that makes it configurable in the m4
> file, but that's a lot more work to cook.
> 
>  BTW, I just noticed now that the 'normal' service definition files
> are installed in /lib/systemd/system rather than /etc/systemd/system.
> 
> [snip]
>>>> +define SYSTEMD_INSTALL_TTY_HOOK
>>>> +	rm -f $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
>>>> +	[ -f $(TARGET_DIR)/etc/systemd/system/getty at .service ] || \
>>>> +		$(INSTALL) -D package/systemd/getty at .service \
>>>> +			$(TARGET_DIR)/etc/systemd/system/
>>>> +	[ -f $(TARGET_DIR)/etc/systemd/system/serial-getty at .service ] || \
>>>> +		$(INSTALL) -D package/systemd/serial-getty at .service \
>>>> +			$(TARGET_DIR)/etc/systemd/system/
>>>> +	ln -fs ../serial-getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/serial-getty@$(BR2_TARGET_GENERIC_GETTY_PORT).service
>>>
>>>  This looks strange to me.  Admittedly, I've never used systemd and
>>> don't really know how it works.  But to me, this looks like the
>>> getty at .service is actually not used.
>>
>> Well, actually, this symlink with weird names is used as the way to pass
>> units some arguments.
> 
>  That much I know :-)
> 
>  My point is: the getty at tty1.service file is removed.  Therefore, there
> is nobody using the getty at .service generic definition.  At least that's
> my understanding of how systemd works.  So why install the 
> getty at .service file?

Aaah. I see your point now. Sorry I went a bit off-topic :)
You're right, of course, I'll remove it.

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
