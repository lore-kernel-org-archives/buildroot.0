From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 16 Feb 2016 16:22:19 +0100
Subject: [Buildroot] [PATCH] barebox: add an option to embed environment
	image
In-Reply-To: <CAGm1_kuuYYjAtWGH6hThAMCSQ1kYTLyaLPUHiMvAodzKDJmobg@mail.gmail.com>
References: <1455633262-27930-1-git-send-email-yegorslists@googlemail.com>
 <CAGm1_kuuYYjAtWGH6hThAMCSQ1kYTLyaLPUHiMvAodzKDJmobg@mail.gmail.com>
Message-ID: <CAGm1_kt5F03eNiQi6MZMwcwNKA982CXOpaimy33JvHqmJNcXNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 16, 2016 at 3:39 PM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> On Tue, Feb 16, 2016 at 3:34 PM,  <yegorslists@googlemail.com> wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  boot/barebox/Config.in  | 12 ++++++++++++
>>  boot/barebox/barebox.mk |  6 ++++++
>>  2 files changed, 18 insertions(+)
>>
>> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
>> index 39cb5d2..5db98c6 100644
>> --- a/boot/barebox/Config.in
>> +++ b/boot/barebox/Config.in
>> @@ -121,4 +121,16 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
>>           barebox devfs format, stored in the images directory, with
>>           the same name as the directory name given here.
>>
>> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
>> +       bool "Embed custom environment"
>> +       help
>> +         Embed a custom environment image into barebox.bin.
>> +
>> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
>> +       string "Embedded environment path"
>> +       depends on BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
>> +       help
>> +         Path to the directory containing the custom barebox
>> +         environment.
>> +
>>  endif
>> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
>> index 7715daf..73b73dd 100644
>> --- a/boot/barebox/barebox.mk
>> +++ b/boot/barebox/barebox.mk
>> @@ -72,6 +72,12 @@ define BAREBOX_BUILD_BAREBOXENV_CMDS
>>  endef
>>  endif
>>
>> +ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV),y)
>> +define BAREBOX_KCONFIG_FIXUP_CMDS
>> +       $(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH)),$(@D)/.config)

qstrip is wrong here ...

The question is should I make an "order" selection for
embedded/external image and just use the existing
BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH?

Yegor
