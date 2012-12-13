From: Victor Hiairrassary <victor.hiairrassary.ml@gmail.com>
Date: Thu, 13 Dec 2012 11:45:41 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <50C91790.6090202@mind.be>
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
 <20121212111628.5d1e9dba@skate> <20121212120159.4292d70b@skate>
 <20121212120341.69a89e93@skate> <20121212134703.7461d9c7@skate>
 <874njrnroe.fsf@dell.be.48ers.dk> <20121212183204.718be669@skate>
 <87r4mvm3gv.fsf@dell.be.48ers.dk> <20121212232108.261e4b29@skate>
 <50C91790.6090202@mind.be>
Message-ID: <0BA8DAED-72C3-4B4D-AC0E-4A0B344D88F1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So maybe boost package should no more depend on BR2_LARGEFILE?

Le 13 d?c. 2012 ? 00:47, Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On 12/12/12 23:21, Thomas Petazzoni wrote:
>> Dear Peter Korsgaard,
>> 
>> On Wed, 12 Dec 2012 21:15:44 +0100, Peter Korsgaard wrote:
>> 
>>>  Thomas>  !largefile build is OK if we pass $(DISABLE_LARGEFILE) to
>>>  Thomas>  gcc1 and gcc2 configure steps, so it solves the build
>>>  Thomas>  problem. I haven't done more testing though (testing the
>>>  Thomas>  generated code, building with largefile enabled, etc.).
>>> 
>>> Cool, great - I'll commit that then.
>>> 
>>>  Thomas>  That said, doesn't --disable-largefile disables largefile
>>>  Thomas>  support at the level of gcc itself, rather than taking into
>>>  Thomas>  account the fact that largefile support is not available on
>>>  Thomas>  the target? Of course, it has the consequence that
>>>  Thomas>  _FILE_OFFSET_BITS is no longer defined to 64 in auto-conf.h,
>>>  Thomas>  which works around the problem. But gcc (the host binary)
>>>  Thomas>  should be capable of being built with largefile support on a
>>>  Thomas>  32 bits host, even if the 32 bits target has no largefile
>>>  Thomas>  support.
>>> 
>>> So for the cross compiler to be able to access large files? Is that
>>> really important? I doubt people are using buildroot with 2G+
>>> source/object/library files?
>> 
>> It's not that we care too much about this (even though some crazy
>> library like Qt with debugging symbols reaches a very fat size, several
>> hundreds of MBs in size), but the fact that it is an ugly workaround to
>> use the side-effect of disabling largefile on gcc to make it play nice
>> with a target system that has largefile disabled.
>> 
>> Right now, when largefile is disabled for the target, it is disabled
>> for the cross gcc, when largefile is enabled for the target, it is
>> enabled for the cross gcc. Doesn't make much sense.
> 
> Indeed, it would make much more sense to disable largefile unconditionally
> while building any gcc stage (uClibc won't complain if _FILE_OFFSET_BITS is
> not set). At least, I guess --disable-largefile only says something about
> the gcc executable, not about the crtstuff and other target support...
> 
> And it also deserves a BIG FAT comment explaining why this is needed.
> 
> Regards,
> Arnout
> -- 
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
