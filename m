From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:28:25 +0200
Subject: [Buildroot] [PATCH v2] circus: new package
In-Reply-To: <1467729693-27460-1-git-send-email-yegorslists@googlemail.com>
References: <1467729693-27460-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160705172825.1aa57f88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Jul 2016 16:41:33 +0200, yegorslists at googlemail.com wrote:

> +	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	depends on BR2_USE_WCHAR # zeromq
> +	depends on BR2_INSTALL_LIBSTDCPP # zeromq
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq

zeromq is not selected anywhere in this package, so these comments
where a bit confusing. Instead, I've added "# pyzmq -> zeromq" which
makes it clear where the dependency comes from.

> +comment "circus needs a toolchain w/ C++, wchar, threads and Python2/3"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
> +		BR2_TOOLCHAIN_HAS_THREADS && (BR2_PACKAGE_PYTHON || \
> +		BR2_PACKAGE_PYTHON3))

I've replaced this with the slightly simpler (IMO) :

comment "circus needs Python and a toolchain w/ C++, wchar, threads"
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
                !BR2_TOOLCHAIN_HAS_THREADS || \
                !(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
