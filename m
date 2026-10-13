Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A2FCC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D48456075D;
	Tue, 13 Oct 2026 09:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUhTYlOX0-FH; Tue, 13 Oct 2026 09:43:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8A9CC607B5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884602;
	b=cfgjKT+ZwmX1+LbLoLCCUxlRD/RAgAclvhmO4cJdsy6b+Iqs+G0Lui+looAE/+342d3J
	 n8KS6gxh1qf4bQBZwlSz9rjGGzd8yZA1+HXtYakrU5OYdD4vBoWrI2dPvc3av1IhZxxWB
	 S2p0fLXi/SNHiWUvuKpbBiiK0Qvocpz1G6QYVkJAHqwMUcQ5fQeeWb67f4tkSA3WhAVPd
	 AyrCORNbq/TxpH+/LA+cWmbM0dxQmtQhn/JFYhpfou9gzAz8oC9/IIuRoi/PPc3LRojdj
	 VVJdgfHeLtfsdL/J6xRgbMTDQwtXdXoq47ewNesfjgXZ857TrpukcLlv923snuCQXTQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884602;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Kjeo9Wl0AGGgScE0amrnnwAi+4kAPL+H2uWnLo8HRdA=;
	b=aSRpWCyBmDQa4jOnQK/Xfd5znoqaj51ilVXzt6m5CdfuS6IT4KDVZpHUQ884/59Ov1TK
	 VBhQJXfqjvxevtiMuRf9VUFM4r7XuFukxlVMrsTL4YjCu8j6SjswZiR+wO5kDCRrWzFSL
	 iXRfOBVHx9GFensFkTPk5ccoXishI1+ADOCOUTGg2psXooPg1ZqZmUxRSlohu1tLUb3cF
	 7CAgLWNRafojIYvgwZlgirZpqLg2Vt/C0HFDvYVejfDtq1JugaDJM/wR6YCn/r6J095LV
	 c0BNTukfMZstsrd95dxV044nnm7i+cEZ10jxcVl8SkA4ycO/PxG5BQAeLqB2CPwEtDA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884602;
	bh=Kjeo9Wl0AGGgScE0amrnnwAi+4kAPL+H2uWnLo8HRdA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Th1ECGblBwxSjvtwb/yXkX7ZuiCKv93pFrRgciiAns39aaP4bK7KqZ82Ibwc0cJoz
	 abPyNUFiRYMLOHN0o9bBwkvAqgOoZPDoyDqFAksbIpALu2MTtHm7PeldWO1b8d1vTb
	 ng3weQlTF3IpbfQjHntWy5U4iSb8JPKTLJKYDXySIBs0ompIcqhIhxOxQRSxpqjZen
	 QNNA1lZlf+eBpnxRcI5hnS3fyOjGYga3/tC1V36RX5t1T7r+7vVKSsO5vymuUmMTy4
	 W8jJiEraZxha2FsYfKDufFkpFHP0/tZoWIgHOZBvEeVRJaC35j+r93FSqv+8epMrpc
	 PAK2W5Rnjw68g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A9CC607B5;
	Tue, 13 Oct 2026 09:43:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A8F75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E56480C72
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j9sFvCFWmAvx for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1E21780C8A
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884586;
 b=ey0TQRULWrcBI2Mb8Aanhk/MPe3Gd1nnQZXqymekGx9UHfkYm+maT4gqUnDjQ/mf1Pw3
 oXe8HLqimJu4DaX1ACrr7S0y75sTWUdOsk/g6UrZOlU6weEnixBI2Ikt3o/PZZB8/L+Nm
 zYO7f5+DrzM6po2B5YqHPeyUpGrjGB4QZ8fqowtpfZHA16kJYWnzYZ8gyBxNvr3RXPg7F
 VzHRKQ3ygaMqpKdbWPKkI46MELVGVISusKsjVzV2cpfMguk9a8iKo1Ajb0P7fPXcSHGlb
 K9mR9vRDGfmo/C5RgZW9081IGD2ozJcjjgewUqiuqryKzXsnBfKXpOHUQ9tatwppa1w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884586;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=mFJhG5ozzrly5DVB60hIa9Aq+a/XnZKjvGcuFsdAj/I=;
 b=M/laBIKtqElFk0DCeoxNyj1Ao5pwFmeTa6KkCKkjsyU2SNSEYGPrEcU9hpyrlsxN7Js4
 lsTx5/ZZnGImdRw5epiXQz6pCAdWSBhTyrvibXEzEH9EHQo9ciUSdoi+Rw9UBaFQ1Yr7I
 CIbRXTNDyKVcbGLvBvAimm1G7VXNsPYRWjlUrf9tqnZd8+DZFRYzDw5NxSC+BkJlwTn1u
 /ywC+z3JxuhlNQsmYDhnTgIBfG5AjvCIylslnrByjpKi/lRVENs5VibvgXkYNaZdGE2bZ
 H+S5LI0DScCDXutGpwoTyktM3+YjQMTpPaNMyPr5zd7g/EDjZp/sy9ZWM2/vzsVMsFw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=G0x3ZK2i; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=G0x3ZK2i
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E21780C8A
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so23655565e9.3
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884584; x=1792489384; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mFJhG5ozzrly5DVB60hIa9Aq+a/XnZKjvGcuFsdAj/I=;
 b=G0x3ZK2ibz6BiJvnuE2UVNkQoZz3RrrEb+2cbccrKxTJuVg6EOx37fAMo4cOgsLIO3
 XB2wCwSRWNBTZ1d6per5TFHVVBFSxvAm1JFWQtZafoameO8ZsUrq81tdi1D0R1G8bSUY
 nyMQpKfFpySyO0U+peDcdUKfPMHS1HkkWyIyfaMC46XauGgqLoARNku7XocPLpvESpoI
 iZbCb7yXt38dKoLcHifuLDt1gDSS/C0fek+Wz9J+MxTKOGDmMhjrEsZKlew91oHs5/N8
 p7ERfT5V4eFENGToluPL38vh6kxhpkYQXnfeLGMM15k0jXh6Gkj/LO9j5oCsFix8eD8e
 VBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884584; x=1792489384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mFJhG5ozzrly5DVB60hIa9Aq+a/XnZKjvGcuFsdAj/I=;
 b=wIb6cH1EQdLf3QSJjSVTkWL/BhCjjgW8I8EW1VRlpaq3vDXqlRhY/zuG2hi/UnmmvT
 Ecaw3PuTnfBnCMBQ4XmmbHgSVD05RRoWlaDz0caEuHn4b+cnfCjfkqaqHAXmfZb2Cg1g
 AVq7ocGXtJiGqU6Lw1UKCGu2blh3oUD1ttd2Ucpfic2eCta1NzgLv9IzFgctjOFKUL8P
 rnKE1xL3C2jBpEXsbukQMvwjiWYK8PurfaGW/JENYP6+H7VRXBwggw8NQs2CgdbKavAg
 +AGCoPlEY8MRazqVPKbENUYEqFfG5mMg93EH7Z9CigP6bd3ZACgihPCuDZXoD/UtBohG
 JHDQ==
