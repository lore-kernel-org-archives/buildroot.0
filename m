Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D920ECA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 902F540664;
	Sat, 10 Oct 2026 12:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeHIzc1Ey7pZ; Sat, 10 Oct 2026 12:42:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B50FE405C8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636169;
	b=IAn2ClJVloKQv1D/6Nsfr+vRadIZPO0vYCnGHl2DwnMn/wnIvB2L+gCxCvQdUtWj0Prn
	 odUQNDxl18f7XXo5hEft1fu7aynYQSe3A8SXhe6HMiBLhYqYAzvh7VdNJdKoWeewNCGKh
	 3walfTmDwf+xXFNbnq5Ayi5H3t9RzaUwuQBu5uV8t2U2wWz0oiX69I2q997bGJe9rF6o9
	 7BMgo+rSBnQrbXc5nCIrtRWXZ5OnhR0SBN9hw0bKGjGEYJv8/cXQfIJ2E/m2fN/EbKBdZ
	 EL0TJtCWYk7B3GSLJsf8tsPOJFPdVtz5GpcIMmFncjA4zKOzkkscZbqiyERw+BPNMVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Vh+fLTId0qsjdm4r9XaacN4LY8hhRtvPdUoh9h/1l9M=;
	b=O/36VdiJgyFK9FceFkpItdqqJUbWS4I2OGQ782CpMyZRWFViCi4zw2ABZN7HDIL7Ztdr
	 XmPGNyNP+V+VlwMxr3oxiXbTmfAWxYEIB43pV8KmoN22mBEu2GaJ9IEBbe0cpxodwle/9
	 Sg+gETODwQkj5uwKE9asU5yfsHQ/w0Iz4fwB6Q8MUEgy992zkRZK4/ZGoBKFaNOnV808i
	 nwoNrLbQ+fthG6ApQdjdeVXIujBF3vBzEtHo3nTmlL5h1Tc37Cg2sjQ8rfn+JXsFBk9zf
	 VzZZpW3Db4oQSCek+65bmeasw23cWCepF+J4jYSC9ly5wesiZkQ/Z6uvXvNQeFtcOqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636169;
	bh=Vh+fLTId0qsjdm4r9XaacN4LY8hhRtvPdUoh9h/1l9M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eVnijpEvOKT9j4PXPMjMNiyODREYj7heHByLUGbVwwiShRRCjjF636TSkNVlVkeiG
	 KhpUKkH7ZnOxU+Q8qYkVmpxuyP40dnpb2paUuRulSHfrxEL9YPLfdIvayEI1Pxh6RE
	 rzIxXqc8XOXgWyDLZCWDQxv6tus74Vn0LQ1Xsgy+IdOtC0JOmncqQ3qzPtzinQzE2y
	 ROeN/yWan1zfq6aFgrTSHj3iFaNuGta9/GzFi9XUdzJiSIDptVAuk268TQWJ+w64Py
	 F0mSHDuQHaaThidW30XAC4m65NJINkW4WqhkM50i5AsXKiDeVNmsh8NMNomNQAf3xo
	 1lBho3oQn7ilg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B50FE405C8;
	Sat, 10 Oct 2026 12:42:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A411356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FB8980FAB
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXeYTgCRZ54G for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:42:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F20E80F43
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636167;
 b=YR4ZaWc20bUASG1rXQo6atEdzNpvCxZzOaIWyE/lDzl7JgEqq/lFNAjHA2DZXHpxvndB
 KScem2FXFpbOac3gZG5jePRWFlARFIzcLrJeGjjp8RG6jK5JVyavPNxI9Cr0cZlrLTwGt
 MT8ibG2B878cJCA6eG5Sko9chxtlI0QR92wM/hU/RfU9qCru9sS57y7iXXWZdvkUS3KZh
 f0lLbp9RfH2Kbh1OwqAU4BX5Hus0Dj4JPUbw5ZAl+NFZrOVP1pKeLLhy8JIrlATNYMJgb
 +wS2unm4x7eCKSASVchX2AuhQ+9H7pfS+Pt4YpJuzOXvoqL6TmLrqdUtVlVeu1n5xPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636167;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Last-TLS-Session-Version;
 bh=BYbNg5CcXQQ2/fT/KJSMEmPFIe5MDoSTs3PBt/WYobk=;
 b=MCEZJXLGcdvDSape+O5Cx5WjMDdBbN290WFDHezWpHjbLv17Zgg2Iz51edjVFT3vg5Lo
 6JO/MmIV8n47jUpSxXhRERuQwRpyjz8Ib1WSkYQwLm0val2B62rdjkbOZoNZGFpdMTQdN
 Cb+zPTfZDGyuqZhHWVh88+DONiwhlUAuIJGnZKBu87pq1oWgV4HNpPuJmHgsp76Xz8vON
 1oC7cfcuKoPdquPj+BKaZ7DsT7TeV0rVL3GmIKPkdZzwgBnhxyGrJJIHXCW3rNA74ZDkS
 BbPnc+WonDXcIwIFIb5iscLWDhAfzZDqLhM8QzJAmCXSOZ3MVtaMqPSKVB7LapZhdQQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=gQY5SdCv; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F20E80F43
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:42:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 29929B979F9D; Sat, 10 Oct 2026 14:42:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>
Date: Sat, 10 Oct 2026 14:42:37 +0200
Message-ID: <20261010124237.92754-1-arnout@rnout.be>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] .b4-config: add patchwork configuration
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This allows maintainers to use b4 to update patchwork.

- Use git config --global b4.pw-key <key> to set the patchwork token.
- Use git config b4.thanks-am-template <filename> to point to a template
  for thank-you mails.
- Use b4 shazam -s -k <patchwork URL> to apply a patch and set it to
  "Under Review".
- Use b4 ty -a to prepare (and optionally send with -S) the thank-you
  mail, and update patchwork to "Accepted".

Without pw-key, b4 doesn't touch patchwork at all, so non-maintainers
can safely keep using b4.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .b4-config | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.b4-config b/.b4-config
index d568669864..9fa518d02a 100644
--- a/.b4-config
+++ b/.b4-config
@@ -4,5 +4,9 @@
     send-series-to = buildroot@buildroot.org
     send-auto-cc-cmd = "./utils/get-developers -e -"
     prep-perpatch-check-cmd = "./utils/check-package -q -p -"
+    pw-url = https://patchwork.buildroot.org
+    pw-project = buildroot
+    pw-review-state = under-review
+    pw-accept-state = accepted
 
 # vim: set filetype=gitconfig:
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
