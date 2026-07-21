Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5F0C44535
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 09:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9C6E6081B;
	Tue, 21 Jul 2026 09:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUZGEzM2EyNE; Tue, 21 Jul 2026 09:39:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1BC86081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784626791;
	bh=FJ9KRwe1TkjsM46rQu5dapVcDopS6hDjfUNsm8xN5C8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tgo1AqohVoLqGGDJQPkORFpfgCKlAflMxMm7HRfUiqKZeReql+oHF06cIM9MxOokA
	 tP3Es94tPCdtth0qUhyKkzzx7TV8oU8HOOxkp3G2o5gjeEBHmNNaGn72rRaLxy998P
	 pnfkeD+bRteI98AKSUH7vvlbhtg1b10VJghayXHSf4viU63pThlYFI1UR0njZQaAYm
	 oSUNPu6liaodwUtfHK+nQJmzw0DNXRLPi/Rhxk7KqYBIM6O9I1hpSlx2ZIQYib5CeY
	 QN0mwM8kEQ9gbUHXuelKld8DtD0KgpKWxf+OnBhOveBEl3wshHzToMA9UltQ/I50dt
	 yhGFsEwAEy5dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1BC86081F;
	Tue, 21 Jul 2026 09:39:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2447742A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 090D780C97
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 09:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AbvjF4AXAlz2 for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 09:39:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADFB580B84
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADFB580B84
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADFB580B84
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 09:39:45 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49548aebcd8so25936565e9.3
 for <buildroot@busybox.net>; Tue, 21 Jul 2026 02:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784626784; x=1785231584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/Fp1/g0RrqGE0nzv5Sx5UUJTeuSWvGzatZnnVMO28uA=;
 b=rftnYHCfd4jz4OqYLMjVsRTrtY4ATZ5ACwgoOSSeUJ8Bm+zznFQc7hiX+hJlkBcmPW
 YtcdBIMKHeRqmyf8imtncB8SwmCF467sQk4Ka7xH36IFbx/2/TqUPaeYUVg9VHVFy7Qn
 3rH7qdmAEzbgxsDHzmH8k3aaqWhxlaxpF4XPhD1gyeM2jIOkz/siztjhuquYfST+8q65
 v6/BngIiWJSpcymyNXN44dJoGXmjMSq0JXIupiDeSLTfNmCGZYhF7PrCajMrqabeKMKv
 kRtKsMp9hoOTdroqITwe66iTLPniE1/MfnArvt9wuWrTbDL0Yn0TGeSFoUnl7W/uNZvI
 SqYw==
X-Gm-Message-State: AOJu0YznftSn+IfkoVPlY0U2ce1KAnJq3P9A6BBk3XiZnPX/BxvnVwCs
 HKU/uzTCgOBk4LaevXEcKnmAjR0wJk/K+JfszQuhndN77BBxtgRWktCbzLNLZA==
X-Gm-Gg: AfdE7cmrlzJCkgesgEiyQO2U5v9fqemPa8RMicRHxGOwTnr54C5F4uKVNWWU0DMk6x9
 vpFm7rnVEGEAVvoqwEH2J1eixd/dgqWS8TJU5OIkhci8LxX8KGn4j4Lu98EqyuBFyebjBXzxI1s
 osRWd+1dxXwdInDnUNnzCpyZWCgaODARzXm4ngGARDchXAD+B65r2EQJdsuCsYiPnYyiEWnRCH6
 QwqlgqtEU4ngkoiA3eG6kfsuUi4El9A6yExHJNYa6bUVca1GL4e3pRB6XCHkLe3jyOn4B+LnU+Z
 6GXnVohfcnAP+4zeMvMSWVQAf+mlkVRaHWECT33ajF3ff/AVbWNPqyg4IwO62/6yvuDaWB0NyZG
 v0XHDeXncPpQWNtl0HSOq9CBbr9evcsxxaCfrB996TwN1T1rbw+eJwM0IgDliz1E15CGRmhAekK
 HBKXEtSq+F5heZO99NqJqDSUzxZPvipW4k/k4hllXgY0vZ
X-Received: by 2002:a05:600c:138c:b0:493:c845:bc20 with SMTP id
 5b1f17b1804b1-4954a3d0080mr184407725e9.4.1784626783418; 
 Tue, 21 Jul 2026 02:39:43 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956546db7bsm56227655e9.3.2026.07.21.02.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 02:39:43 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 21 Jul 2026 11:39:27 +0200
Message-ID: <20260721093932.282565-4-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721093932.282565-1-francois.perrad.86@gmail.com>
References: <20260721093932.282565-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784626784; x=1785231584; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/Fp1/g0RrqGE0nzv5Sx5UUJTeuSWvGzatZnnVMO28uA=;
 b=YtRmQ3JNhF5dzb/jBB6l6j4awXcb1nIkHI78sF7KWwSFeyZ8HSiJyXVB9qXRytgDnL
 O4Lo4+5Dva5TnoeoJfqvzBp3uPjuDlXijpJ56kP4E+BM9v13CwYMpUlvS0PB/HC7WfJB
 wX5cPqnMwLQwSd/GSTuGcERk98FFkTxL6hLIR0i+lti4JAWpQ84s0ZZGOPj0SKlWuNQp
 lpK4EbDXS7B2Ql/fRmWaRET2mdWv8hZbl8+YqOwLb/cQBZ8460dlVO6rMcvY0/JWkSRq
 MHArRlRz78fqv79md99eIejNy1YLDjPKAUvFAxeKv4EBGlghmnfkPjcZvAh/T9CDlkk+
 yU0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=YtRmQ3JN
Subject: [Buildroot] [PATCH v3 3/8] package/harec:  new host package
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
 package/harec/harec.hash |  3 +++
 package/harec/harec.mk   | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/harec/harec.hash
 create mode 100644 package/harec/harec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 442fe4e6a..0b99456a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1176,6 +1176,7 @@ F:	package/copas/
 F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
+F:	package/harec/
 F:	package/janet/
 F:	package/qbe/
 F:	package/libtomcrypt/
diff --git a/package/harec/harec.hash b/package/harec/harec.hash
new file mode 100644
index 000000000..0c3679bfc
--- /dev/null
+++ b/package/harec/harec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5581bc16dcf22969c7d33b0f2a9535ba37d4cf1bb39dec252e98ff2781175629  0.26.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/harec/harec.mk b/package/harec/harec.mk
new file mode 100644
index 000000000..df1096680
--- /dev/null
+++ b/package/harec/harec.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# harec
+#
+################################################################################
+
+HAREC_VERSION = 0.26.0
+HAREC_SITE = https://git.sr.ht/~sircmpwn/harec/archive
+HAREC_SOURCE = $(HAREC_VERSION).tar.gz
+HAREC_LICENSE = GPL-3.0
+HAREC_LICENSE_FILES = COPYING
+
+define HOST_HAREC_CONFIGURE_CMDS
+	cp $(@D)/configs/linux.mk $(@D)/config.mk
+endef
+
+define HOST_HAREC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) ARCH=$(HOSTARCH) all
+endef
+
+define HOST_HAREC_INSTALL_CMDS
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
