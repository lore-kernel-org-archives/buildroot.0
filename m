From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 22:23:03 +0200
Subject: [Buildroot] [PATCHv2 1/4] Add package cryptopp
In-Reply-To: <1458227038-16383-2-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-2-git-send-email-julian@jusst.de>
Message-ID: <20160419222303.56ef0520@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 16:03:55 +0100, Julian Scheel wrote:

> +CRYPTOPP_VERSION = 5.6.3
> +CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
> +CRYPTOPP_SITE = http://cryptopp.com/
> +CRYPTOPP_LICENSE = Boost-v1.0
> +CRYPTOPP_LICENSE_FILES = License.txt
> +CRYPTOPP_INSTALL_STAGING = YES
> +
> +HOST_CRRYPTOPP_MAKE_OPTS = \

Typo in the variable name, which means it wasn't used at all. If it had
been used, you would have spotted some build issues.

> +	$(HOST_CONFIGURE_OPTS) \
> +	LDFLAGS="$(HOST_LDFLAGS)"

This line is not needed, since HOST_CONFIGURE_OPTS already contains
LDFLAGS="$(HOST_LDFLAGS)". However, I had to pass
CXXFLAGS="$(HOST_CXXFLAGS) -fPIC" to make the thing build.

> +
> +define HOST_CRYPTOPP_BUILD_CMDS
> +	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) -f GNUmakefile
> +	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) libcryptopp.so

Having two lines is not needed, building the "shared" target is
sufficient.

> +endef
> +
> +define HOST_CRYPTOPP_INSTALL_CMDS
> +	$(INSTALL) -d ${HOST_DIR}/usr/include/cryptopp
> +	$(INSTALL) -D -m 644 $(@D)/*.h ${HOST_DIR}/usr/include/cryptopp/
> +	$(INSTALL) -D -m 0755 $(@D)/libcryptopp.so ${HOST_DIR}/usr/lib/libcryptopp.so

Using the "install" target is sufficient, so I've used that instead.

> +endef
> +
> +define HOST_CRYPTOPP_EXTRACT_CMDS
> +	$(UNZIP) $(DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
> +endef

Since extract is the first step, we usually put this before the
build/install commands.

I've fixed up those issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
