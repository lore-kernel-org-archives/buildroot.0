From: Sam Voss <sam.voss@collins.com>
Date: Wed, 16 Dec 2020 11:33:15 -0600
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: make sure
 .cargo/config is used
In-Reply-To: <4337425c-31bd-fe1d-19d8-62bdb172ee97@essensium.com>
References: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
 <20201210154850.28578-1-patrick.havelange@essensium.com>
 <20201210213122.035e149a@windsurf.home>
 <4337425c-31bd-fe1d-19d8-62bdb172ee97@essensium.com>
Message-ID: <CAH=K+6mC3G2LtaU6Q=UfNynPyfusV1igPcQFiKuCiQX-A=2RqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Patrick, all,

On Wed, Dec 16, 2020 at 7:47 AM Patrick Havelange
<patrick.havelange@essensium.com> wrote:
>
> On 2020-12-10 21:31, Thomas Petazzoni wrote:
> > Hello Patrick,
>
> Hi,
>
> >
> > On Thu, 10 Dec 2020 16:48:50 +0100
> > Patrick Havelange <patrick.havelange@essensium.com> wrote:
[snip]
> > *However*, for host-sentry-cli, even with this patch, quite a bit of
> > stuff gets rebuilt during the install step. Here is how it goes:
> >
> >>> host-sentry-cli 1.59.0 Extracting
> > gzip -d -c /home/thomas/dl/sentry-cli/sentry-cli-1.59.0.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0   -xf -
> >>>> host-sentry-cli 1.59.0 Patching
> >>>> host-sentry-cli 1.59.0 Configuring
> >>>> host-sentry-cli 1.59.0 Building
> > cd /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin:/home/thomas/projets/git-wrappers" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" RUSTFLAGS="-C link-args=-L/home/thomas/projets/buildroot/output/host/lib -C link-args=-Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo build --offline --release --manifest-path Cargo.tom
>  l --locked
> >
> >     Compiling libc v0.2.71
> >     Compiling cfg-if v0.1.10
> >     Compiling autocfg v1.0.0
> >     Compiling proc-macro2 v1.0.18
>
> [snip]
>
> >     Compiling git2 v0.13.6
> >      Finished release [optimized] target(s) in 6m 10s
> >>>> host-sentry-cli 1.59.0 Installing to host directory
> > cd /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin:/home/thomas/projets/git-wrappers" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" RUSTFLAGS="-C link-args=-L/home/thomas/projets/buildroot/output/host/lib -C link-args=-Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo install --offline --root /home/thomas/projets/build
>  root/outpu
> >   t/host --bins --path ./ --force --locked
> >    Installing sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
> >     Compiling syn v1.0.33
> >     Compiling synstructure v0.12.4
> >     Compiling pest_generator v2.1.3
> >     Compiling serde_derive v1.0.114
> >     Compiling failure_derive v0.1.8
> >     Compiling scroll_derive v0.10.2
> >     Compiling pest_derive v2.1.0
> >     Compiling failure v0.1.8
> >     Compiling which v3.1.1
> >     Compiling scroll v0.10.1
> >     Compiling runas v0.2.1
> >     Compiling goblin v0.2.3
> >     Compiling serde v1.0.114
> >     Compiling sha1 v0.6.0
> >     Compiling serde_json v1.0.56
> >     Compiling bstr v0.2.13
> >     Compiling chrono v0.4.11
> >     Compiling url v2.1.1
> >     Compiling string_cache v0.8.0
> >     Compiling uuid v0.8.1
> >     Compiling csv v1.1.3
> >     Compiling globset v0.4.5
> >     Compiling sourcemap v5.0.0
> >     Compiling plist v0.5.5
> >     Compiling anylog v0.5.0
> >     Compiling git2 v0.13.6
> >     Compiling elementtree v0.5.0
> >     Compiling debugid v0.7.2
> >     Compiling pdb v0.6.0
> >     Compiling proguard v4.0.1
> >     Compiling prettytable-rs v0.8.0
> >     Compiling ignore v0.4.16
> >     Compiling symbolic-common v7.5.0
> >     Compiling sentry-types v0.14.1
> >     Compiling symbolic-debuginfo v7.5.0
> >      Building [====================================================>  ] 299/305: sentry-types, symbolic-debuginfo, ignore
> >
> >     Compiling symbolic v7.5.0
> >     Compiling sentry v0.18.1
> >     Compiling sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
> >      Finished release [optimized] target(s) in 2m 35s
> >    Installing /home/thomas/projets/buildroot/output/host/bin/sentry-cli
> >     Installed package `sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)` (executable `sentry-cli`)
> >
> > Any idea ?
>
> Sadly no. I've spent some time trying various combinations of flags for
> cargo build & cargo install, without luck.
>
> I've found this bug-report though :
> https://github.com/rust-lang/cargo/issues/8703 .
>
> Since the first package being rebuild in this case is 'syn', I've looked
> at it and indeed it does make (non trivial) use of the [features]
> section inside its Cargo.toml. So maybe this can explain why syn is
> being rebuild (and also all similar packages and packages depending on
> those)?  I'm absolutely not sure of that explanation though.

I meant to mention this on the mailing thread but it fell between the
cracks - I tested this without buildroot and had the same outcome.
Seems like you already got to the root of "why" this happens, but just
to show it's not buildroot-centric:

sentry-cli(master)? cargo build --locked --offline --release
   Compiling libc v0.2.71
   Compiling cfg-if v0.1.10
   Compiling proc-macro2 v1.0.18
   Compiling autocfg v1.0.0
   Compiling unicode-xid v0.2.1
   Compiling syn v1.0.33
   Compiling serde_derive v1.0.114
   Compiling serde v1.0.114
   Compiling lazy_static v1.4.0
   Compiling pkg-config v0.3.17
   Compiling getrandom v0.1.14
   Compiling memchr v2.3.3
   Compiling ppv-lite86 v0.2.8
[snip compile logs]
  Compiling symbolic-debuginfo v7.5.0
(https://github.com/getsentry/symbolic#075ee512)
   Compiling symbolic v7.5.0 (https://github.com/getsentry/symbolic#075ee512)
    Finished release [optimized] target(s) in 52.72s

sentry-cli(master)? cargo install --path . --root ./exroot --locked
--offline --bins --force
  Installing sentry-cli v1.60.1
(/accts/smvoss/projects/rust-buildroot/sentry-cli)
warning: package `smallvec v1.4.0` in Cargo.lock is yanked in registry
`crates.io`, consider running without --locked
warning: package `socket2 v0.3.12` in Cargo.lock is yanked in registry
`crates.io`, consider running without --locked
   Compiling syn v1.0.33
   Compiling synstructure v0.12.4
   Compiling pest_generator v2.1.3
   Compiling serde_derive v1.0.114
[snip compile logs]
   Compiling sentry-cli v1.60.1
(/accts/smvoss/projects/rust-buildroot/sentry-cli)
    Finished release [optimized] target(s) in 44.14s
  Installing ./exroot/bin/sentry-cli
   Installed package `sentry-cli v1.60.1
(/accts/smvoss/projects/rust-buildroot/sentry-cli)` (executable
`sentry-cli`)
warning: be sure to add `./exroot/bin` to your PATH to be able to run
the installed binaries


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
