Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9658ECC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E70280D60;
	Tue, 13 Oct 2026 16:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqGrHTWrv9uZ; Tue, 13 Oct 2026 16:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7222080C9F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909793;
	b=QgXgZdQdXzYCS5unyZnwTpnprYkUX5U3a8GolcQ7xc95y+Dxx07SZEz8bBTOezKCo4PE
	 X8LKpj8qn1bj+lvlfjKCdxrxd0D2h0rrZVVIVgxK4vDkj8ftnusEIyakwgI489R55xllM
	 EZkTfj9iKajqBntsjcZ5ONk4xVgtOT8kqAZEGomF5rnzUObrAWJ6TLGZ4L6C6pQ29ZswF
	 J4PWHiTfLZTaaxMzTrOOXsYj3xc4wPTLB2lkzZxb3FQCRufvR2I04eyyFGVNbnd4YMeT6
	 QJhcDwjYOR7VMOOp0D7qApGqTzld6yuRMHlXo9OSS6D+sieNKhVlFJ8qckTvtlvlAiw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909793;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2MPUy9QPrQvcqErA6AcI7r/xv0rvkynMP0fiopF++K4=;
	b=V/Uqi7ymwTKo/+Bkeid30e0b+3VdrDwfK4TqPPr8c1NjJP/E0J4QB0iKlrbfQ515kSuG
	 PHPbaP5Ci2190JWulAWf0q8BAOU3St+Y5Q3X72wkBH/Vk/krcFI6WiLd6Hg9OIYrfP9x7
	 AVHi+CzH/2gMvpyxlVYptPY5k+Yp5B5RQ7TXMg7kTUKgu+t3/xl3XUrWTvy+F8emvJWLR
	 LLt2MxrHCInjdNZgGVcbD94K7en4YKWxEHb0HRfLH2OSaeqvwGCKuRAZGoFFCriXYujI7
	 +8nydbTDj2dxelu2jOV7hGjE1Cu7RdmUHoYFnvUDVk8+wFlIGOWKnb2kfsGijEguZ6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909793;
	bh=2MPUy9QPrQvcqErA6AcI7r/xv0rvkynMP0fiopF++K4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=r8Cul36NmR2AnPGfjsyWwF7jgJdYni3iNtbQgbRxjVVZBLc3S5E6+scW2zKslHRNR
	 RhU9rzPLcAbfurTktXXoDlooxROgG/2sqCzx+2tFCPa6bH5U3ybF3ixbyGR0PtSeQI
	 dWwAm8LOo3f8TgV4ekKYwJrrJewx2j96ftwlflvnwX/U/ggf88RwnrJxCIXAVhDLxP
	 P1TsJJhuOZZSezjAOTXOmU2WNuSTjQumnTpzHTO7l/EwG7Bx23VOoKyStd8BiDH1I5
	 BtgLStyJzh26wsw+1iAvJgv42y24luFPDK5gFrTIG4Ts8DPISNZFJvGZdVGZuB7A9N
	 a9NfV2NjMjI5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7222080C9F;
	Tue, 13 Oct 2026 16:43:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4300D1DE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40E334007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mhC9uYfmnW6 for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6091B4009D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909786;
 b=qHIjRG2TfjA5QBKssD2EcCWoWUmO5QqdyO0NmuTo6X3RiD1LXrwIof+txsVUBjLROvrW
 h3SzX1w4hMDx5JkhfeuoOmmiXG9y5NlJVCjRnBFTZVRR7Uz1p/Sj1LNHapnMavH7kzy0F
 /YUxAAwaDH5rozCxiquwTH21lDZKxOm2CtqJyszJnbCKs8eVx1ssr94bCBUP1b0NZAWHS
 HwXMt8W0UeydkCifvBrkap9yXibff49GvK/+DzAyM9yRxkCf3AaWpoDkvulBifH9WwbZm
 O8v2NMqLQ31AyBIW54cKKKTFhOPl7Xt6yJUT6YidkOsRgIyobuSTUWiXfY5HXTx1Khw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909786;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HiFl1ozCx1hirSJSS941x4kjOK3zjwSFY6+MtT/SHkk=;
 b=LdXa7CUgIOEL5XZzReKdziBkmMIP3JUSuGe0TSdFSgtTLIR4Ll9W9sFbQPAhVG2spv3w
 BZ1PvXlRCn95ytVRoxfMwcwFysNnMbs++7tiPFvsv9DG9paoMXam6M+MjvJEfKdL05cGt
 AscFh84fRXjjjNjZYxrtdBcVMX3cpIOExOHE+RlPYflKdXTZmmKotQN/DGwxUnfbiWqNb
 +QANJri/Smyc1k7Mo8q1PpSnmxpZpjF+YvCk5EdnYV8++UieGBg24r348Dr29C2kO2TMe
 Y8t8OVpiMSLl+ogAl07StVPZEWtWQCxWFsMjSkZMRR3FSu8Sx4cTzg9TrKEcMuGVvCg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=o5umS3Nu; 
 arc=none smtp.remote-ip="2001:4860:4864:20::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=o5umS3Nu
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6091B4009D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:06 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-483d290f398so1928523fac.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909785; x=1792514585; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HiFl1ozCx1hirSJSS941x4kjOK3zjwSFY6+MtT/SHkk=;
 b=o5umS3NuietjDbGoO30K42yXmq7agFlATxewJybJ5DnziefUDRa+APMBxcqoJ35dKD
 CscDZA2h4Viv3qoMqrKi3kYuIq10k0npQTwtY9o0tU0hxRL8+JWaWB3G4IZfJbx2X9Fu
 5oFYukF13XK0CDB97od4/ho6cBGZ0/OXYF7EjEczCSrbbLtxBikxjhIdQPoN1yFJhYvW
 vM2vCFH84ymFzFQjHlMjIUcN4lQEKjfHWd6FVV5SCrZnfarnayYE1HkVSVxLpXPtZn6X
 AUDcGTv0VmmpWNQjF2eCjPJJ5fYcxlPa4Cu4prCeigLdMA+zrTb6+hD6Rs9qFfTJsEL7
 bxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909785; x=1792514585;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HiFl1ozCx1hirSJSS941x4kjOK3zjwSFY6+MtT/SHkk=;
 b=Hi1zBxHu4HK2uVW3MwF5KRxs9k7Fr4T+Tzvonjdxsv4DP1Idg8DwrHx3Yo1olbhiNs
 WxPk1yLraFGGpGQp7p7KgcA25/vVSoXr8JPrPtQ181eMSmMJq2Hk3BUyHwwTqY3I4+wi
 9Vvh0J6VhDBIcK/DvM4L60TbZi7wkWinFnF5N6GGxrObjinaQlxR6xeo0BbCq5vpVzj2
 TpWGTxPpDJr/IA+0Ge4KNJJaDK9wlxxMk+rdaGkPRMMQorr1aiVp49XNMBWTz9jMzV4G
 05Mr6KYnSp/YQ+OgQutLoMiedZu/XcF4zW3DzbgZB8lyGfY1yO2omKWwQe7PL0GmUDIs
 izEA==
