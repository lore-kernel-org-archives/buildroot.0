Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E06CA5FC4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 07:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B75CE40CBA;
	Fri,  2 Oct 2026 07:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9mdHV88TWAH; Fri,  2 Oct 2026 07:20:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 492F140CA6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790925600;
	b=Kl8rWX7VVsR/ZfUATPSfky4MtftHz60KqWYqMHsDHboOHFb/B8ArNGKINZAqt0/Zg6e/
	 xuq+JYp3LqSKSBGEtsUin7JGKzG3DSd0N1SZsXfIS8jmQBlpIBwfzNEM2fJ5UcKd2PIxp
	 mty3id4/h6sZaXfvHpax+lsefLI0yDO8hbNPP1ifowPE+QIUe8d/kAt60cHCgIm9Z4ef/
	 H6HX9yuxVYc5mU2NYqijkaMOH2gh95NOWUm5gha29JOT4vp3/8WJjXxX7C8Zmqs+xrxdz
	 yxHeFmc6fJrimlPiG8jgTmHRhmU0PHBTwhsaWTKzCPMjxbYUm+neb50U+3Qx8IPlALA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790925600;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=o9q2zZHxaHWQTZfn3tAfmY6HjJz7jnVfK2FNJcNwNhA=;
	b=nVvbXTrfI6YSX3e7YTqT+uYnEO1PDglBTIb74tZdrVlEsYMuodSvsoZXm6QF+dj42CBT
	 efWDuP96T+d/EuJrRY3XAVzHprKN+nxDR4tJm0PSj88UQHYfZDkuMwfrJs1mE1Hv8XCvS
	 XVNR+EJHJpSEaqv4yP4xlTCmac2APiUiolfr9SeqsexIjOorVOCeUq4A+dB4waQa5GYgO
	 KsqFC4tjW1bn/AMkIDFDjnSU8mIuALMtzyPlNGjzLdXZXek7cNOxhvfcURdc2AjDp2M65
	 UiUZZrQDaxWU9IhkuOfwoE9RUYYgDUpIMIk/VvaDroDyKw1OqWY2+mSmmidHEvoB+LA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790925600;
	bh=o9q2zZHxaHWQTZfn3tAfmY6HjJz7jnVfK2FNJcNwNhA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=p9mL1nLQc3/6SaD/QhJs/IcASt0Iaj8Xd1DKXUizhumjH7Q3Ct6zckz8dCVUdC2T5
	 OczXJwG73l0XPaZVXAWOLnpr2Sh2QWYBqM7+qNnicExj2SF1zUm2QZm+/JEn1V4/2u
	 8lNWAaSywqqR2DCDIDM4oocgYbTnsr7fLl9qFlgqEogDjICPDa/tE1auvITwyVaOi8
	 FvbXK0oP1uBU9CsW4sKLwgrbZQRh8mbnWb2ui2706FvTdT9d82YEW4Ye9TgpDampnm
	 PNfd8gIccY2XL3/XvDbsfU6F2UJ4yAve3EZNf+NInWq0M9IY3cd2ttfzz9z7lwUlM1
	 zME/d7uAKhG9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 492F140CA6;
	Fri,  2 Oct 2026 07:20:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 311B1282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22B2E811A8
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRdcezAVVv5q for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 07:19:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC13481130
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790925598;
 b=AfqC1DY3HA+IdDg9YbbX1Tt2K6Y/H8GfBdZL30pzwJd16zGKBefSBq9VtTA4mvoYC8Va
 c1ejU6MZ29axQr6j+1ZBqpazd/99vL1NWd/oIQIRqNZ8IZN3A4aCg9KSwveOT5AGPNVUn
 pJNkc0qTzlvseWxKDO6f0asfxASS24Bbu3vWqpXHjPnFj7qXRjgGtVbnSKC/IGWRNnCul
 kROMIuz0v6MVYfji5K5ypCVohlWD2rPoj2o0GLwInydrZeDVHiu9ncQeW82QlXDPIoJok
 0gKKoexCsWsX98Idgk8+jwBfcyK6xSaJrE60hyG9kFclINjUYadSWIcFBzRitntRovg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790925598;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=+5SNXXgGkSD7FZChM7mO96VODexwHH9vCUDsIM/klTI=;
 b=AfjKJ+M7I2LpFxtCcXjMkgW52KmzfKlQBTpCmOjIDDlGz+fdhnQaWmAmP0Fvl31U46tz
 aalupuwbfhnSQjiRiNKODkbWStcFQyBm6LnzVBh0/HK54PhGhr5eAkb3SpClmBAdl7Gaa
 oDuel+DQpHIDUAj9nJybwR41emW9FykjnVtJPzD5arY7xlapUXX1OK81dqhyqKXqLGjzg
 4QpUYYEk++qU/SHOsWa51hUeGeIycC2k/bvluVhXMn6sJZbOJr8IHCeTvNjVPWdW3U0su
 IHmF1SA5XUtMGs/x8Mdpun2g1KzN9YVuV/P7Tt71R3FG7RAZqNB4bDNk8LrlN3ranjA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=korsgaard.com; 
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail1 header.b=UytoX0v+; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=UytoX0v+
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC13481130
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 07:19:56 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=UytoX0v+ZZ5S7ExNz08UfTqzzJZX0tqTyT/d4d31ICQC+sJint6lvGRiMHzM7db7UOeQhuHVP9OB4mRILOAUOt0Qq7jFVI1K2Sfz1yV9Uf9s+8lHH7B4MZHsLP14L7M6jMisI8V/XWAQOKAUgwl+dSyDkDBNPHTcWiwNrv4V9sZ1XP20R7/WcKMNsHMT9n+dCSZBzEFlyKDQJS0Uh8ER1KmPq6hCDn5JDnDlgZ6F/7vH/zaCzrDZny/IfSOPmSYoq8ntI7tSyNIegeMMhquw5PE1xeEP+ehRbLs4UTZdnbLYOcdCxTY2z8629umKC9tAeDJfRk3alhqKJiaHYGWvjQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=hlCa/kA2U0WUjqZePjuZXvCAcyBD6AR95V8u/Jdevmc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1348952492; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 02 Oct 2026 07:19:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xCXYe-000000099hd-3cyU;
 Fri, 02 Oct 2026 09:19:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 09:19:42 +0200
Message-ID: <20261002071943.2182234-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] docs/manual/common-usage.adoc: correct
 generate-cyclonedx invocation
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
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit e09bf9e9511 ("docs/manual: add information on CycloneDX")
unfortunately introduced a typo.  The make target is 'make show-info', not
just 'make show'.

Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 631c2f7788..67c3e06567 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -214,7 +214,7 @@ Similarly to +pkg-stats+, CycloneDX SBOM's can be enriched with vulnerability
 analysis from the NVD database.
 
 ----
-make show | utils/generate-cyclonedx > sbom.cdx.json
+make show-info | utils/generate-cyclonedx > sbom.cdx.json
 cat sbom.cdx.json | support/scripts/cve-check --nvd-path dl/buildroot-nvd/
 ----
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
