Return-Path: <SRS0=Fkjy=NM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27ACC4338F
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 07:24:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6679D611C3
	for <buildroot@archiver.kernel.org>; Sat, 21 Aug 2021 07:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6679D611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10BCF400D0;
	Sat, 21 Aug 2021 07:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HZExjgfyKp5Y; Sat, 21 Aug 2021 07:24:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46D4740203;
	Sat, 21 Aug 2021 07:24:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B379C1BF841
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 07:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B08D080CFE
 for <buildroot@lists.busybox.net>; Sat, 21 Aug 2021 07:24:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3u28encShnx for <buildroot@lists.busybox.net>;
 Sat, 21 Aug 2021 07:24:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EFC780D14
 for <buildroot@busybox.net>; Sat, 21 Aug 2021 07:24:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h13so17497724wrp.1
 for <buildroot@busybox.net>; Sat, 21 Aug 2021 00:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rcf531TEx5hZCc5DEtoZJtXEFMPYfcDfqGl2eSFOETw=;
 b=XlXXniQyRR/io6JLEVWsSujwNMMbsJVq1kn2+UqqQa6XJbeM7tzcfVj5ljrmnCeisy
 nLpdKhgjgG2HokAvdRz6/82vitQ3GkzMgSBMeEiN9RzEa79FwtUhIz/3ISTOuX1HeXs5
 3VzGbQR0kLtoVWgCLdHPi2uAvMHeKF6/hVu3I+RhIEoU9GNhIvw5JApK3yBfmGkNGUJf
 vcHdoubCDefFhow0ZWhghTs5MUWcu5qZUzIJRJW5UAJrOU4TDEgMjVGmly8tA19Ce141
 9tbVTVBS2mGmM6RGgCGgF7QpdqyhN0ASn8BF/rDRmRcqvpRwGq4fLq5OPQzMCTgt6Hrs
 ChzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rcf531TEx5hZCc5DEtoZJtXEFMPYfcDfqGl2eSFOETw=;
 b=Fxap/IkRd8MvyrN6TM4ytlQBBdC1X7Vz1vXSLBE0xcDyVudp/fkrpAfeNfDhzsqeIc
 ssvVnGh/7xLiNKsSyskK/oIKmAwCiVMln4MZ9+kyTm73SDPEjSqGAwcuu6cD9X6Lb9cK
 oOIrJyKYWqFhy4WozTNGhjyntIi0IexqhLk9/0iTygb2FWQ5B8sUyfBpqBHk2uNHZETq
 n0myOCsPqbm02nrIvJVFVcVxD0nUmy3lsYiULX/tGohHHoSI4UEnGdil8GSUfm3YKxVf
 qMxOvqNKlBRSLAF9l+tjrM79qdYgzgONXyf72rkMHmzkEdvBCiui3dfPwwTVDTOF5a2/
 P5hQ==
X-Gm-Message-State: AOAM530qC/VwITiKSbURV5uyMJm8e6qw8grESeXi1KbubSH49ze2gECC
 xp1peoegYCdUqgFJDOQLLWGAkeewMSo=
X-Google-Smtp-Source: ABdhPJxRYdabWJb9Cv1zVUpVB5K0D6bWRXqq3+BX1tU8hkT50gMMeRKJM17LW598HXtl5xw0OE/hrQ==
X-Received: by 2002:a5d:634a:: with SMTP id b10mr2597267wrw.305.1629530660777; 
 Sat, 21 Aug 2021 00:24:20 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id z19sm14636269wma.0.2021.08.21.00.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 00:24:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 21 Aug 2021 09:24:12 +0200
Message-Id: <20210821072412.283941-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5] package/lua-lunix: fix sys/sysctl.h detection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../lua-lunix/0003-fix-sysctl-detection.patch | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/lua-lunix/0003-fix-sysctl-detection.patch

diff --git a/package/lua-lunix/0003-fix-sysctl-detection.patch b/package/lua-lunix/0003-fix-sysctl-detection.patch
new file mode 100644
index 000000000..18656b192
--- /dev/null
+++ b/package/lua-lunix/0003-fix-sysctl-detection.patch
@@ -0,0 +1,24 @@
+sys/sysctl.h was removed with glibc 2.32
+
+Fetched from: https://github.com/wahern/lunix/pull/20/files
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/src/unix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lunix-rel-20170920/src/unix.c b/lunix-rel-20170920/src/unix.c
+index 272820a..fa00876 100644
+--- a/lunix-rel-20170920/src/unix.c
++++ b/lunix-rel-20170920/src/unix.c
+@@ -165,7 +165,7 @@
+ #endif
+ 
+ #ifndef HAVE_SYS_SYSCTL_H /* missing on musl libc */
+-#define HAVE_SYS_SYSCTL_H (defined BSD || GLIBC_PREREQ(0,0) || UCLIBC_PREREQ(0,0,0))
++#define HAVE_SYS_SYSCTL_H (defined BSD || (__GLIBC__ && !GLIBC_PREREQ(2,32)) || UCLIBC_PREREQ(0,0,0))
+ #endif
+ 
+ #ifndef HAVE_STRUCT_IN_PKTINFO
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
