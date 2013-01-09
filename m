From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 09 Jan 2013 21:31:02 +0100
Subject: [Buildroot] new <pkg>_CONFIG_FIXUP variable
In-Reply-To: <50ED8B13.7040701@petroprogram.com>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <201301072310.10765.yann.morin.1998@free.fr>
 <50EB4BC6.6020807@petroprogram.com>
 <201301090021.28343.yann.morin.1998@free.fr> <20130109085412.3ec3662c@skate>
 <50ED8B13.7040701@petroprogram.com>
Message-ID: <50EDD386.5030806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/09/13 16:21, Stefan Fr?berg wrote:
> Hi Thomas
>
> I tried that empty variable checking example you gave but it won't work.
> If I remove DIVINE_CONFIG_FIXUP from divine.mk it will still spit the
> "Fixing package configuration files" message
>
> This is what it looks so far. Added your variable checking and removed
> redundant '\ from sed line as Arnout said.
>
>      if test -n $($(PKG)_CONFIG_FIXUP) ; then \

  There should be quotes around "$($(PKG)_CONFIG_FIXUP)". test -n without 
arguments is true, test -n "" is false.

>          $(call MESSAGE,"Fixing package configuration files") ;\
>          for file in $($(PKG)_CONFIG_FIXUP); do \
>              if [ -e $(STAGING_DIR)/usr/bin/$${file} ]; then \

  This condition should be removed, as Thomas said.


  Regards,
  Arnout

>                  $(SED) "s,^prefix=.*,prefix=$(STAGING_DIR)/usr,g" \
>                      -e
> "s,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,g" \
>                      $(STAGING_DIR)/usr/bin/$${file} ;\
>              fi \
>          done \
>      fi
>      $(Q)touch $@
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
