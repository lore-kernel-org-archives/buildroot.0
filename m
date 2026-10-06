Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9495ECA5FFF
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0E3440769;
	Tue,  6 Oct 2026 19:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4fsZJ-_qE6P; Tue,  6 Oct 2026 19:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CCF1740770
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791314077;
	b=kSIGosK4hK3qOH7DNuVbE/ATSBQNY9K6460/XTrxLgUvRF6uUBFfkeirTnQH5RzUbKAE
	 D/pb8aNww8CAZub7DB5iblQZT5r6Bvr+1mryo5SxjDkp8lgAeVLMpS2teVAEKRMXHZtXk
	 cmRYA1Ogn5qavdwXAbVpX5DpDysnmQpFQA/z0wNiexh+mSPt6PJaM72ekTKsDGhkMKmxr
	 rfhLoXgA4vuldyEhufteesMz8yHeEvkfdBwSGxJMFgh5mQh2Q+FxWlxPpaU5k0G9ysKOE
	 cQTDftpTsKHwi1eq/hDGRM491UQxCU7pLWM5ZSt/wld0lVM9k3zQbNdZWB7wCMQ7HQw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791314077;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=koeosSdBGAX5MftQGw/aHwMcYAsfTQ2ZW1CUtFEQJ/I=;
	b=XZxjkoomBrRoq/QGtfr8rJV17dK+bEUm92PkpocXLcMHVAhCveO755mkCnyU49W65NaQ
	 6thBNfUWUwg6E6tOmZ+Gz1evX2DsO6A/3e1LxqRKVKHQD8WT0myWfqoO+RCQB52O5fz8y
	 Se/4ql+2w4e9yOacdNC/hKjyRiAxm3umAq6GpguA5mBhIpdtQF2J9RhN40sYQBZkIZQ0U
	 pkJySpJxXOgY4E7VJr2BlOWrnm9p9XM3YWxGL9kQe146SLPWOluhoEOD1EXFTSU0yJabK
	 IoD0pAnAersv2dU+kE09+ScngH3ye6EA6MmY8z6D7GI4ZALAAMMZCFWYHPixFHJu1Ow==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791314077;
	bh=koeosSdBGAX5MftQGw/aHwMcYAsfTQ2ZW1CUtFEQJ/I=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZMQq6cfK7E/ge3dc/+7xOkVeeypBkEcAOdPDgIffBY30G3tbnk+7gxWPmszQuG1RR
	 +XkoNhuF9HFcXdmM2XZbRzAY9GOQx50zbxRrGJ1UVyX4QHVBa27yLl9/GzFQe1nVL9
	 8XpzPObZaYCg52iXG06+PiwuadQYJ4v6JzXW1SCRMYCkloyH7uvhEHMJgxw41U0ed1
	 8LMT+mdOCP1VBUunjhscYK2PO4sG2lx33R4XoPp0OPnGOfrqCvBX+y/ly2KxOknTUR
	 oExw5ez+5mHn3p8zHlmFbtzHcQ4ybZwm1A6MYiOJlAK8XEtr6ewf7bFZ5OAdXaqKLW
	 zUOn9wwz+975Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCF1740770;
	Tue,  6 Oct 2026 19:14:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 688152AA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59A12402E5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7EHklCghHO1 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 19:04:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 13110402D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791313440;
 b=U7EykHxSfaiNEr4BYfJizli56f18FgkpgrcezT5IRncmVLkJcJqqQdVyTVb8f0+k1vLa
 nrU910mNXWB+U+1PNu9wfU+6ihrKJbbnzw7KOwsq3xpbnvJ69duOLq2w7BDl3m1ntMWoi
 ohexdQb9PqGfHDpLgPIVgGUikIUvvsjm9gnFj3rsixV4g3jpNTj9k907DxL2NRgSEyNuS
 uDxHyqIrbOqLn2Dh03pLsWHEcWgiubJBAoS4rujn4TVKkNjR+muQGufD0oS5OGK5tceUF
 MoHL1i/CeXyJwWN1E8gFQO5VWKH0jruuFCgWG5SZJim8Xg4IyrlpIVr0ZZ8wf1e/4lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791313440;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=te1XVpBHGoe5AoRlJelMQKEVJ6M4sfhyz+c4CUZo9KU=;
 b=H/cJzctiNT8LlmVIQOcg5trNncc0JPrYF9glOPHiL8FEm/YzEhJQN+2V4+wUU+JYVXXH
 OJ3K4RdKKxpB2+0Coiyvn2F43e48n2RVKWLakVzZmFJl/QKpGcUAOubkBYQwuSYXym8gZ
 QCYwK3eHl6eEt2tpeobD/raQ/yx+CDbLYTffCen7OPLR6Pw1Z4r5YZfOdyHcl0PkXLkUx
 cQf6nXEewWAueQE6Q2JdM5RS38oGKhCm4h3RZaWxzu2n7Q0ugi4qs4WrN2hSjVs438Nh3
 3fzeE3ihhkI0jbP6eErqf/YS3XTdShjDS3iv5D8m4NYopmNZiddNhEpYPAIi0NvUVCw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Sf2JXOdD; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13110402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 19:03:59 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a16c1608faso13205415e9.0
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 12:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791313437; x=1791918237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=te1XVpBHGoe5AoRlJelMQKEVJ6M4sfhyz+c4CUZo9KU=;
 b=Dzki5UGG0BmoohOwqddLPc1jYTfchUlL53zBW1+SSrYB0Sb9xuplD18H5M6OIzTb4J
 crcrV9nBx7W6nDYQqtlzIkRYG1Dz8TUT+QnCqZk0KA7QFoIrwbLaOmXG9xSDTok7PVAF
 4S+xvXblKt2UfA0jj8uZvUqhLCRLWySGF7tV7FO+cTVe9fUouhli0MoS/OA6dkg4w7ha
 8V0UXUI2erd1WhIZBoPWc1LvGsp7/wwJ+j1EUkZO6KtNxpDw3PaEVxq3raPB5r5J3qAV
 8kNkIc+QwVsfSlfVfO61nGZChjtQ+PvIsZVGxvYRutLvktvHKzqPEj1u22eLFFAlV8da
 Z8sg==
