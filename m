Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6243CC6B03
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 779EA80C71;
	Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TwTQTrzdvFtl; Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8570E80BB8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884585;
	b=jlV5wC9UFobdv+C/yGrKGB7mg+5QTqnPxh2OLfGcwdfwP7/NJl634ss02et78TA+kErF
	 3rV6DCd9Ld1UJiByLpDlro63f015kwYhNrPp+CT5hyXkJYDkVFtGSexZPbgTBP3HbCnwm
	 cKBnn7ritr5yK17PzfjYWVRtLgv3QRiNnGM0MK1IvlRxNNl5O2oXjhajhfZH5SoMPQVkh
	 AtG/yOVwBkGRFnqMPhuYJ+hMZw8KlUKt3sJP9zYtFl+6SJgBM0bfoOmkYMF/rXNI6jx3p
	 Th5QuWjmW2I552MD1bIVKg4YRuVgiV7CMgLC4+55/es7RVtD71YE0B7noz6Jv7ZhuaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884585;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=eEdjbzYxpilf8KbgA2MsO/PcHXSwmwdCyIFsl7c8NR8=;
	b=PBXP/gLX3OWGjhtBExIMlkpMhbDqGLwVfpmwVFvsiJhVF7qvNqmGo+w6wmzLjN7unY4w
	 cikBoUNDmOsz/7DvagHzcH/kJmrUTJdwpRI2tHbNcttyKwSGgGjdWMNlnvNuSKH0b336z
	 PAr5RNKr/eXCGNcmfykb8/jMUE+6pDGaZ6O2sRbp0NtefrqtlTuDyWpcHwMe4q0fJu8gS
	 +qg5icoElfi3hb7fQ0vJUBjsNhqrGiQ5jmPzf28k0UxrzmSgwAOUfHe3E2TD8jP899Hod
	 Ou7tXxAACgllqYry9PzYi5exebm1xREguPRIEVDA4kMTuIR64oK7+mdqIEYf7dJxmyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cLsbIlC3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884585;
	bh=eEdjbzYxpilf8KbgA2MsO/PcHXSwmwdCyIFsl7c8NR8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kyq6r7HInZO8Fq8m6iPmFkFJ7lW58G8YpluReFmoCVYLDMxeNd7ZSm39G2jXWMQcj
	 Phud/dIpTRFoOtPXN3JgGAkQKMEU0J5U3qAtKNhALf8GC0nMGD38q+P042HYYWpZbM
	 Gm4pNClqLRPR2p4N6SRfkZ1KppDlwfQFH0vrkdKiWhR/iE4Qs6Vj7J67wzeND0D0Sd
	 dBkCNqYk9z/rk8Y3amfsUhMRn8gKzGzWc4/RkFnc3x/aTi8I+kdwXBr8LtsqMThED+
	 SUd27v9O9Entc0/y1RMvzXWXRxap2k1Z/5i/1TJDt8dXFo8PWnJHWJ5ZKTBrLRH1Qs
	 pDuphGdZ4dRmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8570E80BB8;
	Tue, 13 Oct 2026 09:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2463362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF7EF80C72
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 173VvoPrAcuR for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 877A580BB8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884582;
 b=dPAwTeH4cUniu9COCUT28tYkYdmqgzI6LLAlusEHueQzgD7nJm4/TSgSDwFCymNyHUoy
 4oKDKcqwrLXgWTAFXWBSzwyascCSfxRP7V2c0Afe8zNCdbP0lpNgKZaeq5iDKNMt3Bcjm
 F49UC2e9OXelb7R30doam4/cOzJNep9MJvb8IAipiAB2m1Ty3KCb6MxrR6aqkAwYQFQcG
 VSJGt/QmXjPjDRh6T1AO9MOLmtk2hEn28mgfyfxEpZfjBuC99WsD0BR4GUJ57ueBUOUXg
 qnZ3H/rR9k2t6/oeArzRcIrC8FRdOxTUfsKSA5aPDqP7NuTTSPY6Zyv25yRLAzFT02Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884582;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=NOYn71aS/19aoInFLBPDm8XkMz7AWPfNiMyk4kJiz/k=;
 b=ePGJv7+TkCuTdlbn81Xud2Gp7NEPOKBMmPMj4ZTTbC11RqLSNXtlMynRqmJH1u4Z6x2X
 SrqugQb2RfQ/+Xi98la6QyboSdLMs4KgR4kFh4G/g6aGSMtdjcdiJgCsEz990ROzV/3Oe
 iVncs7ZLiHOeeBgcil+O0nztOQV7UraxXoC7UjDz9w/uCTpjn+Uzpw5N+olZLipQFADSY
 I+iFBl4g/e8OwXufuGKRAbejNPsBSctrl99UoPifE1s8J+bzfLwkhwJ6/rE/gYL0g5g8I
 XekyIQ8WbMMssD4Sf7ql2820+uPXedPVNEy0hUfJtup5Q0GTGdqkMBdOHEbeG7nJD5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cLsbIlC3; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cLsbIlC3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 877A580BB8
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:00 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so23655025e9.3
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884579; x=1792489379; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NOYn71aS/19aoInFLBPDm8XkMz7AWPfNiMyk4kJiz/k=;
 b=cLsbIlC3fuo6BWkt7CX81Rg2yM9L8jeApiTld7ZEgnk7WXEuRfLUvFd22AVnV5KzxQ
 Luo54+3p04qTjWGkZtr+N2vhYQgEo0xuppUSfk5qDlmKIH8jvitHB6pPSAkWgF3foOg6
 OynYTv5PPqb6HiYE/O3R6kQDW5g0e04juQso8LacZNFzd3wUTBN7bC8c/pP+vv4XL45q
 Zzzuxx5czgMoeF8V1CGT2rjxCxGKC9PW+9J25YfnFTZNqzKGhNmPGJEWrGodYHP/jraV
 aKSSRLIDMcz/5vaxrM2GqvjV/sHBlUByOPHL7Iod4BNJ5eNnGvLqPoVcDG07fIbDgEAH
 5JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884579; x=1792489379;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NOYn71aS/19aoInFLBPDm8XkMz7AWPfNiMyk4kJiz/k=;
 b=SeP0GXNbSGpNoL2+wiceRDyQKPW+Glb+iJ4yKcnRo8yQXR5/XR9g43aM/7x96jYWNK
 1fN6A1fIo891nkoxeeBh9y/xmjdwhhf+xs0ZSKffYaVZRyZVXzB5pn2J7s0mu5ASE5hi
 ueRC2WseBCfEzSnLcCP6Rcw6HPuuUaHCjAWnxuYTzlWRQuxpN5CKZIklYxIMPXYfeFmD
 uOqXUNRTrdD+Xmc+F/a3PUONNfhoYuN0c3yzI04MwKn67oa+kvu9+BiZJoUqRQTRkIx/
 Paib2kTK8d6R8RBqXEdK36JCwglCNBJgV6pI1eltRu7Pvemc65gjDwXwRwhY041EMeyO
 fe0A==
