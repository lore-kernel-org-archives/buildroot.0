From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 16:39:06 +0000
Subject: [Buildroot] [PATCH] libcurl: security bump to version 7.39.0
In-Reply-To: <1415197892-30325-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415197892-30325-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545A52AA.6080502@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/05/2014 02:31 PM, Gustavo Zacarias wrote:
> Fixes:
> CVE-2014-3707 - libcurl's function curl_easy_duphandle() has a bug that
> can lead to libcurl eventually sending off sensitive data that was not
> intended for sending.
> 
> Removed patch that was upstream and now in the release.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libcurl/libcurl-0001-fixtimeout.patch | 37 ---------------------------
>  package/libcurl/libcurl.hash                  |  2 +-
>  package/libcurl/libcurl.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 39 deletions(-)
>  delete mode 100644 package/libcurl/libcurl-0001-fixtimeout.patch
> 
> diff --git a/package/libcurl/libcurl-0001-fixtimeout.patch b/package/libcurl/libcurl-0001-fixtimeout.patch
> deleted file mode 100644
> index f897ca4..0000000
> --- a/package/libcurl/libcurl-0001-fixtimeout.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -This fixes a timeout problem with xbmc.
> -
> -Backported from upstream:
> -https://github.com/bagder/curl/commit/d9762a7cdb35e70f8cb0bf1c2f8019e8391616e1
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -
> -
> -From d9762a7cdb35e70f8cb0bf1c2f8019e8391616e1 Mon Sep 17 00:00:00 2001
> -From: Daniel Stenberg <daniel@haxx.se>
> -Date: Tue, 23 Sep 2014 11:44:03 +0200
> -Subject: [PATCH] threaded-resolver: revert Curl_expire_latest() switch
> -
> -The switch to using Curl_expire_latest() in commit cacdc27f52b was a
> -mistake and was against the advice even mentioned in that commit. The
> -comparison in asyn-thread.c:Curl_resolver_is_resolved() makes
> -Curl_expire() the suitable function to use.
> -
> -Bug: http://curl.haxx.se/bug/view.cgi?id=1426
> -Reported-By: graysky
> ----
> - lib/asyn-thread.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/lib/asyn-thread.c b/lib/asyn-thread.c
> -index e4ad32b..6cdc9ad 100644
> ---- a/lib/asyn-thread.c
> -+++ b/lib/asyn-thread.c
> -@@ -541,7 +541,7 @@ CURLcode Curl_resolver_is_resolved(struct connectdata *conn,
> -       td->poll_interval = 250;
> - 
> -     td->interval_end = elapsed + td->poll_interval;
> --    Curl_expire_latest(conn->data, td->poll_interval);
> -+    Curl_expire(conn->data, td->poll_interval);
> -   }
> - 
> -   return CURLE_OK;
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index 7eded03..4c3b8ac 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature
> -sha256	035bd41e99aa1a4e64713f4cea5ccdf366ca8199e9be1b53d5a043d5165f9eba	curl-7.38.0.tar.bz2
> +sha256	b222566e7087cd9701b301dd6634b360ae118cc1cbc7697e534dc451102ea4e0	curl-7.39.0.tar.bz2
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 4af73b1..62ea5fb 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 7.38.0
> +LIBCURL_VERSION = 7.39.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
>  LIBCURL_SITE = http://curl.haxx.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile-test on MIPS architecture plus checking the files are actually
installed in target and were built for the right architecture.

$ file output/target/usr/lib/libcurl.so.4.3.0
output/target/usr/lib/libcurl.so.4.3.0: ELF 32-bit MSB shared object,
MIPS, MIPS32 rel2 version 1 (SYSV), dynamically linked, with unknown
capability 0x41000000 = 0xf676e75, with unknown capability 0x10000 =
0x70401, not stripped

Also built successfully all the packages depending on
BR2_PACKAGE_LIBCURL (except xbmc, which is not supported on MIPS;
clamav, which for some reason I was unable to download; and webkit,
which failed to build for a reason I still have to investigate):

BR2_PACKAGE_COLLECTD
BR2_PACKAGE_CURLFTPFS
BR2_PACKAGE_LIBECORE
BR2_PACKAGE_FEH
BR2_PACKAGE_FLICKCURL
BR2_PACKAGE_GNUPG
BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL
BR2_PACKAGE_LIBOAUTH
BR2_PACKAGE_LIBUPNPP
BR2_PACKAGE_LIBXMLRPC
BR2_PACKAGE_LINKNX
BR2_PACKAGE_MPD_CURL
BR2_PACKAGE_OPENSWAN
BR2_PACKAGE_PHP_EXT_CURL
BR2_PACKAGE_RTORRENT
BR2_PACKAGE_STRONGSWAN_CURL
BR2_PACKAGE_TRANSMISSION
BR2_PACKAGE_VORBIS_TOOLS
BR2_PACKAGE_XERCES

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
