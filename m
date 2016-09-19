From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 19 Sep 2016 09:18:27 -0700
Subject: [Buildroot] [PATCH 1/2] xen: Disable -Werror when building
In-Reply-To: <bb139a26-62f8-b3b9-d52f-78238b11457c@mind.be>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
 <55fa8ac2-b998-7729-3d0b-e10f500a870d@mind.be>
 <bb139a26-62f8-b3b9-d52f-78238b11457c@mind.be>
Message-ID: <CAKmqyKMjNj=cvb4mq12Ha0YyGYR9dA8nOYcioxTu8oWP977DmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 13, 2016 at 4:19 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 14-09-16 00:57, Arnout Vandecappelle wrote:
>>
>>
>> On 13-09-16 22:45, Alistair Francis wrote:
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
>  I forgot to mention before: the commit message should refer to the autobuilder
> failures.

Sorry, I didn't think of that.

>
>>> ---
>>>  ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 ++++++++++++++++++++++
>>>  1 file changed, 26 insertions(+)
>>>  create mode 100644 package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
>>>
>>> diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
>>> new file mode 100644
>>> index 0000000..ca772dd
>>> --- /dev/null
>>> +++ b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
>>> @@ -0,0 +1,26 @@
>>> +From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
>>> +From: Alistair Francis <alistair.francis@xilinx.com>
>>> +Date: Tue, 13 Sep 2016 10:48:31 -0700
>>> +Subject: [PATCH] Remove hardcoded strict -Werror checking
>>> +
>>> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> +---
>>> + Config.mk | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/Config.mk b/Config.mk
>>> +index bd991c6..e7ac662 100644
>>> +--- a/Config.mk
>>> ++++ b/Config.mk
>>> +@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
>>> + SHELL     ?= /bin/sh
>>> +
>>> + # Tools to run on system hosting the build
>>> +-HOSTCFLAGS  = -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer
>>> ++HOSTCFLAGS  = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer
>>
>>  I had a quick look, and there are actually roughly 60 instances of this -Werror
>> spread out over various Makefiles... (It's an autotools package but it looks
>> like it's not using automake.) Although we probably don't use some of them
>> (components that don't get build, Makefiles meant for different targets, etc.),
>> I doubt that removing this one instance is going to be sufficient. But a patch
>> that changes those 60 instances doesn't sound very attractive either...

Yeah, I saw that but I didn't want to delete every single one. So I
just changed the one that fixed the build problem.

This could end up with a game of cat and mouse though. As each new
component breaks I will need to remove the -Werror from that Makefile.

I'll try to work with mainline Xen and see if for the future there is
a better fix.

>>
>>  Although, I must admit, the two errors encountered by the autobuilders come
>> from kconfig which is clearly not -Werror-clean. Perhaps their own code really
>> _is_ -Werror-clean. So we could start with this patch at least.
>
>  Now I replied to the other thread, I realized that the problem really is the
> combination of -Werror with -Wall. And a quick checks shows only three relevant
> occurrences of -Wall (but I may have missed something): two in Config.mk and one
> in tools/Rules.mk.
>
>  So, I propose to accept this patch:
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> and look into removing the -Wall if needed for other build failures.
>
>>
>>  Better still, work with upstream to find a solution.
>
>  That's still true of course :-)

Great! Thanks

Alistair

>
>
>  Regards,
>  Arnout
>
>>
>>  Regards,
>>  Arnout
>>
>>
>>> + HOSTCFLAGS += -fno-strict-aliasing
>>> +
>>> + DISTDIR     ?= $(XEN_ROOT)/dist
>>> +--
>>> +2.7.4
>>> +
>>>
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
