Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913FA1125832
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 425BE422DD;
	Wed, 11 Mar 2026 14:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5dMMNnOqtyo; Wed, 11 Mar 2026 14:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DE4D422D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773237904;
	bh=P4th6z+0tPe7tJQk6El6A/K96M4prbBTE8QdbDtcF7M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=obdYc8Iwh1pjWnIXTbY+aS+4mAiOd382mDV4XfPC7fORx1nu88kJv95qurZHvm26P
	 iUX/8kHGpV2R/2uM/LOslz7Q1LOJXTbhyYao5mD7mpDF5ed9UypvWm4pSAm0wh2UVw
	 KOt7wgEL6fph59JdSc0OzdUZT9J3CzwsNLXU4yDI19/b1CVSoig/a6uXdIgKxc4jFw
	 L5RUD84SKEGUBpiGTHrF3/sKSm9tr0vKAi/x4+LRRxawjuDQZWLhW4wPf51EUB5L9s
	 BlipM6cxqrd4im1ADi907ZPQPV8O2BPWh1A8ucherbE8DmfurHGr7AOwDzJlkiRNGl
	 FUvgWPB6+s7aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE4D422D5;
	Wed, 11 Mar 2026 14:05:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 600B733A
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45A5B40B3E
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTly_1enLxt2 for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 14:05:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 654B840396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 654B840396
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 654B840396
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 14:05:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-439ac15f35fso10596104f8f.0
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 07:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773237899; x=1773842699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZCLW+H/lyhf1lNoIJGoRNDj+TtmLTv31YkovE9IxSc=;
 b=km1N+KjafaMUS5fLIvhZuKwVZVdDZQfSScn+cUEw4DhdqOIbZOHlXLlb45z5IfJMKi
 1SEtuqutPssFE1EwcN0g5vAq2UIZgM0hm7qCdhLuPKpxnTTZXhQ69z9sleltr99x9rZf
 IJQ/G/EiOgGzo3AEcX4tIs2CDGuYgxK2PmXczHFV1BtES+DIqROKpALcPdyw0g5CwnLF
 ZKxUnTAIqE1c/jzY/lNqVpgSuajCh/fZZOKMg75s8ll8zm2nvKw3hy3CweNbwLGo8YPr
 Xq0gsMaBoS3+J2aBBkrlabmV1x9X0Oxgqt4LLN1va0yMxuLZJDlyCjjLfS2jvVKJ0DgO
 p6xw==
X-Gm-Message-State: AOJu0Yx77vNg9UfAuxhBI5vmCC4irSDbNR/j9UAosgAqxoT8xoiW2uI0
 jk5PdQegfAWIGCfAShR8B3j4ebFgl2O0gMTOkCAAOs09ipjTSGdcDW+qnxPmFwCxa4bI014Qqmt
 x+pTm
X-Gm-Gg: ATEYQzxc8iSH/3c4iuSRo7jKYgbxlUIBEk9P7Jy0vVvycQbnsM+JaRTipiEEZtQUngk
 2rRG8OKvyez8WbDWZZ6mkxfk/SxqOlSRuN+BDsnswjUwPOseDDIuqG2wf6p7Fg9yaaoa+3myvYv
 97i7u9xo+kcQ0EyroVM7kRPGQx9QGAqvmVcfR6rDYtgIxpzjBsuQgGJr3p54f5u47y+cjB+usJg
 QtqRgeh6q2GixSYQkPY26SlDufJJeU6OLf4+pcVNydvdPpIvmVM7YMKwCPQNPIBrBfDfMWX9L3d
 VaxbVCPbw2U1me4d3o0hSrOOmWhPZ9AF1HGnvbFYHcP9RQ/7MpFv3XWq89JgZpEZkRB7Eno8VwA
 PSjnH/he0vqJ7Yc7pth6OAzIhX2Bn6b4/Pd5XwxYI0xQPx/2eMbqS7l++SBPMb4RqyafFfZ7plq
 WsdPD9RtEPIan6/pw=
X-Received: by 2002:a05:6000:1acf:b0:439:b440:b8a2 with SMTP id
 ffacd0b85a97d-439f8430c20mr4988180f8f.28.1773237898725; 
 Wed, 11 Mar 2026 07:04:58 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f81f19dbsm7657610f8f.22.2026.03.11.07.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 07:04:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Wed, 11 Mar 2026 15:04:49 +0100
Message-ID: <20260311140457.140041-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773237899; x=1773842699; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sZCLW+H/lyhf1lNoIJGoRNDj+TtmLTv31YkovE9IxSc=;
 b=T1oNyYHf8fIG0uDXeVfUW3uKGZzXDemZW5Jsxc6P7T7YzjMuZwoEjfshtyiZzsnYgc
 iMXxFwE24R7mSkvpFhJuVprU/Iw3rlfUMP3OY0h85qLQAERJdkDfTnkDdvnF9jsPoNMn
 rr3Iy94Ryq2JfbIOv3rbZQc/vV6Mi2xHcR0HImrcfQwPNpCehF0Dc9mnv5wucE31aGlZ
 N/Ozy2GmV4PGOjHSIw7YQ9firkhufHID4V7ye+QATZ2zsBNMot+u3QelLaiDAjmep0wr
 hABN5uIbgQXobKsDCCc0jInkGCGf/aaGcHew00WVBEo3XW6N2/yFIxypdu1QQwR9GBkv
 vYRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=T1oNyYHf
Subject: [Buildroot] [PATCH v5 0/8] Support CycloneDX v1.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v3 --> v4: adds the two last commits
v4 --> v5: fix the v1.7 comparison using a tuple

Thomas Perale (8):
  utils/generate-cyclonedx: use tuple for version
  utils/generate-cyclonedx: move license download in a function
  utils/generate-cyclonedx: move utility function
  utils/generate-cyclonedx: encapsulate CycloneDX generation functions
  utils/generate-cyclonedx: optional bump to v1.7
  utils/generate-cyclonedx: mark host packages as external
  utils/generate-cyclonedx: add 'id' property to resolves
  utils/generate-cyclonedx: split vulnerabilities per state

 utils/generate-cyclonedx | 630 ++++++++++++++++++++++-----------------
 1 file changed, 355 insertions(+), 275 deletions(-)

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
