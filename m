From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 May 2016 21:53:41 +0200
Subject: [Buildroot] [PATCH] alsa-lib: Add option to allow calculations
 in float for soft float targets
In-Reply-To: <1462710802.22644.13.camel@embedded.rocks>
References: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
 <20160507091654.0b03f2fd@free-electrons.com>
 <1462710802.22644.13.camel@embedded.rocks>
Message-ID: <9e37a66a-58b8-6d99-04aa-a2ab4685a246@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/08/16 14:33, J?rg Krause wrote:
> On Sa, 2016-05-07 at 09:16 +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Sat,  7 May 2016 08:45:25 +0200, J?rg Krause wrote:
>>
>>> -ifeq ($(BR2_SOFT_FLOAT),y)
>>> +ifeq ($(BR2_PACKAGE_ALSA_LIB_NO_FLOAT),y)
>>>  ALSA_LIB_CONF_OPTS += --with-softfloat
>>>  endif
>>
>> So we were already passing --with-softfloat when BR2_SOFT_FLOAT=y. So
>> what your option brings is:
>>
>>  - Ability to use floating point operations when BR2_SOFT_FLOAT=y.
>>
>>  - Ability to not use floating point operations when BR2_SOFT_FLOAT
>> is
>>    disabled.
>>
>> Do you have any actual use for such possibilities ?
>
> Yes, for the first case.
>
> I want to use a feature from the alsa-lib which is opted-out at compile
> time for softfloat targets by #ifndef HAVE_SOFT_FLOAT [1]. This
> functionality requires floating point data types and libmath
> operations.
>
> I do not see any point in disabling this unconditionally for softfloat
> targets, as a software floating point library can emulate this.

  The question is: is there a point in disabling it at all, ever? Does it have a 
big impact on size, or does it require functionality which may not be available 
for a particular target arch?

  If not, I'd vote for unconditionally disabling the softfloat option.

  That said, I remember that there was some option (not sure if it was alsalib 
or another lib) to choose between floating point (accurate but slower) and fixed 
point (less accurate but faster) for some filtering operations. *That* would be 
a relevant user-settable option.

  Regards,
  Arnout


>
> [1]
> http://git.alsa-project.org/?p=alsa-lib.git;a=blob;f=src/pcm/pcm_softvo
> l.c;h=802aa4b7cb68e444b8b47e7140870141aad65ffc;hb=HEAD#l785
>
> Best regards
> J?rg Krause
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
