From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Mon, 22 Jun 2015 12:15:14 +0200
Subject: [Buildroot] [PATCH 1/1] Force rebuild of local site packages
 and theirs local dependencies
In-Reply-To: <20150616215022.6eb61f22@free-electrons.com>
References: <1434460888-30770-1-git-send-email-viallard@syscom-instruments.com>
 <20150616215022.6eb61f22@free-electrons.com>
Message-ID: <5587E032.8030506@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/2015 09:50 PM, Thomas Petazzoni wrote:
> Dear Anthony Viallard,
>
> On Tue, 16 Jun 2015 15:21:28 +0200, Anthony Viallard wrote:
>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index d5b29f0..929a31c 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -509,6 +509,10 @@ ifeq ($$(filter $(1),$$(DEPENDENCIES_HOST_PREREQ)),)
>>   $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
>>   endif
>>
>> +ifeq ($$($(2)_SITE_METHOD),local)
>> +$$($(2)_TARGET_RSYNC): $(1)-clean-for-rebuild
>> +endif
>
> Why don't you use "make <pkg>-rebuild" or "make <pkg>-reconfigure" ?
>
> The problem with your proposal is that you have arbitrarily decided to
> make it always restart from the build step. What if some people want to
> restart from the install step, or the configure step ?
>
> Thanks,
>
> Thomas
>

Hi Thomas,

The main thing is this not convenient. I have about 30 packages and we 
are a team. I don't want to check after each git pull the packages which 
have been modified and call make <pkg>-rebuild for each of them (and be 
aware about dependencies, for example calling libraries rebuild before 
because the <pkg>-rebuild target doesn't rebuild the dependencies).

My patch is a quick workaround to do my needs. Moreover, like doug 
claims, the patch doesn't work. There is an issue. I will try to find why.

If there was a "make rebuild" target and if the "make <pkg>-rebuild" was 
able to rebuild all the dependencies too, it will satisfy my needs.

Regards,
Anthony.
