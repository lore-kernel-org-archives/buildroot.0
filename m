From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 23:38:39 +0100
Subject: [Buildroot] [PATCH v1 3/4] package/pinentry: add missing qt5
 dependencies
In-Reply-To: <20200310081902.3488-3-ps.report@gmx.net>
References: <20200310081902.3488-1-ps.report@gmx.net>
 <20200310081902.3488-3-ps.report@gmx.net>
Message-ID: <20200315233839.5a91a231@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Mar 2020 09:19:01 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> -comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, C++, dynamic library"
> +comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 4.8, C++, dynamic library"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> -		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
> +		!BR2_arc || BR2_STATIC_LIBS

This is not the correct way to take into account architecture
dependencies. It should be:

comment "pinentry-qt5 needs a toolchain w/ wchar, NPTL, gcc >= 4.8, C++, dynamic library"
        depends on !BR2_arc
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
                !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
                BR2_STATIC_LIBS

I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
