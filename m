From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Feb 2018 11:26:30 +0100
Subject: [Buildroot] [PATCH v10 08/10] cargo: new package
In-Reply-To: <20180204180749.29942-9-eric.le.bihan.dev@free.fr> (Eric Le
 Bihan's message of "Sun, 4 Feb 2018 19:07:47 +0100")
References: <20180204180749.29942-1-eric.le.bihan.dev@free.fr>
 <20180204180749.29942-9-eric.le.bihan.dev@free.fr>
Message-ID: <87eflzwx49.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This new package provides Cargo, the Rust official package manager.
 > Cargo is written in Rust and uses Cargo as its build system. It also
 > depends on other Rust packages.

 > Normally, a previously installed version of Cargo would be used to:

 >  1. Fetch the dependencies.
 >  2. Build the new version of Cargo, using the available Rust compiler.

 > But the fetching step prevents offline builds. So instead two features
 > of Cargo are leveraged: vendoring [1] and local registry.

 > First, a tarball of the build dependencies generated using `cargo
 > vendor` is fetched along with Cargo source code.

 > Then, the build process is as follows:

 >  1. The tarball of the build dependencies is uncompressed in a local
 >     registry.
 >  2. A snapshot of Cargo, provided by cargo-bin, builds the final
 >     version of Cargo.
 >  3. A configuration file telling Cargo how to cross-compile programs for
 >     the target is generated and installed.

 > Currently, only the host variant is provided.

 > [1] https://github.com/alexcrichton/cargo-vendor

 > +++ b/package/cargo/cargo.hash
 > @@ -0,0 +1,8 @@
 > +# Locally generated
 > +sha256 a9d4291254a1d622d3c3cb942aaa56ab4059b8d04915c3af234f0362f14722e8  cargo-0.24.0.tar.gz
 > +sha256 dc7240d60a869fa24a68c8734fb7c810c27cca0a6dad52df6279865e4e8e7fae  rust-installer-4f994850808a572e2cc8d43f968893c8e942e9bf.tar.gz
 > +sha256 a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 > +sha256 23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
 > +sha256 8bd89f9222dc80292f4107347103b693ac66f3a083371f0629ccf42338abe880  LICENSE-THIRD-PARTY
 > +# From http://pkgs.fedoraproject.org/repo/pkgs/cargo/cargo-0.23.0-vendor.tar.xz/sha512

That should probably be 0.24.0?

 > +CARGO_VERSION = 0.24.0
 > +CARGO_SITE = $(call github,rust-lang,cargo,$(CARGO_VERSION))
 > +CARGO_LICENSE = Apache-2.0 or MIT
 > +CARGO_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
 > +
 > +CARGO_DEPS_SHA512 = 60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21
 > +CARGO_DEPS_SITE = http://pkgs.fedoraproject.org/repo/pkgs/cargo/$(CARGO_DEPS_SOURCE)/sha512/$(CARGO_DEPS_SHA512)

Is that the official location for this?

pkgs.fedoraproject.org is failing for me at the moment :/

--2018-02-05 11:25:50--  http://pkgs.fedoraproject.org/repo/pkgs/cargo/cargo-0.24.0-vendor.tar.xz/sha512/60c12ce49a53cf986490f5a5fdf606f0374677902edfdc4d48ab1ba6094f3f23efc59626cd3776649c9386a9cab2a60332e5693aad6acbcbb92132efdcf9fe21/cargo-0.24.0-vendor.tar.xz
Resolving pkgs.fedoraproject.org (pkgs.fedoraproject.org)... 209.132.181.4
Connecting to pkgs.fedoraproject.org (pkgs.fedoraproject.org)|209.132.181.4|:80... failed: No route to host.

Otherwise the series looks good to me and I would like to add it for
2018.02.

-- 
Bye, Peter Korsgaard
