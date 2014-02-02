From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 02 Feb 2014 12:01:20 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
	BR2_EXTERNAL
In-Reply-To: <20140202102349.GC3331@free.fr>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
 <52E696A9.5070700@mind.be> <20140202102349.GC3331@free.fr>
Message-ID: <52EE2580.5070909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/02/14 11:23, Yann E. MORIN wrote:
> Arnoud, All,
>
> On 2014-01-27 18:26 +0100, Arnout Vandecappelle spake thusly:
>> On 22/01/14 21:59, Yann E. MORIN wrote:
>>> +  _BR2_EXTERNAL = $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
>>> +  ifeq ($(_BR2_EXTERNAL),)
>>> +    ifeq ($(patsubst /%,/,$(BR2_EXTERNAL)),/)
>>> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist)
>>> +    else
>>> +      $(error BR2_EXTERNAL='$(BR2_EXTERNAL)' does not exist, relatively to $(TOPDIR))
>>
>>   I don't think the limited explanation "relatively to $(TOPDIR)" warrants
>> the additional complexity of patsubsting stuff.
>
> Well, we want to tell the user why w edid not find his BR2_EXTERNAL.
> And since it can be tricky to understand that a relative path is not
> found, we do want to highlight that fact in the error message.

  For me it would be sufficient to make it "relative to the buildroot 
directory" for both the absolute and relative case.

>
>>> +    endif
>>> +  endif
>>> +  BR2_EXTERNAL := $(_BR2_EXTERNAL)
>>
>>   AFAICS there is no need to have a separate _BR2_EXTERNAL, since we'll
>> anyway error out if it is empty.
>
> I used an intermediate, since I want to display the user-supplied path
> in the error message, not the one we found (or did not find).
>
>>   So, I'd propose:
>>
>> override BR2_EXTERNAL := $(shell cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd)
>> ifeq ($(BR2_EXTERNAL),)
>> 	$(error BR2_EXTERNAL directory '$(BR2_EXTERNAL)' does not exist)
>> endif
>
> Uh? In this case $(BR2_EXTERNAL) would be empty in the error message, no?

  Silly me, of course!

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
