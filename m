From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 23:57:06 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/tripwire: new package
In-Reply-To: <1461705192-15282-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461705192-15282-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160609235706.2a697076@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 23:13:12 +0200, Bernd Kuhls wrote:

> + install-data-hook:
> +-	prefix="$(prefix)" sysconfdir="$(sysconfdir)" \
> +-        path_to_vi="$(path_to_vi)" path_to_sendmail="$(path_to_sendmail)" \
> +-        ./install/install.sh
> ++	$(mkdir_p) $(DESTDIR)$(sbindir)
> ++	$(install_sh_SCRIPT) install/install.sh $(DESTDIR)$(sbindir)

Why are you changing the logic that runs install.sh on the build
machine to a logic that installs install.sh to the target? How can
installing install.sh on the target be useful?

> ++#	prefix="$(prefix)" sysconfdir="$(sysconfdir)" \
> ++#        path_to_vi="$(path_to_vi)" path_to_sendmail="$(path_to_sendmail)" \
> ++#        ./install/install.sh

Please don't commend the code, just remove it.

Could you submit a bug upstream (they use Github, so it's trivial) to
ask them to make install.sh non-interactive ?

Also, isn't this install.sh script doing this that are also useful
(other than stupidly asking the user to explicitly accept the license).

> diff --git a/package/tripwire/Config.in b/package/tripwire/Config.in
> new file mode 100644
> index 0000000..1373bb6
> --- /dev/null
> +++ b/package/tripwire/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_TRIPWIRE
> +	bool "tripwire"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_OPENSSL

OpenSSL is not mandatory. Use --enable-openssl / --disable-openssl to
make it optional in the .mk file.

> +TRIPWIRE_VERSION = 2.4.3.1
> +TRIPWIRE_SITE = $(call github,Tripwire,tripwire-open-source,$(TRIPWIRE_VERSION))
> +TRIPWIRE_LICENSE = GPLv2+

This license is a bit of an issue when OpenSSL support is enabled: the
GPL license and the OpenSSL license are incompatible, so you cannot
distribute a tripwire binary with OpenSSL support. They need to use a
GPL license with OpenSSL exception for the binary to be
redistributable. See
https://people.gnome.org/~markmc/openssl-and-the-gpl.html for details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
