Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED619CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACA1780BB8;
	Tue, 13 Oct 2026 09:43:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ppBch_izPaG; Tue, 13 Oct 2026 09:43:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B844580C8A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884590;
	b=m/q1DnSV/QcLcm2OZKUikUMxbWnpXbPbsBcj+lcir5mGKjo9R0on7n9zAnECFnTZsoor
	 MxhSYi7pNCMzUVtDl0vj2U1PlwJ4nN90ozIdr7xFx/HAAsSQ7mQlPcFpRxrcyp2TLoH5C
	 JnTLyTV+IT36r9C0p2MU3t3YEsgkh//ZOnUzdWa4dO8o/Ub1LP4ZjFyIVgsGCDIDFioQo
	 F/PIkuGk02LYjxcC5OOK9uh2qRmC/Eljn9t+V1riky1NysTKE1foKp97f+Lqx2GWeAiYC
	 f+pArDxvek/ohl7ZiCljQ3irwbUayuCLJB86PFQWaErKnaXq3yJdbsKZ67z6KNVK4OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=vKTx/kZC6LL3rDE/qNpQE17LWnUpQbie/lqYgJmQi30=;
	b=pdK1dtVs/P4HuGaTAz5BoYc+MXsSiVUq0IqcRodkkVYid7mubnkV0gXbAEZE9ePVVr/z
	 CbzEQTWTXIPohQAV51UlMRMwO/mW/oKrGpX7jueFniAk9PdY/Xt3fSMB2lD/X7/Qol5im
	 MDB+/P4HvP6VGCpK6N5zKw8HTc0lRgMKEj+E8OP2azyn8ApDXakWBy9tBwAUHEe6St7HD
	 m4fjOhHuwaWUOhthxgznCuO87dC6QZBF9F3ZevodhkOZokik+umWBj3QotgKrl6EfE6k0
	 00xwoAFHBqTW/Z8jnYSBTpLA56JBW1+lX0GLEkzykmM8aWjGNKd9jnUncxlHLbCKS9w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=niK6fsgG;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884590;
	bh=vKTx/kZC6LL3rDE/qNpQE17LWnUpQbie/lqYgJmQi30=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W6jZgqta8Q7k3cgsZ4MA6vPzE+pPWNvrXL1Ys0pXxRDlL+cQ29vsdGN/VeGX14KVW
	 9EnlxHsNmBh5cFJSXlfNpyw0kB4YMTlm3LLCV2W+e7xIfVXdY+gyM5d1YP+qyDoRi/
	 xV8+NL6N4ykdVwT/M6SCIQN97aLGNLBDqKeUIgnAj0DSx1+SZO+apjW56J8rfbj9vV
	 HLqzzVcQU5KqVpCjLNvJvv2a/D3BCv/yDVtkNO2RN2Q6LtNFZ7Ep8FVZOC78CsJcDD
	 r8iymIFB7kzxBMTmPED4WJB00ro7rFYkOCdyzuH8Sd0i1ABcWzf54K7F+AtxnQUCIL
	 4tO/LTmKwaIgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B844580C8A;
	Tue, 13 Oct 2026 09:43:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A1A75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BB3980B97
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FStF80Jm-Gr for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 69F1580C72
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884583;
 b=dVLrJljv442+aEWy50R6tGKyF2yTSM8mHDPb+IHF+u27Yb8rwfo9H1VWs3Z29+Eg/iZX
 x5jA+dRcx8AuFOnNHe7XDuvFt8jQE1l5HE/MdrERt6GV8XWdQXygnVGwKUH2/1j8R2Rfd
 xJzkhaZcA3TT7cSYICGJZHst2bQkXxFYV7dcdsnAxA4+J6NQLY0Y61cavLHxEavlxbU6V
 0L2iZ+mQg3kCW+6avrDfAG6ydd/yrc9ZmppKCcQ6ei7UsFLeQPkxf9dc5oKqd4h19HwCD
 01/DO4g2dN/WM6uWkn9439yJvZqoumNf5//27B/P4NbVi16+/A0I9aZq2U5GmwWngzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884583;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Za1bgOlVggcU0WTqHAKhKxEuncceazo39LV1yJXyv3o=;
 b=m/Cy5nAczSb0NwA4zt9sA2oObzpTGXkTWyYxRrIb7IqWM2EbaPDzYewxUUTVjaZbe8GX
 Vg05ULuTKcH3EcDNXY01bxl8O1TiA5kmaqzHA31gBefm/k9ypN5OhsWff6LuIQvfgV704
 b9XzdxG4Qxl/mSAXRfAna3358VTwxEG+uY//IegJ8N4jT7Bsf6vDCDw4qqAnZ2UhlxjOZ
 tpbh9XriT0ize6CzkSzgWLYL91GRvTEyw2e4/7yW0MncDQDNqutjEi170lZnVAONyPBqM
 SjIuJv5ZiToYpRDRtm/69swYaoMlbV9dciFqt2TT6fNCoElAxlS764hWhHiBTxENn4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=niK6fsgG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=niK6fsgG
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69F1580C72
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso167185e9.1
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884581; x=1792489381; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Za1bgOlVggcU0WTqHAKhKxEuncceazo39LV1yJXyv3o=;
 b=niK6fsgG1sA1QEokPsUg90b3oq8Z9zVw7SmOJ/ft4mITonzbJXmzWwUQQd9y7qyy+m
 hbpCZry4n9QiFUJNoUaE4tXuzPThEGaT7RIwozNbiJ6XByFPtAEgkoSwE/l1oHegVBLq
 ScMkLRH+SLaUM3uXFPtzMH/cS7jXrZnzqMHByCLTHBJNVV9fsmj2zL+IBxH47aCUmbmn
 eU1Hd1/7kf2XYT/2jQ8WsZLronSu26TBM21MK5DWRMCXoJfnWvPoZM0Feg7W1k8idErE
 46DQS+1mdzzEFxl/r0b0XtpjWH65PpZ6QykaQBnXIvIu3tO0zC+2s3IsvgHB4cWUEU1X
 ILaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884581; x=1792489381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Za1bgOlVggcU0WTqHAKhKxEuncceazo39LV1yJXyv3o=;
 b=r4Oezqj40E6b9oaYzHqVdb/ER9Fs1orqBLFeAmBg/o8bc8a4o5p9HsFMKZykK6d+fW
 im1pgrmu0Pb491W3oBfBiPSSk3b/FynXFooHT6Dk/wWyyG0Z8AGlI1jeMUKNhPf80zUa
 H9Eucy2hWrE0UEcl8ye+cAcdqC1c97lU1SLmbLXQhpNr/JaxCwYUi2R6cGmH66m1h1Tr
 m1W2Xs6HH9RfLeiv8c0BARwueDOQxNp8G+zdcqvSG2A2T27LjQqPpPC6LSBhzIOMyWE9
 sJnQ7uFgQmtM3++JBDYL7XP4KfIEaFyHT/b1FdsO2Dqm3Ck9t4l/wzCcZ2xKSidSsSNU
 nMSg==
