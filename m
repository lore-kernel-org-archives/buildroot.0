Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4046CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F9B1607CB;
	Tue, 13 Oct 2026 09:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GnOFUaLsDwm2; Tue, 13 Oct 2026 09:43:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6C293607C0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791884607;
	b=aur2+0zUQuCiexCCKxZlXJBZoa3q2YJSmdXtSXbg05INs4xXikzXr3rqH/uFNM2KnLm6
	 l5VrzgzD/LgdY8peKlMX84r8kcAezOoqkNg1+dWJmibjRuCwspZBJIwas3H/fAVkCmtFo
	 NrVc48ZfoWUU9RouNaGyQ5UUCTCwyitNckobDJorBJtIRWHzBtCuR0k3Qc7KJtveJZtab
	 AVXrcX+VCdr9QtkuVZU5TEj+RnxIrdbX/Diq7kQFRRMuKz70P5g+Z7Cx0Z4Zzs9XH41TK
	 AGD+CP8ekjbx7bukT+qaruy8LaT39uCG3Ut8YJZTtQYrGDP3g/ZhbDI/pJZC7MfeZyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791884607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=YR8P23jTS6uiIRTAaUSYqFb7wDRPvWKJJ4H47RkAXsY=;
	b=lsxgs6V5xhDmRSJieTbzMHfgetZhzHUCj7BBeEtr74QwppjiN2tP1mX3UfjR3I7OcGmn
	 Ft630iwA1ne0QgmpkepK33Q18pz+0NXmh9NdP9L0Y2MFyaXZEqiy9vZ8KQiq2crORQjWt
	 tONdNyqvfi77jsInme6e3+quTMwdcIJYOwcoxSuqTEAs51lCEZcw5deKVZ0Itc4Md+cRe
	 BvGb8gtpdveLikPwguyASJ35Si6szvgL8wgHS4lzUx3lOVIndNOog0/kzkGOcZ/dEHT0K
	 QSNPVm4YxgNDE+udh+CWZHG+EK6Hmpygxh1OTYkAM/YFy2bEEryfM+on6yDolysLzZQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791884607;
	bh=YR8P23jTS6uiIRTAaUSYqFb7wDRPvWKJJ4H47RkAXsY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MeFwkuSrRvZYJQMTCKF/ucJo7J52lCj5MSLLMb0YaYkM9lZK9Xc54reGGe0KintUT
	 xDmYvMguxXgiN+ajriTuCt9wL2gslx4tvX8QNoOHvm5GJiseRzCo7VGTmGvRwA5iPs
	 i/mxnxYVV48W3BFgoAmkCMMoEKKaKY/vExS6m/JF+cieWuxzh3L/LlPoRaGOeGLJo1
	 mor+32lBaNTJ1KijFJDYbjtTOyXvbohnZvdFKR4vMvOPUKbgi5lmPSvTPlIGP0E7ow
	 wv98ZSE0Yw/XRTJj4K3zI7wR1EXuEURRFKOsdtFUoPN8yxC8EJ4Vdk9yz4HaUusmP0
	 nmDa0U4cFWLGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C293607C0;
	Tue, 13 Oct 2026 09:43:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA3D129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A66E280BB8
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7isXi21HUCxX for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:43:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8170080D2C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791884587;
 b=GNZiOQ2oJJMByPQW8WbX5pn70N2mK/haDcnwjXqf/TsrMYEGatM3TtpJkYqaMuzsOCqJ
 HvREfyJsisCz/+1syb9LQlMAi1s1nJNL2cQwr6OiadwA4V01oZ3I51a2caM5MP15U+ty0
 G7MENEjsIriYmhphdZK3H+N5AWa4OwIPE0RROMDvfE7VU3mcIe3/a7moWApLAZmAe3IF1
 WrHlvvPuJkGYcp1lsMVpjCllYz/L5Yf8w/lvVw5892dozIQWWxwW5isnEzvXQ+hr/B8Es
 OuG5mMIL4DsXHS7jziM+KWhzJ3oDZi0BvBastQ6CzUuoU+sA0Bt9rMoqqdIn5mGxvCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791884587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=RJWYg9/5X8WSELzmjD+iOT2tLfNe8na3ETsWMTVaQgs=;
 b=qGYXUFSDDVod4v+a4Hf9l75HvppahHEZBsDSGodnSUvGYLgaHm75QD66OmJ5ZmMBE8Oo
 xun1tx0yoQwjDFLdCyOgMVA3RASPi5Irye32Zbj/U7m3zJ18dMdQu/4nR7ZAeoclHSoIe
 bwhSP1i5mTPKZCW3GfRtEzltCdtnj3ChRuC2TaxcBh52EiSwLFGcl1qFahuhrr2z1pzFR
 xzZUqybBzenpvImYHaXzq/p9qGbvXtL1KphJFGEP6wUYVy67/36jyZpVjGXChSIxrtm6U
 SD1NXb3uM6I+Bce8vLMt54Ch8FHv03UaPuLwrn+NgEthgiO6qNPE58HUjtlVf9M7Olg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JJ2zOXY8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JJ2zOXY8
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8170080D2C
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 09:43:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso35426285e9.0
 for <buildroot@busybox.net>; Tue, 13 Oct 2026 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791884584; x=1792489384; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RJWYg9/5X8WSELzmjD+iOT2tLfNe8na3ETsWMTVaQgs=;
 b=JJ2zOXY8ecp6S9rYGlziCVI8r5fBOXb1At88Kpl1Zq1uyaGivnyLG8u95vMr6jO9jM
 ZCYycO95RvjwfX2cgv1G+virOYsmdOZRYvHFHbhIq1NsEpB/djz0u196e8gY/yqb+m70
 c9YnLlw5z4dNpf7358wvYqyNh7mJl3S5rldbpyP0XEpagYPZS6jiFzKUdamHfNRcZ2pj
 iXg/0D/6PUD0vPjq5pm+gj3UPcmMQV26gGzxNMj002H31JTiuWTZ2m7t93rGLD3ZV2JK
 UWvYh2z3vraR0JQ0vr6/yiwmFh8hlR5MusaWhJnF9OFGuEy1TFIon/DqsP6uR+IVfnNm
 sbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791884584; x=1792489384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RJWYg9/5X8WSELzmjD+iOT2tLfNe8na3ETsWMTVaQgs=;
 b=ImKpekzlMWXSs8DBRz2a5/ureX7/Noblmod19ODw3d4YYbo50jF7UAvJF7XNqUNY9O
 B94tEkwfbaH1nK2dITCdD96WxFt91q7/hoPPLzzqofTzzYgfSNn88uOGhNTRrA9FJHnX
 nu5h9Ct5XBf7sfHk5p/SofJbSFbestOQCEUQwkjsm8i4hPXEbBRhXlALKr8t+NBaLT6/
 6doMBwsMEv3eCH9v1eYcpn555sfFYR6On9B7O1QSPMSQyHEo61ZwmE0H+4Y6ViTfnG/q
 Ke+MSMmjs2/pPXxUiNMtORaCgKIuRfmioMQFuQMV7TkNF2Y9eDNark9BUWHUWatn7vZM
 RNNg==
