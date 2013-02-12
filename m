From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Feb 2013 18:01:44 +0100
Subject: [Buildroot] [PATCH] aircrack-ng: new package
In-Reply-To: <CAA1eMkHU92kZyhp_ChMFfPDRLViGNmmM-M+NbXWBNFs1ghh7nA@mail.gmail.com>
References: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
 <20130208163229.553918e3@skate> <51155F6E.5090806@mind.be>
 <CAA1eMkHU92kZyhp_ChMFfPDRLViGNmmM-M+NbXWBNFs1ghh7nA@mail.gmail.com>
Message-ID: <511A7578.6010501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/02/13 16:08, Laurent CANS wrote:
> Arnout, Thomas,
>
> I tried to use $(TARGET_CONFIGURE_OPTS) passed by variable or by
> environment but the 2 methods fails.
>
> What is the correct methode to handle this?
> - Correct package makefiles
> - Don't use $(TARGET_CONFIGURE_OPTS) but CC and LD fixed by variable
> - Another solution
>
> Best regards,
>
> Laurent

  Laurent,

  First of all, please don't top-post, but cut down the quoted message to 
the relevant parts and reply under them, like below.

>
> 2013/2/8 Arnout Vandecappelle <arnout@mind.be>:
>> On 08/02/13 16:32, Thomas Petazzoni wrote:
>>> On Fri,  8 Feb 2013 17:16:29 +0100, Laurent Cans wrote:
[snip]
>>>> +
>>>> +define AIRCRACK_NG_BUILD_CMDS
>>>> +      $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
>>>> $(AIRCRACK_NG_OPTS) all
>>>> +endef
>>>
>>>
>>> Use $(TARGET_CONFIGURE_OPTS) :
>>>
>>>          $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(AIRCRACK_NG_OPTS) all
>>
>>
>>   If it works, I prefer to put the TARGET_CONFIGURE_OPTS in the environment
>> instead:
>>
>> $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(AIRCRACK_NG_MAKE_OPTS) all
>>
>> That gives the Makefile the possibility to append to CFLAGS and LDFLAGS, if
>> necessary. However, some Makefiles unconditionally set CFLAGS or LDFLAGS (or
>> even CC), in that case passing through the environment doesn't work.

  If setting $(TARGET_CONFIGURE_OPTS) in the environment doesn't work, 
then you can try setting it on the command line instead. If that doesn't 
work either, it indicates that something funny is done in the Makefile 
and it's important to find out what exactly. Probably it's a matter of 
CFLAGS or LDFLAGS that need to be set, but are now overridden from the 
command line.

  In that case, the best option is to fix the Makefile (and upstream the 
fix). A less preferred option is something like:

$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
   CC="$(TARGET_CC)" LD="$(TARGET_LD)" $(AIRCRACK_NG_MAKE_OPTS) all

i.e. use the command line to force CC and LD and pass the things that the 
Makefile needs to have control over (CFLAGS and LDFLAGS) through the 
environment.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
