From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 29 Apr 2008 11:04:39 +1000
Subject: [Buildroot] question about make
In-Reply-To: <46a136670804281005t11bcda79mb985e6b78b25e717@mail.gmail.com>
References: <46a136670804281005t11bcda79mb985e6b78b25e717@mail.gmail.com>
Message-ID: <20080429010439.GB23316@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 28, 2008 at 01:05:33PM -0400, John Voltz wrote:
> I'm hoping someone can help me figure out the best way to fix the buildroot
> makefiles for the festival voices and lexicons, right now make doesn't check
> to see if you have already downloaded the tarball before it does it again.
> What's the easiest way to check for the existence of a file with make?

Make something depend on it, and add a rule to download it to fulfill
the dependency. Random example (from gzip.mk);

$(DL_DIR)/$(GZIP_SOURCE):
	 $(WGET) -P $(DL_DIR) $(GZIP_SITE)/$(GZIP_SOURCE)

gzip-source: $(DL_DIR)/$(GZIP_SOURCE)

$(GZIP_DIR)/.unpacked: $(DL_DIR)/$(GZIP_SOURCE)
	$(GZIP_CAT) $(DL_DIR)/$(GZIP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(GZIP_DIR)/.unpacked

> This is the very simplistic method that is currently used for grabbing the
> lexicons:
> 
> $(FESTLEX_STATUS_DIR)/.downloaded:
>     mkdir -p $(FESTLEX_STATUS_DIR)
> ifeq ($(BR2_PACKAGE_FESTLEX_CMU),y)
>     $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX1)
> endif
> ifeq ($(BR2_PACKAGE_FESTLEX_OALD),y)
>     $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX2)
> endif
> ifeq ($(BR2_PACKAGE_FESTLEX_POS),y)
>     $(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX3)
> endif
>     touch $@

You probably want to write something like:

$(DL_DIR)/$(LEX1):
	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX1)
$(DL_DIR)/$(LEX2):
	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX2)
$(DL_DIR)/$(LEX3):
	$(WGET) -P $(DL_DIR) $(FESTIVAL_SITE)/$(LEX3)

FESTLEX_DOWNLOAD_$(BR2_PACKAGE_FESTLEX_CMU) += $(DL_DIR)/$(LEX1)
FESTLEX_DOWNLOAD_$(BR2_PACKAGE_FESTLEX_OALD) += $(DL_DIR)/$(LEX2)
FESTLEX_DOWNLOAD_$(BR2_PACKAGE_FESTLEX_POS) += $(DL_DIR)/$(LEX3)

$(FESTLEX_DIR)/.unpacked: $(FESTLEX_DOWNLOAD_y)
	...


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
