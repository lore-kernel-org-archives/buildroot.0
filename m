From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 26 Jun 2015 21:39:43 +0200
Subject: [Buildroot] [PATCH v4 1/2] packages: fix and improve support
 for top-level parallel makefile
In-Reply-To: <20150626200949.64342552@free-electrons.com>
References: <1435291134-6780-1-git-send-email-fabio.porcedda@gmail.com>
 <1435291134-6780-2-git-send-email-fabio.porcedda@gmail.com>
 <20150626200949.64342552@free-electrons.com>
Message-ID: <CAHkwnC_QGOUJHBVr1pYk+wEfaV0u+Vdsbhe_9mhzEaRREyVV1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 26, 2015 at 8:09 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Fri, 26 Jun 2015 05:58:53 +0200, Fabio Porcedda wrote:
>> To fix packages that fail to build when PARALLEL_JOBS is empty instead
>
> Which packages specifically?

At least the boost and jack2 packages fail.

>> of using an empty PARALLEL_JOBS just avoid to using it in
>
> s/avoid to/avoid/
>
>>  MAKE1 := $(HOSTMAKE) -j1
>> -MAKE := $(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>> +override MAKE = $(HOSTMAKE) \
>> +     $(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
>
> Why should we force to not use make -j for each individual package when
> top-level parallel build is used ? Maybe for some scenarios it is better
> to have 2 top-level jobs, and then 2 jobs per package ?

The good thing about GNU Make jobs is that the number of jobs
available are shared between each instance of make so if you want to
increase the number of jobs you just need to increase the <jobs> value
in  the top make -j<jobs> command.

e.g. 2 in top-level and 2 in each package, the actual cpu utilization
start from 1 to 4.
Using 4 in top-level and let make share the jobs for each packages the
cpu utilization start from 1 to 4 but you have a higher chance to use
4 processor because in this case you can have:

- 4 packages that use make1
or
- 1 package that use make but it actually use 4 processor himself
or
- 3 extract operation and 1 package that use make1


Another example, you have 8 cores, you use top-make -j8 and sub-make -j8.
This time the number of processes goes up to 64 that it's not good,
too much process take more time to be completed.
In my tests on a cpu with 8 cores -j16 is slower than -j9.

So I think it's better to let gnu make handle the jobs distribution.

BR
-- 
Fabio Porcedda
