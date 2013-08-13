From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Aug 2013 18:30:13 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] linux: add support for custom
 Mercurial repository
In-Reply-To: <20130813110914.00c661dc@skate>
References: <patchbomb.1374650577@BEANTN0L019720>
 <702ce86cc56aec78ac12.1374650580@BEANTN0L019720> <52087CBD.10501@mind.be>
 <20130813110914.00c661dc@skate>
Message-ID: <520A5F15.5040801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/08/13 11:09, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 12 Aug 2013 08:12:13 +0200, Arnout Vandecappelle wrote:
>
>>   Given that string options can't be propagated from their legacy values,
>> and since the name of an option isn't really that important, I'd keep
>> the _GIT_ names for the mercurial options as well.
>>
>>   If we do rename the option symbol names, then I would make sure that it
>> is propagated:
>>
>> 	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>>
>> + add a comment to the .legacy file so these hacks can be removed
>> eventually.
>
> Hum, I'm not sure how this articulates with the _WRAP mechanism that
> patch 1/6 is proposing. If we do this:
>
>   	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""
>
> then why would we need the _WRAP thing?

  The _WRAP thing is needed to make sure there is a user-visible boolean 
option in the legacy menu, and to make sure you only select BR2_LEGACY 
when the old option is not empty.

  However, come to think of it, wouldn't it be enough to keep it as a 
string option and add

	select BR2_LEGACY if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""

? Although I guess Thomas has tested this already.

  Looking again at the patch, though, I wonder if it works at all. Aren't 
the old options that have no symbol definition removed? I think there 
should still be a

config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
	string

in Config.in.legacy.

  But then, it will not be possible to modify the string anymore... so 
there is no escape...

  Argh, Kconfig...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
