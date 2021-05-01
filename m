From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 16:43:01 +0200
Subject: [Buildroot] [PATCH 1/4] package/{skalibs, execline, s6,
 s6-dns}: change prefix and shared options
In-Reply-To: <20210407202353.GA359705@scaer>
References: <HbmuNdRmOn2PdMjzu0i70kXEVtJ7gzFTC74uRm0Le50@cp3-web-012.plabs.ch>
 <df3d4c00-dd75-73f5-ed4a-74d53b9e3467@mind.be>
 <20210407202353.GA359705@scaer>
Message-ID: <287e00ff-5ef5-281c-f753-7cd590c5966c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/04/2021 22:23, Yann E. MORIN wrote:
> Arnout, Dick, All,
> 
> On 2021-04-07 21:02 +0200, Arnout Vandecappelle spake thusly:

[snip]

>>  Hm, I'm not sure I like this...
> 
> In the state, I too am not too fond of it. However...
> 
>>  The good is obviously that it allows you to change all skarnet packages in one
>> fell swoop when that is needed.
>>
>>  However, there are also some disadvantages.
>>
>>  The main disadvantage is that it's harder for people to understand how e.g. the
>> execline package is configured. When you look at the execline.mk file, you don't
>> see what is the contents of the SHARED_SKALIBS_CONF_OPTS variable.
>>
>>  Another disadvantage is that you may introduce a dependency on the order in
>> which the different mk files are included. In this case it's fine because the
>> variable is only used inside a rule, which is always expanded after all
>> makefiles have been processed. But in general it's risky.
>>
>>  If there is shared stuff, then I personally prefer to make sure that it is made
>> clear by putting the packages that "belong together" in a subdirectory, and have
>> the shared stuff in the .mk file of that subdirectory. freescale-imx is an
>> example of that.
> 
> ... *if* the ska-related packages would really benefit from having
> shared variables, then we could look at it like we look at qt5, or as
> Arnout mentions, like freescale stuff.
> 
>> However, we try to avoid subdirectories because it's annoying
>> for other reasons, so those are conflicting forces...
>>
>>  I'm not really sure about all this, so I put the other maintainers in Cc of
>> this mail.
> 
> Neither am I; that's only 4 packages impacted, i.e. the library plus
> three packages. I am not sure this-few packages deserve shared variables.
> 
> So, for me, that's a -1 on a [-2..2] scale...

 Thus, I've marked this patch and 2/4 as Rejected.

 Regards,
 Arnout


>>  If this change turns out to be acceptable, there's a small nitpick I'd like to
>> add: since SHARED_SKALIBS_CONF_OPTS is not used by this package itself, you
>> should put it at the very end of the file, after the generic-package.
>>
>>  Oh, and please run check-package on it. SHARED_FOO_ is not allowed, it would
>> have to be FOO_SHARED_.
>>
>>  Oh, and also the refactoring should be in a separate commit from the change of
>> /usr -> /
>>
>>
>>  Regards,
>>  Arnout
>>
>>>  define SKALIBS_CONFIGURE_CMDS
>>>  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(SKALIBS_CONF_OPTS))
>>>  endef
> 
