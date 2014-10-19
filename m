From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 19 Oct 2014 22:49:21 +0200
Subject: [Buildroot] [PATCH v2] libevent: Use github call & fix patch
In-Reply-To: <54442381.3070502@mind.be>
References: <1413135162-16654-1-git-send-email-maxime.hadjinlian@gmail.com>
 <54442381.3070502@mind.be>
Message-ID: <CAGduivx9wmYM=mi9csvTtkHnkr11RJ0k==4DGiz6X2U6f87RQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all

On Sun, Oct 19, 2014 at 10:48 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/10/14 19:32, Maxime Hadjinlian wrote:
>> We want to uses the github helper since we download a generated tarball
>> from the tag anyway.
>>
>> We also need to uses AUTORECONF as theses releases don't contains
>> 'configure' and such.
>>
>> The patchs that was already present is updated to apply against
>> Makefile.am instead of Makefile.in
>>
>> The seconds patchs is backported from upstream to remove the usage of
>> $(top_src_dirs) which makes current autotools error.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>> v1 -> v2:
>>    - Fix the added patches so they have correct SoB (Thomas Petazzoni)
>>    - Add SoB (Thomas Petazzoni)
>>    - Add comment for autoreconf (Yann E. Morin)
> [snip]
>>  LIBEVENT_VERSION = 2.0.21
>> -LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
>> -LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
>> +LIBEVENT_SITE = $(call github,libevent,libevent,release-$(LIBEVENT_VERSION)-stable)
>
>  Like the addition to the manual that you created a few days ago points out:
> this is wrong, because you're replacing a release tarball with a git tag...
>
>>  LIBEVENT_INSTALL_STAGING = YES
>>  LIBEVENT_LICENSE = BSD-3c, OpenBSD
>>  LIBEVENT_LICENSE_FILES = LICENSE
>> +# Straight from the repository, need to generate autotools files
>> +LIBEVENT_AUTORECONF = YES
>
> ... which would also make this redundant. And probably the patch changes as
> well. So perhaps this one should be rejected.
Please look at the commit log of the v4 of this patch, I edited it so
the need for this patch is clearer.
>
>
>  Regards,
>  Arnout
>
>>
>>  define LIBEVENT_REMOVE_PYSCRIPT
>>       rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
