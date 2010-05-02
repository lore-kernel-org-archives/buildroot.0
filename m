From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 May 2010 00:02:25 +0200
Subject: [Buildroot] [PATCH 10/19] uclibc: make sure the default
	configuration doesn't ask questions
In-Reply-To: <741b47e2a65e767bc93ab4ed094248617c5e1298.1272490771.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Wed, 28 Apr 2010 23:40:51 +0200")
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<cover.1272490771.git.thomas.petazzoni@free-electrons.com>
	<741b47e2a65e767bc93ab4ed094248617c5e1298.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <878w82ezda.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since new configuration options have been added in 0.9.31, the value
 Thomas> of these configuration options should be determined, either by the
 Thomas> default configuration file we provide, or by uclibc.mk process.

 Thomas> The locale generation process should probably be improved in order to
 Thomas> allow building other locales than just en_US.

 Thomas>  ifeq ($(BR2_ENABLE_LOCALE),y)
 Thomas> -	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
 Thomas> +	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="en_US"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig

It still asks unless we add a # UCLIBC_BUILD_ALL_LOCALE is not set line
in the sed statement.

 Thomas>  else
 Thomas>  	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
 Thomas>  endif
 Thomas> @@ -325,8 +325,10 @@ else
 Thomas>  endif
 Thomas>  ifeq ($(BR2_PROGRAM_INVOCATION),y)
 Thomas>  	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y,g' $(UCLIBC_DIR)/.oldconfig
 Thomas> +	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=y,g' $(UCLIBC_DIR)/.oldconfig
 Thomas>  else
 Thomas>  	$(SED) 's,^.*UCLIBC_HAS_PROGRAM_INVOCATION_NAME.*,UCLIBC_HAS_PROGRAM_INVOCATION_NAME=n,g' $(UCLIBC_DIR)/.oldconfig
 Thomas> +	$(SED) 's,^.*UCLIBC_HAS___PROGNAME.*,UCLIBC_HAS___PROGNAME=n,g' $(UCLIBC_DIR)/.oldconfig

This only works if we add a UCLIBC_HAS___PROGNAME line to the defconfig.

I've fixed those two issues and committed, thanks.

-- 
Bye, Peter Korsgaard
