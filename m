From: Julien Floret <julien.floret@6wind.com>
Date: Tue, 13 Dec 2016 15:54:59 +0100
Subject: [Buildroot] [PATCH] netsnmp: fix libnl include path in
	configure script
In-Reply-To: <20161212222605.7906c427@free-electrons.com>
References: <1481544668-900-1-git-send-email-julien.floret@6wind.com>
 <20161212222605.7906c427@free-electrons.com>
Message-ID: <CAHfJR7hhiYEKd7c9du61-ave1Gi-rES-L49dGgbfz6e_gL0U=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> The right fix is to modify configure.d/config_os_libs2 to avoid passing
> -I/usr/include/libnl3, and then autoreconf the package. To do this, you
> have a few options:
>
>  - Remove -I/usr/include/libnl3 entirely, and assume the user will pass
>    the appropriate options in CPPFLAGS.
>
>  - Use -I=/usr/include/libnl3, gcc will automatically replace = by the
>    compiler sysroot. However, I have no idea whether this also works
>    with non-gcc compilers.
>
>  - Change the --with-nl option so that it takes a path to the nl
>    library.

Thanks for your analysis. Indeed, your proposals are much better than
patching the configure script on the fly ;)

In fact, I just saw that the issue has been addressed upstream:
libnl include paths & libs can now be overriden with configure environment
variables:
https://sourceforge.net/p/net-snmp/code/ci/852dcd644cfe4cfc7177649eaec163d6221f2be1/

So if you're ok with this, I suggest to:
- embed the upstream patch in package/netsnmp/
- trigger an autoreconf
- pass the right LIBNL3_{CFLAGS,LIBS} variables in NETSNMP_CONF_ENV.

> Also, if netsnmp optionally uses libnl, then it should optionally
> depend on it. Something like:
>
> ifeq ($(BR2_PACKAGE_LIBNL),y)
> NETSNMP_DEPENDENCIES += libnl
> NETSNMP_CONF_OPTS += --with-nl
> else
> NETSNMP_CONF_OPTS += --without-nl
> endif

OK, I will add this as well.

> Or, if you don't care about libnl support in netsnmp and don't want to
> spend time fixing the problem, just add --without-nl to netsnmp
> configuration options.
