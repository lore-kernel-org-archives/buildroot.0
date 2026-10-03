Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC1DCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 03:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE62B40D87;
	Sat,  3 Oct 2026 03:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ibflnELeCqw2; Sat,  3 Oct 2026 03:40:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E8BEF40D1C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790998814;
	b=Dbo+Q2O5ZbwQU/mJkt/EPIa31kJl9ZyFceT2RxHZm+Go1EBKIGflJXrIELbDqz/fmYmi
	 JOwUxPpAHtHLXUUqHL0SWw+4ev/My3zKSxiIxONtzg8aK4u3W/ORnPsOFzZ5MikU8UKoH
	 al5di+rpGh4im6VW/Topgl6FtwpfhW1erMuTamGjE9wpcRiEi1iys5Wchg8asZvREexO/
	 AXfOMswPUnWHjniP9XPf9gJ5BdLQO9hzlUsPjMVrWknxnH2kPM+RqJS9ZB+Zobgj8kvdZ
	 BHabQ8Jl7mgryoTZ+66Q3H3jGRFfcSQOBOSJX1K9s9eSEkuZQ3umDwKnoOyyGJ5Q1og==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790998814;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WdbQNzNK17lTNRgWVYLiaV9sOmZ/CsukTy4V6Wz8RaY=;
	b=mAvXx9LM5viz7ojWE/BEtzPLwb7pl/EBobSfhSgvIxwebMaHJXQyqfwDG/jWuSLBGyGk
	 w/xAao7POhpE+WFqxevC9COR6xFTiBcR7MYCAXTwOUAQD8T90Ia3vVSTwhpBGBKAPVxaM
	 Ae4ebYAHDdC3/qcTJH34q76Db7w1WAMFuGjj6vv7luLTEXF3A4v1WL33CKH4ZEnE+ooXE
	 7arYitrnl5s7lAxvIO9F1RrLv4WeVFkCOgQdDNYvbn5QlV9+07X4N1GGbi09qiqE63MLs
	 MAcWwTdGj6BhmV3mmCMS/udvPe86y6a/X9T+g/bab8XGfFOR1JXKQt9QR3x/gbKVzyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dDnAoKfj;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790998814;
	bh=WdbQNzNK17lTNRgWVYLiaV9sOmZ/CsukTy4V6Wz8RaY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aqT9KlxekxlZa9xcV0A1BEoGh0XPeqF7bs6ibM3VSb6uQD7XSGnuYIfDjc6KeYrZ4
	 BrCvC6lf2KY2fFQ61n5WzlWBD86zpl1dNG7G7ng5yfw8suNrAbpEBT2YqX+V2gYp/K
	 mNWi/v1g1eXXOK4TaeARDjrXrUL1K33r8ys82r9ctI19cQO3zkx+29y0TEhckHJeD8
	 kjn26VUTZI2xHpzRQiFW3Twikc3xSewpgbJMaTXnBNROWQKdmF2wwyniwb3sqTmACD
	 hbPIre/dWabwuFWjTFMLvOnyCaMEgyhIY0Vemz57/Ulkgwcoum7ZG8gzciJm+litZ9
	 JsccYMHAlGv7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8BEF40D1C;
	Sat,  3 Oct 2026 03:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 605BA32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D994440D1C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Tv9b-7ecEY5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 03:40:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D11EB40CA6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790998809;
 b=QjdSJjoH3TSB50FOM9EADkqYx8URHkpHJhuuaPnKesdlgMfk1GNkaHDQ/f9jkyv4VJ8j
 pvBcUO3m5hvZaNPRboAFn1ND7xU2jgYiX/x93L8g86sDryCbBq7u5/MCM2qnYwzIHhYTL
 Z61dPl1NKjBb3moosgPdnwkAEG/64xUcp6gOolgQS4fMkIob7W+RoYc+Jb481VZP/C0ik
 57cMW4Ax5vphn1PDxvaaecwIAvx+O+f7kSIqLojqsBiiJCEEiT+At+G2hewhoJusw/Uev
 c9mKMVGrJkxIukE0q4wrBtiK6za90JhIRPUmpihKHfQ5t/CI2RkIOpE/unyVDZrqvVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790998809;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=AE6cX53cQvq7r0nwsxzAPX+Ny6nhkxhxgDkL7na9mqM=;
 b=oEsZxEWkteZLPiSiH8Hrj8bImAFIvPk89RVm8SiVisIoeZmCOfYsGJ0zx5UFU9GsVBYY
 6OMXaE89WBpGj6heMv3LA4XniWBv+3ngaFXIJdCYn0lK6bl+krKsVOIBbB2k97qr5KSCx
 kLHyaRNbFEthGghGBcJnzy6qcPomXmeQtzU2nlA2BC9FZRRYr2X26eBfB4Ikuh3KssgVV
 u3ds9u+AHxx1hpE3gSuQVMX14WQN1mrJngnlK1s5RdZNTZjtDdKpg2XMRsgxfRcjczYC+
 YkrIHd4X7Q3Mi5r4TYbTmXkcpZXyu39LgYnz9TpiE09Z0fw1p24ZURWkJ8tc62OBqig==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dDnAoKfj; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::c;
 helo=mail-oo2-x0c.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=dDnAoKfj