X-Gm-Message-State: AFq9FYJqzlaNMhxzPRiO9UKpwqI3G0XSIHcTWVrfAAn6xK40EZElZrT0
 peMAgPtIMKU6/E16cLnvbmSUTKpkmf79SavxOlsfjM7W8Lh7DFUGM6iOVazJaw==
X-Gm-Gg: AYBFou2SHPGIcRnFnMxOL/2QGmKER+ltGD+f3HP5XctghxswVqO2Kk3XrI8u3UPeZHO
 kwlwxJB9bqI63oPuei3ZtndWg1zFu3mz+Z17LTKWY4qxSCSqU0Bu7ivh2e4WBVXg9N9ynljXG80
 oYFQS6yzkNPUX633V2n3+yZ+SDV2y6zRKtZe8jkyn1506nB92d2oo2+YSSlGCbX2USdDsla4XIJ
 R9SaxWJ7/h79IjyD6rrSxoF6ez+jkzh1yv5bcoYa2Iy1VuPbGFX8bBkW2/ALe2I75YdJ9/qRryU
 n149ILKbp0tAD7FV1h/2WjF+V0/xLlx40oRQq3l5sdffZtzcB+WAQUK+v+ifPONF1x6A0dlToxp
 SRTUrmVlTmBRAiq1nm4sSp/VNG5/61wQ5tcoIrP/ozlobpBFl8cQklv8D4XtyZ4ME4oViCVYsrO
 zmOxDRXEz1GeqLV/VzZHF4W90adz1/8GKKYc/BiOJyiHFF5qftu6aMlMzsIB29/Ag5gOgpIqM6u
 keMBAlpZD0JYRMuUoR4Nqd15w==
X-Received: by 2002:a05:600c:154c:b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-4a18e4a9159mr255486855e9.19.1791884578346; 
 Tue, 13 Oct 2026 02:42:58 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:42:58 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:40 +0200
Message-ID: <20261013094252.96761-2-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/14] package/perl-html-parser: bump to version
 3.86
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
see https://metacpan.org/release/OALDERS/HTML-Parser-3.86/diff/OALDERS/HTML-Parser-3.83#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-html-parser/perl-html-parser.hash | 6 +++---
 package/perl-html-parser/perl-html-parser.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
index 3de461c7e..6d6ca1e52 100644
--- a/package/perl-html-parser/perl-html-parser.hash
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  17a4c886024bfad1cffcbe6b46cda128  HTML-Parser-3.83.tar.gz
-sha256  7278ce9791256132b26a71a5719451844704bb9674b58302c3486df43584f8c0  HTML-Parser-3.83.tar.gz
+md5  e08b9a5c118e392bf3d7589445ab3752  HTML-Parser-3.86.tar.gz
+sha256  5305e1d5faa70ee0aa282d85a5c9aa93911e8c7afa590ad1ced5703a544e20f6  HTML-Parser-3.86.tar.gz
 
 # computed by scancpan
-sha256  cb797b8a92dcb2329dcde194a3032d5d94c172289e9e54ffe8dd1785bc3de2df  LICENSE
+sha256  c371a9aed7094062bb8cfad3da1bc45fa1984b706443c78cdcd8dbc06a63c509  LICENSE
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 02ce08b56..d7cb1be85 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTML_PARSER_VERSION = 3.83
+PERL_HTML_PARSER_VERSION = 3.86
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