X-Gm-Message-State: AFq9FYIudTSZHa6qO1PhD91iY6KHee41Ss/ree2vHTyk8/mX0y0gc5iu
 kIOyuEjT8M1Y8UHvG3Jm4OC2MYRggt3qDyE1+jMtT0p4yHkvaColfAYp1eg02w==
X-Gm-Gg: AYBFou3wDo9NFmf9fdnaDWcRe+LE0djGSw89bUl+yDCIq1gc/9xViJwc/pE44479AkF
 niT/5f21fvWBrDYLw/r0qPLqBkFVlefazGVRdhjcXuruvhFbZs3R+VX3IaH9GOTaBfTKZuSVGUS
 AYeWF1pLclK1PUzzD/wZigCcD0KrF00h9/ltj94DNLLn/WfEWuYs5yz7oPq6iRMod8Kmg/4+y8k
 plIHIrwQ3qNGF6moHSbRzQRv4fOptMw1Dp13aDq7fppJJbHYKv+asz9QT2S6H3gMUl4FdzdQoVu
 fDfMCsvGpqVpKj79OabgUTPlll91hckfoj8FfuT6q2bK0hS5MaM8GP0AaB65FQvkkdA/HcCIRXf
 8GYkrYs6Is2rn6MoBs6EDZI+UE7pYBbJAQAXyHjN33/7zQIBsj+C0agU4B+Sfczu8qluTy/CfcX
 9GdxKeORodowAwecRfmjo416C3NFqK2TH70SxBR3T4NBNpzevr0ayrQCcWIbdCW2IiFN+vxm6kC
 Rx/J3v7PdQxS8zaMqWe810gCneXbrzxUkI4EtOP
X-Received: by 2002:a05:600c:620b:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-4a18e4d12e7mr213455125e9.31.1791884580764; 
 Tue, 13 Oct 2026 02:43:00 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:00 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:44 +0200
Message-ID: <20261013094252.96761-6-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 06/14] package/perl-lwp-mediatypes: bump to
 version 6.05
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

diff LICENSE:
see https://metacpan.org/release/OALDERS/LWP-MediaTypes-6.05/diff/OALDERS/LWP-MediaTypes-6.04#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-lwp-mediatypes/Config.in                | 2 +-
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash | 8 ++++----
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-lwp-mediatypes/Config.in b/package/perl-lwp-mediatypes/Config.in
index c1f58a6f3..6586042f2 100644
--- a/package/perl-lwp-mediatypes/Config.in
+++ b/package/perl-lwp-mediatypes/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	help
 	  guess media type for a file or a URL.
 
-	  https://github.com/libwww-perl/lwp-mediatypes
+	  https://github.com/libwww-perl/LWP-MediaTypes
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
index 0a09f22ad..6d0fd334e 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  84b799a90c0d2ce52897a7cb4c0478d0  LWP-MediaTypes-6.04.tar.gz
-sha256  8f1bca12dab16a1c2a7c03a49c5e58cce41a6fec9519f0aadfba8dad997919d9  LWP-MediaTypes-6.04.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  61257954fffa7a48f507b058f27efeb8  LWP-MediaTypes-6.05.tar.gz
+sha256  abb2dcfbf069317fe65b098e3b2ad58c5eb33e9a839b9190cce6d371f8966cc1  LWP-MediaTypes-6.05.tar.gz
 
 # computed by scancpan
-sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index 687a84427..16f86b038 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_MEDIATYPES_VERSION = 6.04
+PERL_LWP_MEDIATYPES_VERSION = 6.05
 PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
 PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
