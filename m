Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107D9C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 20:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B022280E56;
	Sun, 20 Sep 2026 20:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SScufXkfkoR3; Sun, 20 Sep 2026 20:05:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D39BA80C1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789934709;
	b=UXB/BAA427jLBcAngUt37ecpJydqdxYQMl6T+hYxdt9Z+a3bOuoGet54p9+fyLIA5TeM
	 vuSVdzVshLOb3VHAM7LYDeynjdleBJLF33MUEIc5IkwsKz6aU9Oj4HVwIXZl62IoWXSPY
	 PspAbKWMvEFJZOjMbXvjpfW5axnec3grY+pIUcBbUjhabO68Th+tfd8Gk7m4BrjcB2FRQ
	 e9p2zUWqIT/4ly0rDl/u9bDfhi/ZEyv6S0dfIVEjb9ecO4n/LtOBBV/3WIcM1utxBRysg
	 qbRn86g+UoUb2OcgAcXTtQODPNKyvWeie//JWO8Ep9Sn9dXQz44A6W+tETcpWq2aM3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789934709;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dEUYtoEgKcjU4ahYc+QB4GNnZ9KpGxqZ0og8tP7Nj3g=;
	b=DL6S0ZoXO+NpDihiOoPj0Ho1RcZt9eDJ0y0MGzQqATcX30KwmCS7m+Th+jvUIGxvk+jE
	 HEuzAzgkeiGkQyqu2DJ4KOPwzsk6d0dfTTA8f93jmeKXzTQxY66ZlZbqgaUiBQU5WjqgT
	 RCEpooEBKQEjvSJrfWOn1dCB04M3t8lSZqwiCdHKuV8CvqExtbxvVqdUbnYbakVuzdryn
	 JrALQRHO9gZFKbY93r14+EjYSumchVEpUknqhox4StDwaYqaNJMZUCiWuMkZVn+OCeN1n
	 yljjYCoWdffK8tCl45bKAzp0TmRtD73G6p9hKp6H+EI1SWFI9lnumvvXEL7OdRUq8pg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789934708;
	bh=dEUYtoEgKcjU4ahYc+QB4GNnZ9KpGxqZ0og8tP7Nj3g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MA472yAeM4klRDXmslrcQnqVwjyuvKjJJx21Qvusk0eNoRi8W7Hlk/YOx7nkF4Pkh
	 /9qXCb4WO8+FRvji19Nh/qDPZVYNYBqiC7eyiYqu3ir59tuwACKuusVSdLU8wQjA9C
	 hb1TFX5lF6lS0WP6PhD35wwBWeuWPtv/SDllxPNYR0zKXu/pCs/AhcgmfB/kJTi5dh
	 3tIMGBo27wxCh3+f0d0uGkN/v2uA60wel6fN7rTqTYPNqmy9LhBPqPGgIeHMQiSVEN
	 x0z+uHuNrAYrnS2O1s8kUJDAZg4lk8NqrR4NbEA8OJB6Uj0YNkdbyZClA80/7M4bJR
	 lrUalP3WAGVug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D39BA80C1E;
	Sun, 20 Sep 2026 20:05:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 558EA25B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5374D606E8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BKiIP_Nq9Rff for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 20:05:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AD606068F
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789934706;
 b=A1O4MuuU6HKSq1Z/RO7h0mxDwT58fT5Z2utI5n0/nFPRQ0D4O7KoZioM24J0zhiefE6N
 oUgltWDgrztmA8NvqDTX8u3Lzlfiavfg7RGTCTxVoQ3vyBaE5333vPiO6cYf5kyxidqi+
 D4e9C2+l204znt6W778INRWm4KqYRMveDnSTrt67KppRvBb+axE4XcwSF+eJ5wCD4xwkt
 0S5TDkRVwcBuy7LPuUwzNgRVimOHz4YA9aU7lVHC5ngMzG14tGWdSelOC2dDbYQ9Oa7Hq
 dnThVLvBPIBPUhqlO+x22GwbE7QN3qQYgWml1Zo3Lhh0x+KlBacEUoLLfeFAFCobDvg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789934706;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Organization:Content-Transfer-Encoding;
 bh=VYpI9L+CWc11LvVQD3GhHMzlMDdue7QTontiPIjpaag=;
 b=UwtZMyXNBAKR/S1UKApt325GsMMHduXk8Rh5S1mg9xQnQNBrg7K2fRselu8f6ZRs+UAK
 4F6+LYvjio1MqXygh7yNE+/Q6R/6brhhnF2RDWeKUipitfUpr8KvCZrxjlNhSotUM7Udd
 AHsbemujM8DfKc/mvvnvR6ipe849TZklVzJi+ThjNqReFsZrNJGo5NfdblrIYbms6HtTY
 y8qsWxQ4hCmjkiMOxG5NbkduSxlUWvDIdYpm0N8ianSAHY7CRsMQCJgHTKD4BJ92cJXH1
 jeZzxYfT/7FHw/Ut9462lCGJzFVIIAP/TcXnpAqnph8UCKU+MFwKzT9MIwqWRHw0Guw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="iphGu/2A"; 
 arc=none smtp.remote-ip="2a00:1450:4864:33::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:33::10; helo=mail-ed2-x10.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=iphGu/2A
