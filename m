Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B5AC44529
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 259904087A;
	Tue, 21 Jul 2026 09:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cdOzx0bNkWWC; Tue, 21 Jul 2026 09:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9EE4086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626788;
	bh=l1D6NBYg1MGoUX2sIurej5pC4IxqD/rnasocnoc5i5k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3cAu5eH5MKx3zvIePyHxnOnHttK6L52D1nLulULNbib0rMxxp2bWIJhIGIqe4IP1
	 qI/qz7uk+J+4Gz9u8gm2t/yGa6n/lx/Y8/0FGLpO4nZrEfAe9PDCGmATCnVnJVUM6a
	 izvpdZbYusfCysIZ44WCoAmlUBnMNDKGtmbE+onlAbDeqOlEwnj5S+5HX/hGQZeKdG
	 fBJZWv8L5KjsBuMJRQuDTDLN9n/cB0S2imu0ROnnPR1dLctylxLCc0YnqqkdYB2tHT
	 BKAnj05HoCdFHExk+yevsh/fV+jmftzrJY1mw1AX7bPP94lwgtOI7pty8n6pATu6/5
	 3usNH5TMtjWVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9EE4086E;
	Tue, 21 Jul 2026 09:39:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2766D96C
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 198F080BE6
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YYbtmrk_XQxe for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0697C80B5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0697C80B5C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0697C80B5C
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso11568065e9.3
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626783; x=1785231583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hA6dDR0HY2iiLn96/2aVxsEMEef8mPWiwaHNcaGQktQ=;
 b=eXp2OI3tPpm7rKQ0l0GeuXkYUP9xhPy+pKbAvY4Y/08xx7UHOan8FASS22IfsDlPxb
 UKKAKkm2XJQXwAolVykUQEVTuiANLrJiEjaCBT88Uxlwott3QLHp0EGNRN4ozO3a0sCr
 BZw3iyJa3/H+wEs4ZJZ2xAOnr4EVniIUnLU73Fi0auYufLgkufqFB+uilDqwJPv7D7EN
 BfrMbKlgTP9EojyfjdIoClBq+0zEphrQTEOqSPBN+y0vQKJXW5anNyqZZgImVG2top6A
 NrV9cs9ft6zXfcWCxWPwudfli1lNBS+com/HQbuF/dNALyPFF/jGHterAHlw+rwp7ErS
 7hwQ==
X-Gm-Message-State: AOJu0YydujydoRES82IdtC1aKj0v9/r7AD9ysoUTezgk/px5xLP0ZYf9
 t/FGQVeBcAC3EMJ+5yQJag5C35+kdnWlOhKE4iOlqg+5Ht3fX2+1fCh0Fr002A==
X-Gm-Gg: AfdE7ck7RE+M++NwALYhAKKHzV3ssiITMfayW/wAOsczOX1XUC8L+H88BsykhKLDQ3O
 QBgk/7ub3xY7IOgDsQ0JwQOOSDR5GiRasfh/A5gGZkVKpV5+YYXBoPxTBBv3TWXZcQnAo5996c/
 6IBsm18BHLo1kqLlJF/xjoS8tKdwSnwZ9Z1QQBTAQ+xLWKIC/zLdJmArjOuUvmUlPsgm6zriu1n
 znr3stXpL+C6w3sViURlSinS0mU9YyvID3kmdYd3wROEJwj8QKVc0+cY2Vs4tSSOBM5z4athcoP
 hR90Qh9JoX/qFrBMqUNAcRRQxkcWaUjQE4+u2k8nVVUZ33uKv2SGWPymFjkmph94KhZeqFHnny7
 cx4UEmZJK68q7ANwkO3MSjsuTBaLI6//8tvXYf3mVbo56mwajYnalAnS1DpYG7PZwvbHi2H8CNf
 yYSuJ2dx7pRmHZAdqRyiyHiTAEIW54QyHasg==
X-Received: by 2002:a05:600c:2204:b0:492:3754:15f2 with SMTP id
 5b1f17b1804b1-4954a40bbdemr146727645e9.32.1784626782798; 
 Tue, 21 Jul 2026 02:39:42 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:42 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:26 +0200
Message-ID: <20260721093932.282565-3-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626783; x=1785231583; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hA6dDR0HY2iiLn96/2aVxsEMEef8mPWiwaHNcaGQktQ=;
 b=Qc5ELn83SY7gMQYjnNFdlx4hVH35XJDM9JQjmzuEfy3zfOrY64YR1gqel58h3/8txp
 fykuMI98AtwqEfXaiWEQOzuoCxe2Sn3oyrR9eBoREoFgAmENixV9DnCK5ao9wACQUgFi
 h6nHXPkL+FmABQAfh+fw4szXRYHnU4k+BFf9XMBjxg+DpkPqH6suvJWqfgqhsO9DGQGN
 ZzQ/eI4jFA4U/AhxrYchGSEDN3SMl/r7PjLrpE/l36uJNJOHoxYCbYZJTJO10A1CIYfZ
 BfmuzxdnxtaEaySvQd+89yDWAIZjVm+m0t3i7jmU7Gr0lrp4t6zbQXs7nvVwAOmq6Ho/
 YV1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Qc5ELn83
Subject: [Buildroot] [PATCH v3 2/8] package/scdoc: new host package
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

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 DEVELOPERS               |  1 +
 package/scdoc/scdoc.hash |  3 +++
 package/scdoc/scdoc.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/scdoc/scdoc.hash
 create mode 100644 package/scdoc/scdoc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 23c95db6f..442fe4e6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,6 +1197,7 @@ F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
+F:	package/scdoc/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
diff --git a/package/scdoc/scdoc.hash b/package/scdoc/scdoc.hash
new file mode 100644
index 000000000..8917b4038
--- /dev/null
+++ b/package/scdoc/scdoc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e1a9c2000f855123a1a50c8f897073e0ee95fc41787431efe3864c2f1c2e7092  1.11.4.tar.gz
+sha256  ad227c56bf22c9fa35be3d383789d065698904b61161f6a8339b91bde5a3e48b  COPYING
diff --git a/package/scdoc/scdoc.mk b/package/scdoc/scdoc.mk
new file mode 100644
index 000000000..80ee9ce76
--- /dev/null
+++ b/package/scdoc/scdoc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# scdoc
+#
+################################################################################
+
+SCDOC_VERSION = 1.11.4
+SCDOC_SITE = https://git.sr.ht/~sircmpwn/scdoc/archive
+SCDOC_SOURCE = $(SCDOC_VERSION).tar.gz
+SCDOC_LICENSE = MIT
+SCDOC_LICENSE_FILES = COPYING
+
+define HOST_SCDOC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_SCDOC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
