From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Aug 2013 14:03:12 +0200
Subject: [Buildroot] ccache dependency issues
In-Reply-To: <20130801135731.2ba53f36@skate>
References: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
 <20130801113514.495c3b0d@skate>
 <CAAXf6LVwctGqfMYiG_fLGccTS0+yubt678k1bC95H_hmkQQ3QA@mail.gmail.com>
 <20130801135731.2ba53f36@skate>
Message-ID: <CAAXf6LWJPwOwVbP4VOfe2cLRLHC1Ezgk=kx2vYEpEsaMcG7bVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 1, 2013 at 1:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 1 Aug 2013 12:08:30 +0200, Thomas De Schampheleire wrote:
>
>> >> What do you think of this solution?
>> >
>> > This indeed looks like a much better solution. I think it would be even
>> > better if host-ccache was moved from BASE_TARGETS to
>> > DEPENDENCIES_HOST_PREREQ. I.e, the main Makefile chunk
>> >
>> > ifeq ($(BR2_CCACHE),y)
>> > BASE_TARGETS += host-ccache
>> > endif
>> >
>> > would be moved to support/dependencies/dependencies.mk as:
>> >
>> > ifeq ($(BR2_CCACHE),y)
>> > DEPENDENCIES_HOST_PREREQ += host-ccache
>> > endif
>> >
>> > and then we can also remove the usage of HOSTCC_NOCCACHE from
>> > package/ccache/ccache.mk.
>> >
>> > This way, all the package that should not rely on ccache availability
>> > are built as part of the 'dependencies' target, and as soon as we enter
>> > $(BASE_TARGETS), we now that we have ccache available.
>>
>> We will have to start expressing some dependencies between
>> dependencies, I think: in order to build ccache, the package has to be
>> extracted, but for this one would need host-tar (or host-xzcat for
>> example).
>>
>> This could be done by creating an order in which
>> support/dependencies/check-host-X.mk is included, so that
>> DEPENDENCIES_HOST_PREREQ is filled in a fixed order.
>> Alternatively, if we make an assumption that we only need such
>> dependencies on extract-tools (like tar, xzcat) then we can introduce
>> another level of dependencies.
>> Yet another alternative is to explicitly express the dependencies like:
>> host-ccache: host-tar
>> but this is cumbersome, and should also take into account the outcome
>> of suitable-host-package.
>
> I believe we don't have to worry about this for now. The
> dependencies.mk code looks like this (with ccache added as proposed):
>
> define suitable-host-package
> $(shell support/dependencies/check-host-$(1).sh $(2))
> endef
> -include support/dependencies/check-host-*.mk
>
> ifeq ($(BR2_STRIP_sstrip),y)
> DEPENDENCIES_HOST_PREREQ+=host-sstrip
> endif
>
> ifeq ($(BR2_CCACHE),y)
> DEPENDENCIES_HOST_PREREQ+=host-ccache
> endif
>
> So the dependencies such as host-tar and host-xzcat are always pulled
> before host-sstrip and host-ccache, so we should be all set. For sure,
> this is the case because we don't do top-level parallel build, but
> there are already many places in Buildroot that rely on ordering of
> dependencies.
>

You're right, this order is fine.

But the solution of moving host-ccache to dependencies seems so
surprisingly simple... I wonder why no-one thought of it before,
surely we are missing something?

Thanks,
Thomas
