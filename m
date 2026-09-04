Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14515C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA5840BE2;
	Fri,  4 Sep 2026 16:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CD4fbEy4hcIF; Fri,  4 Sep 2026 16:22:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CB69240BFB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538975;
	b=hX+KneePEuNgeu4mRaLIa8u3x13lkHAlo7AaU4qggOineanOCwAXsgrXr5qAETHO0GjJ
	 qqEO0nAgyyRDQzrUKlOcoFIr3i5QaQ8mfnnHl4/Px9BQ7vkticLSUHifTTKlj38DSPowy
	 sIswrNG2VeV79B8pl7MxqfiOiB+LiC1NYUWRUH/tITc7344oHfgQ1wzRZ+SzfdflFQm+G
	 skUM+8OavSFx6i2wM3IRN1DreDW8hEAXCUl5owz64AxrkojiNMAKF+Xo0HRoigdIJhmrC
	 JEuTmIeAETwjcVhO2zUtgKJAy/C2AnAJ2VNd7EGPjCbj3I1XGW17eEoLMD+3ooEafOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538975;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=3t+5EBdN4wFg2t9lbcuMdcNYGuIYJwux5YVQyB48+H4=;
	b=hX2g5NrU86inggsqEJE0UTNSGvZWe3bML285BKz50Z4/1OI7zdkITsekPQuiqKg7RUt+
	 EoemyaRxMtL+BR+Wq8yVQLLWchH/AqC+ULNK79Ub5SEgMQDvWO4BYsLG3r9cWqzU3pc2P
	 H//tau0Evqig9YEpcfllxtd0/kNmsp5X0ZOEHzf041/ITs4Fbakq3bvz8RNsvX7HRWdMZ
	 M06w+EkL8Nb84IB5vdMwMPYvugNAzoaNZouTkE7Edsq0FKKj+Ykw7dAApNH8tcSyPkPdw
	 n5uV8S4cVihQlhV5cJe63nUL01dhnfiPjtr9mrDJ5fUsViH+7zThTEiI31j7fWjYk7g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538975;
	bh=3t+5EBdN4wFg2t9lbcuMdcNYGuIYJwux5YVQyB48+H4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cb3WrWYOOQZrOggRgv7beJM4pLpp7rx4KzGp14yaZK+IdzBcYPcZmiXMMzV9cilBg
	 7tb5Tlt7Zz+bbPzGf8dDrPY6n/gbCV3SU6IfRdsBvJdbUnpaVg83AIYgyApLjz+Ghj
	 1qDQu3ks1kYkrMlwcin2d6mwrzO/OEx2NwUJoJ3ILtjJxOrCJGd+pYOjmSZ6p7arlO
	 bjSw5/LofiC8nY7P5H6v6giX2A0ZtlKWANWPXcalr+QVROaOZipHUZac/Wp3dmbn3g
	 GygdXOBMjrhA7me+IIKAOO3QxXVBw7aH4Yj56AguViGzae+7vCHUo8uIwfuZKMteTJ
	 KbmCLHkq37Gvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB69240BFB;
	Fri,  4 Sep 2026 16:22:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C35CAB2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9EF960681
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yefJJjuFq4va for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 844286069C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538928;
 b=GCv/Ivh/U+Ak4JcDZ1sH4VEv8bW/a83SFNne2HK2S7zMd86PeWVecPoa16MmtUIu9U00
 bc7gF2xsrenLZsWJtB4uybxUiKO2F9rIyMgc4K7SKUAr3suL4gYusC/g3auatz3LF7MPo
 KMiGNpdfvY1cJZjDO9TLIoWFqrQMm+H6IiTiFrjjQhdWOsf70eNAdmZXdAhh5IWIYF5Xc
 5hqrSnMXpN5OeggkcY37LcqAtmBzwNadQ+ZwFL8hStKym1K6ovPiwkiefda/wGRludbdF
 p8ZY45AvRqH+i/BKKZbrQ4qoUno/9d+jrB6j5+m3itCDfybbFR7TjRJTLaxUug9xggA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538928;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=U1xz4l8MmCgARS1ppsAJoFZwh8NU65YO/teohKX/nyw=;
 b=Zz0qKJNS82SDZ2SoXKd/KrNaYzOxechw2IgExtrBnLEmFXiLXZdIdK65fVbmunHfqtRi
 RlAxXd6KZuIn/iV2AEkqHbHOBEGzHtfQ2GEK+QhtYkx30pdbnPv+LahLo8L81jvt+MI3d
 3+gGKeW/KxyO/bUFIEfgIqnt2fl101f+4OoNyeR/Zl2m79aYg6X+9F6qlfUJLOWSVsgU2
 nQ4Bj7EJgmcXcILF0wUKBOB1eazI2xMF3hpFnN+/NR9UhDuC0Q9MTYNDcqVJQUlLtopqb
 gMQEd2b5SlcHAam3p4veO3PV7V39hAJzcp0fZ70r2OOecSEzmkE8P96RmQcWIU2QCSQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 844286069C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D772194C87; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 18:17:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 91a2916a97a2aa29f98dcdbb4bec19382636dee7
X-Git-Newrev: db652bbabaa710f2f917b204065d33858a57023c
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.D772194C87@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2026.11 cycle
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db652bbabaa710f2f917b204065d33858a57023c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 36fbd7b3e7..490f1d419d 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2026.08
+export BR2_VERSION := 2026.11-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1788535000
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