Received: from mail-oo2-x0c.google.com (mail-oo2-x0c.google.com
 [IPv6:2607:f8b0:4864:31::c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D11EB40CA6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 03:40:08 +0000 (UTC)
Received: by mail-oo2-x0c.google.com with SMTP id
 46e09a7af769-8231c185333so304039a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 20:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790998807; x=1791603607; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=AE6cX53cQvq7r0nwsxzAPX+Ny6nhkxhxgDkL7na9mqM=;
 b=dDnAoKfjQW+BibaOWrvufULvB5vI1ej+G8y1ta4iWhDJOfJBWixEw2mAFNuU48Mf3s
 k1cxDn1Tccbn05s9+Lm6OOJQOx6+X0Z3KzIR3nA7becB2s0lT4aeeQbfYtd4MCwHgG77
 VgpvfmJKZWMyNl0srnoaV3n/f11D46bDj1bRaX7UqHnEPZehoOwHerLOiOaz3N/UrdPj
 WkQE1cKV2uOKoU6tSi+uVXvLRNh3XtnDYvQtoSbYY3c1jIHrVcT6fDhTRoELFtJ0fP84
 9cvK5OxlUYmoQ0qLdo9QXwj9Kh9qncYvcDY2J4u3BbVZ0gfukEQmuCqabAiRZbn1Ufft
 5lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790998807; x=1791603607;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=AE6cX53cQvq7r0nwsxzAPX+Ny6nhkxhxgDkL7na9mqM=;
 b=RvLMz08ypAGVHLPCEm3s1BF2b5zkpZARqjj6yaFaECm/RIzGt8rXN5cz+6SKDQo/PV
 37CVrBtfAh6QOS4y3+ftIyh5Bl4qYXStzqyN4T1mH3lPJVIxkWt2DhwIFfjSfwNvdg2J
 oVnIOraI5oVFW6UJdlkmq9jOmAFaboVCTwjsBnfH9HLui0kqFdsRIIOmMdIuJSSom94h
 AFuonkrIqQILOyNzanBeZOvVloM213No64dLkFKOpvjhyAH+x3j2LJeOMPvG1YdLSkdF
 CKNd7Id8QYKIJiLCktlo8QxPi14MWecUGw2Cep/QXRFmWnn1w2ZJeKrZ02rv9VPVJJdN
 tMsQ==
X-Gm-Message-State: AFuF++nxKm4gHIsWjmClOe96fRvUrtXlux4VKu+RHtGQ1alqcHa5JkTP
 YQfscYWMbcb5Lnv8cNSzs6NfLM410hNf4dBvXTpYYJGTYrSsSkJkH9UsBGnmYA==
X-Gm-Gg: AYBFou2vMWwfEw4wME1kZjgrNn9F6AMuct21wnCnVxbIATQ1Iz8AOOBq3oTYR7yAXu1
 +d6I2jjbQKJTVnxvP3r667CFKq/4A8MaGgOWHxOsHO+ez/mRzv0dfiCPTy1bXuGGuexS/EuMbc9
 NgLzabHZ3a1vCJeQ23CJMl8jCi8Ugzi6ZfreQLcO/MHZpX6cq9Mz8wR2o7YA/hmwVvnjYrN/VvV
 zMUQOJRgvRHj63vLzAi8RnocMl8SZl1eTf/YkeUMm1Ta8dAfeRxfKYE/X1eqrsGNfcQxqdUHAq0
 kit8LFrE30x4m2Bz1ATa4WTrrZjMLp4a7xKIOZINbg2RZeFEfDkCLpZTOxMlgDmJpc+n7vDyVUT
 A2R6rs2rYAUr59fWZ/sz+3yyd7MWkmyn5hwApx3uvA0govdkDurpvzn2IPrn3o9rzv9fZInE0M3
 Nj7oyyn7wZL8VBqwMIHg205/WgMc0wo/a3zD5FncJWVktA4eJyageEuoUSiDG33yryAbl/exp3E
 HYnT+iQpWJoaR4pC99pWSFQtT4YD5AoG8KqGVFCOUZXgjjxeQ1Nbzi3d8A0V6zhpWZffWVPuIrH
 9p3EzrNy+w35MEM8uLDKOXWOyGd48nVDjEDFincVwFyk8BTSud9X+CkGUQ2b16Z7a/v75dBvcIs
 uIcUju1fMYExsK4ihxSJ4H+hkztaYxSgYFH8dBVQfjw==
X-Received: by 2002:a4a:e917:0:b0:6cd:3fdc:5ffe with SMTP id
 006d021491bc7-6df36520691mr3553654eaf.79.1790998807277; 
 Fri, 02 Oct 2026 20:40:07 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6df3afab7adsm4203344eaf.10.2026.10.02.20.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 20:40:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 21:39:53 -0600
Message-ID: <20261003033954.462113-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003033954.462113-1-james.hilliard1@gmail.com>
References: <20261003033954.462113-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-hpack: bump to version 4.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-hpack/python-hpack.hash | 4 ++--
 package/python-hpack/python-hpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hpack/python-hpack.hash b/package/python-hpack/python-hpack.hash
index aaaa3bcbbb..78e572a282 100644
--- a/package/python-hpack/python-hpack.hash
+++ b/package/python-hpack/python-hpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hpack/json
-md5  16e7423c5b5078c1997fa3eedd2e5935  hpack-4.1.0.tar.gz
-sha256  ec5eca154f7056aa06f196a557655c5b009b382873ac8d1e66e79e87535f1dca  hpack-4.1.0.tar.gz
+md5  b9e407d481be0790533689779b6b86ca  hpack-4.2.0.tar.gz
+sha256  0895cfa3b5531fc65fe439c05eb65144f123bf7a394fcaa56aa423548d8e45c0  hpack-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  763a9342a04df62046c9dc748a5287934eb0a5331c6863b3ca0aee20e18cb4ed  LICENSE
diff --git a/package/python-hpack/python-hpack.mk b/package/python-hpack/python-hpack.mk
index 2655a6b4ad..d49fe73d8b 100644
--- a/package/python-hpack/python-hpack.mk
+++ b/package/python-hpack/python-hpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HPACK_VERSION = 4.1.0
+PYTHON_HPACK_VERSION = 4.2.0
 PYTHON_HPACK_SOURCE = hpack-$(PYTHON_HPACK_VERSION).tar.gz
-PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/2c/48/71de9ed269fdae9c8057e5a4c0aa7402e8bb16f2c6e90b3aa53327b113f8
+PYTHON_HPACK_SITE = https://files.pythonhosted.org/packages/26/5b/fcabf6028144a8723726318b07a32c2f3314acdff6265743cf08a344b18e
 PYTHON_HPACK_SETUP_TYPE = setuptools
 PYTHON_HPACK_LICENSE = MIT
 PYTHON_HPACK_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
