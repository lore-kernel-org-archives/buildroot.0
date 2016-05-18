From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 18 May 2016 07:41:10 -0500
Subject: [Buildroot] [PATCH 1/4] fmc: add powerpc e6500 support
In-Reply-To: <CANQCQpZ9br=NmCO4tns9SiThfBs-BkeTEMvXOs9Wi+DTDa17AQ@mail.gmail.com>
References: <1463511883-27657-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160517211405.6e6584ef@free-electrons.com>
 <CANQCQpZ9br=NmCO4tns9SiThfBs-BkeTEMvXOs9Wi+DTDa17AQ@mail.gmail.com>
Message-ID: <CANQCQpZxAM-HNkX-=jfX7yMZAhLFkwkTMJUO+4TVBxU2PcdgDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, May 17, 2016 at 4:11 PM, Matthew Weber <
matthew.weber@rockwellcollins.com> wrote:

> Thomas,
>
> On Tue, May 17, 2016 at 2:14 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Hello,
>>
>> On Tue, 17 May 2016 14:04:40 -0500, Matt Weber wrote:
>>
>> > +ifeq ($(BR2_powerpc64), y)
>>
>> Remove the sparc before "y".
>>
>> > +     EXTRA_FLAGS = "M64BIT=1"
>>
>> EXTRA_FLAGS is not a proper variable name. Remember that the variable
>> namespace is global in Buildroot, to *all* variables should be prefixed
>> by the name of the package they are related to.
>>
>> However, in this case, why not just appending to FMC_MAKE_OPTS ?
>>
>> Also, your double quotes are not needed.
>>
>> > +else
>> > +     EXTRA_FLAGS = ""
>>
>> Not needed.
>>
>> >  define FMC_BUILD_CMDS
>>
>
Thanks for the note on PLATFORM not being used.  I was missing a commit set
in my original patches.  In both fmc and fmlib I plan to add something like
the following as the first step in the BUILD_CMD

$(SED) "s:P4080:$(FMLIB_PLATFORM):g" $(@D)/source/Makefile




> >       # The linking step has dependency issues so using MAKE1
>> > -     $(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) -C $(@D)/source
>> > +     $(TARGET_MAKE_ENV) $(MAKE1) $(FMC_MAKE_OPTS) $(call
>> qstrip,$(EXTRA_FLAGS)) -C $(@D)/source
>>
>> Change not needed if you append to FMC_MAKE_OPTS.
>>
>> So, the only change needed to the .mk file is:
>>
>> ifeq ($(BR2_powerpc64),y)
>> FMC_MAKE_OPTS += M64BIT=1
>> endif
>>
>> Can you rework this?
>>
>
> Will do.
>
> -Matt
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160518/5b9bb365/attachment.html>