X-Gm-Message-State: AFq9FYKOBHBzsbC+qV2wVjvKLSiiSjFCDIU6EGNXr2JxnZfBdOmOkEx+
 UMCbhAVXOuqSahV1+KuvwhlPJJtlK2Egmj1o3+OEozqfU3YEsMb1GUUMYxDQ1Q==
X-Gm-Gg: AYBFou2FaFrwExk14Z7dHXs/4loOykXmXVdZ4BwpOlbueu6b89S0ud9ZcznOzam598Z
 7tnUviPvhBTeiNQS3SvCvjtzGkB0uk/FqGnHYR17NQRfS4LrdTP/Vd1ptEzkgn3b3HUYkN7XS6o
 RtF5Jht9sQWD7hrdlxwSENDq4XmkgkfoM+neOlPiLA5rJTkP/Chv55iFszms7Nt6ptq7bFY6pnF
 t1UOv7UvuE9wOTrbAI/YZwLiTK+dYvjl4GAehy1ONYcQLGmW8v7CJdxgg7PCdeaOWkzvEj5F3mu
 OSlCtzSar9iYTMuUkvJ55lOtnZyAzs8MHx+9mxkegolJSbUX0y2UvlWIE2TKsNliLtIcguNVzdl
 SIp0YWf9og2Y+Z4WW2OoLrknp2tUJhfvWUoU7eEJ2B16qizvxUqANywUEAbKLRuWFv/aWSuyCYc
 +ik9lk39DlObCvu9/2j3Ssbm+5FC9+s/kZ97aKjbq5F8FyKyIG+fKXU8xmljbN59qoDAVXYii46
 qNbErE76p6fn4syI//ODCsWyCNyn1ARxN/IXJyQ
