From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 20 Jul 2013 00:07:59 +0200
Subject: [Buildroot] [PATCHv2 2/3] eglibc/arm: doesn't build in thumb(1)
	mode
In-Reply-To: <1374239193-23811-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 19 Jul 2013 10:06:32 -0300")
References: <buildroot@busybox.net>
 <1374239193-23811-1-git-send-email-gustavo@zacarias.com.ar>
 <1374239193-23811-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87li52td8g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> It runs out of registers, so build it in ARM mode, EABI mandates
 Gustavo> interworking so this isn't an issue.
 Gustavo> Tested in an arm920t board.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/eglibc/eglibc.mk | 8 +++++++-
 Gustavo>  1 file changed, 7 insertions(+), 1 deletion(-)

 Gustavo> diff --git a/package/eglibc/eglibc.mk b/package/eglibc/eglibc.mk
 Gustavo> index 5431ac5..253dabd 100644
 Gustavo> --- a/package/eglibc/eglibc.mk
 Gustavo> +++ b/package/eglibc/eglibc.mk
 Gustavo> @@ -23,6 +23,11 @@ EGLIBC_INSTALL_STAGING = YES

 Gustavo>  EGLIBC_INSTALL_STAGING_OPT = install_root=$(STAGING_DIR) install

 Gustavo> +# Thumb build is broken, build in ARM mode
 Gustavo> +ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 Gustavo> +EGLIBC_EXTRA_CFLAGS += -marm
 Gustavo> +endif
 Gustavo> +
 Gustavo>  # Even though we use the autotools-package infrastructure, we have to
 Gustavo>  # override the default configure commands for several reasons:
 Gustavo>  #
 Gustavo> @@ -36,7 +41,8 @@ define EGLIBC_CONFIGURE_CMDS
 Gustavo>  	# Do the configuration
 Gustavo>  	(cd $(@D)/build; \
 Gustavo>  		$(TARGET_CONFIGURE_OPTS) \
 Gustavo> -		CFLAGS="-O2" CPPFLAGS="" CXXFLAGS="-O2" \
 Gustavo> +		CFLAGS="-O2 $(EGLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \

I know you didn't add this, but why are we forcing -O2 here? Thomas?

-- 
Bye, Peter Korsgaard
