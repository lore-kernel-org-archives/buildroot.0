From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Dec 2012 23:51:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/spice: don't enable GUI if
	dependencies not met
In-Reply-To: <0edfe5fad92256f3d70bc151650cade9d1f6a7fa.1356459033.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 25 Dec 2012 19:11:29 +0100")
References: <cover.1356459033.git.yann.morin.1998@free.fr>
 <cover.1356459033.git.yann.morin.1998@free.fr>
 <0edfe5fad92256f3d70bc151650cade9d1f6a7fa.1356459033.git.yann.morin.1998@free.fr>
Message-ID: <87obhg5svo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> The spice GUI selects unconditionally selects cegui06, but cegui06 requires
 Yann> threads and C++, so spice GUI must also depend on threads and C++.

 Yann> Fixes:
 Yann>     http://autobuild.buildroot.net/results/37f8ee90bb4348db97daef83493005c42a193b91/

 Yann> +++ b/package/spice/Config.in
 Yann> @@ -35,8 +35,13 @@ config BR2_PACKAGE_SPICE_CLIENT
 Yann>  	select BR2_PACKAGE_XLIB_LIBXFIXES
 Yann>  	select BR2_PACKAGE_XLIB_LIBXRANDR
 
 Yann> +comment "GUI requires a toolchain with threads and C++"
 Yann> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
 Yann> +

This comment should only be shown if SPICE_CLIENT is enabled, so I've
added the dependency and committed, thanks.

 Yann>  config BR2_PACKAGE_SPICE_GUI
 Yann>  	bool "Enable GUI"
 Yann> +	depends on BR2_TOOLCHAIN_HAS_THREADS    # cegui06
 Yann> +	depends on BR2_INSTALL_LIBSTDCPP        # cegui06

-- 
Bye, Peter Korsgaard
