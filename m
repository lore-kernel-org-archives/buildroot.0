From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 21:31:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: make sure
 .cargo/config is used
In-Reply-To: <20201210154850.28578-1-patrick.havelange@essensium.com>
References: <20201119213658.1232531-8-thomas.petazzoni@bootlin.com>
 <20201210154850.28578-1-patrick.havelange@essensium.com>
Message-ID: <20201210213122.035e149a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Patrick,

On Thu, 10 Dec 2020 16:48:50 +0100
Patrick Havelange <patrick.havelange@essensium.com> wrote:

> The way cargo searches for config file is based (among other rules)
> on the current directory. This means that if cargo is started outside
> of a package directory, its configuration file will not be taken
> into account.
> So just 'cd' into it before running cargo build/install
> 
> This fix the issue where the build is failing in offline mode and
> only the dl/package.tar.gz is available.
> 
> Without this, it would have worked only if the CARGO_HOME cache had
> been populated (by running cargo vendor for example).
> 
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

Thanks a lot! This does fix the "make ripgrep; make clean ripgrep"
issue that Ryan reported. Also, for ripgrep, I no longer see anything
being rebuilt during the install step, which is good.

*However*, for host-sentry-cli, even with this patch, quite a bit of
stuff gets rebuilt during the install step. Here is how it goes:

