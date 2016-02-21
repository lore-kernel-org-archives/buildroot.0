From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 23:13:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/pound: new package
In-Reply-To: <1454712192-26144-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454712192-26144-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221231329.29094844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri,  5 Feb 2016 23:43:12 +0100, Bernd Kuhls wrote:

> +POUND_VERSION = 2.7
> +POUND_SITE = http://www.apsis.ch/pound
> +POUND_SOURCE = Pound-$(POUND_VERSION).tgz
> +POUND_LICENSE = GPLv3+
> +POUND_LICENSE_FILES = GPL.txt
> +POUND_DEPENDENCIES = openssl

Unfortunately, nobody will be able to distribute binaries of this
program. The GPLv3 is incompatible with the OpenSSL license. The
authors of Pound should have planned an exception to the GPLv3, but I
haven't seen any indication of this.

I've nonetheless applied the package since well, it's not our
responsibility, but GPLv3+OpenSSL -> not good.

> +# Do not set user/group for the installed binaries.
> +define POUND_FIX_INSTALL
> +	$(SED) 's/-o proxy -g proxy//g' $(@D)/Makefile
> +endef
> +POUND_POST_CONFIGURE_HOOKS += POUND_FIX_INSTALL

I've removed this and instead passed:

	--with-owner=$(shell id -un) \
	--with-group=$(shell id -gn)

So that we install with the current user/group, which is guaranteed to
work fine. And all files get anyway re-assigned to root when creating
the final image.

Applied to next with this change!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
