From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 18:26:07 +0200
Subject: [Buildroot] [PATCH v4 1/2] packages: fix and improve support
 for top-level parallel makefile
In-Reply-To: <20150627161001.02b0fb43@free-electrons.com>
References: <1435291134-6780-1-git-send-email-fabio.porcedda@gmail.com>
 <1435291134-6780-2-git-send-email-fabio.porcedda@gmail.com>
 <20150626200949.64342552@free-electrons.com>
 <CAHkwnC_QGOUJHBVr1pYk+wEfaV0u+Vdsbhe_9mhzEaRREyVV1w@mail.gmail.com>
 <20150627161001.02b0fb43@free-electrons.com>
Message-ID: <CAHkwnC8mO6jQJnjMgbV_bYUy4StkkCuL38O9jZu19fRijK426A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 27, 2015 at 4:10 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Fabio,
>
> On Fri, 26 Jun 2015 21:39:43 +0200, Fabio Porcedda wrote:
>
>> > On Fri, 26 Jun 2015 05:58:53 +0200, Fabio Porcedda wrote:
>> >> To fix packages that fail to build when PARALLEL_JOBS is empty instead
>> >
>> > Which packages specifically?
>>
>> At least the boost and jack2 packages fail.
>
> Ok, this should probably been indicated in the commit log, in order to
> make it more specific than "To fix 'packages'".

Ok

>> The good thing about GNU Make jobs is that the number of jobs
>> available are shared between each instance of make so if you want to
>> increase the number of jobs you just need to increase the <jobs> value
>> in  the top make -j<jobs> command.
>>
>> e.g. 2 in top-level and 2 in each package, the actual cpu utilization
>> start from 1 to 4.
>> Using 4 in top-level and let make share the jobs for each packages the
>> cpu utilization start from 1 to 4 but you have a higher chance to use
>> 4 processor because in this case you can have:
>>
>> - 4 packages that use make1
>> or
>> - 1 package that use make but it actually use 4 processor himself
>> or
>> - 3 extract operation and 1 package that use make1
>>
>>
>> Another example, you have 8 cores, you use top-make -j8 and sub-make -j8.
>> This time the number of processes goes up to 64 that it's not good,
>> too much process take more time to be completed.
>> In my tests on a cpu with 8 cores -j16 is slower than -j9.
>>
>> So I think it's better to let gnu make handle the jobs distribution.
>
> Ah, I didn't know this. This is a very good explanation! Why isn't it
> part of the commit log? It very clearly explains why we want to not
> pass any -j option to the sub-makes used to build the packages.

Ok i will add it.

> However, I don't see how it properly fixes the packages that are
> directly using PARALLEL_JOBS. Yes, now, PARALLEL_JOBS is no longer
> empty. But it's going to be number of CPU + 1, which is not good when
> we're doing top-level parallel job, as you explained very well. So why
> would all make-based packages be built with "make", and packages using
> special build systems (midori, qt, qt5, jack2, cmake, boost) would
> still use a PARALLEL_JOBS number higher than 1. What is your plan to
> solve this problem?

The ideal solution is that those special build systems are capable to
use the jobs server of gnu make, but that is not an easy feat.

IMHO the pragmatical solution is to avoid the worst case, even if
using CPU+1 is not the optimal solution, it's still better than using
an inferior number and risking to leave some cpu idling.
In other words the excessive cpu utilization is less harmful than
under utilizing cpus.

BR
-- 
Fabio Porcedda
