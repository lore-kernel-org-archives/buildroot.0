From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 2 Feb 2017 22:41:29 +0100
Subject: [Buildroot] [PATCH] core: enhance printvars
In-Reply-To: <20170131173106.GA3534@free.fr>
References: <1485641971-25278-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LUwymo-EZXVjeyjiuuaFnXSirYr4o9krs0Xkxv64=oBiQ@mail.gmail.com>
 <20170131173106.GA3534@free.fr>
Message-ID: <5e882f66-3c79-d986-7705-77e069478618@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 31-01-17 18:31, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2017-01-31 11:12 +0100, Thomas De Schampheleire spake thusly:
>> On Sat, Jan 28, 2017 at 11:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> Currently, the output of printvars copntains the name of the variable,
>>> its expanded value and its un-expanded value.
>>>
>>> However, most of the time, we need the actual, expanded value, so it can
>>> be re-used from a (non-Buildroot) infrastructure script, like a
>>> post-build script, or a build-farm driver (e.g. a Jenkins job...)
>>>
>>> Add two options that a user may set to change the output of printvars:
>>>   - RAW_VARS, if set, will drop the unexpanded value
>>>   - QUOTED_VARS, if set, will quote the expanded value
>>>
>>> So that it can be used as such:
>>>
>>>     $ make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=1 QUOTED_VARS=1
>>>     BUSYBOX_VERSION='1.26.2'
>>>
>>> And it is even possible to directly evaluate it in a shell script:
>>>
>>>     eval $(make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=1 QUOTED_VARS=1)

 That one would be nice to add to the documentation! However, I think you should
document it as XXX_VARS=YES to stay consistent with the rest of Buildroot.

>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> ---
>>>  Makefile | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 5e4bc92..67a9b5d 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -934,7 +934,7 @@ printvars:
>>>                 $(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
>>>                 $(if $(filter-out environment% default automatic, \
>>>                                 $(origin $V)), \
>>> -               $(info $V=$($V) ($(value $V)))))
>>> +               $(info $V=$(if $(QUOTED_VARS),')$($V)$(if $(QUOTED_VARS),')$(if $(RAW_VARS),, ($(value $V))))))
>>>
>>>  clean:
>>>         rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
>>> --
>>> 2.7.4
>>
>>
>> Very nice, I've been needing this a few times before too.
>>
>> I do think we should document the new flags QUOTED_VARS and RAW_VARS
>> somewhere (and in general 'printvars' itself). Perhaps here:
>> http://buildroot.uclibc.org/downloads/manual/manual.html#make-tips ?
> 
> Damned, I forgot to document it, indeed...
> 
> I was instead thinking of documenting it in the output of 'make help'.
> 
> But both there and in the manual seems OK for me. I'll do.

 IMHO 'make help' should be rather limited, the real explanation should be in
the manual.


>> Regarding naming (I realize, these are nits): RAW sounds like somehow
>> opposite of QUOTED. What about using PLAIN rather than RAW ?

 Or say it like it is: NO_UNEXPANDED_VARS.

>> An alternative is to change the default behavior to be raw/plain, and
>> add a VERBOSE option to display also the unexpanded value.
> 
> Well, I prefer not to change the current behaviour.
> 
> If others prefer we change the current behaviour, so be it. I'll wait
> for more feedback.

 I'd normally indeed prefer to not change current behaviour. However, making the
verbose one optional does make a whole lot more sense. Also, the reson to not
change current behaviour is not to break existing scripts. But using the current
output in scripts would be extremely fragile; it would require a filter that
most likely will still match (e.g. "make printvars | cut -d ' ' -f 1").

 So I'm inclined indeed to change to expanded only by default.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
