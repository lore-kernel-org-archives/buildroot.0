From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 25 Jul 2014 18:42:24 +0200
Subject: [Buildroot] [PATCH 1/2] apply-patches.sh: don't print anything
 when "-s" option is used
In-Reply-To: <20140721172657.GC3874@free.fr>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
 <20140721172657.GC3874@free.fr>
Message-ID: <CAHkwnC8q1Vp0SCjh1JbQLFLu9iSzeLm3_HZnTRr_=BH0gM=AWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 21, 2014 at 7:26 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-07-09 13:46 +0200, Fabio Porcedda spake thusly:
>> The make "-s" option is used to enable the "Silent operation" so if
>> that option is used don't print anything as far as there isn't any
>> error.
>> Add the "-s" option to "apply-patches.sh" to enable silent operation.
>> Because "apply-patches.sh" is called in many places add a
>> "APPLY_PATCHES" variable to permit adding the "-s" easily.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> OK, this patch does two things:
>   - introduce the APPLY_PATCHES variable, to be used instead of
>     duplicating support/scripts/apply-patches.sh everywhere,
>   - add the -s option to apply-patches
>
> So, it should be split in two.

Ok, done.

> I did not initially notice that appy-patches was not always made silent,
> but that it was conditional to the user using 'make -s' in the first
> place.
>
> So, I would not oppose that patch. After all, if the user uses make -s,
> and it is not really complicated to propagate that to our sub-tools,
> that's pretty OK.

Great!

> However, see below...
>
> [--SNIP--]
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 97053ba..e1fdb4d 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -218,6 +218,12 @@ FLEX:=$(shell which flex || type -p flex)
>>  BISON:=$(shell which bison || type -p bison)
>>  SED:=$(shell which sed || type -p sed) -i -e
>>
>> +ifeq (,$(findstring s,$(MAKEFLAGS)))
>> +APPLY_PATCHES = support/scripts/apply-patches.sh
>> +else
>> +APPLY_PATCHES = support/scripts/apply-patches.sh -s
>> +endif
>
> I would do:
>
>     BR_SILENT = $(if $(findstring s,$(MAKEFLAGS)),YES)
>
>     APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(BR_SILENT),-s)

Ok, done.

> That way, we can re-use $(BR_SILENT) for other tools (I'm thinking of
> graph-depends and our other custom tools in support/scripts/ .)

I've sent a new revision:
http://lists.busybox.net/pipermail/buildroot/2014-July/102796.html

Thanks and best regards
-- 
Fabio Porcedda
