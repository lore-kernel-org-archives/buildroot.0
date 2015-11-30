From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Nov 2015 22:34:21 +0100
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <20151130173202.4f4933cc@free-electrons.com>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
 <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
 <20151129092811.0d05dabd@free-electrons.com> <20151129095306.GA3630@free.fr>
 <565B78D8.6070103@mind.be> <20151129233338.261cf080@free-electrons.com>
 <87h9k3n4f9.fsf@dell.be.48ers.dk>
 <CANu7NGuKGNtVyiWqN=KW1kW5zQA35NLaFVE2JP4GoS0wh3vuqw@mail.gmail.com>
 <20151130173202.4f4933cc@free-electrons.com>
Message-ID: <565CC0DD.6010206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-11-15 17:32, Thomas Petazzoni wrote:
> Dear Sergio Prado,
> 
> On Mon, 30 Nov 2015 13:07:36 -0200, Sergio Prado wrote:
> 
>> I have created a package called sys-queue that will only install queue.h on
>> the staging dir.
>>
>> Then to make musl generated toolchain depends on sys-queue, I added the
>> following lines to toolchain/toolchain-buildroot/toolchain-buildroot.mk:
>>
>> ifeq ($(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
>> TOOLCHAIN_BUILDROOT_DEPENDENCIES += sys-queue
>> endif
>>
>> It worked like a charm. Is this the correct approach?
> 
> No, because this will only work for internal toolchains. So instead,
> you need to put this dependency in two places:

 That's what Sergio was doing...

> 
>  1/ In package/musl/musl.mk, where it should be an unconditional
>     dependency.
> 
>  2/ In toolchain/toolchain-external/toolchain-external.mk, where it
>     should be conditional on BR2_TOOLCHAIN_USES_MUSL.
> 
>> Also, I am struggling to find out a way to do the same thing on the
>> external toolchain. Using the DEPENDENCIES approach, it will process the
>> sys-queue package before the external toolchain package, and it is best to
>> do it after. Any ideas?
> 
> Is it really a problem if it is processed before?

 It's actually good if it is processed before, so if there is a queue.h in the
external toolchain after all (e.g. for a buildroot-built external toolchain), it
will overwrite ours. At least, I think that that is what we want.

 Regards,
 Arnout

> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
