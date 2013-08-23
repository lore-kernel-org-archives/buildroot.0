From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 23 Aug 2013 13:31:28 +0200
Subject: [Buildroot] [PATCH v2 2/3] package: fix generic extract target
 for top-level parallel make
In-Reply-To: <52163548.2020108@mind.be>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <1374138746-23279-3-git-send-email-fabio.porcedda@gmail.com>
 <521513E3.8080401@mind.be>
 <CAHkwnC_6k4tY_KRudG7yWp1gOi5WZnYKDwWv2gh_xBtCQhJesQ@mail.gmail.com>
 <52163548.2020108@mind.be>
Message-ID: <CAHkwnC-jcKmyrS6-RfLWsAyaVDWjviU=B_yDBvzD1A1t76FWWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 22, 2013 at 5:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 22/08/13 09:44, Fabio Porcedda wrote:
>>
>> On Wed, Aug 21, 2013 at 9:24 PM, Arnout Vandecappelle <arnout@mind.be>
>> wrote:
>>>
>>> On 18/07/13 11:12, Fabio Porcedda wrote:
>>>>
>>>>
> [snip]
>
>>>>
>>>>    $(1)-patch:           $(1)-extract $$($(2)_TARGET_PATCH)
>>>>
>>>> -$(1)-extract:          $(1)-source \
>>>> -                       $$($(2)_TARGET_EXTRACT)
>>>> +$$($(2)_TARGET_EXTRACT):       $$($(2)_TARGET_SOURCE)
>>>> +$(1)-extract:                  $$($(2)_TARGET_EXTRACT)
>>>>
>>>>    $(1)-depends:         $$($(2)_DEPENDENCIES)
>>>>
>>>>
>>>
>>>   On second observation, I don't really like this change, because it
>>> makes
>>> the extract and patch parts asymmetrical with the others. I would prefer
>>> one
>>> patch that changes it for all the targets. But then, the behaviour does
>>> change, because rebuilding one package will also trigger a rebuild of the
>>> packages that depend on it. Which may be a good thing, of course...
>>
>>
>> Do you mean a single patch that changes all the targets? IMHO the
>> patch becomes too complex, but if is the preferred way i'm fine with
>> that.
>
>
>  Yes. I estimate it will modify about 50 lines, so I don't see a problem.
>
>
>>
>> To be able to change the others targets i need to add stamp file for
>> every target inside $$($(2)_DEPENDENCIES,
>> i need to do that because a file cannot depends on a non existing file.
>
>
>  That's not true. Take the following Makefile:
>
> ----------------
> %.source:
>         touch $@
>
> %.extract: %.source
>         touch $@
>
> %.config: %.extract
>         touch $@
>
> %.build: %.config
>         touch $@
>
> X_DEPS = y z
>
> x.config: $(X_DEPS)
> x: x.build
>
> Y_DEPS = z
>
> y.config: $(Y_DEPS)
> y: y.build
>
> z.config: $(Z_DEPS)
> z: z.build
>
> .PRECIOUS: %.source %.extract
> ----------------
>
>  Type 'make x', and all the build, config, extract, source files will be
> touched in the right order.
>
>  The .PRECIOUS line may not be needed in practice, I added it here because
> there are no explicit rules involving *.source and *.extract, therefore
> these files will be deleted after a successful build.
>
>
>
>> If there is any chance that such modification is going to be accepted
>> i restart to work on the second part.
>>
>>>   Also, I think it would be nicer / clearer to put these dependencies in
>>> the
>>> %-rules at the top of the file, rather than specifying them per package.
>>
>>
>> Do you mean to put together all those rules between the %-rules
>> section and inner-generic-package function?
>> or to scatter them in the %-rules section?
>
>
>  No, I mean to do it like the example above: use the % rules to specify the
> dependencies between the stamp files, rather than an explicit rule for each
> package.
>

Thanks for the suggestions, I'll look into it.

Regards
-- 
Fabio Porcedda
