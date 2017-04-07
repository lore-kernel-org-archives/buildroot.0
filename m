From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Fri, 07 Apr 2017 09:03:34 +0200
Subject: [Buildroot] [Patch v4 1/3] rust-bootstrap: new package
In-Reply-To: <20170402194651.28684-2-eric.le.bihan.dev@free.fr>
References: <20170402194651.28684-1-eric.le.bihan.dev@free.fr>
 <20170402194651.28684-2-eric.le.bihan.dev@free.fr>
Message-ID: <1491548614.26127.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2017-04-02 at 21:46 +0200, Eric Le Bihan wrote:
> This new package fetches a binary snapshot of the Rust compiler,
> suitable for the host, in order to bootstrap the Rust compiler.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
> ?DEVELOPERS?????????????????????????????????|??1 +
> ?package/rust-bootstrap/rust-bootstrap.hash |??5 ++++
> ?package/rust-bootstrap/rust-bootstrap.mk???| 37
> ++++++++++++++++++++++++++++++
> ?3 files changed, 43 insertions(+)
> ?create mode 100644 package/rust-bootstrap/rust-bootstrap.hash
> ?create mode 100644 package/rust-bootstrap/rust-bootstrap.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c89468b..863d5aa 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -448,6 +448,7 @@ F:	package/execline/
> ?F:	package/hicolor-icon-theme/
> ?F:	package/jemalloc/
> ?F:	package/ninja/
> +F:	package/rust-bootstrap
> ?F:	package/s6/
> ?F:	package/s6-dns/
> ?F:	package/s6-linux-init/
> diff --git a/package/rust-bootstrap/rust-bootstrap.hash
> b/package/rust-bootstrap/rust-bootstrap.hash
> new file mode 100644
> index 0000000..b418ea0
> --- /dev/null
> +++ b/package/rust-bootstrap/rust-bootstrap.hash
> @@ -0,0 +1,5 @@
> +# Locally calculated
> +sha256
> a833304f99071600c72ecd868c1c7bd5ce49d1102332637a8eb7adb942f349ab??rus
> tc-1.15.1-i686-unknown-linux-gnu.tar.gz
> +sha256
> 33ff44672b731fc71145974ce84194a1a9bafe6da3a74fd1e7543f12467f8894??rus
> tc-1.15.1-x86_64-unknown-linux-gnu.tar.gz
> +sha256
> eff452a54b208a83b35432f226cb7de046d27b5e43edfc31d71ff340af686db0??rus
> t-std-1.15.1-i686-unknown-linux-gnu.tar.gz
> +sha256
> 69b251b478e284dfcaefc1153183f26f41d504ae213a81224f2101d8dbd52bb0??rus
> t-std-1.15.1-x86_64-unknown-linux-gnu.tar.gz
> diff --git a/package/rust-bootstrap/rust-bootstrap.mk b/package/rust-
> bootstrap/rust-bootstrap.mk
> new file mode 100644
> index 0000000..1098423
> --- /dev/null
> +++ b/package/rust-bootstrap/rust-bootstrap.mk
> @@ -0,0 +1,37 @@
> +####################################################################
> ############
> +#
> +# rust-bootstrap
> +#
> +####################################################################
> ############
> +
> +RUST_BOOTSTRAP_VERSION = 1.15.1
> +RUST_BOOTSTRAP_DATE = 2017-02-09
> +RUST_BOOTSTRAP_TRIPLE = $(RUST_BOOTSTRAP_ARCH)-unknown-linux-gnu
> +RUST_BOOTSTRAP_LABEL = $(RUST_BOOTSTRAP_VERSION)-
> $(RUST_BOOTSTRAP_TRIPLE)
> +
> +ifeq ($(HOSTARCH),x86_64)
> +RUST_BOOTSTRAP_ARCH = x86_64
> +else ifeq ($(HOSTARCH),x86)
> +RUST_BOOTSTRAP_ARCH = i686
> +endif

Is there any necessity to limit the bootstrap compiler to those host
archs only?

> +RUST_BOOTSTRAP_SITE = https://static.rust-
> lang.org/dist/$(RUST_BOOTSTRAP_DATE)

Why use a date and not https://static.rust-lang.org/dist solely. Since
I can fetch https://static.rust-lang.org/dist/rust-1.15.1-x86_64-unknow
n-linux-gnu.tar.gz.

> +RUST_BOOTSTRAP_SOURCE = rustc-$(RUST_BOOTSTRAP_LABEL).tar.gz
> +RUST_BOOTSTRAP_LICENSE = Apache-2.0 or MIT
> +RUST_BOOTSTRAP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
> +RUST_BOOTSTRAP_LIBSTD_SOURCE= rust-std-
> $(RUST_BOOTSTRAP_LABEL).tar.gz
> +RUST_BOOTSTRAP_LIBSTD_ROOT = rust-std-$(RUST_BOOTSTRAP_LABEL)/rust-
> std-$(RUST_BOOTSTRAP_TRIPLE)

Why not make a seperate package?

> +RUST_BOOTSTRAP_EXTRA_DOWNLOADS =
> $(RUST_BOOTSTRAP_SITE)/$(RUST_BOOTSTRAP_LIBSTD_SOURCE)
> +
> +define RUST_BOOTSTRAP_LIBSTD_EXTRACT
> +	$(call suitable-extractor,$(RUST_BOOTSTRAP_LIBSTD_SOURCE)) \
> +		$(DL_DIR)/$(RUST_BOOTSTRAP_LIBSTD_SOURCE) | \
> +		$(TAR) --strip-components=2 -C $(@D)/rustc
> $(TAR_OPTIONS) - \
> +			$(RUST_BOOTSTRAP_LIBSTD_ROOT)/lib
> +endef
> +
> +HOST_RUST_BOOTSTRAP_EXTRA_DOWNLOADS =
> $(RUST_BOOTSTRAP_EXTRA_DOWNLOADS)
> +HOST_RUST_BOOTSTRAP_POST_EXTRACT_HOOKS +=
> RUST_BOOTSTRAP_LIBSTD_EXTRACT
> +
> +$(eval $(host-generic-package))

J?rg
