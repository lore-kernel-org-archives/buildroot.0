Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA339C4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 20:38:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73AD360EB2
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 20:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73AD360EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33069605C7;
	Sat, 14 Aug 2021 20:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DKoP1nk8Vuz; Sat, 14 Aug 2021 20:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 729856062D;
	Sat, 14 Aug 2021 20:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6BADE1BF311
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 20:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AEC180E27
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 20:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Izg3Tp4df7U1 for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 20:38:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB7FD80E1E
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 20:38:29 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so2829722wme.1
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 13:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeP9jF3OFTvLSqHf1xma1FVFKVfECRltxoj0VohzjCA=;
 b=pqwx0F/clQFCBgyQrnLWW0BUja4SZTQineF99J1jH7PrlL/7SYdMa93f6SZBbQlRGl
 U2PXlbfz3fstz2knCGs7S4zpoN/8/Bv6sd/A8CbeErB+fDUx2Cq9FFFxQpZ1eLd8aLgr
 tRJoU5S2SjzQ0uUA+WvQ9/4MABWk4Z4EmZEqDNrQdcJOvVw7+6Oe4c6WLUXyJx+4Ucyr
 0bh+rab+flGejqfwg8yqKG4hWvTdPqCaoRdXW76263ZXfR06lPy0SaGze3mVEzVDFHw7
 0FPWyNKKLusDrdik11es5nJbU9ZpBSL1DEL+AbjqmiRt511c8ZL/VTl+BBARM5TTAuCQ
 SueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeP9jF3OFTvLSqHf1xma1FVFKVfECRltxoj0VohzjCA=;
 b=b2by7WABMzylR0j2ObfAJb1V0YLnm5ZMwqBXj/iCSssc2JjRg5xy4uRfCK1CanAMZ1
 pepTNAiOhTxyUmCeOOZeJWx9WvmYxt/bHSW75q9NZ6o2GihW6vCOoUc/H1ge2AhRX9hW
 tUqBDn+nyt6aPF4WGMuUYDCeTERycXpmHFZXnp/2BdB0tVD4T4yXp4mbwmCzBbaELEup
 Wh0yV9x2Pl+piFX57ylW1NRBLCqcZAKz3Dxb0bNQvuM7vW/52875trZXphogcRLut+hS
 ftZ2fkQQIuE6KQRnFoxs+Asd2+kyWN8UUX6yM39WTi23D9FIlcA4OaPlpmIfIUurZ8Rv
 hi7g==
X-Gm-Message-State: AOAM530WwYUI8KrbGOJngPrClrTbMF94OOZWwoi2oEaxWgt4dSimoz9N
 w+ApLBGT9zjqLDzjty1aRvLoOwveZlxHsA==
X-Google-Smtp-Source: ABdhPJwtiD3DX3rXwSSVlhLou+d2RqEXoGmBJ2+xje6ngQd/6GLO82fa0EsGAhtzcQDNKnPGIuhalA==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr8501760wmk.102.1628973507782; 
 Sat, 14 Aug 2021 13:38:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id e6sm5896155wrx.87.2021.08.14.13.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 13:38:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 22:37:25 +0200
Message-Id: <20210814203725.351569-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: needs headers >= 4.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since its addition in commit f7b8508e4fe9c96bf679cc5423cc1500b6523e83,
libbpf unconditionally uses TCA_BPF_ID which is only available since
kernel 4.13 and
https://github.com/torvalds/linux/commit/e86283071fb0eed28136adb52997888f4beb202b:

netlink.c: In function '__get_tc_info':
netlink.c:515:11: error: 'TCA_BPF_ID' undeclared (first use in this function); did you mean 'TCA_BPF_FD'?
  515 |  if (!tbb[TCA_BPF_ID])
      |           ^~~~~~~~~~
      |           TCA_BPF_FD

Fixes:
 - http://autobuild.buildroot.org/results/14996a0b7b9b65d0d6d5717d6da8922752789749

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbpf/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libbpf/Config.in b/package/libbpf/Config.in
index 9eadf0254a..3aa6679b3a 100644
--- a/package/libbpf/Config.in
+++ b/package/libbpf/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBBPF
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_ZLIB
@@ -24,8 +25,9 @@ config BR2_PACKAGE_LIBBPF
 
 	  https://github.com/libbpf/libbpf
 
-comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
+comment "libbpf needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, headers >= 4.13"
 	depends on BR2_PACKAGE_LIBBPF_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
 		|| !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13 \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
