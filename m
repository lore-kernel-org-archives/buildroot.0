Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9826DEF586E
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 14:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F351D813FC;
	Sun, 15 Feb 2026 14:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rsXeZGunQ82p; Sun, 15 Feb 2026 14:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D4C0811F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771166970;
	bh=2Hfa6FYVEYa5hLBMl1hTwAXp5fKd4WYDaNl4QEwg0dw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=h7nJyTnz+6eI9T6eqW6GLInu/BEM24JplcVIj6eOi/ZkEZPXeh7IkML0RjjK8biLf
	 +6NG/jUuQePrtyW2pUyA7gaViHHlgruG40xyctiu3aqWpm0jfYZUf7zQCu491S7Gxs
	 4RyDSHkp5s+dwfihECryLf+yaFb2CPDaxpLkwJ0HlnJQWJtsof3eoBii7G/pCbTug9
	 GEevDtAz80xKWlBdun4lGyvexjaF5U5q1X3XYxxrzSj79DgARjrJNtViEq1RX1pt/l
	 y326JI+CaPaD0VtJuGVWPjJ+tbedvG9GmDoo+AV4FCg+NbgcqZWRZHAUOhTIc2ziCJ
	 fujwVLMwAc0nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D4C0811F6;
	Sun, 15 Feb 2026 14:49:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A06035B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A8A5400D3
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7aLoHlfVX1RH for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 14:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F3BCE40074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3BCE40074
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F3BCE40074
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:49:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso17234425e9.0
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 06:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771166965; x=1771771765;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zp14/QAbR3c60GKFkGG8EMsCYxrhYrO8TaKtzf6ewJE=;
 b=BGBweV+tFBGxfxpNeKJHRBrq0ASmluKm3SMnF10TUFntK+dP3/C8ja4Pvlg3QtoyEe
 TKdY0ApsV6eFkWdiJmOTBc3Qw3vK71GAUejMpWjqJOWKQEQqDs5b5l1TOpJK2xTrFT/K
 fnKedO+CJhShDZqu3h6+m5AO9C5TNGP5T59RoNyBPbIDYuw0qC/SCiGf1FKWYkl6NE0l
 d07mskSb3ExLHY2STaeLXwk6hfw2Z+XYM6+W4a9f62IUnjAk/uWQC5LuU++FgWd1pgEE
 B9PAJTJOqVSZJINsLRDq2OOq6E6z8lv/M5cV23uNTqXQtH+iu6lTD+e2207ajP64LDxM
 jD3Q==
X-Gm-Message-State: AOJu0Yy/w+Y3ZUOq2NML6hwAZ9iZ0J2q8A/t2Cc77+MkyQMRauxSaKP4
 xp5PdKF0VsBcRvMlgRSGZroelsFLGfH1YcKN0dpPJ/tKFxL96XnrfAN2R+1qsg7c+OjCXG3iKkg
 BpeSQ
X-Gm-Gg: AZuq6aL4IFgHsRHhtR6oSC9pP4qtf+5wrwCCOXpZjjNQDFSNGiXv0JAiZPtVOq1eRhO
 ZLflQQR8171qu2lZJGDdrixIra3lMNhX35dEfSINsFXKEdRzrzv3M9WkErIGdNxvXPiDjGiRTl7
 Crx/trZQ46j4FnNGQ58zoCbGgkqpWfgLEWy5ZfwKaEFQ/8I+ljJUgfYzhfjWsBxBMusYvQKtVwn
 RBT8MnX2eo5h5BCvVmgO3mrCcLR6oRzTTgum4QSXGUh9oXGUMQF3aJ4BLF21eqOQ08L6AL9TMOY
 fyDOMu+hOkUkiP542LzFPNFA3A/pUpPMrLEUpvwJ4l84ugCACfhMZbt7+fK0xeDXqwW72vL4023
 cJ0cy4SeWnOrKY4/u3DnsdZ9/s2O/BA/10wDRiNtllvmeXsjQiu45Zpwca2T5AjJMfZFUt47YDT
 inWVv+Au1s82Bsqbo=
X-Received: by 2002:a05:600c:5246:b0:483:71f7:2782 with SMTP id
 5b1f17b1804b1-48373a14406mr139425175e9.12.1771166964525; 
 Sun, 15 Feb 2026 06:49:24 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac800esm21184682f8f.27.2026.02.15.06.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 06:49:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Feb 2026 15:49:22 +0100
Message-ID: <20260215144923.54095-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771166965; x=1771771765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zp14/QAbR3c60GKFkGG8EMsCYxrhYrO8TaKtzf6ewJE=;
 b=XqrdOkqs1mcejm0ISFS5Oz4teDx+9oRcaS8ZAfykpwP4OeuW81k+EKyZIy9Nrrjxxl
 eZpBUGysegIc/LTsliQdvRgFpCyWS4bAxsFx7pSLo2/3Lk0sRgzbnJMCxsRuxhLvAKil
 rp0q4TrHuxfkINqZRYKE3qwN22xXK0hi2KDPp72Zhbn9UF/Qx023pDbHSAVFe0eOW88O
 zZzM53rZhfbbpZoRthK2dhj9N5v3l5VczzS98ahDzIKIYignj9h1vMnEvjCuQWKtQxMM
 aZMyFOUAcT/6Gt2nDxhgL5Fb46Ij+tBju6npOmBj8MurEg5pxMiZtbYzh029DGzloO6f
 /D1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XqrdOkqs
Subject: [Buildroot] [PATCH 1/2] package/haproxy: ignore CVE-2023-45539
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

The CVE-2023-45539 has incomplete informations (see [1]) and will be
reported as exploitable by pkg-stats for haproxy v2.6.22.

The vulnerability has been fixed upstream since version 2.6.15 [2][3].

This commit mark this vulnerability as ignored.

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-45539
[2] https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
[3] https://security-tracker.debian.org/tracker/CVE-2023-45539

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haproxy/haproxy.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 77195d966b..f60cb1e08a 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -11,6 +11,10 @@ HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
 HAPROXY_CPE_ID_VENDOR = haproxy
 
+# Incomplete NVD annotations, fixed since v2.6.15
+# https://git.haproxy.org/?p=haproxy-2.6.git;a=commit;h=832b672eee54866c7a42a1d46078cc9ae0d544d9
+HAPROXY_IGNORE_CVES += CVE-2023-45539
+
 HAPROXY_MAKE_OPTS = \
 	LD=$(TARGET_CC) \
 	PREFIX=/usr \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