Received: from mail-ed2-x10.google.com (mail-ed2-x10.google.com
 [IPv6:2a00:1450:4864:33::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AD606068F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 20:05:05 +0000 (UTC)
Received: by mail-ed2-x10.google.com with SMTP id
 4fb4d7f45d1cf-6a9ba73bee8so1680401a12.0
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 13:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789934704; x=1790539504; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VYpI9L+CWc11LvVQD3GhHMzlMDdue7QTontiPIjpaag=;
 b=iphGu/2Aq8NGlkDksbu9iQtCdVm6kpsTip9ja4Vd/H9wP2aLJ1FeFMXsin7erPPKg1
 O2zdGIhiXT+D1Z78mMPoyoBtmObWujFmg19/O9YE0QYk3+II0fjc0vbRTionE7AQBZ36
 uC5GVmBSAPzQOqUmMPRYYhDJ9dJbnbKhbhcOdMaC4EmrEDYdkxyHt2oirtSdYu7h1JPt
 U5k/XsZBwki7a81fpPUi71nRufbLENFO8a/iw0JzBOoHsjh5KonLQdebe80059LEL1wp
 W8DtKVR9R7CxIkC/3G2v0zBrCAvkgZ1uMs84+i7PHt5PfqfZxas5oeplm12IdULSATi4
 /Qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789934704; x=1790539504;
 h=content-transfer-encoding:organization:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VYpI9L+CWc11LvVQD3GhHMzlMDdue7QTontiPIjpaag=;
 b=fE8edUsvK81XEetY7k174rK5EyHv7+i3YBlKwzgrjiIKi5Rpq9dJOYSSQ/QyXvEQoN
 c7TOI17SUnIEm2nTmn91NC56g8w44fu6YwgDn7fAYPAephmVfvXzUgE7KZxtyd9+dtZ8
 Ifk0z6wa3JBSNE6I+jNIK6s+9XUV1G6DkQluuPjY2VO5OLXOi/3EXPRky/TM4lIDvT1f
 r2LoIPtDxyt1Hk/OMkLjIyXGYfBtUjlbtksYSZHEsk3sO9rz0rCrHB6pe4NROno/PoNw
 0Yo92PDjlYaFlu7Plv8BeB4wzlq2yaVQ3CipYuMhHXIgo6ileFBm1lSkkaFxxAtlNeFT
 KkCw==
X-Gm-Message-State: AFuF++npbmhAiIb7vZBT5VyWSb3GpE2owNsjB00JuxwYLmBfEC1+3tWO
 zjGpJ2efQsy5R1zD5uyGZ1a+loAyuanFuEqAQnypl4CkxIhRz6gf7ngf2/ZI1w==
X-Gm-Gg: AYBFou0wBfTMkh29L0eYFrWkKwSQFUOjrXXI8cmT5jEBZc+rZBKeNWr5hf1gGMdFTWq
 EgJBRaclZJ2wIieicv0L29nhKDl3vcwVOTiddgwHKRqMMZUUbyQ2W/BDrh6CeXFxgzIZqKywFZ9
 mQ4DG7DO6HhZ6nEvEoFX89g9PPYbohavHUsvQFNwwIcPyc6Ip+PshWcZWnE3xJHj0gg7zaUOSD4
 EmvRrMESDz6fbPMtK2CqEnhgOfgA/94ryymeHJCV3YXSMaE7v8KtHbIhYCWlKhRN2AsUZesnS3C
 vvTyXPo39ss3BCMPKi2JYmnpG2/bG/lIoUJWE9eI3o4HUXMf2Nqsthbh+USjiGV3nCBQYKe2OH4
 1ah5Vdgn+qf5iy/DmkZbEgfivLhXpDWRdwQSxP+RM3vZnE3S3D4WXcfrIdbUBhKS37GTtKhQRun
 n9PxLPt0XLhivXsnzQSFG3TAKHnl7W9dceS7E1iRyYgp2LGyiTQJz3YVYaOZlELdN9aMRpzEU4M
 tEFYADD5otq4wuf+dYMTtgJyw==
X-Received: by 2002:a05:6402:2111:b0:6aa:4943:7502 with SMTP id
 4fb4d7f45d1cf-6aa4fe73987mr6643225a12.15.1789934703711; 
 Sun, 20 Sep 2026 13:05:03 -0700 (PDT)
Received: from gimli.. (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa67e1b7e1sm2796115a12.26.2026.09.20.13.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2026 13:05:02 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>, Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2026 22:04:48 +0200
Message-ID: <20260920200450.15964-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914103020.3485030-1-troglobit@gmail.com>
References: <20260914103020.3485030-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 1/2] package/mrouted: fix invalid daemon path
 in S41mrouted
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S41mrouted hard-coded /sbin/mrouted, but mrouted has always installed
to /usr/sbin/mrouted. This went unnoticed with BR2_ROOTFS_MERGED_USR=y,
but the daemon fails to start without it.

Also drop the script's executable bit to match other sysv init
scripts that do not set it.

Introduced in c25115daf2b2761a2f0f411790c6d24b460c7999
(package/mrouted: add sysv init script).

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mrouted/S41mrouted | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 package/mrouted/S41mrouted

diff --git a/package/mrouted/S41mrouted b/package/mrouted/S41mrouted
old mode 100755
new mode 100644
index 7dca258255..d653425719
--- a/package/mrouted/S41mrouted
+++ b/package/mrouted/S41mrouted
@@ -11,7 +11,7 @@ MROUTED_ARGS="-w 30"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $MROUTED_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
