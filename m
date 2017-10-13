From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 13 Oct 2017 08:31:22 +0200
Subject: [Buildroot] [RFC 0/3] Adding software stacks
In-Reply-To: <CA+TH9VmG3vnC_1Nx92kQNeeTobW1SiBbts_9o+M4bX4xaYH2Wg@mail.gmail.com>
References: <1507668210-5427-1-git-send-email-angelo.compagnucci@gmail.com>
 <60e44779-04da-d7d4-9589-cfef09d1a226@mind.be>
 <CA+TH9VmG3vnC_1Nx92kQNeeTobW1SiBbts_9o+M4bX4xaYH2Wg@mail.gmail.com>
Message-ID: <cd5b6907-c2d0-c68d-662b-40c4567fbdb4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-10-17 08:13, Angelo Compagnucci wrote:
> Dear Arnout Vandecappelle
> 
> 2017-10-11 23:38 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>>  Hi Angelo,
>>
>> On 10-10-17 22:43, Angelo Compagnucci wrote:
>>> Software stacks are a way to define a group of options that should be used together and they are orthogonal to configs: a software stack can indeed be shared among several configs.
>>
>>  Wow, you always come with the innovative ideas, don't you?
> 
> Could you point me where I said it's innovative?

 You didn't say it, but I thought it was innovative. Sorry, I probably didn't
express myself clearly. When I saw your patch series the first time, I
immediately thought "hey, this is nice" and started composing this answer (but
only this sentence). But then I realized we had discussed something like this
before both on the list and in face-to-face meetings, so I left it to have a
sleep on it before continuing. I realize now that the rest of my mail can come
over pretty critical. With my

 So to clarify (hopefully :-): I really like the idea of adding software stacks
(good name BTW, because I was thinking of "packages of packages" which sounds
awful). I also like the idea of making it very easy for people to add those
stacks together. But only if there is a real added value compared to calling
merge_config.sh directly. Some of my comments in patch 2/3 are meant to go in
that direction.

 Also, I only give my own opinion. This may or may not represent the position of
most of the community.

>>  We discussed such a feature before, but never came up with an elegant way to do
>> it, and that was better than just calling merge_config.sh.
> 
> I'm only proposing my POV.
> 
>>> Having a stack system like the one envisioned in this patch series make possible to do something like this:
>>>
>>> make imx6-sabresd_defconfig; make mesa3d-etnaviv_stack qt5-fb_stack qt5-demos_stack; make
>>
>>  So yeah, is this really better than
>>
>> ./utils/merge_config.sh configs/imx6-sabresd_defconfig
>> stacks/mesa3d-etnaviv_stack stacks/qt5-fb_stack stacks/qt5-demos_stack; make
>>
>> ? Yes, it is significantly shorter, but you can at least use tab-completion.
> 
> Well, the difference is that on the mailing list or the documentation
> you can say "there's a defined way in buildroot to do this thing"
> instead of "you should merge your configurations manually". Explicit
> is better than implicit!

 Very true. But calling merge_config.sh is also a defined way, isn't it?


>>  That said, I'm not absolutely opposed to the idea. But I'm not convinced either.
> 
> It's not a problem for me to have a makefile target or not, I really
> want to know if it's an acceptance to the idea and if I should spend
> some time to refine it. If it's a no go, please tell me!

 I don't want to say you shouldn't spend time on it. Perhaps the best approach
is to start with the stacks themselves and document how to use them, and we can
add make rules or scripts later on.


>>  Adding stacks, on the other hand, seems like a worthwhile endeavour.
>>
>>
>>> In this way we can declutter redundant configs (ex: imx6-sabresd_qt5_defconfig) and decouple software packages side related symbols from hardware related defconfigs.
>>
>>  Not the best example, because imx6-sabresd_qt5_defconfig contains quite a few
>> board-specific adaptions: a kconfig fragment and a rootfs overlay. And of course
>> increasing the ext2 rootfs size.
>>
>>  A better example would be atmel_sama5d4_xplained_dev_defconfig which is purely
>> a collection of packages.
> 
> It was an example. Obviously for the sama5d4, we can have a stack for
> each board variant to be merged with a base one.

 My point is, the "dev" stack (a collection of development/debug tools +
enabling BR2_PTHREAD_DEBUG=y) is a more convincing example of why these stacks
are useful.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
