From: Patrick Havelange <patrick.havelange@essensium.com>
Date: Wed, 16 Dec 2020 14:40:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: make sure
 .cargo/config is used
In-Reply-To: <20201210213122.035e149a@windsurf.home>
References: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
 <20201210154850.28578-1-patrick.havelange@essensium.com>
 <20201210213122.035e149a@windsurf.home>
Message-ID: <4337425c-31bd-fe1d-19d8-62bdb172ee97@essensium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-12-10 21:31, Thomas Petazzoni wrote:
> Hello Patrick,

Hi,

> 
> On Thu, 10 Dec 2020 16:48:50 +0100
> Patrick Havelange <patrick.havelange@essensium.com> wrote:
> 
>> The way cargo searches for config file is based (among other rules)
>> on the current directory. This means that if cargo is started outside
>> of a package directory, its configuration file will not be taken
>> into account.
>> So just 'cd' into it before running cargo build/install
>>
>> This fix the issue where the build is failing in offline mode and
>> only the dl/package.tar.gz is available.
>>
>> Without this, it would have worked only if the CARGO_HOME cache had
>> been populated (by running cargo vendor for example).
>>
>> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> 
> Thanks a lot! This does fix the "make ripgrep; make clean ripgrep"
> issue that Ryan reported. Also, for ripgrep, I no longer see anything
> being rebuilt during the install step, which is good.

glad it fixes those issues indeed.

> 
> *However*, for host-sentry-cli, even with this patch, quite a bit of
> stuff gets rebuilt during the install step. Here is how it goes:
> 
>>> host-sentry-cli 1.59.0 Extracting
> gzip -d -c /home/thomas/dl/sentry-cli/sentry-cli-1.59.0.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0   -xf -
>>>> host-sentry-cli 1.59.0 Patching
>>>> host-sentry-cli 1.59.0 Configuring
>>>> host-sentry-cli 1.59.0 Building
> cd /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin:/home/thomas/projets/git-wrappers" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" RUSTFLAGS="-C link-args=-L/home/thomas/projets/buildroot/output/host/lib -C link-args=-Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo build --offline --release --manifest-path Cargo.toml --locked
>    
>     Compiling libc v0.2.71
>     Compiling cfg-if v0.1.10
>     Compiling autocfg v1.0.0
>     Compiling proc-macro2 v1.0.18

[snip]

>     Compiling git2 v0.13.6
>      Finished release [optimized] target(s) in 6m 10s
>>>> host-sentry-cli 1.59.0 Installing to host directory
> cd /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin:/home/thomas/projets/git-wrappers" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" RUSTFLAGS="-C link-args=-L/home/thomas/projets/buildroot/output/host/lib -C link-args=-Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo install --offline --root /home/thomas/projets/buildroot/outpu
>   t/host --bins --path ./ --force --locked
>    Installing sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
>     Compiling syn v1.0.33
>     Compiling synstructure v0.12.4
>     Compiling pest_generator v2.1.3
>     Compiling serde_derive v1.0.114
>     Compiling failure_derive v0.1.8
>     Compiling scroll_derive v0.10.2
>     Compiling pest_derive v2.1.0
>     Compiling failure v0.1.8
>     Compiling which v3.1.1
>     Compiling scroll v0.10.1
>     Compiling runas v0.2.1
>     Compiling goblin v0.2.3
>     Compiling serde v1.0.114
>     Compiling sha1 v0.6.0
>     Compiling serde_json v1.0.56
>     Compiling bstr v0.2.13
>     Compiling chrono v0.4.11
>     Compiling url v2.1.1
>     Compiling string_cache v0.8.0
>     Compiling uuid v0.8.1
>     Compiling csv v1.1.3
>     Compiling globset v0.4.5
>     Compiling sourcemap v5.0.0
>     Compiling plist v0.5.5
>     Compiling anylog v0.5.0
>     Compiling git2 v0.13.6
>     Compiling elementtree v0.5.0
>     Compiling debugid v0.7.2
>     Compiling pdb v0.6.0
>     Compiling proguard v4.0.1
>     Compiling prettytable-rs v0.8.0
>     Compiling ignore v0.4.16
>     Compiling symbolic-common v7.5.0
>     Compiling sentry-types v0.14.1
>     Compiling symbolic-debuginfo v7.5.0
>      Building [====================================================>  ] 299/305: sentry-types, symbolic-debuginfo, ignore
> 
>     Compiling symbolic v7.5.0
>     Compiling sentry v0.18.1
>     Compiling sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
>      Finished release [optimized] target(s) in 2m 35s
>    Installing /home/thomas/projets/buildroot/output/host/bin/sentry-cli
>     Installed package `sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)` (executable `sentry-cli`)
> 
> Any idea ?

Sadly no. I've spent some time trying various combinations of flags for 
cargo build & cargo install, without luck.

I've found this bug-report though : 
https://github.com/rust-lang/cargo/issues/8703 .

Since the first package being rebuild in this case is 'syn', I've looked 
at it and indeed it does make (non trivial) use of the [features] 
section inside its Cargo.toml. So maybe this can explain why syn is 
being rebuild (and also all similar packages and packages depending on 
those)?  I'm absolutely not sure of that explanation though.

> 
> Thomas
> 

Patrick H.
