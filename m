From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 23 Dec 2014 09:58:02 +0100
Subject: [Buildroot] [PATCH v4] Makefile: improve detection of make "-s"
	flag
In-Reply-To: <CAHkwnC-raxb_am4p_sNzYX-0rfzHePR1UM95mha7+Pia_YnM4w@mail.gmail.com>
References: <1416419494-14916-1-git-send-email-fabio.porcedda@gmail.com>
 <20141203181701.GA4152@free.fr>
 <CAHkwnC-raxb_am4p_sNzYX-0rfzHePR1UM95mha7+Pia_YnM4w@mail.gmail.com>
Message-ID: <CAHkwnC9f4vzby0kZ8So=EWNvOp=uWkJ2ZX418M2tny9P65xZ3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 9, 2014 at 6:48 PM, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> On Wed, Dec 3, 2014 at 7:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Fabio, All,
>>
>> On 2014-11-19 18:51 +0100, Fabio Porcedda spake thusly:
>>> Because it's just checked the presence of the "s" character even a
>>>   make --warn-undefined-variables
>>> is detected as a silent build so fix this by filtering out long options.
>>>
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>> ---
>>>
>>> Notes:
>>>     v4:
>>>      - split this patch from the patch set to send to muster as bugfix
>>>     v2:
>>>      - remove spurious space at the beginning of the QUIET variable (Arnout)
>>>
>>>  Makefile | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 471edf9..6b97dc6 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -303,7 +303,7 @@ GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>>>  TARGETS :=
>>>
>>>  # silent mode requested?
>>> -QUIET := $(if $(findstring s,$(MAKEFLAGS)),-q)
>>> +QUIET := $(if $(findstring s, $(filter-out --%, $(MAKEFLAGS))),-q)
>>
>> Please, do not add a space after the comma when calling a macro. This
>> should be:
>>
>>     QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
>>
>> Yes, that's slightly less readable. But make really cuts on commas, and
>> the sapce is then part of the values, so we do not want it (it has no
>> impact in your case, though, but: consistency! ;-) )
>
> Ok done, i will push an updated path set.
>
>> Otherwise, looks good to me.

I've sent an updated version:
http://patchwork.ozlabs.org/patch/423608/

BR
-- 
Fabio Porcedda
