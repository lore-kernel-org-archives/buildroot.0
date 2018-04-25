From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:33:44 +0200
Subject: [Buildroot] [PATCH 1/1] cowpatty: new package
In-Reply-To: <1523624400-3162-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523624400-3162-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180425233344.12628892@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guillaume,

On Fri, 13 Apr 2018 15:00:00 +0200, Guillaume W. Bres wrote:
> CowPatty is a C based tool to identify weak WPA passphrases
> contained in a pcap file.
> 
> Use the github.com/gwbres/cowpatty fork at the moment because Makefile in the mainstream is faulty.
> (-lssl flag is missing and some recipes had to be reordered).

Please use the original upstream, and add some patches (generated with
git format-patch) in package/cowpatty/ to fix the problems. Ideally,
those patches should be submitted to the upstream project.

> I will have the buildroot configuration eventually point to the original mainstrean as soon as
> Makefile is corrected.

Please don't use "I" in commit logs, but rather a formulation like: "Due
to <foo>, we chose to use ..."

Also, please wrap your commit logs to 72 characters.

> The package is easy to build, it requires the -lssl -lpcap and -lcrypto flags.
> Build tests passed for the 7 default toolchains with a simple
> config snippet made of "BR2_PACKAGE_COWPATTY=y". But please
> double check the proposed dependencies & package selections.

Messages such as "please double check the proposed ..." should not be
part of the commit log.

> I set the package to select libpcap & libopenssl at the moment.

Ditto.

> Tested & used on RPI 1 & 3 here:
> 
> 	/usr/bin/cowpatty -r eap-test.dump -f dict -s somethingclever
> 	[...]
> 	1079 passphrases tested in 97.18 seconds:  11.10 passphrases/second
> 
> I put the package in network apps. but this is more of a util. tool
> than anything, so you might want to change that to.

Don't use "I" as well here.

May I suggest that you read the commit logs from other contributors, to
see how they are typically written, and that you take inspiration from
this ?

> diff --git a/package/cowpatty/cowpatty.mk b/package/cowpatty/cowpatty.mk
> new file mode 100644
> index 0000000..8c7ec23
> --- /dev/null
> +++ b/package/cowpatty/cowpatty.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# cowpatty
> +#
> +################################################################################
> +
> +COWPATTY_VERSION = 83fd1589c142676d26cabe1d56e9ff8bb288683a
> +COWPATTY_SITE = $(call github,gwbres,cowpatty,$(COWPATTY_VERSION))
> +COWPATTY_LICENSE = GPL-2.0+

The license seems to be GPL-2.0, not GPL-2.0+. Do you see any evidence
that it is "version 2 or later" ?

> +COWPATTY_LICENSE_FILES = COPYING
> +
> +COWPATTY_DEPENDENCIES = libpcap
> +COWPATTY_DEPENDENCIES += libopenssl

Just one line is enough.

Did you verify static linking with libpcap + libnl enabled ? It might
very well fail like it did for the "reaver" package.

> +
> +define COWPATTY_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) CC=$(TARGET_CC) -C $(@D)

Please try to use $(TARGET_CONFIGURE_OPTS) instead of CC=$(TARGET_CC).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
