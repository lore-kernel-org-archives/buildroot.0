From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 Mar 2016 00:02:20 +0100
Subject: [Buildroot] [PATCH v2] barebox: add an option to embed
 environment image
In-Reply-To: <CAGm1_kt_fuJB9=3LPP1C0jnpBY2ijNzpGNLSf8J=kynzHC685Q@mail.gmail.com>
References: <1455698573-6480-1-git-send-email-yegorslists@googlemail.com>
 <56D209B5.70107@mind.be>
 <CAGm1_kt_fuJB9=3LPP1C0jnpBY2ijNzpGNLSf8J=kynzHC685Q@mail.gmail.com>
Message-ID: <56D61F7C.8020805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/28/16 23:50, Yegor Yefremov wrote:
> On Sat, Feb 27, 2016 at 9:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Note that this patch conflicts with Pieter's dual-config series, so it would be
>> good to combine both in a single series.
> 
> I'll rebase my patches on top of dual-config series. This patch was
> more proof of concept.
> 
>> On 02/17/16 09:42, yegorslists at googlemail.com wrote:
>>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>>
>>> Barebox provides an option to embed a custom environment image into
>>> barebox.bin. This image will be used, when the environment found in
>>> the environment sector is invalid.
>>>
>>> This patch sets barebox Kconfig option CONFIG_DEFAULT_ENVIRONMENT_PATH to user
>>> specified path. This way one can use BR's variables like BR2_EXTERNAL, TOPDIR
>>> etc. to provide paths to custom environment folders.
>>
>>  I don't understand this comment. I mean, it seems obvious that you'd have a
>> config option for it, and that you can use BR2_EXTERNAL in it, no?
> 
> What I mean is, that with this BR option one would change Barebox's
> own option. Because if you specify the path in Barebox Kconfig
> directly using BR2_EXTERNAL, it won't be expanded, so that Barebox
> build process would fail. How would you formulate this?

 Hm, now I read your commit log a second time, it was perfectly clear...

> 
>>  Also, commit log should be wrapped at 72 columns.
> 
> ACK
> 
>>>
>>> Cc: Pieter Smith <pieter@boesman.nl>
>>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>>> ---
>>> Changes:
>>>       v2: - remove qstrip
>>>           - add detailed patch description
>>>           - improve help texts
>>>
>>>  boot/barebox/Config.in  | 19 +++++++++++++++++++
>>>  boot/barebox/barebox.mk |  6 ++++++
>>>  2 files changed, 25 insertions(+)
>>>
>>> diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
>>> index 39cb5d2..ae52b2a 100644
>>> --- a/boot/barebox/Config.in
>>> +++ b/boot/barebox/Config.in
>>> @@ -121,4 +121,23 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
>>>         barebox devfs format, stored in the images directory, with
>>>         the same name as the directory name given here.
>>>
>>> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
>>> +     bool "Embed custom environment"
>>> +     help
>>> +       Embed a custom environment image into barebox.bin. In order
>>> +       to use this option you need to enable CONFIG_DEFAULT_ENVIRONMENT
>>> +       and setup desired compression type for embedded images in barebox
>>> +       itself.
>>
>>  I don't know a lot about barebox, but wouldn't it be more appropriate to select
>> those options automatically?
> 
> I can add CONFIG_DEFAULT_ENVIRONMENT, but leave compression type
> selection to Barebox config.

 Sounds good.

> 
>>> +
>>> +config BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV_PATH
>>> +     string "Embedded environment path"
>>> +     depends on BR2_TARGET_BAREBOX_CUSTOM_EMBEDDED_ENV
>>> +     help
>>> +       Barebox CONFIG_DEFAULT_ENVIRONMENT_PATH
>>> +       will be set to the path containing custom barebox
>>> +       environment. Depending on your setup, it will probably be
>>> +       based on either the content of the defaultenv or
>>> +       defaultenv-2 directories in the barebox source code, plus
>>> +       the additions needed.
>>
>>  How much sense does it make to have an embedded env that is different from the
>> custom environment specified above?
> 
> For example you can have an embedded env for production stage, that
> fetches kernel from tftp, where systems flash is empty and the real
> env comes during the production stage and will be used the next time
> the system boots. So I would keep them both separately.

 Doesn't sound like a very strong case to me, but OK, why not.

> 
>>  If I understand correctly, barebox always has a built-in default environment.
> 
> AFAIK CONFIG_DEFAULT_ENVIRONMENTdecides whether you have a built-in
> default environment or not.

 Ah of course.

 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
