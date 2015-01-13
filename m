From: Ivo Slanina <ivo.slanina@gmail.com>
Date: Tue, 13 Jan 2015 11:32:07 +0100
Subject: [Buildroot] [PATCH 2/2] linux/linux.mk: fixed downloading
 kernel patches
In-Reply-To: <20150112213812.GB9000@free.fr>
References: <1421080646-26230-1-git-send-email-ivo.slanina@gmail.com>
 <1421080646-26230-2-git-send-email-ivo.slanina@gmail.com>
 <20150112213812.GB9000@free.fr>
Message-ID: <54B4F427.7080405@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann Morin,

On 01/12/2015 10:38 PM, Yann E. MORIN wrote:
> Ivo, All,
> On 2015-01-12 17:37 +0100, Ivo Slanina spake thusly:
>> Patches located at ftp or http(s) URLs were downloaded using DOWNLOAD
>> macro. For example, if linux source was located at external git
>> repository, DOWNLOAD macro uses git scheme as well and buildroot
>> tried to downlod a path using DOWNLOAD_GIT macro. As a result, nothing
>> was downloaded and build siletly passes.
> 
> I had a hard time understanding how that would be possible. So I'll
> write it here so we're sure we're speaking about the same thing. If you
> set your options to:
> 
>     BR2_LINUX_KERNEL_CUSTOM_GIT=y
>     BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://foo/bar/buz.git"
>     BR2_LINUX_KERNEL_PATCH="http://foo/bar/buz.patch"
> 
> Then this is translated in the code as:
> 
>     [linux/linux.mk]
>     else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
>     LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>     LINUX_SITE_METHOD = git
>     else [...]
> 
> which means _SITE_METHOD is set to git, and thus our DOWNLOAD_INNER
> macro relies on this to decide how to do the download:
> 
>     [package/pkg-download]
>         if test -z "$($(PKG)_SITE_METHOD)" ; then \
>             scheme="$(call geturischeme,$(1))" ; \
>         else \
>             scheme="$($(PKG)_SITE_METHOD)" ; \
>         fi ; \
> 
> So, this sounds legit, indeed.
> 
> However, I'm not too fond that we directly use the internal download
> macros. But I guess since we ecplicitly filter on schemes wget
> understands, that's pretty OK.
> 
> Which still prompts a question: what if the user has patches he want to
> download via scp? We do not handle this case for now, right. Should we?

Yes, this is true. Another solution would be to add optional parameter
to DOWNLOAD macro in order to force execute scheme="$(call geturischeme,$(1))".

When I get back from my work, I'll send another patch version :)

Regards,
Ivo Slanina

> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
>> Patches located at mentioned URLs is now downloaded directly with
>> DOWNLOAD_WGET macro.
>>
>> Signed-off-by: Ivo Slanina <ivo.slanina@gmail.com>
>> ---
>>  linux/linux.mk |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index d02b02b..29f59e8 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -148,7 +148,7 @@ define LINUX_DOWNLOAD_PATCHES
>>  	$(if $(LINUX_PATCHES),
>>  		@$(call MESSAGE,"Download additional patches"))
>>  	$(foreach patch,$(filter ftp://% http://% https://%,$(LINUX_PATCHES)),\
>> -		$(call DOWNLOAD,$(patch))$(sep))
>> +		$(call DOWNLOAD_WGET,$(patch),$(notdir $(patch)))$(sep))
>>  endef
>>  
>>  LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
>> -- 
>> 1.7.10.4
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
