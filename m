From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Nov 2015 23:14:48 +0100
Subject: [Buildroot] Missing 'sys/queue.h' on musl
In-Reply-To: <20151129095306.GA3630@free.fr>
References: <CANu7NGtDTbf+0uOcqZQON_E4cwQtRzqiGU=y-NGDe3jjOF0+RQ@mail.gmail.com>
 <20151128184915.6017fae9@free-electrons.com>
 <CANu7NGsZ6J3-n+zmKf+Ueds8_ePbvZydEPchfQokgqTAWhELHw@mail.gmail.com>
 <20151128192022.6bc8d7fd@free-electrons.com>
 <CANu7NGvmMFc9xADTq_ES7h=13LcnLH5yYJO9KV+8mSYSB-VVtg@mail.gmail.com>
 <20151129092811.0d05dabd@free-electrons.com> <20151129095306.GA3630@free.fr>
Message-ID: <565B78D8.6070103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29-11-15 10:53, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-11-29 09:28 +0100, Thomas Petazzoni spake thusly:
>> On Sat, 28 Nov 2015 18:42:37 -0200, Sergio Prado wrote:
>>> Instead of making each package that needs 'sys/queue.h' select this
>>> package, it would be better to select this package automatically when a
>>> musl toolchain is used. That way, we won't need to change any package.
>>>
>>> It is possible to do that?
>>
>> Well, we could probably put this logic in the toolchain virtual
>> package, since it is the common point between the internal toolchain
>> and external toolchain backends (and we need sys/queue.h in both cases).
>>
>> However, I am not sure if I wouldn't prefer packages that need
>> sys/queue.h to have an explicit dependency on the package installing
>> sys/queue.h. Since such package would itself have no dependency, it
>> would be just a matter of adding "select BR2_PACKAGE_SYS_QUEUE" in
>> Config.in and adding "sys-queue" in <pkg>_DEPENDENCIES.
>>
>> Peter, Arnout, Yann, your opinion?
> 
> I think it is best to handle it as a dependency of the toolchain
> package. That way, it is transparent to packages.
> 
> That musl refuses to carry a sys/queue.h on philosophical reasons (as
> they explain in their FAQ) while all the other main C libraries do (even
> newlib!) is not ground for making it difficult for packagers to add a
> new package.
> 
> Adding such a package would be a Buildroot peculiarity, which I would
> prefer we avoid.

 +1 to that.

 Also take into account that we only install it to staging, so there is really
nothing to gain from installing it conditionally.

 The only question is whether to do it in the toolchain virtual package (which
would be unusual to say the least), or duplicate it in the musl and external
toolchain packages. I actually think the latter is the way to go.

 When adding this, there's a small issue to take into account: a
buildroot-generated musl toolchain will already have queue.h, so for the
external toolchain support you probably have to check if it exists already in
the toolchain itself.


 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
