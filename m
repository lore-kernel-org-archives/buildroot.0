From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 20:22:13 +0100
Subject: [Buildroot] [PATCH v3 1/5] Makefile: don't depend on the umask
In-Reply-To: <20141118170140.GA20682@fox>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-2-git-send-email-guido@vanguardiasur.com.ar>
 <546A6496.6050709@mind.be> <20141118170140.GA20682@fox>
Message-ID: <546B9C65.3050509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 18:01, Guido Mart?nez wrote:
> Hi Arnout, all,
> 
> On Mon, Nov 17, 2014 at 10:11:50PM +0100, Arnout Vandecappelle wrote:
>> On 17/11/14 18:19, Guido Mart?nez wrote:
>>> Some packages and BR itself create files and directories on the target
>>> with cp/mkdir/etc which depend on the umask at the time of building.
>>>
>>> To fix this, use a trick inside the Makefile which wraps all rules when
>>> the umask is not 0022. This sets the umask at the top level, and then
>>> the building process continues as usual.
>>>
>>> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
>>> ---
>>>  Makefile | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 471edf9..5ad8235 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -24,6 +24,19 @@
>>>  # You shouldn't need to mess with anything beyond this point...
>>>  #--------------------------------------------------------------
>>>  
>>> +# Trick for always running with a fixed umask
>>> +UMASK=0022
>>> +ifneq ($(shell umask),$(UMASK))
>>> +.PHONY:*
>>
>>  What is this * supposed to do? It will expand to all existing files and
>> directories in the buildroot directory... Don't you mean:
>>
>> .PHONY: all $(MAKECMDGOALS)
>>
>> ?
> Right, it was supposed to expand to existing files so we always run the
> rules, but your solution is better. In fact, I tried touching a file
> named "clean" and the "phoniness" didn't actually work, since apparently
> "%" isn't expanded for phony rules, so I used $(MAKECMDGOALS) for the
> rule too.
> 
> With Yann's comment the first patch would then be:
> 
> """
> diff --git a/Makefile b/Makefile
> index 471edf9..054a6be 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -24,6 +24,19 @@
>  # You shouldn't need to mess with anything beyond this point...
>  #--------------------------------------------------------------
>  
> +# Trick for always running with a fixed umask
> +UMASK=0022
> +ifneq ($(shell umask),$(UMASK))
> +.PHONY: all $(MAKECMDGOALS)
> +
> +all:
> +       @umask $(UMASK) && $(MAKE)
> +
> +$(MAKECMDGOALS):
> +       @umask $(UMASK) && $(MAKE) $@
> +
> +else # umask
> +
>  # This is our default rule, so must come first
>  all:
>  
> @@ -932,3 +945,5 @@ include docs/manual/manual.mk
>  -include $(BR2_EXTERNAL)/docs/*/*.mk
>  
>  .PHONY: $(noconfig_targets)
> +
> +endif #umask
> """
> 
> Does that sound good?

 Yes, sounds good.


 Regards,
 Arnout

> 
>>  Otherwise, looks good.
>>
>>  BTW wouldn't it be nice to add the umask setting to the generated Makefile in
>> the $(O) directory, to avoid another level of make?
> Sure, will do.
> 
> Thanks!
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