>> host-sentry-cli 1.59.0 Extracting
gzip -d -c /home/thomas/dl/sentry-cli/sentry-cli-1.59.0.tar.gz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0   -xf -
>>> host-sentry-cli 1.59.0 Patching
>>> host-sentry-cli 1.59.0 Configuring
>>> host-sentry-cli 1.59.0 Building
cd /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin:/home/thomas/projets/git-wrappers" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" RUSTFLAGS="-C link-args=-L/home/thomas/projets/buildroot/output/host/lib -C link-args=-Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo build --offline --release --manifest-path Cargo.toml --locked
  
   Compiling libc v0.2.71
   Compiling cfg-if v0.1.10
   Compiling autocfg v1.0.0
   Compiling proc-macro2 v1.0.18
   Compiling unicode-xid v0.2.1
   Compiling syn v1.0.33
   Compiling serde_derive v1.0.114
   Compiling serde v1.0.114
   Compiling lazy_static v1.4.0
   Compiling pkg-config v0.3.17
   Compiling getrandom v0.1.14
   Compiling memchr v2.3.3
   Compiling ppv-lite86 v0.2.8
   Compiling fallible-iterator v0.2.0
   Compiling regex-syntax v0.6.18
   Compiling byteorder v1.3.4
   Compiling stable_deref_trait v1.1.1
   Compiling adler32 v1.1.0
   Compiling rand_core v0.4.2
   Compiling autocfg v0.1.7
   Compiling failure_derive v0.1.8
   Compiling log v0.4.8
   Compiling scopeguard v1.1.0
   Compiling ryu v1.0.5
   Compiling rustc-demangle v0.1.16
   Compiling tinyvec v0.3.3
   Compiling object v0.20.0
   Compiling matches v0.1.8
   Compiling semver-parser v0.7.0
   Compiling maybe-uninit v2.0.0
   Compiling itoa v0.4.6
   Compiling serde_json v1.0.56
   Compiling proc-macro2 v0.4.30
   Compiling encoding_index_tests v0.1.4
   Compiling typenum v1.12.0
   Compiling unicode-xid v0.1.0
   Compiling ucd-trie v0.1.3
   Compiling crc32fast v1.2.0
   Compiling smallvec v1.4.0
   Compiling syn v0.15.44
   Compiling maplit v1.0.2
   Compiling unicode-width v0.1.8
   Compiling adler v0.2.2
   Compiling version_check v0.9.2
   Compiling percent-encoding v2.1.0
   Compiling bitflags v1.2.1
   Compiling rayon-core v1.7.1
   Compiling curl v0.4.30
   Compiling plain v0.2.3
   Compiling podio v0.1.7
   Compiling ahash v0.3.8
   Compiling siphasher v0.3.3
   Compiling fnv v1.0.7
   Compiling xml-rs v0.8.3
   Compiling dmsort v1.0.0
   Compiling new_debug_unreachable v1.0.4
   Compiling openssl-probe v0.1.2
   Compiling arc-swap v0.4.7
   Compiling match_cfg v0.1.0
   Compiling safemem v0.3.3
   Compiling percent-encoding v1.0.1
   Compiling lazycell v1.2.1
   Compiling either v1.5.3
   Compiling precomputed-hash v0.1.1
   Compiling same-file v1.0.6
   Compiling sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
   Compiling xdg v2.2.0
   Compiling number_prefix v0.3.0
   Compiling encode_unicode v0.3.6
   Compiling httpdate v0.3.2
   Compiling instant v0.1.5
   Compiling if_chain v0.1.3
   Compiling strsim v0.8.0
   Compiling chardet v0.2.4
   Compiling glob v0.3.0
   Compiling dotenv v0.15.0
   Compiling username v0.2.0
   Compiling open v1.4.0
   Compiling if_chain v1.0.0
   Compiling thread_local v1.0.1
   Compiling crossbeam-utils v0.7.2
   Compiling num-traits v0.2.12
   Compiling num-integer v0.1.43
   Compiling memoffset v0.5.4
   Compiling crossbeam-epoch v0.8.2
   Compiling hashbrown v0.7.2
   Compiling indexmap v1.4.0
   Compiling rayon v1.3.1
   Compiling gimli v0.21.0
   Compiling miniz_oxide v0.3.7
   Compiling rand_core v0.3.1
   Compiling rand_jitter v0.1.4
   Compiling rand_pcg v0.1.2
   Compiling rand_chacha v0.1.1
   Compiling rand v0.6.5
   Compiling lock_api v0.3.4
   Compiling unicode-normalization v0.1.13
   Compiling unicode-bidi v0.3.4
   Compiling semver v0.9.0
   Compiling encoding-index-japanese v1.20141219.5
   Compiling encoding-index-tradchinese v1.20141219.5
   Compiling encoding-index-simpchinese v1.20141219.5
   Compiling encoding-index-korean v1.20141219.5
   Compiling encoding-index-singlebyte v1.20141219.5
   Compiling pest v2.1.3
   Compiling miniz_oxide v0.4.0
   Compiling im v14.3.0
   Compiling phf_shared v0.8.0
   Compiling line-wrap v0.1.1
   Compiling itertools v0.9.0
   Compiling walkdir v2.3.1
   Compiling app_dirs v1.2.1
   Compiling rand_hc v0.1.0
   Compiling rand_xorshift v0.1.1
   Compiling rand_isaac v0.1.1
   Compiling idna v0.2.0
   Compiling idna v0.1.5
   Compiling rustc_version v0.2.3
   Compiling addr2line v0.12.2
   Compiling encoding v0.2.33
   Compiling pest_meta v2.1.3
   Compiling time v0.1.43
   Compiling parking_lot_core v0.7.2
   Compiling memmap v0.7.0
   Compiling socket2 v0.3.12
   Compiling rand_os v0.1.3
   Compiling term_size v0.3.2
   Compiling num_cpus v1.13.0
   Compiling termios v0.3.2
   Compiling dirs v1.0.5
   Compiling terminal_size v0.1.12
   Compiling uname v0.1.1
   Compiling atty v0.2.14
   Compiling signal-hook-registry v1.2.0
   Compiling dirs-sys v0.3.5
   Compiling hostname v0.3.1
   Compiling jobserver v0.1.21
   Compiling quote v1.0.7
   Compiling aho-corasick v0.7.13
   Compiling csv-core v0.1.10
   Compiling regex-automata v0.1.9
   Compiling base64 v0.10.1
   Compiling backtrace v0.3.49
   Compiling url v1.7.2
   Compiling scroll v0.9.2
   Compiling sentry v0.18.1
   Compiling quote v0.6.13
   Compiling bitmaps v2.1.0
   Compiling flate2 v1.0.16
   Compiling crossbeam-queue v0.2.3
   Compiling crossbeam-channel v0.4.2
   Compiling rand_core v0.5.1
   Compiling parking_lot v0.10.2
   Compiling textwrap v0.11.0
   Compiling term v0.5.2
   Compiling signal-hook v0.1.16
   Compiling dirs v2.0.2
   Compiling cc v1.0.56
   Compiling regex v1.3.9
   Compiling sized-chunks v0.5.3
   Compiling rand_chacha v0.2.2
   Compiling rand_xoshiro v0.4.0
   Compiling scheduled-thread-pool v0.2.4
   Compiling clap v2.33.1
   Compiling crossbeam-deque v0.7.3
   Compiling openssl-src v111.10.0+1.1.1g
   Compiling libz-sys v1.0.25
   Compiling bzip2-sys v0.1.9+1.0.8
   Compiling curl-sys v0.4.32+curl-7.70.0
   Compiling brotli-sys v0.3.2
   Compiling libgit2-sys v0.12.7+1.0.0
   Compiling runas v0.2.1
   Compiling backoff v0.1.6
   Compiling console v0.11.3
   Compiling java-properties v1.2.0
   Compiling might-be-minified v0.3.0
   Compiling rand v0.7.3
   Compiling r2d2 v0.8.8
   Compiling synstructure v0.12.4
   Compiling pest_generator v2.1.3
   Compiling scroll_derive v0.9.5
   Compiling openssl-sys v0.9.58
   Compiling indicatif v0.14.0
   Compiling scroll_derive v0.10.2
   Compiling dlv-list v0.2.2
   Compiling pest_derive v2.1.0
   Compiling scroll v0.10.1
   Compiling ordered-multimap v0.2.4
   Compiling failure v0.1.8
   Compiling goblin v0.2.3
   Compiling sha1 v0.6.0
   Compiling bstr v0.2.13
   Compiling chrono v0.4.11
   Compiling url v2.1.1
   Compiling string_cache v0.8.0
   Compiling rust-ini v0.15.3
   Compiling which v3.1.1
   Compiling uuid v0.8.1
   Compiling csv v1.1.3
   Compiling globset v0.4.5
   Compiling sourcemap v5.0.0
   Compiling plist v0.5.5
   Compiling anylog v0.5.0
   Compiling elementtree v0.5.0
   Compiling brotli2 v0.3.2
   Compiling debugid v0.7.2
   Compiling pdb v0.6.0
   Compiling proguard v4.0.1
   Compiling prettytable-rs v0.8.0
   Compiling ignore v0.4.16
   Compiling symbolic-common v7.5.0
   Compiling sentry-types v0.14.1
   Compiling bzip2 v0.3.3
   Compiling zip v0.5.6
   Compiling symbolic-debuginfo v7.5.0
   Compiling symbolic v7.5.0
   Compiling git2 v0.13.6
    Finished release [optimized] target(s) in 6m 10s