X-Gm-Message-State: AFuF++n+T1JYBwdd7+k6WMd4C3rBeBkJ4FL1bQ2a22q790ZR4Xi0r9ns
 HzB3A12aVVS+hLd47IO2FODLK7tXeVIJynBomGtRBXNt6cYbsChJaRRwLRz7i0fVgD82ug3Defk
 1OkrCpdY=
X-Gm-Gg: AYBFou3WejBPvu5hhGn4d3fyx9lYhTnmNA6M3BhxB6J4ztNlgTYY6eoGopi6zGuctvb
 21o0BR+rM20DxBFRvFDLFc2QKKpiAHofgbMZ62g/U6fY2jop2c9S/wk9CG505FAVjklL7KdLFpv
 /aTWtA+dqPw/0PrzTU1wGF0ye0apsB6zlvRA0CgfsFLiTsTaxhRcx9A/98IJ1bNKeEplD8EchBU
 leifXPzOK99hOtWnUVBWvdpN/QGAuCpt0hDyzbjlQZeXVdkk1MiB91hG+LqfA9BDiIZeZuUqAz4
 tddfKEeA5da4OVBM+7+JgDS771IsPYTIoGNwbzIO60iXGKMldXXJSmsJNiQjSmbZ9OqBAxYMsHL
 xPUDb1Jp0PG8iYZsrE3BiTuHEgs80DTLVENHsDdGCPxAYFmjASl+xRRC1ysNF8OkGj55oorjD0D
 XThJubh2jUTEfHgfRbD22R1zEcg7q1qgbqoWV5vqPVeGWkKtdEFcXPp0Ka8RaJICCr6JBvhxCuP
 iCKUwc3NXzFJVBFdQ2UXLSddwG6slugWpXlhrWtjLwTyIDzBOguLiK3
X-Received: by 2002:a05:600c:8b38:b0:4a1:7a1e:6910 with SMTP id
 5b1f17b1804b1-4a17b533d06mr43015575e9.4.1791313437577; 
 Tue, 06 Oct 2026 12:03:57 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-6134-ce7a-f873-1485.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:6134:ce7a:f873:1485])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f493761sm12343065e9.2.2026.10.06.12.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 12:03:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue,  6 Oct 2026 21:03:56 +0200
Message-ID: <20261006190356.176112-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wolfssl: security bump to v5.9.4
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

See the release note:

- https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable

This fixes the following vulnerabilities:

- CVE-2026-15442: https://www.cve.org/CVERecord?id=CVE-2026-15442
- CVE-2026-89102: https://www.cve.org/CVERecord?id=CVE-2026-89102
- CVE-2026-89133: https://www.cve.org/CVERecord?id=CVE-2026-89133
- CVE-2026-89134: https://www.cve.org/CVERecord?id=CVE-2026-89134
- CVE-2026-89135: https://www.cve.org/CVERecord?id=CVE-2026-89135
- CVE-2026-89136: https://www.cve.org/CVERecord?id=CVE-2026-89136
- CVE-2026-93302: https://www.cve.org/CVERecord?id=CVE-2026-93302
- CVE-2026-93304: https://www.cve.org/CVERecord?id=CVE-2026-93304
- CVE-2026-94417: https://www.cve.org/CVERecord?id=CVE-2026-94417
- CVE-2026-94418: https://www.cve.org/CVERecord?id=CVE-2026-94418
- CVE-2026-94419: https://www.cve.org/CVERecord?id=CVE-2026-94419

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index c259734875..23f90dc197 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
+sha256  7256bfc89b183a75183806c7debfa203443873b0b4a562e1b80d68e01b45ac57  wolfssl-5.9.4.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 779fd2cabf..20244c4e83 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.9.2
+WOLFSSL_VERSION = 5.9.4
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
