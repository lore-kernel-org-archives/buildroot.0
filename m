Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B204CC021A0
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8101342844;
	Sat,  8 Feb 2025 14:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBnTpMztv0GH; Sat,  8 Feb 2025 14:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6065C429D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6065C429D9;
	Sat,  8 Feb 2025 14:24:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40CAF1BA
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A511417ED
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5VmkRYQ8N0N for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 501C6417E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 501C6417E4
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 501C6417E4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so29430955e9.3
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024616; x=1739629416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgu/Td2MwB/XCEqBE8KdWhVl78OPZ69ur67eIDdPdbM=;
 b=SmJduVl6L/i9GIitW2894MBXBPesZwxoQfSiNmv0VhOLP2FBv6g9VeVGPCUiR3vZnu
 DyaPtFYL4MjPK4LgRci4r+B3p8nQQALrPR2hOYvBGxNnslOKghU0CFdemrwcQR2nsI2W
 Y8QVTiy3OWH0bOw4kEeV+W96fNm7UjDgtBE3s7ZP81dHaluGUKB33DSYTGJAdkb6XGF2
 arJKa80b7PnTRiHPOxBC5rV3Acm+Vo3aF2Kzsx/2DlhYtehb7JAmU78Diu1/CH8csZkl
 mw8xxSpiz/hX7QyPhfWl40HEu/Wu2mPX8YaMR6hoJux9V9fw6Sd8SHxriZQP6KORwUVr
 +NDA==
X-Gm-Message-State: AOJu0YxQWYndQ/GDDYlhP2DgNyNvvJ2L7dC7BJD53+gTfyFWhSjeYuwd
 nwsf4VVb4PZo1BPu7w8gkxMqO62hu4XoRKnH6YhBOMaTDik5bWKxMb90M8mNzZej2qAfI7fCOH3
 M
X-Gm-Gg: ASbGncs1x5jKkO/Sv5zDrdN1grWRc/jj66B5KKUdRpcHO8qRYhnoGbkGrCJZqBXyvMM
 u/gzpXAjLzplu6eWF/YwqSsciIf0UmiuHrHWA1hHwIdi47D5QEQ1IY9n9LHH/Pt6OPC+Sp39W+3
 VYj/IAphQ7VX9EzPfD8EbwmCC+YtF40NFhA/+dOKYDLQb77Pis6p7q8qr/DcVmZLp/EZWx/UYUi
 gpQNBaXcR0+0DZv/6ltOQ7RjZQYV0Ju+IzRCPTZXzNzMPkW1G6M8KNrshoa+ceMUnvdESoBCToj
 xa3nNrIeJLMiY4gizYObmcHNsW5vmBkNG2KaMoL3qvRVigIAClyeUo/1VtykEmUE6w3vvEpa+fJ
 T1YQDpFLAaqVu
X-Google-Smtp-Source: AGHT+IHlkM3RPsp3vg3DA8IiqmCIg7wRJed7kW6Ap7rC0LvyZegG2ttc6jP9MnoWoAaK+jona3PuuQ==
X-Received: by 2002:a05:600c:3552:b0:438:a1f5:3e38 with SMTP id
 5b1f17b1804b1-439249c75c3mr65051015e9.30.1739024616312; 
 Sat, 08 Feb 2025 06:23:36 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:36 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:27 +0100
Message-ID: <20250208142327.418271-12-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024616; x=1739629416; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgu/Td2MwB/XCEqBE8KdWhVl78OPZ69ur67eIDdPdbM=;
 b=SNv/e8YhhV7GaDLubNl0Yr13/Ddi9d9Pnz92v47FLhwpLVdAVXYBLMFCA+D880NIj1
 bupx+svWZN/K/DUO+/4kmKJYmlsPJw8q9DyQMPdeAKkLY3grl/Zt+UtUAvcysX0NrDt8
 nII0Ad1I3666qAe9giSouFKAT+RV+6wwMnVRQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=SNv/e8Yh
Subject: [Buildroot] [PATCH 11/11] package/mdnsd: fix shellcheck SC2320 for
 S50mdnsd
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SC2320 is now reported for $? that always refers to echo or printf
since shellcheck 0.9.0 [1]

Apply shellcheck suggestion by using a variable to store
the start-stop-daemon's return code.

[1] https://www.shellcheck.net/wiki/SC2320

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mdnsd/S50mdnsd | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mdnsd/S50mdnsd b/package/mdnsd/S50mdnsd
index 13b65d0c69..d022f9a664 100644
--- a/package/mdnsd/S50mdnsd
+++ b/package/mdnsd/S50mdnsd
@@ -37,6 +37,7 @@ reload() {
 
 case "$1" in
 	start|stop|restart|reload)
+		RC=$?
 		if "$1"; then
 			echo "OK"
 		else
@@ -49,4 +50,4 @@ case "$1" in
 		;;
 esac
 
-exit $?
+exit "$RC"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