X-Received: by 2002:a05:600c:34c4:b0:4a1:b027:99dc with SMTP id
 5b1f17b1804b1-4a1b027a161mr3654765e9.18.1791884583579; 
 Tue, 13 Oct 2026 02:43:03 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:03 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:49 +0200
Message-ID: <20261013094252.96761-11-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 11/14] package/perl-time-parsedate: bump to
 version 2026.033
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

Update the custom license to "same as Perl" for all
see https://metacpan.org/release/BPS/Time-ParseDate-2026.033/diff/MUIR/Time-ParseDate-2015.103#Changes

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-time-parsedate/Config.in                |  2 +-
 package/perl-time-parsedate/perl-time-parsedate.hash | 11 +++++------
 package/perl-time-parsedate/perl-time-parsedate.mk   |  8 ++++----
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/package/perl-time-parsedate/Config.in b/package/perl-time-parsedate/Config.in
index bd5957d91..02ad47145 100644
--- a/package/perl-time-parsedate/Config.in
+++ b/package/perl-time-parsedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIME_PARSEDATE
 	bool "perl-time-parsedate"
 	help
-	  Parse and format time values.
+	  date parsing both relative and absolute.
 
 	  https://metacpan.org/release/Time-ParseDate
diff --git a/package/perl-time-parsedate/perl-time-parsedate.hash b/package/perl-time-parsedate/perl-time-parsedate.hash
index 0e5199809..9aebd541e 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.hash
+++ b/package/perl-time-parsedate/perl-time-parsedate.hash
@@ -1,7 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  9143d075278857d21c77467d26f1603b  Time-ParseDate-2015.103.tar.gz
-sha256  2c1a06235bf811813caac9eaa9daa71af758667cdf7b082cb59863220fcaeed1  Time-ParseDate-2015.103.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  31e4fb54f3e047255285fc3f9d73d559  Time-ParseDate-2026.033.tar.gz
+sha256  8465c8146bd129d3be4a402b45e1b9f9c306f42b0f58a1e507bbdbd653f253b7  Time-ParseDate-2026.033.tar.gz
 
-# locally calculated
-sha256  6d8de888d0662f75cfa3bf21b261741d5634ac9cdd8604d6173850546a3d40a9  lib/Time/JulianDay.pm
-sha256  9ae411fbaf87add414e7357417032dfedce652c393643bc5cb5b7698041a1dca  lib/Time/Timezone.pm
+# computed by scancpan
+sha256  e8694831e3fcbba2e01b09f77f3e638cf98c7af57cd6d9498452aad1f6cb7f12  README
diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
index cba8c7b6b..bc2cfe1f1 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.mk
+++ b/package/perl-time-parsedate/perl-time-parsedate.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_TIME_PARSEDATE_VERSION = 2015.103
+PERL_TIME_PARSEDATE_VERSION = 2026.033
 PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
-PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
-PERL_TIME_PARSEDATE_LICENSE = Time Parse Date License, Public Domain
-PERL_TIME_PARSEDATE_LICENSE_FILES = lib/Time/JulianDay.pm lib/Time/Timezone.pm
+PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BP/BPS
+PERL_TIME_PARSEDATE_LICENSE = Artistic or GPL-1.0+
+PERL_TIME_PARSEDATE_LICENSE_FILES = README
 PERL_TIME_PARSEDATE_DISTNAME = Time-ParseDate
 
 $(eval $(perl-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
