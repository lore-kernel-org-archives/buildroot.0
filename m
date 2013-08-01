From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Aug 2013 12:08:30 +0200
Subject: [Buildroot] ccache dependency issues
In-Reply-To: <20130801113514.495c3b0d@skate>
References: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
 <20130801113514.495c3b0d@skate>
Message-ID: <CAAXf6LVwctGqfMYiG_fLGccTS0+yubt678k1bC95H_hmkQQ3QA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 1, 2013 at 11:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 1 Aug 2013 11:26:33 +0200, Thomas De Schampheleire wrote:
>>
>> host-ccache is built is part of BASE_PKGS, which comes after the
>
> I guess you meant BASE_TARGETS.

Correct.

>
>> 'dependencies' target. This means that when the dependencies are
>> built, there will never be a ccache yet. Hence, a more global solution
>> looks to be:
>>
>> diff --git a/support/dependencies/dependencies.mk
>> b/support/dependencies/dependencies.mk
>> index a2d229c..6fd1df1 100644
>> --- a/support/dependencies/dependencies.mk
>> +++ b/support/dependencies/dependencies.mk
>> @@ -25,6 +25,7 @@ core-dependencies:
>>                 DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
>>                 $(TOPDIR)/support/dependencies/dependencies.sh
>>
>> +dependencies: HOSTCC=$(HOSTCC_NOCCACHE) HOSTCXX=$(HOSTCXX_NOCCACHE)
>>  dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)
>>
>>  dependencies-source:
>>
>> Here we force HOSTCC and HOSTCXX to the no-ccache version, only during
>> the dependencies step. This also fixes the host-tar/ccache chicken-egg
>> problem (tested), and will also help with other dependencies (for
>> example I assume that the host-xzcat will suffer from the same issue
>> when ccache is enabled).
>>
>> What do you think of this solution?
>
> This indeed looks like a much better solution. I think it would be even
> better if host-ccache was moved from BASE_TARGETS to
> DEPENDENCIES_HOST_PREREQ. I.e, the main Makefile chunk
>
> ifeq ($(BR2_CCACHE),y)
> BASE_TARGETS += host-ccache
> endif
>
> would be moved to support/dependencies/dependencies.mk as:
>
> ifeq ($(BR2_CCACHE),y)
> DEPENDENCIES_HOST_PREREQ += host-ccache
> endif
>
> and then we can also remove the usage of HOSTCC_NOCCACHE from
> package/ccache/ccache.mk.
>
> This way, all the package that should not rely on ccache availability
> are built as part of the 'dependencies' target, and as soon as we enter
> $(BASE_TARGETS), we now that we have ccache available.

We will have to start expressing some dependencies between
dependencies, I think: in order to build ccache, the package has to be
extracted, but for this one would need host-tar (or host-xzcat for
example).

This could be done by creating an order in which
support/dependencies/check-host-X.mk is included, so that
DEPENDENCIES_HOST_PREREQ is filled in a fixed order.
Alternatively, if we make an assumption that we only need such
dependencies on extract-tools (like tar, xzcat) then we can introduce
another level of dependencies.
Yet another alternative is to explicitly express the dependencies like:
host-ccache: host-tar
but this is cumbersome, and should also take into account the outcome
of suitable-host-package.


>
>> Loosely related to this: it seems there also is a HOSTCPP variable,
>> but it is never changed in the context of ccache settings (see e.g.
>> Makefile), while it is passed to configure scripts of autotools
>> packages. Shouldn't there be a HOSTCPP_NOCCACHE as well, to be
>> correct?
>
> Does executing cpp through ccache makes sense? For now, HOSTCPP is
> always 'cpp', regardless of whether ccache is enabled or not, so there
> should not be any problem.

Ah, sorry, my mistake. cpp is the pre-processor but I was confusing it with g++
(very bad naming IMO: the acronym CPP is also often used in the
context of the C++ language)

Thanks,
Thomas
