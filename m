From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Jan 2010 14:51:55 +0100
Subject: [Buildroot] [PATCH 5/8] gperf: convert to autotools
	infrastructure
In-Reply-To: <1258279977-1482-6-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sun, 15 Nov 2009 11:12:54 +0100")
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
	<1258279977-1482-6-git-send-email-llandwerlin@gmail.com>
Message-ID: <87ockfpsec.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/gperf/gperf.mk |   12 +++++++-----
 llandwerlin>  1 files changed, 7 insertions(+), 5 deletions(-)

 llandwerlin> diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
 llandwerlin> index 0dc6d6e..bb2d4f3 100644
 llandwerlin> --- a/package/gperf/gperf.mk
 llandwerlin> +++ b/package/gperf/gperf.mk
 llandwerlin> @@ -9,12 +9,14 @@ GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 llandwerlin>  GPERF_AUTORECONF = NO
 llandwerlin>  GPERF_INSTALL_STAGING = NO
 llandwerlin>  GPERF_INSTALL_TARGET = YES
 llandwerlin> -GPERF_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
 llandwerlin> +
 llandwerlin> +# install-strip rule does not exist in gperf's makefiles
 llandwerlin>  GPERF_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
 llandwerlin> -$(eval $(call AUTOTARGETS,package,gperf))
 llandwerlin> +define GPERF_INSTALL_STRIP
 llandwerlin> +$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
 llandwerlin> +endef
 
 llandwerlin> -$(GPERF_HOOK_POST_INSTALL): $(GPERF_TARGET_INSTALL_TARGET)
 llandwerlin> -	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gperf
 llandwerlin> -	touch $@
 llandwerlin> +GPERF_POST_INSTALL_HOOKS += GPERF_INSTALL_STRIP

All binaries are stripped in target-finalize, so there's no need to to
it explicitly here, otherwise it looks good.

-- 
Bye, Peter Korsgaard
