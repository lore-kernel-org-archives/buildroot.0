Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C15CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 15:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A5140913;
	Sun, 24 Sep 2023 15:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A5140913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y_6OOgZNUpiL; Sun, 24 Sep 2023 15:49:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66EA34095E;
	Sun, 24 Sep 2023 15:49:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66EA34095E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22A3D1BF3E8
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF6ED40960
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 15:49:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF6ED40960
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8vpP6qpVWH6 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 15:49:11 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8D44E40994
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 15:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D44E40994
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3215f19a13aso4836241f8f.3
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 08:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695570549; x=1696175349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P+ZG7QC3QVizb9I8xHKVWluxYAaKV60p6q16h3J8LXY=;
 b=g0U9F74gle9MnXcYHWkp4K16EhEY+FHS7D9mMFU68J5JzvyvDz/iTgPgHASfv8/WGk
 AKh4M17mwx4DaBiIpjVPWAOtO6pAwC+CH0pD1NyOEt8SJEFBGXMAXSFysBaTpH4P/pof
 g39Go4G4nLHEGmbsXjS8CTBMy1GsZF3hTnIt10j/ROna/CX3tJljM5+DToVWEyYV0YqK
 wgbb4qshBSIHgaSDO5rLIvIrcsW9yQXjy8q9XDPyg+mrYc5oWhEyUgj4i7rQw2rH9CfH
 J3Vd/es1jWao6t9dxUI80O5/axTrlcTG6ChQ4R14VNLMynTDMvd+MSPWjn/UaVi3xLjC
 kL9A==
X-Gm-Message-State: AOJu0Yw+8xuApu3JfxpUbmreZ014p7ZMp/ePk/4+qou/3y2wsLZbu+ZJ
 RTH6AgZ6LH5q6vwyLEZhByXyYgQhWqI=
X-Google-Smtp-Source: AGHT+IH0IMBoOvRBO87fb7vXij+Tu7Qw+c9/5jSuKlaPhMfBKEwJ3Lg5iIprz7oo+U4ntjlE97lOSQ==
X-Received: by 2002:a5d:4305:0:b0:31f:ca48:552f with SMTP id
 h5-20020a5d4305000000b0031fca48552fmr3911683wrq.67.1695570548956; 
 Sun, 24 Sep 2023 08:49:08 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b1-20020a5d4d81000000b003215c6e30cbsm9443922wru.104.2023.09.24.08.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Sep 2023 08:49:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 17:49:05 +0200
Message-Id: <20230924154905.964469-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695570549; x=1696175349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P+ZG7QC3QVizb9I8xHKVWluxYAaKV60p6q16h3J8LXY=;
 b=dELBWUKmi6Cft6zX9dmpnMsp+gGyiKXv4CJdlQG5bwj8cUWtC040CAhdHisZsNnNKL
 dTTQ1aahp+3RpPrO5LXDu/VG7v5z2VazDsj+wJPqfQV0rw0QQvPYBJ+iEntoFsE2Hoh/
 feyLZg+ZGQ+LKVvZP0QVY1JdPxSu6U5M5yPpTD5qh0OvtBfmTYTkytfxjunTzcszNrQZ
 EDuODYdCq3naEPpv4hQchNrRdn0W5k1nrCUuhY4I413fu06Kf+/Q+XMTP3Heq935Bd5m
 BGu7Dc58OL6era3VjoWvb7wVCr3rh9/fuKGFZiKq62DvveUxtTpKLg0T4Q44zKFUGAiE
 6oAg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dELBWUKm
Subject: [Buildroot] [PATCH 1/1] package/keepalived: bump to version 2.2.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ilias Apalodimas <apalos@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop all patches (already in version) and so drop autoreconf

