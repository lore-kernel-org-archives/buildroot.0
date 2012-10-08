From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Oct 2012 23:09:55 +0200
Subject: [Buildroot] [PATCH 3/6] ttcp: convert to generic-package
	infrastructure
In-Reply-To: <1348266518-27665-4-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Sat, 22 Sep 2012 00:28:35 +0200")
References: <1348266518-27665-1-git-send-email-s.martin49@gmail.com>
 <1348266518-27665-4-git-send-email-s.martin49@gmail.com>
Message-ID: <87vcek1xi4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
 Samuel> diff --git a/package/ttcp/ttcp.mk b/package/ttcp/ttcp.mk
 Samuel> index 080286b..894b0cb 100644
 Samuel> --- a/package/ttcp/ttcp.mk
 Samuel> +++ b/package/ttcp/ttcp.mk
 Samuel> @@ -4,47 +4,25 @@
 Samuel>  #
 Samuel>  #############################################################
 Samuel>  #
 Samuel> -TTCP_VERSION:=
 Samuel> -TTCP_SOURCE_URL=http://ftp.sunet.se/pub/network/monitoring/ttcp
 Samuel> -TTCP_SOURCE=ttcp$(TTCP_VERSION).c
 Samuel> -TTCP_DIR=$(BUILD_DIR)/ttcp$(TTCP_VERSION)
 Samuel> +TTCP_VERSION =
 Samuel> +TTCP_SITE    = http://ftp.sunet.se/pub/network/monitoring/ttcp
 Samuel> +TTCP_SOURCE  = ttcp.c
 Samuel> +TTCP_LICENSE = public domain
 
 Samuel> -$(DL_DIR)/$(TTCP_SOURCE):
 Samuel> -	 $(call DOWNLOAD,$(TTCP_SOURCE_URL)/$(TTCP_SOURCE))
 Samuel> +TTCP_BINARY  = ttcp
 
 Samuel> -$(TTCP_DIR)/.unpacked: $(DL_DIR)/$(TTCP_SOURCE)
 Samuel> -	-mkdir $(TTCP_DIR)
 Samuel> -	cp -af $(DL_DIR)/$(TTCP_SOURCE) $(TTCP_DIR)
 Samuel> -	support/scripts/apply-patches.sh $(TTCP_DIR) package/ttcp/ ttcp-\*.patch
 Samuel> -	touch $(TTCP_DIR)/.unpacked
 Samuel> +define TTCP_EXTRACT_CMDS
 Samuel> +	cp -f -t $(@D) $(DL_DIR)/$(TTCP_SOURCE)
 Samuel> +endef
 
 Samuel> -$(TTCP_DIR)/.configured: $(TTCP_DIR)/.unpacked
 Samuel> -	touch $(TTCP_DIR)/.configured
 Samuel> +define TTCP_BUILD_CMDS
 Samuel> +	$(TARGET_CC) $(TARGET_CPPFLAGS) $(TARGET_CFLAGS) \
 Samuel> +		-o $(TTCP_SRCDIR)/$(TTCP_BINARY) $(@D)/$(TTCP_SOURCE)

I prefer to use $(@D) both places for consistency.
 Samuel> +endef
 
 Samuel> -$(TTCP_DIR)/ttcp: $(TTCP_DIR)/.configured
 Samuel> -	$(TARGET_CC) -O2 -o $(TTCP_DIR)/ttcp $(TTCP_DIR)/$(TTCP_SOURCE)
 Samuel> +define TTCP_INSTALL_TARGET_CMDS
 Samuel> +	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/$(TTCP_BINARY)
 Samuel> +	$(INSTALL) -D -m 0755 $(@D)/$(TTCP_BINARY) $(TARGET_DIR)/usr/bin
 Samuel> +endef

You shouldn't do the explicit strip.

You have to provide the destination file name when using install -D.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
