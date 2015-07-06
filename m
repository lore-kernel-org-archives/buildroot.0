From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 5 Jul 2015 21:59:23 -0400
Subject: [Buildroot] [PATCH 1/1] ntp: drop uselss patch fixup which
 sometimes breaks rebuild
In-Reply-To: <20150705220854.GU3647@free.fr>
References: <1436129545-3540-1-git-send-email-danomimanchego123@gmail.com>
 <20150705220854.GU3647@free.fr>
Message-ID: <CANxTyt4Toz3WdYpVZ5sAV1qSyvRFoUv7DcNgiAuMEexkEPpPUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

>> diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
>> index 5f05508..93cefa1 100644
>> --- a/package/ntp/ntp.mk
>> +++ b/package/ntp/ntp.mk
>> @@ -42,7 +42,6 @@ endif
>>
>>  define NTP_PATCH_FIXUPS
>>       $(SED) "s,^#if.*__GLIBC__.*_BSD_SOURCE.*$$,#if 0," $(@D)/ntpd/refclock_pcf.c
>
> As far as I could see, that one line does not do anything either.

It *does* change the file - though, I don't know if the change is
actually necessary.  Verified by doing:

$ rm -rf output/build/ntp-4.2.8p3/
$ make -s ntp-extract
$ cp -ra output/build/ntp-4.2.8p3/ .
$ make -s ntp-patch
$ diff ntp-4.2.8p3/ntpd/refclock_pcf.c
output/build/ntp-4.2.8p3/ntpd/refclock_pcf.c
170c170
< #if defined(__GLIBC__) && defined(_BSD_SOURCE)
---
> #if 0

I imagine that this change is better done via patch than sed, if it's
needed at all, but since it is actually doing something, changing it
would be a different topic from removing the second line.

Danomi -
