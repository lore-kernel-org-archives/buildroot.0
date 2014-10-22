From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 22 Oct 2014 13:26:40 +0200
Subject: [Buildroot] [PATCH] Complain loudly if BR2_GLOBAL_PATCH_DIR
 does not exit
In-Reply-To: <20141021165817.GI3912@free.fr>
References: <1413880974-30138-1-git-send-email-sojka@merica.cz>
 <20141021165817.GI3912@free.fr>
Message-ID: <CAGduivxejVSE-p42u+WRBbYqc-oMNSKdd6cEqBw4ROtuKUU5sA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michal, Yann, all

On Tue, Oct 21, 2014 at 6:58 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Michal, All,
>
> On 2014-10-21 10:42 +0200, Michal Sojka spake thusly:
>> If the BR2_GLOBAL_PATCH_DIR is misspelled in the .config or if somebody
>> renamed the existing directory with patches, buildroot happily builds
>> everything but without the patches. As this can lead to surprising
>> results,
>> ---
>>  package/pkg-generic.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> index 259ee02..46d92aa 100644
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -162,6 +162,11 @@ $(BUILD_DIR)/%/.stamp_patched:
>>       $(Q)touch $@
>>       @$(call step_end,patch)
>>
>> +# Check that all directories specified in BR2_GLOBAL_PATCH_DIR exist.
>> +$(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>> +     $(if $(wildcard $(dir)),,\
>> +             $(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))
>> +
On a small note, since we already do a '[...] test -d $${D} [...]',
why don't you simply add an else condition with the error message ?
>>  # Configure
>>  $(BUILD_DIR)/%/.stamp_configured:
>>       @$(call step_start,configure)
>> --
>> 2.1.1
