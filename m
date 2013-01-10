From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 10 Jan 2013 02:16:34 +0200
Subject: [Buildroot] new <pkg>_CONFIG_FIXUP variable
In-Reply-To: <50EDD386.5030806@mind.be>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <201301072310.10765.yann.morin.1998@free.fr>
 <50EB4BC6.6020807@petroprogram.com>
 <201301090021.28343.yann.morin.1998@free.fr> <20130109085412.3ec3662c@skate>
 <50ED8B13.7040701@petroprogram.com> <50EDD386.5030806@mind.be>
Message-ID: <50EE0862.5000008@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

9.1.2013 22:31, Arnout Vandecappelle kirjoitti:
> On 01/09/13 16:21, Stefan Fr?berg wrote:
>> Hi Thomas
>>
>> I tried that empty variable checking example you gave but it won't work.
>> If I remove DIVINE_CONFIG_FIXUP from divine.mk it will still spit the
>> "Fixing package configuration files" message
>>
>> This is what it looks so far. Added your variable checking and removed
>> redundant '\ from sed line as Arnout said.
>>
>>      if test -n $($(PKG)_CONFIG_FIXUP) ; then \
>
>  There should be quotes around "$($(PKG)_CONFIG_FIXUP)". test -n
> without arguments is true, test -n "" is false.
>
Ok

>>          $(call MESSAGE,"Fixing package configuration files") ;\
>>          for file in $($(PKG)_CONFIG_FIXUP); do \
>>              if [ -e $(STAGING_DIR)/usr/bin/$${file} ]; then \
>
>  This condition should be removed, as Thomas said.
>
>
>  Regards,
>  Arnout
>

Okay.

Here is the new version

    $(Q)if test -n "$($(PKG)_CONFIG_FIXUP)" ; then \
        $(call MESSAGE,"Fixing package configuration files") ;\
            $(SED)  "s,^prefix=.*,prefix=$(STAGING_DIR)/usr,g" \
                -e "s,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,g" \
                $(addprefix
$(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_FIXUP)) ;\
    fi

If nothing else comes up then I will make a new patch of this sometime
tomorrow

Regards
Stefan
