From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 13 Feb 2014 10:13:46 +0100
Subject: [Buildroot] [PATCH v12 3/7] package: add support for top-level
	parallel make
In-Reply-To: <52FC6D26.6030309@mind.be>
References: <1392196751-23485-1-git-send-email-fabio.porcedda@gmail.com>
 <1392196751-23485-4-git-send-email-fabio.porcedda@gmail.com>
 <52FC6D26.6030309@mind.be>
Message-ID: <CAHkwnC8ouwgFspmA+OHVNrxF91G4DaS1ZStQ=X+cBM==ZKk9nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2014 at 7:58 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/02/14 10:19, Fabio Porcedda wrote:
>> To be able to use top-level parallel make we must not depend in a rule
>> on the order of evaluation of the prerequisites, so instead of relying
>> on the left to right ordering of evaluation of the prerequisites add
>> an explicit rule to describe the dependencies.
>>
>> We cannot use the pattern rules because they must have the same
>> dependency for every package, but we need to change the dependencies
>> depending on $(2)_OVERRIDE_SRCDIR variable value, so we must use a
>> more flexible way like $(2)_TARGET_% variables.
>>
>> So add explicit dependencies for the following stamp files:
>>   $(2)_TARGET_EXTRACT
>>   $(2)_TARGET_PATCH
>>   $(2)_TARGET_CONFIGURE
>>   $(2)_TARGET_BUILD
>>   $(2)_TARGET_INSTALL_STAGING
>>   $(2)_TARGET_INSTALL_TARGET
>>   $(2)_TARGET_INSTALL_IMAGES
>>   $(2)_TARGET_INSTALL_HOST
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
> [snip]
>> -$(1)-build:          $(1)-configure \
>> -                     $$($(2)_TARGET_BUILD)
>> +$$($(2)_TARGET_INSTALL_TARGET) $$($(2)_TARGET_INSTALL_STAGING) \
>> +$$($(2)_TARGET_INSTALL_IMAGES) $$($(2)_TARGET_INSTALL_HOST): \
>> +     $$($(2)_TARGET_BUILD)
>
>  I'd prefer to see these on separate lines:
>
> $$($(2)_TARGET_INSTALL_TARGET): $$($(2)_TARGET_BUILD)
> $$($(2)_TARGET_INSTALL_STAGING): $$($(2)_TARGET_BUILD)
> ...
>
>  And also I'd prefer them close to the corresponding $(1)-install target.

Ok, like this?

ifeq ($$($(2)_INSTALL_TARGET),YES)
$(1)-install-target:    $$($(2)_TARGET_INSTALL_TARGET)
else
$(1)-install-target:
endif
$$($(2)_TARGET_INSTALL_TARGET): $$($(2)_TARGET_BUILD)

>  By the way, for these it would actually be possible to put them in the
> pattern rule, because they don't depend on OVERRIDE_SRCDIR, right? But I
> guess we said a long time ago that it would be better to do it
> symmetrical for all targets.

Yes we said exactly that, i've already sent a patch with asymmetrical
targets that was rejected.

>
>> +
>> +$(1)-build:          $$($(2)_TARGET_BUILD)
>> +$$($(2)_TARGET_BUILD):       $$($(2)_TARGET_CONFIGURE)
>> +
>> +# The symbol "|" specify a order-only-prerequisite, this is needed for
>> +# phony requisites to avoid rebuilding every time the target.
>
>  Possible improvement of the explanation:
>
> Since $(2)_DEPENDENCIES are phony targets, they are always "newer" than
> $(2)_TARGET_CONFIGURE. This would force the configure step (and therefore
> the other steps as well) to be re-executed with every invocation of make.
> Therefore, make $(2)_DEPENDENCIES an order-only dependency by using |.


Ok

>> +
>> +$(1)-configure:                      $$($(2)_TARGET_CONFIGURE)
>> +$$($(2)_TARGET_CONFIGURE):   | $$($(2)_DEPENDENCIES)
>>
>>  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dirs prepare
>>  ifeq ($(filter $(1),$(DEPENDENCIES_HOST_PREREQ)),)
>> @@ -449,13 +458,13 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
>>  #  extract
>>  #  patch
>>  #  configure
>> -$(1)-configure:              $(1)-patch $(1)-depends \
>> -                     $$($(2)_TARGET_CONFIGURE)
>> +$$($(2)_TARGET_CONFIGURE):   $$($(2)_TARGET_PATCH)
>>
>> -$(1)-patch:          $(1)-extract $$($(2)_TARGET_PATCH)
>> +$(1)-patch:          $$($(2)_TARGET_PATCH)
>> +$$($(2)_TARGET_PATCH):       $$($(2)_TARGET_EXTRACT)
>>
>> -$(1)-extract:                $(1)-source \
>> -                     $$($(2)_TARGET_EXTRACT)
>> +$(1)-extract:                        $$($(2)_TARGET_EXTRACT)
>> +$$($(2)_TARGET_EXTRACT):     $$($(2)_TARGET_SOURCE)
>>
>>  $(1)-depends:                $$($(2)_DEPENDENCIES)
>
>  Since _CONFIGURE now explicitly depends on _DEPENDENCIES, the -depends
> target has become redundant, so you can remove it.

Well, it's fine for me, but what if somebody want just to be sure that
all the dependencies are satisfied without
downloading/patching/configuring  the package?
Do you think it's not a real or important enough use case?

>>
>> @@ -465,10 +474,9 @@ else
>>  #  source, by rsyncing
>>  #  depends
>>  #  configure
>> -$(1)-configure:              $(1)-depends \
>> -                     $$($(2)_TARGET_CONFIGURE)
>> +$$($(2)_TARGET_CONFIGURE):   $$($(2)_TARGET_RSYNC)
>>
>> -$(1)-depends:                $(1)-rsync $$($(2)_DEPENDENCIES)
>> +$(1)-depends:                $$($(2)_DEPENDENCIES)
>
>  Here as well.
>
<snip>

Thanks
-- 
Fabio Porcedda
