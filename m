From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 24 Apr 2013 18:25:01 +0200
Subject: [Buildroot] [RFC 2/4] package: fix generic configure for
 top-level parallel make
In-Reply-To: <20130424161153.3b3587f0@skate>
References: <1366798138-30722-1-git-send-email-fabio.porcedda@gmail.com>
 <1366798138-30722-3-git-send-email-fabio.porcedda@gmail.com>
 <20130424161153.3b3587f0@skate>
Message-ID: <CAHkwnC8WiE6+1k5YGqevHxe3kaEf4M41D4snUMLJK7B+B60EqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 24, 2013 at 4:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> Could you add a detailed commit description for patches 2, 3 and 4 ?
> Those patches are touching core infrastructure, so they should be
> explained in detail. Thanks!

Hi Thomas,
Thanks for reviewing.

I will do that in the next iteration.

Something like:

Some rules depends on the left-to-right evaluation order of prerequisites,
but that works only in non-parallel makefiles.
To fix that it must use instead a new rule to clarify that dependency.

Best regards
Fabio Porcedda

> Thomas
>
> On Wed, 24 Apr 2013 12:08:56 +0200, Fabio Porcedda wrote:
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  package/pkg-generic.mk | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 2460384..455d0ef 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -386,6 +386,8 @@ $(1)-install-host:      $(1)-build $$($(2)_TARGET_INSTALL_HOST)
>>  $(1)-build:          $(1)-configure \
>>                       $$($(2)_TARGET_BUILD)
>>
>> +$$($(2)_TARGET_CONFIGURE): $(1)-depends
>> +$(1)-configure:              $$($(2)_TARGET_CONFIGURE)
>>  ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>>  # In the normal case (no package override), the sequence of steps is
>>  #  source, by downloading
>> @@ -393,8 +395,7 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>>  #  extract
>>  #  patch
>>  #  configure
>> -$(1)-configure:              $(1)-patch $(1)-depends \
>> -                     $$($(2)_TARGET_CONFIGURE)
>> +$$($(2)_TARGET_CONFIGURE): $(1)-patch
>>
>>  $(1)-patch:          $(1)-extract $$($(2)_TARGET_PATCH)
>>
>> @@ -409,9 +410,6 @@ else
>>  #  source, by rsyncing
>>  #  depends
>>  #  configure
>> -$(1)-configure:              $(1)-depends \
>> -                     $$($(2)_TARGET_CONFIGURE)
>> -
>>  $(1)-depends:                $(1)-rsync $$($(2)_DEPENDENCIES)
>>
>>  $(1)-patch:          $(1)-rsync
>
>
>
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

--
Fabio Porcedda
