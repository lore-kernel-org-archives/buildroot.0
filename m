From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 12:53:12 +0200
Subject: [Buildroot] [PATCH] fmt: new package
In-Reply-To: <1491474619-11636-1-git-send-email-semenak94@mail.ru>
References: <fmt: new package>
 <1491474619-11636-1-git-send-email-semenak94@mail.ru>
Message-ID: <20170406125312.3675b60a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this new version. For new versions, it is better if the
subject prefix is change, and you include a changelog.

To change the subject prefix:

	git format-patch -v2 HEAD^

will change [PATCH] into [PATCHv2]

On Thu,  6 Apr 2017 13:30:19 +0300, Semyon Kolganov wrote:
> Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
> ---

And the changelog can be written here, detailing what changed between
v1 and v2.

> diff --git a/package/fmt/Config.in b/package/fmt/Config.in
> new file mode 100644
> index 0000000..9ce2874
> --- /dev/null
> +++ b/package/fmt/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_FMT
> +	bool "fmt"

Missed this on the first review: since this is a C++ package, you need
to do:

	depends on BR2_INSTALL_LIBSTDCPP

> +	help
> +	  fmt is an open-source formatting library for C++. It can be used
> +	  as a safe alternative to printf or as a fast alternative to
> +	  IOStreams.
> \ No newline at end of file

Still a missing new line here.

And since there's now a C++ dependency, you must add:

comment "fmt needs a toolchain w/ C++"
	depends on !BR2_INSTALL_LIBSTDCPP

> +FMT_CONF_OPTS = \
> +	-DHAVE_OPEN=ON \
> +	-DFMT_INSTALL=ON \
> +	-DFMT_TEST=OFF
> +
> +define FMT_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/fmt
> +	cp -dpfr $(@D)/fmt/*.h $(STAGING_DIR)/usr/include/fmt
> +endef

I still don't get this. For the target installation, you're using the
"make install" from the CMake packaging, but for the staging
installation, you're overriding the logic to only install the header
files. Why?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
