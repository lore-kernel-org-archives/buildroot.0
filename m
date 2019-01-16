From: Ryan Coe <bluemrp9@gmail.com>
Date: Tue, 15 Jan 2019 17:40:53 -0800
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <20190115224239.26125-1-ps.report@gmx.net>
References: <20190115224239.26125-1-ps.report@gmx.net>
Message-ID: <f0836ac8-ad36-b0f7-a6e1-8f9eef1fe7cd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 1/15/19 2:42 PM, Peter Seiderer wrote:
> - remove all parallel build patches (openssl build-system changed)
>
> - rebased 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>    to apply to Configurations/unix-Makefile.tmpl (Makefile template)
>
> - removed 0002-cryptodev-Fix-issue-with-signature-generation.patch
>    (upstream applied)
>
> - rebased 0003-Reproducible-build-do-not-leak-compiler-path.patch to
>    apply to crypto/build.info (Makefile template)
>
> - fix musl/uclibc build failure, use '-DOPENSSL_NO_ASYNC'
>
> - remove legacy enable-tlsext configure option
>
> - fix host library install path
>
> - change legacy INSTALL_PREFIX to DESTDIR
>
> - remove 'libraries gets installed read only, so strip fails'
>    workaround (not needed anymore)
>
> - change engine directory from /usr/lib/engines to
>    /usr/lib/engines-1.1
>
> - change license file hash, no license change, only the following
>    hint was removed:
>
>      Actually both licenses are BSD-style Open Source licenses.
>      In case of any license issues related to OpenSSL please
>      contact openssl-core at openssl.org.
>
> - fix host-libopenssl compile setting rpath as decribed in
>    libopenssl-1.1.0h/NOTES.UNIX
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v3 -> v4:
>    - bump version to 1.1.1a
>    - remove all parallel build patches hash file entries
>    - re-remove 0004-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
>      (upstream applied)
>    - fix hist library install path
>    - removed 0002-cryptodev-Fix-issue-with-signature-generation.patch
>      (upstram applied)
>    - remove follow up patch for openssh (not longer needed since
>      version bump to 7.9p1, see https://www.openssh.com/releasenotes.html
>      Portability)
>
> Changes v2 -> v3:
>    - no changes
>
> Changes v1 -> v2:
>    - add OPENSSL_NO_ASYNC workaround for musl compile too
>      (suggested by Bernd Kuhls)
>
>    - fix host-libopenssl compile (reported by Ryan Coe) by setting rpath
>      (suggested by Ryan Coe)
>
>    - fix 0001-Dont-waste-time-building-manpages-if-we-re-not-going.patch
>      and 0003-Reproducible-build-do-not-leak-compiler-path.patch to apply
>      to the Makefile templates (instead of re-generated Makefile)
>      (reported by Ryan Coe)
>
>    - add 0004-Revert-util-dofile.pl-only-quote-stuff-that-actually.patch
>      (suggested by Bernd Kuhls)
>
> Notes:
>
>   - There was a previous attempt to bump the openssl version by
>     David Mosberger <davidm@egauge.net>. I could not find the
>     corresponding patch in patchwork or on the mailing list,
>     only a reply by Arnout Vandecappelle (see [2]) and the
>     answer by David Mosberger (see [3]).
>
>   - Compile checked packages (depending explicit on libopenssl or host-libopenssl):
>     O.k:
>       - hostapd
>       - libpjsip
>       - mosquitto
>       - wpa_supplicant
>
>      Failure:
>       - softether/host-softether
>
>   - Compile checked packages (depending on openssl or host-openssl):
>      O.k.:
>        - alljoyn-base
>        - apr
>        - apr-util
>        - freeswitch
>        - openssh
>
>      Failure:
>        - android-tools
>        - apache (CMake configure errro, unrelated?)
>
> [2] http://lists.busybox.net/pipermail/buildroot/2017-August/200859.html
> [3] http://lists.busybox.net/pipermail/buildroot/2017-August/200898.html
> ---
>   ...building-manpages-if-we-re-not-going.patch |  34 +-
>   ...-Fix-issue-with-signature-generation.patch | 450 ------------------
>   ...ible-build-do-not-leak-compiler-path.patch |  31 +-
>   package/libopenssl/libopenssl.hash            |  15 +-
>   package/libopenssl/libopenssl.mk              |  41 +-
>   5 files changed, 61 insertions(+), 510 deletions(-)
>   delete mode 100644 package/libopenssl/0002-cryptodev-Fix-issue-with-signature-generation.patch

[snip]


Thanks for your continued work on bumping libopenssl.


I'm getting a build failure in wget with the patch.? The failure is:

checking for library containing psl_builtin... no
configure: WARNING: *** libpsl was not found. Fallback to builtin cookie 
checking.
checking for ZLIB... yes
checking for OPENSSL... no
configure: error: Package requirements (openssl) were not met:

Package 'openssl', required by 'virtual:world', not found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.

Alternatively, you may set the environment variables OPENSSL_CFLAGS
and OPENSSL_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.
make: *** [package/pkg-generic.mk:223: 
/home/ryan/devel/buildroot/output/build/wget-1.20.1/.stamp_configured] 
Error 1


The following tweak makes things build again for me:

diff --git a/package/libopenssl/libopenssl.mk 
b/package/libopenssl/libopenssl.mk
index e461e08126..8046995720 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -74,7 +74,7 @@ define HOST_LIBOPENSSL_CONFIGURE_CMDS
 ???? ??? ./config \
 ???? ??? --prefix=$(HOST_DIR) \
 ???? ??? --openssldir=$(HOST_DIR)/etc/ssl \
-??? ??? --libdir=$(HOST_DIR)/lib \
+??? ??? --libdir=lib \
 ???? ??? -Wl,-rpath,'$(HOST_DIR)/lib' \
 ???? ??? shared \
 ???? ??? zlib-dynamic \
@@ -90,7 +90,7 @@ define LIBOPENSSL_CONFIGURE_CMDS
 ???? ??? ??? linux-$(LIBOPENSSL_TARGET_ARCH) \
 ???? ??? ??? --prefix=/usr \
 ???? ??? ??? --openssldir=/etc/ssl \
-??? ??? ??? --libdir=/lib \
+??? ??? ??? --libdir=lib \
 ???? ??? ??? $(if $(BR2_TOOLCHAIN_HAS_THREADS),threads,no-threads) \
 ???? ??? ??? $(if $(BR2_STATIC_LIBS),no-shared,shared) \
 ???? ??? ??? no-rc5 \