https://www.keepalived.org/release-notes/Release-2.2.8.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  3 -
 ...upport-meta-l4proro-until-Linux-3-14.patch | 76 -------------------
 ...upport-meta-l4proro-until-Linux-3-14.patch | 40 ----------
 .../0003-fix-build-with-libressl.patch        | 50 ------------
 package/keepalived/keepalived.hash            |  2 +-
 package/keepalived/keepalived.mk              |  4 +-
 6 files changed, 2 insertions(+), 173 deletions(-)
 delete mode 100644 package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
 delete mode 100644 package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
 delete mode 100644 package/keepalived/0003-fix-build-with-libressl.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a6e1672c6..55e1bbe6fa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -614,9 +614,6 @@ package/janus-gateway/0001-disable-ssp.patch Upstream
 package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch Upstream
 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch Upstream
 package/jose/0002-man-add-option-to-skip-building-man-pages.patch Upstream
-package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch Upstream
-package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch Upstream
-package/keepalived/0003-fix-build-with-libressl.patch Upstream
 package/kexec-lite/0001-clean-restart.patch Upstream
 package/keyutils/0001-fix-install-rule.patch Upstream
 package/keyutils/0002-cifs.patch Sob Upstream
diff --git a/package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch b/package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
deleted file mode 100644
index 9d5f3f7905..0000000000
--- a/package/keepalived/0001-vrrp-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From edc71b19c619fdc1d71df10a2d0e8f5822965d69 Mon Sep 17 00:00:00 2001
-From: Quentin Armitage <quentin@armitage.org.uk>
-Date: Tue, 8 Feb 2022 14:58:49 +0000
-Subject: [PATCH] vrrp: nft didn't support meta l4proro until Linux 3.14
-
-For Linux 3.13 (first version to support nftables), we instead specify:
-@nh,48,8 58
-
-Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
-
-[Retrieved (and updated to drop update of README.kernel_versions) from:
-https://github.com/acassen/keepalived/commit/edc71b19c619fdc1d71df10a2d0e8f5822965d69]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- README.kernel_versions          |  1 +
- configure.ac                    |  5 +++++
- keepalived/vrrp/vrrp_nftables.c | 16 ++++++++++++++--
- 3 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 350a9f4e9..bc643dbf1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1754,6 +1754,11 @@ if test .${enable_nftables} != .no; then
- 	],[
- 	  AC_MSG_RESULT(no)
- 	])
-+
-+      # nft l4proto from Linux 3.14
-+      AC_CHECK_DECLS([NFT_META_L4PROTO], [], [],
-+        [#include <linux/netfilter/nf_tables.h>])
-+
-       # nft dup from Linux 4.3
-       AC_CHECK_DECLS([NFTA_DUP_MAX], [], [],
-         [#include <linux/netfilter/nf_tables.h>])
-diff --git a/keepalived/vrrp/vrrp_nftables.c b/keepalived/vrrp/vrrp_nftables.c
-index d3ea39db3..8b5095ad4 100644
---- a/keepalived/vrrp/vrrp_nftables.c
-+++ b/keepalived/vrrp/vrrp_nftables.c
-@@ -1191,6 +1191,8 @@ setup_rule_move_igmp(uint8_t family, const char *table,
- 	   otherwise:
- 	     nft add rule ip keepalived out ip protocol igmp [meta oifkind macvlan] oif @vmac_set drop
- 	     nft add rule ip6 keepalived out icmpv6 type mld2-listener-report [meta oifkind macvlan] oif @vmac_set drop
-+	 *
-+	 * Note: on 3.13 kernels, icmpv6 is specified as @nh,48,8 58
- 	 */
- 	struct nftnl_rule *r = NULL;
- 	uint64_t handle_num;
-@@ -1223,7 +1225,12 @@ setup_rule_move_igmp(uint8_t family, const char *table,
- 			    offsetof(struct iphdr, daddr), sizeof(struct in_addr));
- #endif
- 	} else {
--		add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
-+#if HAVE_DECL_NFT_META_L4PROTO
-+		add_meta(r, NFT_META_L4PROTO, NFT_REG_1);	/* From Linux 3.14 */
-+#else
-+		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
-+			    offsetof(struct ip6_hdr, ip6_nxt), sizeof(((struct ip6_hdr *)NULL)->ip6_nxt));
-+#endif
- 		protocol = IPPROTO_ICMPV6;
- 		add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &protocol, sizeof(protocol));
- 		add_payload(r, NFT_PAYLOAD_TRANSPORT_HEADER, NFT_REG_1,
-@@ -1279,7 +1286,12 @@ setup_rule_drop_router_solicit(const char *table, const char *chain,
- 		nftnl_rule_set_u64(r, NFTNL_RULE_POSITION, handle_num);
- 	}
- 
--	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
-+#if HAVE_DECL_NFT_META_L4PROTO
-+	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);	/* From Linux 3.14 */
-+#else
-+	add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
-+		    offsetof(struct ip6_hdr, ip6_nxt), sizeof(((struct ip6_hdr *)NULL)->ip6_nxt));
-+#endif
- 	protocol = IPPROTO_ICMPV6;
- 	add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &protocol, sizeof(protocol));
- 	add_payload(r, NFT_PAYLOAD_TRANSPORT_HEADER, NFT_REG_1,
diff --git a/package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch b/package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
deleted file mode 100644
index 3713de37c2..0000000000
--- a/package/keepalived/0002-ipvs-nft-didn-t-support-meta-l4proro-until-Linux-3-14.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 50e8a8d56cd5a3d7184b035708865302bbc7ef69 Mon Sep 17 00:00:00 2001
-From: Quentin Armitage <quentin@armitage.org.uk>
-Date: Tue, 8 Feb 2022 17:43:49 +0000
-Subject: [PATCH] ipvs: nft didn't support meta l4proro until Linux 3.14
-
-For Linux 3.13 (first version to support nftables), we instead specify:
-ipv4: @nh,72,8 PROTO
-ipv6: @nh,48,8 PROTO
-
-Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
-
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/50e8a8d56cd5a3d7184b035708865302bbc7ef69]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- keepalived/check/check_nftables.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/keepalived/check/check_nftables.c b/keepalived/check/check_nftables.c
-index 2d163ac14..45831203b 100644
---- a/keepalived/check/check_nftables.c
-+++ b/keepalived/check/check_nftables.c
-@@ -150,7 +150,16 @@ setup_rule_set_mark(uint8_t family, const char *table,
- 		nftnl_rule_set_u64(r, NFTNL_RULE_POSITION, handle_num);
- 	}
- 
--	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);
-+#if HAVE_DECL_NFT_META_L4PROTO
-+	add_meta(r, NFT_META_L4PROTO, NFT_REG_1);	/* From Linux 3.14 */
-+#else
-+	if (family == NFPROTO_IPV4)
-+		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
-+			    offsetof(struct iphdr, protocol), sizeof(((struct iphdr *)NULL)->protocol));
-+	else
-+		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
-+			    offsetof(struct ip6_hdr, ip6_nxt), sizeof(((struct ip6_hdr *)NULL)->ip6_nxt));
-+#endif
- 	add_cmp(r, NFT_REG_1, NFT_CMP_EQ, &l4_protocol, sizeof(l4_protocol));
- 	if (family == NFPROTO_IPV4)
- 		add_payload(r, NFT_PAYLOAD_NETWORK_HEADER, NFT_REG_1,
diff --git a/package/keepalived/0003-fix-build-with-libressl.patch b/package/keepalived/0003-fix-build-with-libressl.patch
deleted file mode 100644
index 090d35511c..0000000000
--- a/package/keepalived/0003-fix-build-with-libressl.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From bbec15d4781670ac1be5e543cb04543f79200e69 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 12 Apr 2022 20:30:57 +0200
-Subject: [PATCH] fix build with libressl
-
-SSL_set0_rbio is provided by libressl since version 3.4.0 and
-https://github.com/libressl-portable/openbsd/commit/c99939f9665a9c3c648682b4987df46600b70efc
-but SSL_set0_wbio is not provided resulting in the following build
-failure:
-
-/nvmedata/autobuild/instance-9/output-1/host/lib/gcc/s390x-buildroot-linux-gnu/10.3.0/../../../../s390x-buildroot-linux-gnu/bin/ld: check/libcheck.a(check_ssl.o): in function `ssl_connect':
-check_ssl.c:(.text+0x7da): undefined reference to `SSL_set0_wbio'
-
-Fixes:
- - http://autobuild.buildroot.org/results/76f72a3c7350ea265e2277c89d68e5256410e94c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/acassen/keepalived/commit/bbec15d4781670ac1be5e543cb04543f79200e69]
----
- configure.ac                 | 2 +-
- keepalived/check/check_ssl.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5a2ea76ec..e8b5ccc41 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1327,7 +1327,7 @@ AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- AC_CHECK_FUNCS([SSL_CTX_set_verify_depth])
- 
- # SSL_set0_rbio(), SSL_set0_wbio() OPENSSL_init_crypto() and TLS_method() introduced OpenSSL v1.1.0
--AC_CHECK_FUNCS([SSL_set0_rbio OPENSSL_init_crypto TLS_method])
-+AC_CHECK_FUNCS([SSL_set0_wbio OPENSSL_init_crypto TLS_method])
- 
- # In OpenSSL v1.1.1 the call to SSL_CTX_new() fails if OPENSSL_init_crypto() has been called with
- # OPENSSL_INIT_NO_LOAD_CONFIG. It does not fail in v1.1.0h and v1.1.1b.
-diff --git a/keepalived/check/check_ssl.c b/keepalived/check/check_ssl.c
-index 0155fce59..2cbedb8d3 100644
---- a/keepalived/check/check_ssl.c
-+++ b/keepalived/check/check_ssl.c
-@@ -234,7 +234,7 @@ ssl_connect(thread_ref_t thread, int new_req)
- 		BIO_get_fd(req->bio, &bio_fd);
- 		if (fcntl(bio_fd, F_SETFD, fcntl(bio_fd, F_GETFD) | FD_CLOEXEC) == -1)
- 			log_message(LOG_INFO, "Setting CLOEXEC failed on ssl socket - errno %d", errno);
--#ifdef HAVE_SSL_SET0_RBIO
-+#ifdef HAVE_SSL_SET0_WBIO
- 		BIO_up_ref(req->bio);
- 		SSL_set0_rbio(req->ssl, req->bio);
- 		SSL_set0_wbio(req->ssl, req->bio);
diff --git a/package/keepalived/keepalived.hash b/package/keepalived/keepalived.hash
index 9d8ab949b7..7c93d81803 100644
--- a/package/keepalived/keepalived.hash
+++ b/package/keepalived/keepalived.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c61940d874154a560a54627ecf7ef47adebdf832164368d10bf242a4d9b7d49d  keepalived-2.2.7.tar.gz
+sha256  85882eb62974f395d4c631be990a41a839594a7e62fbfebcb5649a937a7a1bb6  keepalived-2.2.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 5d6cf174e3..eb5abf97a2 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-KEEPALIVED_VERSION = 2.2.7
+KEEPALIVED_VERSION = 2.2.8
 KEEPALIVED_SITE = http://www.keepalived.org/software
 KEEPALIVED_DEPENDENCIES = host-pkgconf openssl
 KEEPALIVED_LICENSE = GPL-2.0+
 KEEPALIVED_LICENSE_FILES = COPYING
 KEEPALIVED_CPE_ID_VENDOR = keepalived
 KEEPALIVED_CONF_OPTS = --disable-hardening
-# We're patching configure.ac
-KEEPALIVED_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_JSON_C),y)
 KEEPALIVED_DEPENDENCIES += json-c
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
