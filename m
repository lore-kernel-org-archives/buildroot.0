Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C408C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 11:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1C840848;
	Fri, 28 Aug 2026 11:32:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V8iNTDyK9Zxm; Fri, 28 Aug 2026 11:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787916769;
	bh=C26ychJPQg3zvOAiTCDFnx/yrjI64r6mWA19Px7W1iU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mTd8h8Q80FfEFy1UmztIHmIzZ0m1eGkE38L80g8eNM8v894uewfvWCbeV59lGhaQq
	 QGrs5IXmEBT5e2ni51lLcyYGxEADvtkUZi0iiwQiGBSUKxeSLf7Vks/X7OLBlpQpjM
	 DZKvEYtMytLZy30bSuu2OfqnMbXwdN0sk3vvNELLLoqTRH1F5T5ovqdthJAp6pAbpA
	 sOrYp86E0NKzmvdKU7NUT9q4hxUXOqfdqfXbvKapo3njrjh0i+EVdOi10X+32BzrRh
	 uLs3h8RuJmub0BPcYBa09mmaebJFTuw9IGADdmL7hyOy/VNVGOlDkbHeIDImgmcqCx
	 pWdPICyVTH77g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E79E407FB;
	Fri, 28 Aug 2026 11:32:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F477336
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82ED040121
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRrlqKWlZQxY for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 11:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=bogdan@nimblex.org; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=nimblex.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=nimblex.net header.i=@nimblex.net header.a=rsa-sha256
 header.s=google header.b=TpIf4GmL
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58C8D4005A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 11:32:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso5764865e9.0
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 04:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nimblex.net; s=google; t=1787916764; x=1788521564; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HK6ZA57F45uRk7RSllFOhJQobaAWeYV1bCQmYWYOhSk=;
 b=TpIf4GmLrn2qxckfQZ3yt5C3Ysfrtgqs49P6x3s4zR0hpaauV4rsuoMnzqeUxMlr5E
 b/2QlQanSjLiNq+UQeFv7PiH7Z/GWPKpA+f38trJEfZ5YDGbcjiBLPVVNhxWVauR0jqU
 CasWfbXxAmp6ET/7H+/rzxmiSGT0YzrTfLCB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787916764; x=1788521564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HK6ZA57F45uRk7RSllFOhJQobaAWeYV1bCQmYWYOhSk=;
 b=MOkyANJqwix1uKQ6iVcmEt5IJCrg+OEiW8dSiVdFkI9y/+xLX+rS8Qzno0luGSXuUG
 QngEh9qNoRhR94hA6coDe1+wxFMTZPj/YFH+CD69OgCJ0Kglx9fVDkiWfCeNy3n8wWKg
 ar/UnJ7mn7dUXUO/kLd9U9FZtcopk+/fSt8bcpVtXoyqHcigLBcqWme8X8MtOlOogtWk
 upUzMUciuS9NSdTAYJKjgxqCQis+1KcnDcgiWZ5bFhYAVKyQkY9trD6YrF2g+CnXFQ2J
 9sc67ho13sXIJ78Xh1E0fEl8X96zg08kCQ3VB9gatt8oa5GMj5ez7sXlFFS7caci1cCY
 H0qA==
X-Gm-Message-State: AFuF++l8l0WXa4adfDevx1JzkNwqxxolIySQFUaBe00lLUb5KN70q6yV
 DgLujZkyzQRcRlFXvbSsmOkKEKKHDjQuNx2piBm/UgvS4JswxnfgzD59GTryWBn1PPBk9BZ8KBD
 X835vOnE=
X-Gm-Gg: AR+sD13Tw/v9u8+tiMM9DCY6MOYFevSeCdTxagse+MGrNeQGnx2uB63ocwbwymj6Rrg
 6KF+UOkDb93aM6LgVvkRzNw67XHix/l9rKZL6st/ds1eH9KCmCnzOsvVu02OE/lRFzMPpMKkLnv
 3gb5fb8uTUIKX2J7b/Xd2RyFFezbAat5kxnXsJ8/pCQuAg7DvP76Cv/e0xJB71XroCCjYRYUydb
 vDaVdpnxhd5ohkHsGRUt0Tdhh41sQVtT3G1gaHjjFEi17QoRKhekDx7MGqnrJDA9YBUZm3H/cxw
 kiSdMDgsnrnlNcWuJSckJRLYjrBjdrOA8f9RREeZsGSnUD41/Z4gWBx0IkvWMLdAL3VJ1sTKnEH
 BjSe24pMscGDP4QdX/Ty4PLBACRnuuS8e1qOGD4tkdSrvtXITy0clyi4Fkik1N9Cw4KQUXnyFCA
 uHy4lHqkZU3m1/sdgINL8/SmOiflnPo3daHq3N5GJJl49V9EyjJLgs3yy/wQ==
