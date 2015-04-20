From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 23:06:13 +0200
Subject: [Buildroot] [PATCH 2/3] manual: cvs: document that a date can
 be used instead of a tag
In-Reply-To: <CAHkwnC9rcyr4Y+ydSYiDBY2x=+3QLfGapr75E3+Do+69wbWF=Q@mail.gmail.com>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
 <1429376067-9228-3-git-send-email-fabio.porcedda@gmail.com>
 <20150419081028.GB4313@free.fr>
 <CAHkwnC-mOAdrGEt0E_FCrvf2kFZJ78UuWa+2h0a+Dco8dg49uA@mail.gmail.com>
 <5533CD7D.1070605@mind.be>
 <CAHkwnC9rcyr4Y+ydSYiDBY2x=+3QLfGapr75E3+Do+69wbWF=Q@mail.gmail.com>
Message-ID: <55356A45.5020301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/04/15 04:36, Fabio Porcedda wrote:
> On Sun, Apr 19, 2015 at 5:45 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 19/04/15 12:08, Fabio Porcedda wrote:
>>> On Sun, Apr 19, 2015 at 10:10 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>> Fabio, All,
>>>>
>>>> On 2015-04-18 18:54 +0200, Fabio Porcedda spake thusly:
>>>>> Also instead of using the generic word "timestamp" use the word "tag".
>>>>>
>>>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>>>> ---
>>>>>  docs/manual/adding-packages-generic.txt | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
>>>>> index 8cf6bb6..be754a2 100644
>>>>> --- a/docs/manual/adding-packages-generic.txt
>>>>> +++ b/docs/manual/adding-packages-generic.txt
>>>>> @@ -280,7 +280,7 @@ information is (assuming the package name is +libfoo+) :
>>>>>       Only anonymous pserver mode is supported.
>>>>>       +LIBFOO_SITE+ 'must' contain the source URL as well as the remote
>>>>>       repository directory. The module is the package name.
>>>>> -     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a timestamp.
>>>>> +     +LIBFOO_VERSION+ is 'mandatory' and 'must' be a tag or a date.
>>>>
>>>> I'd like we document the format of the date we recognise. Because, IIRC,
>>>> cvs accepts 'yesterday' as a date format, and that would be interpreted
>>>> as a tag with the current code.
>>>>
>>>> So maybe, just state something like:
>>>>
>>>>     ... or a date (YYYYMMDD:hhmmss)
>>>
>>> What about this:
>>> (<YYYY>-<MM>-<DD>[T<HH><MM>[<SS>]] e.g 2015-12-20 or 2015-12-20T1010)
>>
>>  Can a timezone be added to that? Playing with dates and times without timezone
>> is dangerous.
> 
> This one works: (<YYYY>-<MM>-<DD>[T<HH>:<MM>[:<SS>][-<ZZ>] e.g
> 2015-12-20 or 2015-12-20T10:10-00)

 Well, the example should include a timezone and mention that adding a timezone
is advisable.

 Alternatively, we could specifies that times are in UTC and set TZ=UTC in the
cvs helper.

> 
> But to made it works I must replace the ":" with "_":

 Why? The / substitution is only needed because VERSION is used in filenames,
and : is fine in filenames, no?

 Regards,
 Arnout

> 
> index bdb26b8..2beb529 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -325,14 +325,14 @@ $(2)_RAWNAME                      =  $$(patsubst
> host-%,%,$(1))
>  ifndef $(2)_VERSION
>   ifdef $(3)_VERSION
>    $(2)_DL_VERSION := $$(strip $$($(3)_VERSION))
> -  $(2)_VERSION := $$(subst /,_,$$(strip $$($(3)_VERSION)))
> +  $(2)_VERSION := $$(subst :,_,$$(subst /,_,$$(strip $$($(3)_VERSION))))
>   else
>    $(2)_VERSION = undefined
>    $(2)_DL_VERSION = undefined
>   endif
>  else
>    $(2)_DL_VERSION := $$(strip $$($(2)_VERSION))
> -  $(2)_VERSION := $$(strip $$(subst /,_,$$($(2)_VERSION)))
> +  $(2)_VERSION := $$(strip $$(subst :,_,$$(subst /,_,$$($(2)_VERSION))))
>  endif
> 
> BR
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
