From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Mon, 20 Jan 2020 09:51:34 -0600
Subject: [Buildroot] [PATCH v2 1/9] package/rust: build and install cargo
In-Reply-To: <20200115132617.26604-1-patrick.havelange@essensium.com>
References: <20200115132617.26604-1-patrick.havelange@essensium.com>
Message-ID: <CAH=K+6=57A7X3fnOWqdXfOCUu8rtxm+QwbFq5Qqu0=Ok2w5+Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patrick, All,

On Wed, Jan 15, 2020 at 7:27 AM Patrick Havelange
<patrick.havelange@essensium.com> wrote:
>
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> Cargo source code is not provided anymore as a separate tarball but is
> now built along with the Rust compiler.
>
> So update rust host variant to build Cargo and install the
> cross-compilation configuration file.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

Tested-by: Sam Voss <sam.voss@rockwellcollins.com>

> ---
>  package/rust/config.in |  2 ++
>  package/rust/rust.mk   | 25 ++++++++++++++++++++++++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 package/rust/config.in
>
> diff --git a/package/rust/config.in b/package/rust/config.in
> new file mode 100644
> index 0000000000..47fad026be
> --- /dev/null
> +++ b/package/rust/config.in
> @@ -0,0 +1,2 @@
> +[target. at RUSTC_TARGET_NAME@]
> +linker = "@CROSS_PREFIX at gcc"
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 5d14fc6682..901995c203 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -47,11 +47,14 @@ define HOST_RUST_CONFIGURE_CMDS
>                 echo 'python = "$(HOST_DIR)/bin/python2"'; \
>                 echo 'submodules = false'; \
>                 echo 'vendor = true'; \
> +               echo 'extended = true'; \
> +               echo 'tools = ["cargo"]'; \
>                 echo 'compiler-docs = false'; \
>                 echo 'docs = false'; \
>                 echo 'verbose = $(HOST_RUST_VERBOSITY)'; \
>                 echo '[install]'; \
>                 echo 'prefix = "$(HOST_DIR)"'; \
> +               echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
>                 echo '[rust]'; \
>                 echo 'channel = "stable"'; \
>                 echo '[target.$(RUSTC_TARGET_NAME)]'; \
> @@ -64,9 +67,29 @@ define HOST_RUST_BUILD_CMDS
>         cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py build
>  endef
>
> -define HOST_RUST_INSTALL_CMDS
> +define HOST_RUST_INSTALL_RUST_BIN
>         cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py dist
>         cd $(@D); $(HOST_MAKE_ENV) $(HOST_DIR)/bin/python2 x.py install
>  endef
>
> +define HOST_RUST_INSTALL_CARGO_BIN
> +       find $(@D)/build/tmp/dist -maxdepth 2 -wholename '*cargo*/install.sh' \
> +               -exec {} --prefix=$(HOST_DIR) --disable-ldconfig \;
> +endef
> +
> +define HOST_RUST_INSTALL_CARGO_CONFIG
> +       $(INSTALL) -D package/rust/config.in \
> +               $(HOST_DIR)/share/cargo/config
> +       $(SED) 's/@RUSTC_TARGET_NAME@/$(RUSTC_TARGET_NAME)/' \
> +               $(HOST_DIR)/share/cargo/config
> +       $(SED) 's/@CROSS_PREFIX@/$(notdir $(TARGET_CROSS))/' \
> +               $(HOST_DIR)/share/cargo/config
> +endef
> +
> +define HOST_RUST_INSTALL_CMDS
> +       $(HOST_RUST_INSTALL_RUST_BIN)
> +       $(HOST_RUST_INSTALL_CARGO_BIN)
> +       $(HOST_RUST_INSTALL_CARGO_CONFIG)
> +endef
> +
>  $(eval $(host-generic-package))
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Sam Voss | Sr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 263 4039

sam.voss at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
