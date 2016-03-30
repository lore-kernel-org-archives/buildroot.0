From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 18:26:53 +0200
Subject: [Buildroot] [PATCH 1/1] aer-inject: new package
In-Reply-To: <1459342912-10816-1-git-send-email-tiago.brusamarello@datacom.ind.br>
References: <1459342912-10816-1-git-send-email-tiago.brusamarello@datacom.ind.br>
Message-ID: <20160330182653.6d1791c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've applied your patch, after doing a few tweaks.

First of all, could you fix your SMTP configuration so that your From:
is Tiago Brusamarello <...> rather than tiago.brusamarello ?

On Wed, 30 Mar 2016 10:01:52 -0300, tiago.brusamarello wrote:
> aer-inject allows to inject PCIE AER errors on the software level into
> a running Linux kernel. This is intended for validation of the PCIE
> driver error recovery handler and PCIE AER core handler.
> 
> Change-Id: Id3e701a9eb692627db42320ea7c37afbf4f712b8

This line is not needed.

> Signed-off-by: tiago.brusamarello <tiago.brusamarello@datacom.ind.br>

This should also be Tiago Brusamarello <....>

> diff --git a/package/aer-inject/Config.in b/package/aer-inject/Config.in
> new file mode 100644
> index 0000000..8856ff1
> --- /dev/null
> +++ b/package/aer-inject/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_AER_INJECT
> +	bool "aer-inject"
> +	help
> +	  aer-inject allows to inject PCIE AER errors on the software level into
> +	  a running Linux kernel. This is intended for validation of the PCIE
> +	  driver error recovery handler and PCIE AER core handler.
> +
> +	  Requires a new Linux kernel with PCIE AER error injection patches.

Those lines were slightly too long, so I rewrapped them.

> +AER_INJECT_VERSION = 9bd5e2c7886fca72f139cd8402488a2235957d41
> +AER_INJECT_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/gong.chen/aer-inject.git
> +AER_INJECT_SITE_METHOD = git
> +AER_INJECT_LICENSE = GPLv2
> +AER_INJECT_LICENSE_FILES = README
> +AER_INJECT_DEPENDENCIES = host-flex host-bison
> +AER_INJECT_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)

This variable was not needed, you can just use TARGET_CONFIGURE_OPTS
directly.

> +
> +define AER_INJECT_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(AER_INJECT_MAKE_OPTS)
> +endef
> +
> +define AER_INJECT_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(AER_INJECT_MAKE_OPTS) \
> +	DESTDIR=$(TARGET_DIR) PREFIX=/usr/bin install

The continuation line should be indented.

> +endef
> +
> +$(eval $(generic-package))
> \ No newline at end of file

There should be a newline at the end of file.

I've fixed up those minor issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