X-Received: by 2002:a05:600c:8b86:b0:493:f5bf:4dc6 with SMTP id
 5b1f17b1804b1-49b91c2777emr107387425e9.7.1787916763535; 
 Fri, 28 Aug 2026 04:32:43 -0700 (PDT)
Received: from nimblex ([2a02:2f0c:5a05:7200:60d7:4f79:f9e4:d6e9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbb20526sm3927004f8f.19.2026.08.28.04.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 04:32:43 -0700 (PDT)
From: Bogdan Radulescu <bogdan@nimblex.net>
To: buildroot@buildroot.org
Cc: Bogdan Radulescu <bogdan@nimblex.net>
Date: Fri, 28 Aug 2026 14:32:41 +0300
Message-ID: <20260828113241.3531968-1-bogdan@nimblex.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nettest: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nettest measures download and upload throughput, latency, jitter and
packet loss using the RMBT protocol. The same binary runs as either the
client or the measurement server it tests against.

Written in Rust with no native library dependencies: the target binary
links only libc, libm and libgcc_s, and is fully static when built
against musl.

Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/nettest/Config.in    | 11 +++++++++++
 package/nettest/nettest.hash |  3 +++
 package/nettest/nettest.mk   | 12 ++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/nettest/Config.in
 create mode 100644 package/nettest/nettest.hash
 create mode 100644 package/nettest/nettest.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55..1116f677 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -564,6 +564,7 @@ F:	package/libgpiod2/
 N:	Bogdan Radulescu <bogdan@nimblex.net>
 F:	package/iftop/
 F:	package/ncdu/
+F:	package/nettest/
 
 N:	Brandon Maier <brandon.maier@collins.com>
 F:	board/freescale/ls1046a-frwy/
diff --git a/package/Config.in b/package/Config.in
index 60588006..913daff7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2558,6 +2558,7 @@ endif
 	source "package/nethogs/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
+	source "package/nettest/Config.in"
 	source "package/network-manager/Config.in"
 	source "package/network-manager-openvpn/Config.in"
 	source "package/networkd-dispatcher/Config.in"
diff --git a/package/nettest/Config.in b/package/nettest/Config.in
new file mode 100644
index 00000000..0ec4dcdc
--- /dev/null
+++ b/package/nettest/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NETTEST
+	bool "nettest"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  nettest measures download and upload throughput, latency,
+	  jitter and packet loss using the RMBT protocol. The same
+	  binary runs as either the client or the measurement server
+	  it tests against.
+
+	  https://github.com/specure/nettest
diff --git a/package/nettest/nettest.hash b/package/nettest/nettest.hash
new file mode 100644
index 00000000..eaafe15e
--- /dev/null
+++ b/package/nettest/nettest.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  13dd03c8853f7eb9a4dd20b9deedbfa7cd7efbc59a175bd3bb1f0c4d1126e238  nettest-2.1.3-cargo6.tar.gz
+sha256  6523fc0e74e4774f105b0ee86a8187952337db6231f1a1817316174e241344ff  LICENSE.txt
diff --git a/package/nettest/nettest.mk b/package/nettest/nettest.mk
new file mode 100644
index 00000000..d7ca9864
--- /dev/null
+++ b/package/nettest/nettest.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# nettest
+#
+################################################################################
+
+NETTEST_VERSION = 2.1.3
+NETTEST_SITE = $(call github,specure,nettest,v$(NETTEST_VERSION))
+NETTEST_LICENSE = Apache-2.0
+NETTEST_LICENSE_FILES = LICENSE.txt
+
+$(eval $(cargo-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
