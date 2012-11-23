From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Nov 2012 09:38:16 +0100
Subject: [Buildroot] [PATCH v3 1/6] snowball-hdmiservice: new package
In-Reply-To: <50AF2BB8.8060908@calao-systems.com>
References: <1352967920-3164-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352967920-3164-2-git-send-email-gregory.hermant@calao-systems.com>
 <50AC79F3.6000807@mind.be> <50AE1C2D.8010905@calao-systems.com>
 <50AE2FE3.8020801@mind.be> <50AE61D1.7070303@calao-systems.com>
 <20121122184521.1599d90d@skate> <50AF2BB8.8060908@calao-systems.com>
Message-ID: <50AF35F8.4060806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/11/12 08:54, Gr?gory Hermant wrote:
> Le 22/11/2012 18:45, Thomas Petazzoni a ?crit :
>> Dear Gr?gory Hermant,
>>
>> On Thu, 22 Nov 2012 18:33:05 +0100, Gr?gory Hermant wrote:
>>> Le 22/11/2012 15:00, Arnout Vandecappelle a ?crit :
>>>> It should be passed in the environment, not in the make argument list.
>>>> Otherwise it will override the definition in the Makefile itself.
>>>>
>>>>   A good Makefile appends to LDFLAGS passed in from the environment, but this
>>>> is not always the case...  Anyway the worst that can happen is that the LDFLAGS
>>>> are just ignored.
>>> You mean that way:
>>>
>>> SNOWBALL_HDMISERVICE_MAKE_ENV = CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CCFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
>>>
>>> $(SNOWBALL_HDMISERVICE_MAKE_ENV) $(MAKE) -C $(@D)
>> No, just:
>>
>> $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>>
>> Thomas
>
> It doesn't work with this Makefile.
>
> Indeed if i use $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D), CC is set to the host gcc compiler.

  Silly Makefile...

  You can do either:

$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) CC="$(TARGET_CC)"

or fix the Makefile in a patch.

  But if the Makefile overrides CC, it will most likely also override all the
other stuff so passing TARGET_CONFIGURE_OPTS in the environment doesn't help
much.


  What should be our philosophy for bad Makefiles?  Fix the Makefile and try
to upstream the patch, or just work around it in a package-specific way?

  We can actually work around it generically, using:

$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS)"

but I don't like forcing flags into the CC command.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
