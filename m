From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 8 Nov 2017 00:57:40 +0100
Subject: [Buildroot] [RFCv1 4/4] core: implement per-package SDK and
 target
In-Reply-To: <20171108001139.0071f3b5@windsurf>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-5-thomas.petazzoni@free-electrons.com>
 <ab34a9ea-90a0-fc39-273d-0bd08a2c72b0@mind.be>
 <20171108001139.0071f3b5@windsurf>
Message-ID: <a54c11b5-7f05-808b-99e6-ecfc14abd153@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-11-17 00:11, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks a lot for the suggestions, I'll take them into account for the
> next version. Just a few comments/questions below.
> 
> On Tue, 7 Nov 2017 23:50:52 +0100, Arnout Vandecappelle wrote:

[snip]
>>  Also, is there a good reason not to do the rsync at the end of package
>> installation? I don't know how robust rsync is against race conditions in
>> directory or hardlink creation... OK, so I did a test and it races pretty badly
>> :-) So, could you add this to the commit log? Like:
>>
>> It is necessary to do this sequentially in the target-finalize step and not in
>> each package. Doing it in package installation means that it can be done in
>> parallel. In that case, there is a chance that two rsyncs are creating the same
>> hardlink or directory at the same time, which makes one of them fail.
> 
> I didn't think at all about doing this in parallel. 

 The point is not that you may want to do it in parallel. The point is that it
is natural to do something that needs to be done for each package at the time
you build that package. Doing stuff in finalize is always a bit weird.

> To me, the creation
> of the final/common HOST_DIR/TARGET_DIR/STAGING_DIR is not at
> all something that needs to be done while the build is on-going. And I
> could go even further: unless you call "make sdk", we technically don't
> really need to create the final/common HOST_DIR/STAGING_DIR.

 Absolutely true, it would make sense to do that in 'make sdk'.

> Only a
> TARGET_DIR is needed, and perhaps even we could avoid a global one, and
> instead have a per-filesystem image one, in order to avoid the parallel
> filesystem image creation problem.

 That's a great idea!

[snip]
>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>> index 82f8c06821..aee4011f63 100644
>>> --- a/package/pkg-generic.mk
>>> +++ b/package/pkg-generic.mk
>>> @@ -158,6 +158,7 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
>>>  $(BUILD_DIR)/%/.stamp_extracted:
>>>  	@$(call step_start,extract)
>>>  	@$(call MESSAGE,"Extracting")
>>> +	@mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR)  
>>
>>  Why do you create them here? It would make more sense to do it just before the
>> rsync, no?
> 
> I don't remember, I'll have to check again. I don't immediately see a
> reason why they would be needed before the rsync.

 A package without any dependencies will not do the rsync, and I do think you
want the directories to exist. Or maybe not, I'm not sure... Actually, shouldn't
a skeleton be installed there as well?


>>  Given the possible host-tar and host-lzip dependencies, the rsync should be
>> done here already, not in the configure step. Ouch, that's not good, because the
>> dependencies are only evaluated for the configure step... There are
>> PATCH_DEPENDENCIES, but those are only before patch. Well, I guess that's a
>> reason to keep host-tar and host-lzip as DEPENDENCIES_HOST_PREREQ :-)
> 
> These are all topics that I haven't looked at yet. So thanks for
> pointing them out. I should probably collect a TODO list on per-package
> SDK to not forget about all the things people have mentioned as things
> to look at.

 Yeah, a skeleton HOST_DIR that every package depends on would simplify that,
perhaps.

[snip]
>>  I hate adding more per-package variables. Can't you use the expanded values,
>> substituting $($(PKG)_NAME) for $(1)? Or maybe even better, change the
>> definition of TARGET_DIR etc:
>>
>> TARGET_DIR = $(if
>> $(PKG),$(PER_PACKAGE_DIR)/$($(PKG)_RAWNAME)/target,$(BASE_DIR)/target)
>>
>>  That way you also don't need to pass those variables to each individual stamp rule.
> 
> I didn't think about this, sounds like a good idea, I'll try that.
> 
> However, I'm actually planning to drop entirely having TARGET_DIR
> defined outside of package rules. What I want to have ultimately is:
> 
>  - TARGET_DIR points to the current package per-package target
>    directory. If we're outside of a package rule, TARGET_DIR has no
>    value (or possibly a bogus value such as /this/is/a/bogus/thing/).
>    Indeed, we really don't want things to directly install/mess with
>    the global/common target directory.

 bogus thing, good plan!

> 
>  - Have something like COMMON_TARGET_DIR that points to
>    $(BASE_DIR)/target, and we carefully change the places that should
>    access the COMMON_TARGET_DIR (i.e mainly target-finalize and some
>    filesystem generation stuff).

 Ack yes, sounds good.


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