X-Gm-Message-State: AFq9FYIrPQF1sJNKlaQ5vBzZ6uUEsX7Z/YSUCD++eQGdOdz3wmqQIhI/
 P5CT98G0n6nvPkz8R3qR+KbDKCQgofbg1nNkioQ0gXtswguVE1js3VLKCqCuOg==
X-Gm-Gg: AYBFou2o5f59aE9kS7KCwC3DdcfmfhPwjD39tdC9FbbhAtOdvICnG7Ma3oMXpLrwy71
 TDkljllIJsntMZB37w4QBXhwtczZWDIOdaxMP+p1kn5zddFU7ZfvOVp6AYXRc0DFoRrVpTwGswZ
 Pbe01M7VvXaWRXxsn0MgX9nuSiVkFObOrD7IZSCDqFnApErr2I/eJl7l7sSSWOqMuauOMJ/XUtY
 ueta2WoXUXFQg/58Wz8HKlnrixnvoeVxI+ang2wcuFpMC092Jd57zCXOarv5Xl+l1tUg3MCtTH0
 bgtu1jutMKr7tc487RXxtsjU3W7SQtod8yng3guBeeMtbXZYMd4mnx2UhLlTF1vKBPoZjLgLmSf
 NyQA3XxEW3a6JW5ySOEJzJgRy8cFZLz+k2xLtavFKL2p3au9cc6kUAydP020rYIIbmxfQ1AMkfb
 ybOEUrotURdb+QCRq/pRnV330zb0ejCbLIVpyYHT5RfmSR36Xa/Xcp4WRs74pwCsn0QsLyfi8Qw
 dAZrtfrkex4IE79/QKfnGeBoKwWZYTidP7EgGMGmafNUAOd46g4MyX3TzS5GIwvZbFvvoawwoNz
 cDYCStVHUA8kYNLm/MC8gZWlPFoakgegW1hDoYC/Yx40tt4FzrElAfqhXeJ0TZ+/8IR1pnfjJ1t
 5H5XkjwiOs+5JtljiTjfSjyMu1Jd1/KJ9M61bJul/75tH7ETBXVxW7w==
X-Received: by 2002:a05:6870:a0aa:b0:493:8967:86c2 with SMTP id
 586e51a60fabf-4a2a88127cemr11738045fac.16.1791909785067; 
 Tue, 13 Oct 2026 09:43:05 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:53 -0600
Message-ID: <20261013164254.1476592-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cssselect: bump to version 1.6.0
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
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index e373b88d57..eb0ab6c8b6 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  465a7b6af9ea95fdefe5357301589b9c  cssselect-1.5.0.tar.gz
-sha256  3cbe82dd7acbee9ba9e5723b5f9e4749826912f1fb31cd7f92aabed5fde15b15  cssselect-1.5.0.tar.gz
+md5  49c5cb824fa52120931154f7a24bc904  cssselect-1.6.0.tar.gz
+sha256  8c83a7139e97b93aa5ebdc0f46e785f7056a08a8bf201e597a6a2629d7eb11db  cssselect-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 283a00947f..4fc9bbd1ce 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.5.0
+PYTHON_CSSSELECT_VERSION = 1.6.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/8e/5a/6d6fcf922709391fac986f0a03ad4546f4f45b94d10aeb6c1ee041599993
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/c8/8b/dc32df939ab541fca6ee8964d26aa231dbe231cdc2b2713228161441ba9c
 PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
