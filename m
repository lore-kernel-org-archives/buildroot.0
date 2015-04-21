From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Apr 2015 22:00:34 +0200
Subject: [Buildroot] [PATCH] packages: fix and improve support for
 top-level parallel makefile
In-Reply-To: <CAHkwnC88R9T-01ZQvscus7MwHop3u3i1iavHwJXXcUT42rJ7Fg@mail.gmail.com>
References: <1428328208-27211-1-git-send-email-fabio.porcedda@gmail.com>
 <55357119.9020401@mind.be>
 <CAHkwnC88R9T-01ZQvscus7MwHop3u3i1iavHwJXXcUT42rJ7Fg@mail.gmail.com>
Message-ID: <5536AC62.3020702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Thanks for your explanation, I see now why my alternative won't work.

On 21/04/15 05:01, Fabio Porcedda wrote:
> On Mon, Apr 20, 2015 at 11:35 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 06/04/15 15:50, Fabio Porcedda wrote:
>>> To fix packages that fail to build when PARALLEL_JOBS is empty instead
>>> of using an empty PARALLEL_JOBS just avoid to using it in
>>> the MAKE variable.
>>>
>>> Check the MAKEFLAGS variable to know automatically if the -j option is
>>> being used, but use the "=" operator instead of the ":=" operator
>>> because it can be checked only in a "recursively expanded variable".

 I don't understand this part though. For QUIET we use :=, so why will it not
work for MAKE? Oh, of course, it's because -j does not appear in the global
MAKEFLAGS :-(

>>> Use "override" because otherwise it's impossible to change the
>>> automatic variable "MAKE".
>>>
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> ---
>>>  Makefile            | 4 ++--
>>>  package/Makefile.in | 3 ++-
>>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 8d09725..6c2dcca 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -58,8 +58,8 @@ export HOSTARCH := $(shell uname -m | \
>>>  #
>>>  # Taking into account the above considerations, if you still want to execute
>>>  # this top-level Makefile in parallel comment the ".NOTPARALLEL" line and
>>> -# build using the following command:
>>> -#    make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))
>>> +# use the -j<jobs> option when building, e.g:
>>> +#      make -j$((`getconf _NPROCESSORS_ONLN`+1))
>>>  .NOTPARALLEL:
>>>
>>>  # absolute path
>>> diff --git a/package/Makefile.in b/package/Makefile.in
>>> index fc57427..ed68e35 100644
>>> --- a/package/Makefile.in
>>> +++ b/package/Makefile.in
>>> @@ -18,7 +18,8 @@ PARALLEL_JOBS := $(BR2_JLEVEL)
>>>  endif
>>>
>>>  MAKE1 := $(HOSTMAKE) -j1
>>> -MAKE := $(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>>> +override MAKE = $(HOSTMAKE) \
>>> +     $(if $(findstring j,$(filter-out --%,$(MAKEFLAGS))),,-j$(PARALLEL_JOBS))
>>
>>  Wouldn't it be much simpler to surround the definition of PARALLEL_JOBS at the
>> beginning of this file with
>>
>> ifeq ($(findstring j,$(filter-out --%,$(MAKEFLAGS))),)
>> ...
>> endif
>>
>> ?
> 
> I don't know the reason but the MAKEFLAGS variable is empty if is
> checked inside the "ifeq" directive, so the only way I've found to
> check it is using the "$(if ,,)" function like what is done for the
> QUIET variable.

 Right! It's actually not empty, but the -j flag is removed from it. I've done a
few tests and found no way to detect the -j flag at global scope.


> Also some packages, like boost and jack2 use the $(PARALLEL_JOBS)
> variable, if that variable isn't defined they fail to build.

 Right, I forgot about that.


 So, I tried the solution proposed in this patch extensively on a simple
Makefile to find out if everything is propagated correctly, and it seems to work
well. Therefore:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
