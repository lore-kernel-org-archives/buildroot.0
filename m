From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 12 May 2012 00:50:46 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile.in: add host python2 binary
	detection
In-Reply-To: <4FAD8F82.6010007@mind.be>
References: <1336509949-19630-1-git-send-email-s.martin49@gmail.com>
 <1336509949-19630-2-git-send-email-s.martin49@gmail.com>
 <4FAD8F82.6010007@mind.be>
Message-ID: <CAHXCMMK79cTDFU+G4h5kCNsO+3Ke+Ao0PtCdZBC=v35d01GFow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/5/12 Arnout Vandecappelle <arnout@mind.be>:
> On 05/08/12 22:45, Samuel Martin wrote:
>>
>>
>> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index df7042c..84968da 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -151,6 +151,18 @@ FLEX:=$(shell which flex || type -p flex)
>> ?BISON:=$(shell which bison || type -p bison)
>> ?SED:=$(shell which sed || type -p sed) -i -e
>>
>> +PYTHON2:=$(shell \
>> + ? ? ? which python&>/dev/null&& ?\
>> + ? ? ? ? ? ? ? python --version 2>&1 | grep -qE 'Python 2\.[6-7]*'&& ?\
>> + ? ? ? ? ? ? ? which python || \
>> + ? ? ? which python2&>/dev/null&& ?\
>> + ? ? ? ? ? ? ? python2 --version 2>&1 | grep -qE 'Python 2\.[6-7]*'&& ?\
>> + ? ? ? ? ? ? ? which python2 || \
>> + ? ? ? echo $(HOST_DIR)/usr/bin/python)
>> +HOST_PYTHON2:=$(shell \
>> + ? ? ? test $(PYTHON2) != $(HOST_DIR)/usr/bin/python || \
>> + ? ? ? echo host-python)
>> +
>
>
> ?This is probably better placed in support/dependencies, using the
> suitable-host-package infrastructure. ?Put the PYTHON2 script in
> support/dependencies/check-host-python2.sh, and create a
> support/dependencies/check-host-python2.mk containing:
>
> PYTHON2 := python python2
> PYTHON2 := $(call suitable-host-package,$(PYTHON2))
> ifeq ($(PYTHON2),$(HOST_DIR)/usr/bin/python)
> ?HOST_PYTHON2 = host-python
> endif
>
> ?Actually, maybe DEP_PYTHON2 is a better name for the dependency. ?Or
> NEEDS_PYTHON2.
>
I've never noticed this stuff before.
Looks like exactly what I wanted to do!

Thx for the tip.

> ?Regards,
> ?Arnout
>
> --
> Arnout Vandecappelle ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
> Senior Embedded Software Architect ? ? ? ? ? ? ? ? +32-16-286540
> Essensium/Mind ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium ? ? ? ? ? ? ? ?BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint: ?7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F


Cheers,

Sam
