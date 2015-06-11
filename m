From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 11 Jun 2015 23:56:24 +0200
Subject: [Buildroot] [PATCH v4 2/3] lutok: new package
In-Reply-To: <1434056459-24075-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1434056459-24075-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
 <1434056459-24075-3-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <557A0408.6030903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 23:00, Sebastien Bourdelin wrote:
> Lutok is a lightweight C++ API library for Lua.
> 
> https://github.com/jmmv/lutok
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
[snip]
> diff --git a/package/lutok/Config.in b/package/lutok/Config.in
> new file mode 100644
> index 0000000..ef885c8
> --- /dev/null
> +++ b/package/lutok/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_LUTOK
> +	bool "lutok"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER \
> +		&& !BR2_PACKAGE_LUAJIT

 We only put several depends on one line if they're ||-ed. So make this

	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
	depends on BR2_PACKAGE_LUAJIT

> +	help
> +	  Lutok is a lightweight C++ API library for Lua.
> +
> +	  https://github.com/jmmv/lutok
> +
> +comment "lutok needs a toolchain w/ C++ and full Lua"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
[snip]
> +ifneq ($(BR2_STATIC_LIBS),y)
> +LUTOK_MAKE_OPTS = LIBS=-ldl
> +endif

 This is actually not needed for this package, it is needed for liblua. So add a
comment like in haserl:

# liblua uses dlopen when dynamically linked


> +
> +$(eval $(autotools-package))
> 

 Like atf, this package installs a bunch of tests in /usr/tests.

 Short term, get rid of them, either with a POST_INSTALL_TARGET_HOOK or by using
install-exec.

 Long term, we should consider adding a global option BR2_INSTALL_TESTS that
installs various tests. There are a bunch of packages that have a local option
for installing tests, but that's not sustainable. If we ever get around to doing
runtime tests, we'll need something like that. In the meantime, it could already
be useful for others.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
