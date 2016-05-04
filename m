From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 4 May 2016 12:59:58 +0200
Subject: [Buildroot] [PATCH v2] barebox: add an option to embed
 environment image
In-Reply-To: <CAGm1_ku-6e-8=CXoK-ATG98yXKbV+vdBGU_R+nbpgfpU91TTbA@mail.gmail.com>
References: <1462280172-23389-1-git-send-email-yegorslists@googlemail.com>
 <0a54707b-6bc8-979d-8eac-8aa87a388f08@mind.be>
 <CAGm1_ku-6e-8=CXoK-ATG98yXKbV+vdBGU_R+nbpgfpU91TTbA@mail.gmail.com>
Message-ID: <67c82e42-73e2-5602-cc72-fe2cc0e1930a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/04/16 11:25, Yegor Yefremov wrote:
> On Tue, May 3, 2016 at 7:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 05/03/16 14:56, yegorslists at googlemail.com wrote:
[snip]
>>> +config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV
>>> +       bool "Embed custom environment"
>>> +       help
>>> +         Embed a custom environment image into barebox.bin. This option
>>> +         enables barebox internal CONFIG_DEFAULT_ENVIRONMENT option.
>>> +
>>> +config BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV_PATH
>>> +       string "Embedded environment path"
>>> +       depends on BR2_TARGET_BAREBOX_AUX_CUSTOM_EMBEDDED_ENV
>>
>>
>>  I'm not altogether sure of this, but we could remove the
>> _CUSTOM_EMBEDDED_ENV option and instead check for non-empty
>> _CUSTOM_EMBEDDED_ENV_PATH. Or was this discussed before already?
>
> No, this wasn't discussed before. I like the idea.
[snip]
>>> +       $$(call
>>> KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH),$$(@D)/.config)
>>
>>
>>  This should be qstripped and then "" added explicitly. That way, it will
>> also work when the variable is overridden from the command line.
>
> Something like that?
>
> $$(call KCONFIG_SET_OPT,CONFIG_DEFAULT_ENVIRONMENT_PATH,"$$(call
> qstrip,$$(BR2_TARGET_$(1)_CUSTOM_EMBEDDED_ENV_PATH))",$$(@D)/.config)

  Yes, but if you follow my suggestion of removing the boolean option and just 
keeping the string, you'll also need to use the qstripped string to evaluate the 
make condition, so you'd better put it in a variable $(1)_CUSTOM_EMBEDDED_ENV_PATH.

  Regards,
  Arnout

[snip]--
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
