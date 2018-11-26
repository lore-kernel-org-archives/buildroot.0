From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Nov 2018 10:28:29 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <20181124184708.GB20308@scaer>
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer>
Message-ID: <7ef83036-fe64-9ca2-e2d0-689f428f5fff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/11/2018 19:47, Yann E. MORIN wrote:
> Alexander, All,
> 
> Arnout, licensing question for you at the end.
> 
> On 2018-11-24 17:54 +0100, Alexander Sverdlin spake thusly:
>> This will save 1700K on target filesystem (as tested on ARM, i686).
>>
>> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>> ---
>> Changelog:
>> v2:
>> - rework target libtool instead of new package/libltdl
>>
>>  package/libtool/libtool.mk | 16 +++++++++++++---
>>  1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
>> index bf97ee12b5..b25e058bf4 100644
>> --- a/package/libtool/libtool.mk
>> +++ b/package/libtool/libtool.mk
>> @@ -7,12 +7,22 @@
>>  LIBTOOL_VERSION = 2.4.6
>>  LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.xz
>>  LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
>> +
>> +LIBTOOL_SUBDIR = libltdl
>> +HOST_LIBTOOL_SUBDIR = .

 I guess the following doesn't work?

HOST_LIBTOOL_SUBDIR =

 That is because we handle this case as follows:

ifndef $(2)_SUBDIR
 ifdef $(3)_SUBDIR
  $(2)_SUBDIR = $$($(3)_SUBDIR)
 else
  $(2)_SUBDIR ?=
 endif
endif

The problem is that 'ifndef' doesn't check if it is not defined, it checks if it
is not empty. I.e., 'ifndef' is exactly the same as 'ifeq ($(foo),)'. So if we
define HOST_LIBTOOL_SUBDIR as empty, it will take its value from the target even
if we override the host value.

 Ideally, we should fix this in the infra so we can just use
HOST_LIBTOOL_SUBDIR =
here.

 I think the solution is to change the infra into

$(2)_SUBDIR ?= $$($(3)_SUBDIR)

... which is also shorter and easier to understand.

 And ideally, all these inherit-from-target things should be changed into
something like:

$(2)_FOO ?= $$(or $$($(3)_FOO),<default>)

 As usually, I haven't tested this :-)


[snip]
> 
> So, the host presumably also builds libltdl, no? Thus, we should include
> its licensing information too;
> 
>     HOST_LIBTOOL_LICENSE = GPL-2.0+, LGPLv2.1 (libltdl)

 LGPL-2.1 instead of LGPLv2.1. And I think it has the 'or later' clause
everywhere, doesn't it?

>     HOST_LIBTOOL_LICENSE_FILES = COPYING $(LIBTOOL_SUBDIR)/COPYING.LIB
> 
> Not sure about that one, wait a bit for others to confirm before
> respinning the patch.

 Well, the idea was that when you distribute both together, the whole
effectively becomes GPL-2.0+.

 However, since the library may be used independently (if a host tool links
against libltdl), it does make sense to mention the libltdl separately.

 Ideally, the GPL-2.0+ part should also mention to what it applies. Like

HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPLv2.1 (libltdl)

(because I think libtool is the only thing that gets installed in HOST_DIR,
isn't it?)

 Regards,
 Arnout
