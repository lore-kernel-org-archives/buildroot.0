From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Nov 2014 22:41:52 +0100
Subject: [Buildroot] [PATCH v3 1/5] Makefile: don't depend on the umask
In-Reply-To: <20141117213645.GE12473@free.fr>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-2-git-send-email-guido@vanguardiasur.com.ar>
 <20141117213645.GE12473@free.fr>
Message-ID: <546A6BA0.2000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/14 22:36, Yann E. MORIN wrote:
> Guido, All,
> 
> On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
>> Some packages and BR itself create files and directories on the target
>> with cp/mkdir/etc which depend on the umask at the time of building.
>>
>> To fix this, use a trick inside the Makefile which wraps all rules when
>> the umask is not 0022. This sets the umask at the top level, and then
>> the building process continues as usual.
>>
>> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
>> ---
>>  Makefile | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 471edf9..5ad8235 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -24,6 +24,19 @@
>>  # You shouldn't need to mess with anything beyond this point...
>>  #--------------------------------------------------------------
>>  
>> +# Trick for always running with a fixed umask
>> +UMASK=0022
>> +ifneq ($(shell umask),$(UMASK))
>> +.PHONY:*
>> +
>> +all:
>> +	@umask $(UMASK) && make --no-print-directory
> 
> You should use $(MAKE) instead of just 'make'.
> 
> I'm not too fond of --no-print-directory, because it is gonna be
> inherited by all sub-makes, and especially the sub-makes that actually
> build the packages. I don't care we have an extra "Entering directory"
> message.

 Note that the generated Makefile in $(O) does add --no-print-directory...


 Regards,
 Arnout

> 
> Also, did you check how that plays with top-level parallel builds? I'm
> not too fond of it, but some users want to use it. See the comment a bit
> further in the Makefile.
> 
>> +
>> +%:
>> +	@umask $(UMASK) && make --no-print-directory $@
> 
> Ditto.
> 
> Regards,
> Yann E. MORIN.
> 
>> +else # umask
>> +
>>  # This is our default rule, so must come first
>>  all:
>>  
>> @@ -932,3 +945,5 @@ include docs/manual/manual.mk
>>  -include $(BR2_EXTERNAL)/docs/*/*.mk
>>  
>>  .PHONY: $(noconfig_targets)
>> +
>> +endif #umask
>> -- 
>> 2.1.3
>>
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
