From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 13:48:22 +0200
Subject: [Buildroot] [PATCH v3 00/10] Merge rust and cargo
In-Reply-To: <20200207180829.165689-1-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
Message-ID: <20200727134822.3962f4a7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  7 Feb 2020 19:08:19 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Eric Le Bihan (7):
>   package/rust: build and install cargo
>   package/cargo-bin: install if rust-bin selected
>   package/rust-bin: host variant depends on host-cargo-bin
>   package/rust: drop dependency on host-cargo-bin
>   package/ripgrep: depends on host-rustc
>   package/cargo: drop package
>   docs/manual: cargo packages depend on host-rustc
> 
> Patrick Havelange (2):
>   package/rust: bump to 1.40
>   package/cargo-bin: remove and use cargo-bin from rust-bin package

Thanks a lot, I have applied the whole series.

One thing that I find strange is that host-rust-bin gets installed to
$(HOST_DIR) into the traditional places, and then when you build
host-rust, it installs *over* host-rust-bin. It was already like that
prior to your series, so this is not really a change, but I'm wondering
if we should clarify this. Related to this, this is also non very nice:

                echo 'cargo = "$(HOST_RUST_BIN_DIR)/cargo/bin/cargo"'; \
                echo 'rustc = "$(HOST_RUST_BIN_DIR)/rustc/bin/rustc"'; \

Here, we're pointing directly to the source directory of another
package, which we generally try to avoid.

So, I'm wondering if we shouldn't be installed host-rust-bin in some
unusual $(HOST_DIR) location, maybe $(HOST_DIR)/opt/rust-bin/ or
something like that.

Then:

 - If the host-rustc virtual package uses host-rust-bin as the
   provider, then we create the appropriate
   $(HOST_DIR)/bin/{rustc,cargo} symlinks to
   $(HOST_DIR)/opt/rust-bin/{rustc,cargo}

 - If the host-rustc virtual package uses host-rust as the provider,
   then host-rust will use $(HOST_DIR)/opt/rust-bin/ to build itself,
   and then will install $(HOST_DIR)/bin/{rustc,cargo}

Thoughts ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