X-Gm-Message-State: AFq9FYKQvKFQ+/Ol+uIYQGqPXY1O77SCt2SbHtGKTBMDMmFGuQ+AThlF
 YY1fqYrCJ4bcbbJxONzpy2UaxqyMjOJcmrJ3ajEoVldHeEYv5vhZZ0KHv3ldcw==
X-Gm-Gg: AYBFou0LRAOSGCuQZYX2zQDAydeEvjkvCl1kerMhVYE1h6PkRk8MXRSuEPxVQpV0nrc
 NFJmxWTIeZ3NV5a2ZwO2B6s9ohvsO1+a7W5JRicnXAXwRzWspXu6K8MXJ2NNfJsZtso4Zyp8bIX
 XS4Bim941bRpWROKI5ocs2mfaLm+gBVbITLroJv1x6TjZUaThI7BViLitNYGmvAdTOaXelFzCut
 MHQwL5P928nZaJqXuEjeq3LYNRpbTHVJUw3cIBxqj2O2xnaFd9hnWzPXdvaDMQEmekZSj2fzM8J
 uAM8BNZoC+XyzxDCS9h93+K4xuAK3xz+3L7iDEgTXIWYNqe5K3wvbAcrtQYzcGgFI4hsuq1XwBN
 u88nYAjBXFAjhsRFG02Wdws0H0PAuUu9qkM+CA73FhLygfUK+JRYM1TzR8s4A0HOa31s9C1Namc
 lhLef/7qjLZ1CiHjQjDD4dUSqhXACmf9gyn+rJJ8HFCG7ZU+ZmP61+uU0GRep6SYnJGxpTOGRC2
 WYb4F0S74+zhlQklv1PmjDQsZz9XkOZWLtfElQI
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id
 5b1f17b1804b1-4a18e4b1311mr223123375e9.17.1791884584167; 
 Tue, 13 Oct 2026 02:43:04 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1972eaed8sm238665595e9.1.2026.10.13.02.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 02:43:03 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue, 13 Oct 2026 11:42:50 +0200
Message-ID: <20261013094252.96761-12-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013094252.96761-1-francois.perrad.86@gmail.com>
References: <20261013094252.96761-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 12/14] package/perl-timedate: bump to version
 2.35
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

now, it has its own LICENSE file

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/perl-timedate/Config.in          | 2 +-
 package/perl-timedate/perl-timedate.hash | 8 ++++----
 package/perl-timedate/perl-timedate.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-timedate/Config.in b/package/perl-timedate/Config.in
index 84ba8ff6f..b1b919613 100644
--- a/package/perl-timedate/Config.in
+++ b/package/perl-timedate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_TIMEDATE
 	bool "perl-timedate"
 	help
-	  miscellaneous timezone manipulations routines.
+	  Date and time formatting subroutines.
 
 	  https://metacpan.org/release/TimeDate
diff --git a/package/perl-timedate/perl-timedate.hash b/package/perl-timedate/perl-timedate.hash
index 5ea4d49cb..6748883bc 100644
--- a/package/perl-timedate/perl-timedate.hash
+++ b/package/perl-timedate/perl-timedate.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  5e5afe22c8d417417283d1f7f4572a57  TimeDate-2.33.tar.gz
-sha256  c0b69c4b039de6f501b0d9f13ec58c86b040c1f7e9b27ef249651c143d605eb2  TimeDate-2.33.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  a06d7f6ec7b24581f0564f0f70da1a86  TimeDate-2.35.tar.gz
+sha256  baddd0306ae2e86e9ec28d3de5439e514643e80b3735e43bd0fbb426d73304de  TimeDate-2.35.tar.gz
 
 # computed by scancpan
-sha256  e72e67533eb3ddd705ae718898945e2f3bf3702e91e85bb67824575706bd5bf9  README
+sha256  76f019211fce0b5cb773d602f9a9be9a6f8534991f251cee760a65ace1c97408  LICENSE
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index 89a82c042..7d708cb82 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_TIMEDATE_VERSION = 2.33
+PERL_TIMEDATE_VERSION = 2.35
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AT/ATOOMIC
 PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
-PERL_TIMEDATE_LICENSE_FILES = README
+PERL_TIMEDATE_LICENSE_FILES = LICENSE
 PERL_TIMEDATE_DISTNAME = TimeDate
 
 $(eval $(perl-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
