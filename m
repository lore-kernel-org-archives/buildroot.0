From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Nov 2012 07:36:00 -0300
Subject: [Buildroot] [PATCH] flex: fix build for nommu systems
In-Reply-To: <50B7ED98.1030501@mind.be>
References: <1354113314-30687-1-git-send-email-gustavo@zacarias.com.ar>
 <50B7ED98.1030501@mind.be>
Message-ID: <50B88C10.6070007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/29/2012 08:19 PM, Arnout Vandecappelle wrote:
>  Two small comments.
> 
> [snip]
>> +ifeq ($(BR2_PACKAGE_FLEX_BINARY),)
> 
>  I would prefer to compare with y and swap the two branches
> (that will also make the diff much more readable...)

Sure, i left it that way because i was using another aproach before this
one (removing the binary option since it's pointless without a target
toolchain), but changed my mind after a little chat with Thomas.

>> +define FLEX_DISABLE_PROGRAM
>> +    $(SED) 's/^bin_PROGRAMS.*//' $(@D)/Makefile.in
>>   endef
>>
>> -define FLEX_UNINSTALL_LEX
>> -    -rm $(TARGET_DIR)/usr/bin/lex
>> -endef
>> +FLEX_POST_EXTRACT_HOOKS += FLEX_DISABLE_PROGRAM
> 
>  POST_PATCH_HOOKS would be more appropriate.

Really?
It's basically another patch, i can do it before (like now) it's patched
with something else or after.
If the other patches did too much damage so that the sed wouldn't work,
well, it'd probably be against buildroot policy on patches :)
Regards.
