Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9CBCC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C9960773;
	Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id in6RU5AST7hw; Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E5C1606CF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884587;
	b=VKjJEBCnl/rM1cvOFcWu34+e5dozU94KZ6wRBVXcPdMpiGTLQY8jCf9u7v0BrI7Lmk9M
	 D+UH07HsVszBtJyOE2OW+HuUXWq+nQ21BAd2nMd3vHXqwdk+vVCwfBcgqYpavtPAON6Rb
	 AMxV6eHxamZGfhe9xx2kpWhrhvRbwXaWzCiHJSltBXZC07m3JchYF2G/Pl2Yj4M1YELdX
	 QN/AxP/f/lwAYFeVeknfTddi1oBqxONcnD5ePjy85kekw6Od8Q7xyyc66qV5K/NhgcVTE
	 vGamGva9ff1dUD6Q7mJV1MDkxJliqw5gDyi4s88k96PLffFkqD7afpf7BvutVpUOZaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=snqiusl+vNiQOu9z5fh0XDCSMeLZ/fFktrwntRbO/O0=;
	b=Exm9cn444bYIRkYWHdG0yo3glK2+3T7Rh8NYMLnczWsLTtD7DAobp8UPtlW6lLrMe6GL
	 b7TAZvXeS/76KRsndoJAkgGEXAoZ4i09o/z8IXsH/FSZpmufcZUGcrMZKAJpOlRgwiwoZ
	 yDGr109O3ZCqVRzZ8JdYctaYLvTuhEDKKiYqmuVujfDbPrJ7IG9iD3lWgf1etNgFbWI2G
	 9K3HwihTYzEZz4dL4mdA1A3XKz7I1Jbo32jXjIhoC2DTH/WLxiw7Xgn7vtXBj7tiQ3yir
	 ZUnq6UtSDW6395E3IPdL2wKH3HaryxmymDyXoas2znbP4y0Fu/XyqkzAsTyT30pSQUA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884587;
	bh=snqiusl+vNiQOu9z5fh0XDCSMeLZ/fFktrwntRbO/O0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYFp+aOY+ictZnczfGQVjA2q7RxTvHRai9ktO/aavWXTc5G/ZgjuTH+GuChIxCkLE
	 p5nGJbEcbA5pu440j/A2sigpdUexWqhH2tJ6SR0GU2/FRzIJyasXorG8rb+ThWHMrE
	 I8CJ80L0gdsMs12iJmGLa+g1bWfXu0FYCmLIutZtqJ6RPPskgppNuq6QxPS8kltwuc
	 nnC41hZbaFdT0N6ROHV/X68TgyLiaUeygOgUrKYDjN2YXfrJ03pu7NJqhGPDnHMkMz
	 YZl7/Cb77jiKobxerUPR3KV+0u3+OQULHZMEbjNN/gJY/5JoMevNDPhzGJMs89qYxJ
	 y5PODP0+15r7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5C1606CF;
	Tue, 13 Oct 2026 09:43:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49AAD75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B46F80C8A
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4G_Hu8OYKwO for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C23580BB8
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884583;
 b=cVXOPMNVaNATn+Le60MiFGiTLELLoN+6q5cwSuCJmRfqvpTqeVu8FkuVxirQ1PoebXi2
 cflfHdRLAT8xUVr11fGjxbH2PZDFYmljvtCapl4ghmFsxXcYwPyO6CKZlUn6+W2gLD8Fu
 5WSVikDnTz3i4WHM7X+FpEHXOrpOUDtvSmA6cDDkPBXcIxlQrfVkz0bnOCYVRhZ5p983A
 +LsujJnWbjFbQ69RTHhv0D26ScKRgbXQL1P2sBWO+NcVG3ulaEtRgYfK1AcMSIhz0jiNR
 TZpm1koVWxhX8MWVZdyVKGdXbMslUTWKFTIP510fjT77fLXqL5m7jKu6UOlIJ5pyung==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884583;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=phOvFGHB8gxAnbvOBZCSFjaaIODyM9z5f+oypiXhWfs=;
 b=lNsBEJPz5Lif1onjLYAEz7uJe1r8XVfmuh+hvNEemP2jSSsZwUMjS3p6nsNxC81GtTdb
 ePS40wI23PlZiY3b6mvO7moQa+DV7y9VqslXF3itqZqNp4kNroVrvzdK/KCtWzbIxqFrh
 yUYHBcoFVLltGQ13CZERjrb+GilDLi79fqjXyIscTFFmenArz6ZJu1VjJxxsW1XtgvIQA
 /yXtg7h+zuc8aMl0/RUUiswT8cuAg74/rc7H6fPEvBqBTXZRUa1jd0r43nevj1PitVb8A
 5VyAJcQ2msEmUn9bDLC0YqyYbwi1ZtbCbMtB6rxQW1Xd7UbxtUObli0A7R2L7yUTRGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JOgGqsCe; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JOgGqsCe
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C23580BB8
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so32935925e9.0
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884580; x=1792489380; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=phOvFGHB8gxAnbvOBZCSFjaaIODyM9z5f+oypiXhWfs=;
 b=JOgGqsCeM/AxbrZ9tRqmr8+USYEWBQJHfB+YHkjhu77OfI7TziGAF32jtyJ5Pf0gGe
 eJk/tLzdmppQsmnQnvqLAbM9O19njD39YxO+RGpGV6m64GKQSYHuWlL2KCfigbcomAqt
 pyi7o5PmkWs6AgmYi4qlIu+TcSBDpeXYwxZ8HUpqZn1mTYBItZdGBi0zQMNoaTFXcJw9
 B8BgP3Xo1USH2r/BytUnYaycyMJJAm3Z5gX+Lhv1kzpvL21X11oHxQHu3k2n20VEAhlG
 AStEHM0+j4fcOTFUhWyk8hWEEtwui59swp7lgxtXwzwNWRtryZ0DX4lwyodLtCjlaix8
 gmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884580; x=1792489380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=phOvFGHB8gxAnbvOBZCSFjaaIODyM9z5f+oypiXhWfs=;
 b=Pg27Xexy1vjMQbWBYgI2izKRx8mAbTWFLImGq/8FK9cT16C+hsoTyiPZY7E3XyCJT9
 8/WdMnv9jQqONnmM3usoKwHuZIsNtFTrINIDLgtTSmO2TQaTXNzq9SaCYSyn9qoGbf4q
 ShbSBbZY7fWKBFSGK7BEIu1WNWQezr/w87v7QXOpBPL11wXCU0DnoFq6NfMo+BoJc1eS
 NquUrl7KTAH6D+jogAwQzmbDC9y4DOSNOrKDQ/d4QtIPo5xtdpHk7G6iP1/DjFsCzCTw
 Wa8Oqk0w89DgAtrxXuV65/WDyJ9Bqqc4bFFmQcIs+rdAbowVHIV/DmcqJJtmDVgIw7CB
 dXog==
