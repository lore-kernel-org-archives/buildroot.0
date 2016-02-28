From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 28 Feb 2016 23:50:36 +0100
Subject: [Buildroot] [PATCH v2] barebox: add an option to embed
 environment image
In-Reply-To: <56D209B5.70107@mind.be>
References: <1455698573-6480-1-git-send-email-yegorslists@googlemail.com>
 <56D209B5.70107@mind.be>
Message-ID: <CAGm1_kt_fuJB9=3LPP1C0jnpBY2ijNzpGNLSf8J=kynzHC685Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 27, 2016 at 9:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Note that this patch conflicts with Pieter's dual-config series, so it would be
> good to combine both in a single series.

I'll rebase my patches on top of dual-config series. This patch was
more proof of concept.

> On 02/17/16 09:42, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Barebox provides an option to embed a custom environment image into
>> barebox.bin. This image will be used, when the environment found in
>> the environment sector is invalid.
>>
>> This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH to user
>> specified path. This way one can use BR's variables like BR2_EXTERNAL, TOPDIR
>> etc. to provide paths to custom environment folders.
>
>  I don't understand this comment. I mean, it seems obvious that you'd have a
> config option for it, and that you can use BR2_EXTERNAL in it, no?

What I mean is, that with this BR option one would change Barebox's
own option. Because if you specify the path in Barebox Kconfig
directly using BR2_EXTERNAL, it won't be expanded, so that Barebox
build process would fail. How would you formulate this?

>  Also, commit log should be wrapped at 72 columns.

ACK

>>
>> Cc: Pieter Smith <pieter@boesman.nl>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>> Changes:
>>       v2: - remove qstrip
>>           - add detailed patch description
>>           - improve help texts
>>
>>  boot/barebox/Config.in  | 19 +++++++++++++++++++
>>  boot/barebox/barebox.mk |  6 ++++++
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
>> index 39cb5d2..ae52b2a 100644
>> --- a/boot/barebox/Config.in
>> +++ b/boot/barebox/Config.in
>> @@ -121,4 +121,23 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
>>         barebox devfs format, stored in the images directory, with
>>         the same name as the directory name given here.
>>
>> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
>> +     bool "Embed custom environment"
>> +     help
>> +       Embed a custom environment image into barebox.bin. In order
>> +       to use this option you need to enable CONFIG_DEFAULT_ENVIRONMENT
>> +       and setup desired compression type for embedded images in barebox
>> +       itself.
>
>  I don't know a lot about barebox, but wouldn't it be more appropriate to select
> those options automatically?

I can add CONFIG_DEFAULT_ENVIRONMENT, but leave compression type
selection to Barebox config.

>> +
>> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
>> +     string "Embedded environment path"
>> +     depends on BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
>> +     help
>> +       Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
>> +       will be set to the path containing custom barebox
>> +       environment. Depending on your setup, it will probably be
>> +       based on either the content of the defaultenv or
>> +       defaultenv-2 directories in the barebox source code, plus
>> +       the additions needed.
>
>  How much sense does it make to have an embedded env that is different from the
> custom environment specified above?

For example you can have an embedded env for production stage, that
fetches kernel from tftp, where systems flash is empty and the real
env comes during the production stage and will be used the next time
the system boots. So I would keep them both separately.

>  If I understand correctly, barebox always has a built-in default environment.

AFAIK CONFIG_DEFAULT_ENVIRONMENTdecides whether you have a built-in
default environment or not.

Yegor

> So I think it is sufficient to have a single new option to use the
> BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH as the built-in default environment.
>
>  Of course, you may want to have only the custom built-in default environment (I
> think that that's probably the most common case). But the only thing that will
> happen is that there is one extra file in the images directory, which doesn't
> hurt IMHO.
>
>
>  Regards,
>  Arnout
>
>> +
>>  endif
>> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
>> index 7715daf..49adba0 100644
>> --- a/boot/barebox/barebox.mk
>> +++ b/boot/barebox/barebox.mk
>> @@ -72,6 +72,12 @@ define BAREBOX_BUILD_BAREBOXENV_CMDS
>>  endef
>>  endif
>>
>> +ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV),y)
>> +define BAREBOX_KCONFIG_FIXUP_CMDS
>> +     $(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,$(BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH),$(@D)/.config)
>> +endef
>> +endif
>> +
>>  ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
>>  BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
>>       $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