>>> host-sentry-cli 1.59.0 Installing to host directory
cd /home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0 && PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/home/thomas/sys/bin:/home/thomas/.gem/ruby/2.1.0/bin:/usr/share/Modules/bin:/usr/lib64/ccache:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/thomas/.rvm/bin:/home/thomas/.rvm/bin:/home/thomas/.local/bin:/home/thomas/projets/git-wrappers" PKG_CONFIG="/home/thomas/projets/buildroot/output/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/thomas/projets/buildroot/output/host/lib/pkgconfig:/home/thomas/projets/buildroot/output/host/share/pkgconfig" RUSTFLAGS="-C link-args=-L/home/thomas/projets/buildroot/output/host/lib -C link-args=-Wl,-rpath,/home/thomas/projets/buildroot/output/host/lib" CARGO_HOME=/home/thomas/projets/buildroot/output/host/share/cargo cargo install --offline --root /home/thomas/projets/buildroot/outpu
 t/host --bins --path ./ --force --locked 
  Installing sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
   Compiling syn v1.0.33
   Compiling synstructure v0.12.4
   Compiling pest_generator v2.1.3
   Compiling serde_derive v1.0.114
   Compiling failure_derive v0.1.8
   Compiling scroll_derive v0.10.2
   Compiling pest_derive v2.1.0
   Compiling failure v0.1.8
   Compiling which v3.1.1
   Compiling scroll v0.10.1
   Compiling runas v0.2.1
   Compiling goblin v0.2.3
   Compiling serde v1.0.114
   Compiling sha1 v0.6.0
   Compiling serde_json v1.0.56
   Compiling bstr v0.2.13
   Compiling chrono v0.4.11
   Compiling url v2.1.1
   Compiling string_cache v0.8.0
   Compiling uuid v0.8.1
   Compiling csv v1.1.3
   Compiling globset v0.4.5
   Compiling sourcemap v5.0.0
   Compiling plist v0.5.5
   Compiling anylog v0.5.0
   Compiling git2 v0.13.6
   Compiling elementtree v0.5.0
   Compiling debugid v0.7.2
   Compiling pdb v0.6.0
   Compiling proguard v4.0.1
   Compiling prettytable-rs v0.8.0
   Compiling ignore v0.4.16
   Compiling symbolic-common v7.5.0
   Compiling sentry-types v0.14.1
   Compiling symbolic-debuginfo v7.5.0
    Building [====================================================>  ] 299/305: sentry-types, symbolic-debuginfo, ignore                                                                                                                    

   Compiling symbolic v7.5.0
   Compiling sentry v0.18.1
   Compiling sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)
    Finished release [optimized] target(s) in 2m 35s
  Installing /home/thomas/projets/buildroot/output/host/bin/sentry-cli
   Installed package `sentry-cli v1.59.0 (/home/thomas/projets/buildroot/output/build/host-sentry-cli-1.59.0)` (executable `sentry-cli`)

Any idea ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
