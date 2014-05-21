From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 21 May 2014 15:14:24 +0200
Subject: [Buildroot] [PATCH 1 of 7 v2] infra: consistently use double
 dollar signs inside inner-xxx-targets
In-Reply-To: <5371E50C.7010606@mind.be>
References: <patchbomb.1399905848@argentina>
 <a0eab18241e211343bfa.1399905849@argentina>
 <5371E50C.7010606@mind.be>
Message-ID: <CAAXf6LXt9=durmGRQhgav5F0qsDtdeSzKXrks5=WGfo5dzLoQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, May 13, 2014 at 11:25 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>>
>> @@ -548,7 +550,7 @@ endif
>>  $$($(2)_TARGET_RSYNC_SOURCE):                SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
>>  $$($(2)_TARGET_RSYNC_SOURCE):                PKG=$(2)
>>  $$($(2)_TARGET_PATCH):                       PKG=$(2)
>> -$$($(2)_TARGET_PATCH):                       RAWNAME=$(patsubst host-%,%,$(1))
>> +$$($(2)_TARGET_PATCH):                       RAWNAME=$$(patsubst host-%,%,$(1))
>>  $$($(2)_TARGET_PATCH):                       PKGDIR=$(pkgdir)
>>  $$($(2)_TARGET_EXTRACT):             PKG=$(2)
>>  $$($(2)_TARGET_SOURCE):                      PKG=$(2)
>> @@ -559,9 +561,9 @@ endif
>>  # kernel case, the bootloaders case, and the normal packages case.
>>  ifeq ($(1),linux)
>>  $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
>> -else ifneq ($(filter boot/%,$(pkgdir)),)
>> +else ifneq ($$(filter boot/%,$(pkgdir)),)
>
>  $$(pkgdir) works fine here. Also, it gets evaluated only once anyway, so
> there's no speedup from using a single $.
>

While creating v3 of this patch and retesting, I bumped into a nasty
situation regarding pkgdir: the foo-patch rule is executed with the
variable PKGDIR=$(pkgdir) which I changed to PKGDIR=$$(pkgdir).
However, in that case, the foo-patch rule, which is outside
inner-targets, gets executed with the literal $(pkgdir) as PKGDIR,
which is evaluated to docs/manual (the directory of the last makefile
parsed).
As a result, package patching does not occur.

There are two solutions:
- do not double the $$ here, so keep the originial PKGDIR=$(pkgdir)
- use :=, so PKGDIR:=$(pkgdir)

I feel that if we take the first alternative, we should consistently
use $(pkgdir) like that as it is less error-prone to have it as a
general exception, than as an
exception-only-if-you-pass-it-to-non-inner-rules.
All of this is because the pkgdir variable is rather tricky.

Thanks,
Thomas
