From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Sep 2012 10:45:10 +0200
Subject: [Buildroot] [PATCH] schifra: new package
In-Reply-To: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 24 Aug 2012 10:39:54 +0100")
References: <1345801194-28735-1-git-send-email-spdawson@gmail.com>
Message-ID: <87627m1d2h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed with minor changes (see below), thanks.

 spdawson> +#############################################################
 spdawson> +#
 spdawson> +# schifra
 spdawson> +#
 spdawson> +#############################################################
 spdawson> +SCHIFRA_VERSION = 0.0.1
 spdawson> +SCHIFRA_SITE = http://www.schifra.com/downloads
 spdawson> +SCHIFRA_SOURCE = schifra.tgz
 spdawson> +SCHIFRA_INSTALL_STAGING = YES
 spdawson> +SCHIFRA_LICENSE = schifra license
 spdawson> +SCHIFRA_LICENSE_FILES = schifra_license.txt
 spdawson> +
 spdawson> +SCHIFRA_MAKE_OPT = COMPILER="$(TARGET_CXX)"

We also need to pass TARGET_CFLAGS / TARGET_LDFLAGS

 spdawson> +
 spdawson> +# The examples are the only buildable artefacts.
 spdawson> +ifeq ($(BR2_PACKAGE_SCHIFRA_EXAMPLES),y)
 spdawson> +define SCHIFRA_BUILD_CMDS
 spdawson> +	$(MAKE) -C $(@D) $(SCHIFRA_MAKE_OPT) all
 spdawson> +endef
 spdawson> +endif
 spdawson> +
 spdawson> +define SCHIFRA_INSTALL_TARGET_CMDS
 spdawson> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/include
 spdawson> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/include $(@D)/schifra_*.hpp
 spdawson> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/bin
 spdawson> +	for i in `find $(@D) -type f -name 'schifra_*' -executable` ; \
 spdawson> +	do \
 spdawson> +		$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/bin $$i ; \
 spdawson> +	done

I would like to keep the examples handling seperate (similar to the
build step), so I moved it to a _TARGET_INSTALL hook.

 spdawson> +endef
 spdawson> +
 spdawson> +define SCHIFRA_INSTALL_STAGING_CMDS
 spdawson> +	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include
 spdawson> +	$(INSTALL) -m 0644 -t $(STAGING_DIR)/usr/include $(@D)/schifra_*.hpp

We typically do a loop doing install -D instead, so I changed it to that
for consistency.

-- 
Bye, Peter Korsgaard
