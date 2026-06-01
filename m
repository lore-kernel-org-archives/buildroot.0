Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78E2CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 19:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ADC8606B8;
	Mon,  1 Jun 2026 19:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4XGQbtaQiS0L; Mon,  1 Jun 2026 19:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8D4D606BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780342140;
	bh=VJ8d5zXmveNnWrlV1RgKKBs3p2US5f4aq+FiyiWXDW8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=blmcVkX2CpCQhsro+VAMQLvywFoAoaAqtJ8TeHm9QDQWKYrNgfbaCYRwS/icoSUxP
	 51pLAtCM0PjvRI9UAWvpsWpiPy3NtsDlv/aSr235k3olMgUfQ/ctdTaXHmVs2c8HST
	 qee+7Drpf8jIpvhkY7qg60tMiKMpkm2sdVZr7uDKwD2CK/VOiWhEA5K5PSDRA7+pnt
	 Upfk19TdDeUIO+Tr+th5TOY6V2fNHUXw7KKF9ec1fyoOXYWWmIcACgVzAu/Y7g0JIr
	 tL8/tyi4Af6vbLBqXKeakYZupZLUW1lwAGqH8q9xSFdgBbQmD7zsxz8Qrc/x3ToJOH
	 E1F+ZbcZg8KRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8D4D606BA;
	Mon,  1 Jun 2026 19:29:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 448F4D3
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29B97400F5
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rL4RF0YFNk4w for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 19:28:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74B13400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74B13400D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74B13400D6
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 19:28:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D1B3B97C39F; Mon,  1 Jun 2026 21:28:56 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>
Date: Mon,  1 Jun 2026 21:28:55 +0200
Message-ID: <20260601192855.1901119-1-arnout@rnout.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780342136; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=xVVD9anrm6JDQqZ/eUyNY9tL70VU6xxbWJjwsblBkDY=;
 b=ebSvKFHZn3wWX7YdBMf+298X8JMoCAhcVqNdwoRn7Cdui/Umr20Aw32ITLzCYCZNRxNLeI
 IFSsc5J1iQzvZGbRJlgvzRWOW/rNNJB1U2J25mjxzEElrl10uAyVJN981g4nik0jjBHoV+
 KU2PWLxRAns/c7tmwZJQDmJ1gb1vNjGZLEJ5URYK1B6r2b0Swyyt8woKRbUhSb1ryqALkW
 IDfjCF1OfbFVp+Hzqj7Thf8/syijcuMGnnH5AzkB4123BeRU3H/1UmZ1PI4cqQUCBG1ifn
 WcT8brkjtPvHliNRZvDfGaUe9zLfxJUXOu83m9FsfiK/QKkznGXbzOA6oo6Ghw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ebSvKFHZ
Subject: [Buildroot] [PATCH v--cc=Romain Naour <romain.naour@smile.fr>]
 support/scripts/generate-gitlab-ci-yml: use large runners for defconfigs
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

defconfigs are very unlikely to successfully build on a small runner
because they build a kernel (and often a toolchain). They're also likely
to benefit a lot from the additional parallelism on larger runners.

For now, always build them on large runners. There may be some for which
even the large runners don't have sufficient disk space or memory, but
we'll solve that when it happens.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 2a8c9be5f5..48c272e6f5 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -126,7 +126,7 @@ gen_tests() {
 
     if [ -n "${do_defconfigs}" ]; then
         for cfg in "${defconfigs[@]}"; do
-            printf '%s%s: { extends: .defconfig_%s }\n' \
+            printf '%s%s: { extends: [ .defconfig_%s, .runner-large ] }\n' \
                    "${cfg}" "${defconfigs_ext}" "${do_defconfigs}"
         done
     fi
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
