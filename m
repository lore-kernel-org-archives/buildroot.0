Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62424C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 20:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F37613F2;
	Thu, 10 Jul 2025 20:23:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAH1EsnDVvWb; Thu, 10 Jul 2025 20:23:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E059A610BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E059A610BB;
	Thu, 10 Jul 2025 20:23:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BD80114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D9F540111;
 Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDAevkF8Z4iJ; Thu, 10 Jul 2025 20:23:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D22D040B3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D22D040B3D
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D22D040B3D
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 20:23:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a510432236so1080019f8f.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 13:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752178984; x=1752783784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SPy6LB0MflvC2ASM81Vywr80QqA3/xACWJ7P1UYOHTs=;
 b=vPbkqCOYFf/xtjj3YiVzj2KmVwMKXoNYXxuEXF7skOYifR/3pt2CtmDrHTlvWB5/sa
 QIZIfdqS6fFo5YL/7zzjpaOY7oejutGeLcg9RehuKywdCoQ+mWnplUIaL0UkvOWVKXQP
 a9J8w9NkQCq3AhXJxvb2sdVFnb5kJ9O8s8xF9XlGHt1GjAYD87UA1HTa+1/B2P0QDwE2
 Bjh3BVeQ8k1tUqv7OW2Ud0iwjoQov1aP+BK7NWq14oK2zrvjUOkIO/uhv6HMeYrNQxz5
 LXOZji5ACJVqyfTuyvcKHyoitWKL+KRYYftUpM6Gs0/8MlWK6XmMOaEUjlQEx0JexO8W
 4h2A==
X-Gm-Message-State: AOJu0YwUA70VGlioZvUdiugVu70hCezrlOWNDGAkB0DmjJOcTyrlgLYc
 +hGHMTIFh74c1+qNrEz7j0Ylvdb3ZWn1HPZi6CQz2E/jxmZhEWgsq94QabT8GQ==
X-Gm-Gg: ASbGncvfMHnW7s0naqdnO6F536pm2Z7u7Xb6N6u+X7d1KXW2b1I7PBahAhdpoDsrq7J
 T0ss2Duf60ajx1EcwdBOAr0K7RMa7H8gGp6DQVhMgBy0jYH0FKHTtGbL2ujSAyal2ADhm9onlph
 kjoRxqFr3uKrO/6Qt0z5AG21jRi65YNRMu17cOddSgmApJuz42SKBz2TryYdt7hzLT8oBXsapkF
 qVP0/JVJpnrMvD6e39aKz7j5V0CtP18lOmDxD4IkEaCIRmacZen35CWTVbDRC4pFfd3UNsbzzmz
 oM9nPxVvImhYo/v+OKU2t5T7XvMDVrglKhC1V94bj0T2R/Q10VEuNRwcwt8Og0u/z9rfaTSs
X-Google-Smtp-Source: AGHT+IH4K18rYix/bvWgSl+mraXpcDI3NM6Ngxa1HquNDPgSyXXw+Nbo+zvdcPdFh2Rj3MIBshyApw==
X-Received: by 2002:a05:6000:2085:b0:3a4:e667:922e with SMTP id
 ffacd0b85a97d-3b5f2dacddamr95268f8f.4.1752178983746; 
 Thu, 10 Jul 2025 13:23:03 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8bd1997sm2742694f8f.10.2025.07.10.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 13:23:03 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 10 Jul 2025 22:22:48 +0200
Message-ID: <d82f2e940656bae7ba1a4680d0ec978d5c69369e.1752178975.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752178975.git.yann.morin.1998@free.fr>
References: <cover.1752178975.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752178984; x=1752783784; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SPy6LB0MflvC2ASM81Vywr80QqA3/xACWJ7P1UYOHTs=;
 b=RcG5OzQi4f0rFN7BfFMraTabJHb5OBYetDE+4XiTiSGP0nDcUEVZK3RlOdptDyu+Qk
 R1umd2ckymp2jV+NEaHjS6klq7y30aRyAjnYVTMvFh9QLSel0TIvbsyqDz8Xge2jtdWu
 5A0r76U5zvGudY+dqzR/e3+kefp7TR/b7/JLrh5BjXcThKNSK1Td+p0C+Tw3OemH7p/j
 yPFek/o9LVk9nM9ezaRRiuo4KmygTQqv08XKMzcNktDCK14/B3v8OO9yVUWLfsPWkVHL
 qD1d34PqAJtSQOfQW42qu7lwVVK5darUFsrkaA3OLAGKD5ksKtXhkWqScZbxCaWyNGRX
 hd0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RcG5OzQi
Subject: [Buildroot] [PATCH 06/17 v2] support/scripts: also exit in error on
 improperly merged-usr
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-merged-usr.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index ac676185dd..6d31c81c21 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -14,6 +14,9 @@
 #   $1:     the root directory (skeleton, overlay) to check
 # Output:
 #   stdout: the list of non-compliant paths (empty if compliant).
+# Exit code:
+#   0:      in case of success (stdout will be empty)
+#   !0:     if any path is improperly merged
 #
 
 # The directory to check for merged-usr
@@ -45,9 +48,13 @@ test_merged() {
 
 	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
 		printf '%s\n' "${dir1}"
+		is_success=false
 	fi
 }
 
+is_success=true
 test_merged "${root}" "/lib" "/usr/lib"
 test_merged "${root}" "/bin" "/usr/bin"
 test_merged "${root}" "/sbin" "/usr/sbin"
+
+${is_success}
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
