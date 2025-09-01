Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54F4CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B51F4152C;
	Mon,  1 Sep 2025 09:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnBVM5vFiNFo; Mon,  1 Sep 2025 09:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 932C4414C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 932C4414C7;
	Mon,  1 Sep 2025 09:01:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0816D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94B4D83C48;
 Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w1uSJLlx2Y6j; Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BA7E83C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BA7E83C44
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BA7E83C44
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45b7c01a8c1so32215855e9.2
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717291; x=1757322091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=trIlvKzUrf4xuBtp7xA4GGLzQPebQZkYuHs1hEEFzuQ=;
 b=EEarqcHOe/lJ9kaDwvBTJXZVVX9Mo19uUPeB2l4c26V8/VhaBGnDKDcxOeykbfjRex
 8QzmCCtirZ2RfdmPQPF0UCGf5+SawQpBr4s0M2ZVGyHA1AIxdtQlg0R6sotG3G+plo2h
 gBYkKETAuxrbFRTHIhyBYcpMi8myzK8TuhAHv3AQKN9OSTKkUdQSNJgxR5hcrtSYCEhx
 M0A4z41sYvvbXwype3hVCQIHG60GVa+wNSxl9csWAwqoILTKjnidQ+0ZPdwOEcSDW9DZ
 DU1PbreNQZhy6HKmpRmhAF1ARICV0E9x+Riv9/UE4Qa9UtdyuniQpOaIOPlq+jhV0Xgy
 HllA==
X-Gm-Message-State: AOJu0YzOBSzMFiDyPFx6bYoJbHz2JOFbDoo9tiJS65YkifaYEWjk3jyb
 tA1Er2kXUQcX1WSurMxIpbUzjnZO2ywEkReHmVYTcuY6f1J6OQQL1vyW5sO8ug==
X-Gm-Gg: ASbGncsZpIe/sQk6OVacYWqr/Xg/0XTRYLVPm8S/u+xX7AR2k/xYP+0bRS3A4Pp6FE5
 wKyW3BZTYrk5ttby89p+WRCgKDgMZjyjunuSerIK0qOd9SS9iSTpiJl+mFO272EMV8pvuT8JG4Z
 nRaBp3JmubtGEJpn5/o85tso9GvTtep4YC69lnshb/lBsrJ9xYjXXhwpledeLp/jv5JMvb1BjJb
 ROgKPHAUtwYQEASoV10h+tT9T/PVgop8cIwiTciIbW8KkEyniKEQs+V+o5SHRHUFe0sW1zcupfR
 V3yQklp3cK3QRBlxZHrdhNSoCXrookgQN2fGkmK+/RbvZBWiwt+Zjd2JhdfcSf828QExdsiaZiH
 HUAowKxERjuGaAZowut/mzMAwWKchfnuZzXuX0BTswFA=
X-Google-Smtp-Source: AGHT+IGHu5F0MD4UCyd34XN67vFT9FsifweUemmtBLSO049CO0ep/uCD/d8GTZM2bWXQffooiZVs8Q==
X-Received: by 2002:a05:600c:1385:b0:45b:80ff:58f7 with SMTP id
 5b1f17b1804b1-45b855c489fmr52705265e9.36.1756717291123; 
 Mon, 01 Sep 2025 02:01:31 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:15 +0200
Message-ID: <3176077c1de123d7b4d1feaa20470a66373bedbc.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717291; x=1757322091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=trIlvKzUrf4xuBtp7xA4GGLzQPebQZkYuHs1hEEFzuQ=;
 b=ZsOhNpxYBcyMamsJLIyO+JQymrOG72LgHGENx/2w+5qtZTgSzwk6GxpEneE2QPajWh
 VcDy6ur0i1fsBTmGsLqAtFHAc6V7T0Vi42cNtgfunUuXEnx15tzUeBCkDg5cKp/4obiH
 tlYlH9akiaqgIGCcD44Q/X6f6r4JAc4JgHpk5SrSGFa7/iumeDhWWpqQxsELSG8MppLW
 4GOVCYeC3bi08GYUSYr35ltNURdwHo6ZuN6JBOo2+USn8VlpjVkkAXplbo/zhvDlZyTB
 M1+86DZZMvkEUntSeEPn0vZ//sNPIDY8xUoqdVohpUcEVnMxao7oc6AwzB+Z5NSUuEbS
 CScw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZsOhNpxY
Subject: [Buildroot] [PATCH 06/18 v3] support/scripts: also exit in error on
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
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
