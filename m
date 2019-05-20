From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 May 2019 22:20:41 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/murata-cyw-fw: new package
In-Reply-To: <20190510083505.1341-2-m.niestroj@grinn-global.com>
References: <20190510083505.1341-1-m.niestroj@grinn-global.com>
 <20190510083505.1341-2-m.niestroj@grinn-global.com>
Message-ID: <20190520222041.2777147e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Fri, 10 May 2019 10:35:04 +0200
Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

I have applied your patch to next, with a few changes, see below.


> +define MURATA_CYW_FW_EXTRACT_NVRAM_PATCH
> +	$(foreach tar, $(notdir $(MURATA_CYW_FW_EXTRA_DOWNLOADS)), \
> +		$(call suitable-extractor,$(tar)) $(MURATA_CYW_FW_DL_DIR)/$(tar) | \
> +		$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -$(sep) \

I dropped the $(sep) and final backslash, as this is how we typically
write foreach loops.

> +	)
> +ifneq ($(MURATA_CYW_FW_FILES_y),)

This condition was not really needed: if this variable is empty, the
foreach loop will iterate on an empty list, and do nothing.

> +define MURATA_CYW_FW_INSTALL_TARGET_CMDS
> +	mkdir -p $(TARGET_DIR)/lib/firmware/brcm

I dropped this, and instead added the -D flag to $(INSTALL), which
takes care of creating all intermediate directories.

> +	$(foreach f,$(MURATA_CYW_FW_FILES_y), \
> +		$(INSTALL) -m 0644 $(@D)/$(f) \
> +			$(TARGET_DIR)/lib/firmware/brcm/$(call murata-cyw-fw-file-rename,$(f))$(sep))

I have dropped the $(sep) and moved the final closing parenthesis to
the next line, which does the same thing, but is a bit more common in
Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
