From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Thu, 02 Jul 2015 10:56:49 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <20150622161302.GA32191@dkarchlinux64.currentcomm.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <20150616215022.6eb61f22@free-electrons.com>
 <5587E032.8030506@syscom-instruments.com>
 <20150622161302.GA32191@dkarchlinux64.currentcomm.com>
Message-ID: <5594FCD1.5000101@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/2015 06:13 PM, rdkehn at yahoo.com wrote:
> Hi Antony,
>
> On Mon, Jun 22, 2015 at 12:15:14PM +0200, Viallard Anthony wrote:
>> On 06/16/2015 09:50 PM, Thomas Petazzoni wrote:
>>> Dear Anthony Viallard,
>>>
>>> On Tue, 16 Jun 2015 15:21:28 +0200, Anthony Viallard wrote:
>>>
>>>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>>>> index d5b29f0..929a31c 100644
>>>> --- a/package/pkg-generic.mk
>>>> +++ b/package/pkg-generic.mk
>>>> @@ -509,6 +509,10 @@ ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
>>>>   $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>>>>   endif
>>>>
>>>> +ifeq ($$($(2)_SITE_METHOD),local)
>>>> +$$($(2)_TARGET_RSYNC): $(1)-clean-for-rebuild
>>>> +endif
>>>
>>> Why don't you use "make <pkg>-rebuild" or "make <pkg>-reconfigure" ?
>>>
>>> The problem with your proposal is that you have arbitrarily decided to
>>> make it always restart from the build step. What if some people want to
>>> restart from the install step, or the configure step ?
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>
>> Hi Thomas,
>>
>> The main thing is this not convenient. I have about 30 packages and we are a
>> team. I don't want to check after each git pull the packages which have been
>> modified and call make <pkg>-rebuild for each of them (and be aware about
>> dependencies, for example calling libraries rebuild before because the
>> <pkg>-rebuild target doesn't rebuild the dependencies).
>>
>> My patch is a quick workaround to do my needs. Moreover, like doug claims,
>> the patch doesn't work. There is an issue. I will try to find why.
>>
>> If there was a "make rebuild" target and if the "make <pkg>-rebuild" was
>> able to rebuild all the dependencies too, it will satisfy my needs.
>>
>
> Here is what I have done to support the workflow, I believe, you
> want.  I don't think... this is something that Buildroot needs to
> support natively; but, maybe it could/should be documented
> somewhere.
>
> I create a custom directory structure, let's call it 'mycustom',
> that mimics Buildroot's.  The mycustom directory contains
> proprietary bits to be incorporated into the Buildroot environment
> while keeping them separate from Buildroot.  I set
> BR2_EXTERNAL=mycustom when executing the initial make to create the
> output directory and specify the default configuration.
>
> <Buildroot>/mycustom/Config.in contains:
>          comment "MyCustom"
>
>          menu "Libraries"
>          source "$BR2_EXTERNAL/package/libmycustom/Config.in"
>          endmenu
>
>          menu "Applications"
>          source "$BR2_EXTERNAL/package/mycustomapp/Config.in"
>          endmenu
>
> In <Buildroot>/mycustom/external.mk, I add a mycustom-rebuild target
> to rebuild all of my custom packages.
>
>          mycustom-rebuild:
>              @ sed -e '1,/#.MyCustom/d' \
>                    -ne 's/^BR2_PACKAGE_\(.*\)=y/\1/p' \
>                    $(BR2_CONFIG) | \
>                      tr '[:upper:]' '[:lower:]' | \
>                      sed -e 's/_/-/' | \
>                      while read t; do \
>                              $(MAKE1) -C $(BASE_DIR) O=$(O) \
>                                      $${t}-dirclean $${t}-rebuild || exit 1; \
>                      done
>              $(MAKE) -C $(BASE_DIR) O=$(O) target-post-image
>
> Presently, Buildroot puts all user provided options at the end of
> BR2_CONFIG so it's sufficient to extract all BR2_PACKAGE_*
> definitions after the the Config.in comment "# MyCustom".  Each
> extracted BR2_CONFIG definition becomes the make target to execute
> after BR2_PACKAGE_ is stripped from the entry, it is changed to
> lower case, and '_' is changed to '-'.  For example,
> BR2_PACKAGE_LIBMYCUSTOM is transformed to libmycustom.  libmycustom
> is then used to create the libmycustom-dirclean and
> libmycustom-rebuild targets.  Lastly, the target-post-image target
> is executed to regenerate the root file system(s).
>
> With this in place, after a 'git pull', I can simply execute 'make
> mycustom-rebuild' to only rebuild all of my custom stuff.
>
> As you can see there are clearly some personal preferences in the
> mycustom-rebuild target that others may not want.  This is why I
> don't think this is something Buildroot needs to support natively.
> Anyway, maybe this will help you implement the function you want.
>
> Regards,
> ...doug
>

Hi doug,

Thanks for the hint. I will try to do the same thing on my side. But I 
think the recipe will be different for me. I don't want to rebuild all 
the packages each time but rebuild only if there is a change in the 
source code.

Regards,
Anthony.