X-Gm-Message-State: AFq9FYJWL2uTGNHo2BCH7sFg5AHGDU/1Ve+2KTiVD1lYroJNmo7o2Px4
 Ac07PmHS6XDg1kE1g9xmafKwWvmwAG42iCZW2BCxXla7qX4R+1LyTrpi8sex2A==
X-Gm-Gg: AYBFou2o/Ws79T+06WikknfdI/NMw29e0dJt0bsSxjrIuh3iTRiZOPrARG0R2iHcGYN
 aMG/kcI/x5b9xMXIqop7ZOEEUY0sCZ6WOr6YjzHWSiOmPW0Ki0wGjcx+knZQ2xT/E6KkDMF7R+k
 2t2NQd/9dIGwI6fx+QGRPYrMU03Y/hjfZH2KN4YwecDCS2s3VWfJ3jZGhXJVtEa5AY3F5gEz7FI
 SrIUP0LaOkET5KFvGhwgMbScFx8ZZVVSOzRTx5Dfsb6AGHrf6zryccqbYV/DXJZp1h2b0dE5nzb
 jPIut8pxkFCCIrTOJ2XHW1BnlEIuo+ieFdJ7DBmDo6XipEOaiN9FnlGMQNQHQ8IFQmZhWi+wAMS
 fEDSHMqvxbPaTKyiSGf8RRMfTThvtFlwPcYchsK0uaePCzW5I6JxXhZH4dOv75YEvWxOs5a3tYH
 V9rCX95+EsPrgqXK5RpdEorpX58nJNLA0SeOL/Wwg3g4wDYu1OeKbyDkCxU33p/0EbADwZtn/sX
 FtmARypNjrKsG0HDBvjQHM10Sr5CF2CZARb/CPO
X-Received: by 2002:a05:600c:e549:20b0:4a1:9438:719e with SMTP id
 5b1f17b1804b1-4a1943872ecmr115611175e9.9.1791884580164; 
 Tue, 13 Oct 2026 02:43:00 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:42:59 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:43 +0200
Message-ID: <20261013094252.96761-5-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/14] package/perl-http-date: bump to version
 6.08
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
see https://metacpan.org/release/OALDERS/HTTP-Date-6.08/diff/OALDERS/HTTP-Date-6.06#LICENSE

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-http-date/perl-http-date.hash | 6 +++---
 package/perl-http-date/perl-http-date.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-http-date/perl-http-date.hash b/package/perl-http-date/perl-http-date.hash
index a6f770182..844641826 100644
--- a/package/perl-http-date/perl-http-date.hash
+++ b/package/perl-http-date/perl-http-date.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  60462359bfeb1e6d14602508cfd07885  HTTP-Date-6.06.tar.gz
-sha256  7b685191c6acc3e773d1fc02c95ee1f9fae94f77783175f5e78c181cc92d2b52  HTTP-Date-6.06.tar.gz
+md5  5955c394ed659bf4cd41fbd526c42ec1  HTTP-Date-6.08.tar.gz
+sha256  b57d80ca6d821c6949ca48b27467d45aba7a9c77346562306facca781a003e44  HTTP-Date-6.08.tar.gz
 
 # computed by scancpan
-sha256  6186a79a305a0e62c5087f9737b4f66fa5793fa1b396da0126e3c8722c460245  LICENSE
+sha256  994ab45a4f8ef43f47b7baabc48d100838c42d226d8d161d6ac1f49c5f9d7c84  LICENSE
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 2f1aeb7da..a66130935 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_DATE_VERSION = 6.06
+PERL_HTTP_DATE_VERSION = 6.08
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_DATE_LICENSE = Artistic-1.0-Perl or GPL-1.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
