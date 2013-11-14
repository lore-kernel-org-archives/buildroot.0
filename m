From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 14 Nov 2013 10:15:58 +0100
Subject: [Buildroot] [PATCH v8 RESEND 0/8] Add support for top-level
 parallel make
In-Reply-To: <5283DB7A.6060901@mind.be>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <20131111144953.43bd80b0@skate>
 <CAHkwnC8UTtDi-ZhSCBWAgviRz-5FOEx2e+GYxKtHzBY6W8pJCw@mail.gmail.com>
 <5283DB7A.6060901@mind.be>
Message-ID: <CAHkwnC8pv6GGjz4=zuREMMNDkcQ6VQij+9oosiajya63edBHkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 13, 2013 at 9:05 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/11/13 09:39, Fabio Porcedda wrote:
>>
>> On Mon, Nov 11, 2013 at 2:49 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>>
>>> Fabio, Arnout,
>>>
>>> On Fri, 18 Oct 2013 11:34:12 +0200, Fabio Porcedda wrote:
>>>
>>>> this is a patch set for adding support for top-level parallel make in
>>>> buildroot, the common problem scattered in buildroot's top-level
>>>> makefiles is that in the rules it relies on the order of evaluation of
>>>> the prerequisites, to be able to use top-level parallel make instead
>>>> of reling on the left to right ordering of evaluation of the
>>>> prerequisites we must add an explicit rule to describe the
>>>> dependencies.
>>>
>>>
>>> I'd like to agree on a plan with this patch series. At the latest
>>> Buildroot Developer Day in Edinburgh, I think we agreed that:
>>>
>>>   (1) Enabling top-level parallel without having per-package sysroot was
>>>       not desirable, as it would make the builds non-reproducible.
>>
>>
>> What do you think if we provide an easy way to use top-level parallel make
>> that warns about the problems:
>>
>> ifeq ($(P),1)
>> $(warning Not reproducible builds use at your own risk!)
>
>
>  Such a warning will not really be visible, because it appears at the very
> beginning of the build and is immediately followed by all of the build
> output...
>
>
>> BR2_JLEVEL=
>> else
>> # This top-level Makefile can *not* be executed in parallel
>> .NOTPARALLEL:
>> endif
>
>
>  Since you only need to make this simple change in the Makefile (remove
> .NOTPARALLEL), I think it's a lot more effective for people who want
> top-level parallel builds to remove this line in their copy of buildroot. We
> also agreed at the BR developer meeting that we would add an explanatory
> comment at that location to make it clear why we disable parallel builds.
> That way, someone who wants to enable it will be aware of the risks.

Ok, I will just change the comment in the latest commit, i will add
this comment:
-# This top-level Makefile can *not* be executed in parallel
+# The parallel execution of this top-level Makefile is disabled
+# because it would make builds non-reproducible also some packages
+# have unspecified optional dependencies so if those dependencies are
+# present when the package is built, they are used, otherwise they
+# aren't (but compilation happily proceeds). This means that the
+# package order is relevant in this case, and the end result will
+# differ if the order is swapped due to parallel building.
+# Taking in account the above warnings, if you still want to execute
+# this top-level Makefile in parrallel remove/comment the following
+# line and execute:
+#      make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))

I've used a slightly modified description give by  Thomas De Schampheleire.
What do you think about that?

I think that there two problems:
- first: non reproducible build, that can be resolved just recording
the building steps and replaying it.
- second: the unspecified optional dependency that is harder to fix.

Best regards
-- 
Fabio Porcedda
