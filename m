From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 10 May 2011 09:08:24 +0200
Subject: [Buildroot] [PATCH 1/3] Makefile.package.in: Makes it possible
 to override the default extract commands
In-Reply-To: <1305008226-8906-2-git-send-email-a@awn.dk>
References: <1305008226-8906-1-git-send-email-a@awn.dk>
	<1305008226-8906-2-git-send-email-a@awn.dk>
Message-ID: <BANLkTinswmwVvxF=h01WYUH6Xii93t014A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/5/10 Allan W. Nielsen <a@awn.dk>:
> +# Unpack the archive using custom commands
> +$(BUILD_DIR)/%/.stamp_custom_extracted:
> + ? ? ? @$(call MESSAGE,"Extracting - custom")
> + ? ? ? $(Q)mkdir -p $(@D)
> + ? ? ? $($(PKG)_EXTRACT_CMDS)
> + ? ? ? $(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
> + ? ? ? $(Q)touch $@
> +
> +# Unpack the archive using default commands
> ?$(BUILD_DIR)/%/.stamp_extracted:
> - ? ? ? @$(call MESSAGE,"Extracting")
> + ? ? ? @$(call MESSAGE,"Extracting - default")
> ? ? ? ?$(Q)mkdir -p $(@D)
> ? ? ? ?$(Q)$(if $($(PKG)_SOURCE),$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
> ? ? ? ?$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -)

What's the point of having a specific stamp target for custom
extration? Why not just merge them both under .stamp_extracted?
