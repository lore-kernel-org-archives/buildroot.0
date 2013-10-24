From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 24 Oct 2013 09:41:28 +0200
Subject: [Buildroot] [PATCH v8 RESEND 1/8] package: add base dependency
 to every package
In-Reply-To: <52683BBC.7070506@mind.be>
References: <1382088860-30524-1-git-send-email-fabio.porcedda@gmail.com>
 <1382088860-30524-2-git-send-email-fabio.porcedda@gmail.com>
 <52683BBC.7070506@mind.be>
Message-ID: <CAHkwnC_3oA+DKkUxVweB0Xt5wqWt11epFujXvmStEu25hGQNOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
thanks for reviewing the patch set.

On Wed, Oct 23, 2013 at 11:12 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 18/10/13 11:34, Fabio Porcedda wrote:
>>
>> Move "dependencies" "dirs" "prepare" dependencies from "toolchain" to
>> every package.
>> This way we can build correctly every package right after the clean
>> stage.
>> As example with this commit we can build successfully the glibc right
>> after the clean stage:
>>         make clean glibc
>>
>> This is also a step forward supporting top-level parallel make.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
>
>  Although this is one of the most useful patches of the series, it is also
> the one that introduces the circular dependency. So although it looks good,
> I'm not ready to ack it.

I've found a work around:

$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare

# to prevent circular dependency
ifneq ($(1),$(DEPENDENCIES_HOST_PREREQ))
$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
endif

What do you think about that?

>
>> ---
>>   package/pkg-generic.mk           | 2 ++
>>   toolchain/toolchain/toolchain.mk | 3 +--
>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 4bba4b5..1e7154e 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -385,6 +385,8 @@ $(1)-install-host:      $(1)-build
>> $$($(2)_TARGET_INSTALL_HOST)
>>   $(1)-build:           $(1)-configure \
>>                         $$($(2)_TARGET_BUILD)
>>
>> +$$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies dirs prepare
>
>
>  Is there any reason why you changed the order here?

The order whit top-level parallel make does not matter, it's just that
i was thinking that it's the right logical order:
1: dependencies: requisite
2: dirs: create empty directories
3. prepare: add something to the empty directories

But now i understand that is "dirs prepare dependencies" or "dirs
dependencies prepare" because dirs can require host-ccache and so
directories,
nevertheless this does not matter anymore.

>
>  Regards,
>  Arnout
>
>
>> +
>>   ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>>   # In the normal case (no package override), the sequence of steps is
>>   #  source, by downloading
>> diff --git a/toolchain/toolchain/toolchain.mk
>> b/toolchain/toolchain/toolchain.mk
>> index 44ed629..8559ac9 100644
>> --- a/toolchain/toolchain/toolchain.mk
>> +++ b/toolchain/toolchain/toolchain.mk
>> @@ -14,5 +14,4 @@ endif
>>
>>   $(eval $(generic-package))
>>
>> -toolchain-source: prepare dirs dependencies
>> $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
>> -
>> +toolchain: $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake
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

Best regards
-- 
Fabio Porcedda
