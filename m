From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 14:06:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmodsecurity: fix build with
 libmaxminddb
In-Reply-To: <20210717203343.GX12203@scaer>
References: <20210716172016.207663-1-fontaine.fabrice@gmail.com>
 <20210717091140.GI12203@scaer>
 <CAPi7W80_mm5p24UOGj9mhZYYU7eHtadzsVGrrBVScCWoehTAeQ@mail.gmail.com>
 <20210717203343.GX12203@scaer>
Message-ID: <20210718140606.1ba06d6b@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 17 Jul 2021 22:33:43 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

>     +
>     +# configure.ac will call git to get various version strings, from
>     +# libmodsecurity itself, but also from bundled dependencies, just
>     +# for the sake of siplaying them at the end of configure.
>     +# Fake a git that returns the version for libmodescurity, to quiesce
>     +# warnings...
>     +define LIBMODSECURITY_FAKE_GIT
>     +	$(Q)mkdir -p $(@D)/.buildroot
>     +	$(Q)printf '#!/usr/bin/env sh\necho "$(LIBMODSECURITY_VERSION)"\n' \
>     +		>$(@D)/.buildroot/git
>     +	@(Q)chmod 755 $(@D)/.buildroot/git
>     +endef
>     +LIBMODSECURITY_POST_EXTRACT_HOOKS += LIBMODSECURITY_FAKE_GIT
>     +
>     +# 0001-Revert-Fix-maxminddb-link-on-FreeBSD.patch
>     +LIBMODSECURITY_AUTORECONF = YES
>     +LIBMODSECURITY_AUTORECONF_ENV = PATH="$(@D)/.buildroot:$(BR_PATH)"
>     +
>      LIBMODSECURITY_CONF_OPTS = \
>      	--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config" \
>      	--disable-examples \

Shouldn't we "simply" teach to libmodsecurity configure.ac that it may
be autoreconf'ed outside of a Git repository ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
