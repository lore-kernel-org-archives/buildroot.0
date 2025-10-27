Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E24CCF9E5
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 21:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A2E414BA;
	Mon, 27 Oct 2025 21:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJ_MTL_KIYtN; Mon, 27 Oct 2025 21:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 524B54143F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 524B54143F;
	Mon, 27 Oct 2025 21:44:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7C9970B
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D91BF6142D
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:44:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxG6jQM8r-r9 for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 21:44:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F2796142C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2796142C
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F2796142C
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 21:44:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso3020683f8f.3
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 14:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761601454; x=1762206254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UlXkuW1+RvhERA7pgY+xMO8uMTgJtKnTWqEjF0hZz0U=;
 b=TxjvlWbXnnrnuRI4uo8Z5huiibRqdHtrdLX1J55Z0X48wH2eCTaz+3bkkIWzQbHy13
 FRO8boGYp7106lraj3UqQh25OYN/85wbqChHIadJy6adkcdGNylNxDAflOEwAAj1SDtw
 JS51Tg61uzFYcA6bYuXvIoyjPR+rY7lpx09HWIcvh0AZkQHbyDoKGfHWgRJXAbsTnuFE
 awZhSRYim7y9OKImSqCuxFoUD7P3HdiaSDv4hNeAymFW8xfgQgU1FEcc1jDNVhnNVqIJ
 jyMh2zdOtuGWyrvb1SjUljPmv+bo2b1SM59vi69P/Hrm3PXj87qN7fBU+ChSdY0KfjlX
 BDsQ==
X-Gm-Message-State: AOJu0YxGMOxyrGUBn/3tiDIpAgZ7huFg2EP+m5YQwBiKJ254RzEGNKb2
 TuLo0nxEDj8V8hstAZmS4ovSGjvWQ+fQdw3zTa+BiIYIfMJ4JX8fE+qeouTapgU6uYkX2F9stB/
 LTeZe
X-Gm-Gg: ASbGnct3XUBRR0zVn44Tezjy6o3EiE3P1KyjW0rTwYh6+bS0AFAtDosqRW7MdMs5Wx8
 Zz4FpkKhFYmzmIUM9idUAnpSfJpIOsLnDYjH3efReNFNFSq5aF2TB2k5qV2NsZJojCDoHzv012y
 jNKpCJhyYL4hqYWMwGMV6EAx1X95qtFMKO4zXodhIS9bttY2hDiv0DODbPEOl2yKvOB0FSunzAx
 JodvgQ+GuU7WC7qV5uZPR6YsJRVZyR0mFAKlR5UzQ56R/I65DckhBvDnKWKRhknRWnnYmBOwdhm
 ivhSDSrRPiTctrbuYqrAtwNWy2vEZUYb3QM9Le854AOGETNVmuky2djUGojkwRmZFATNmu3N7z+
 qpxCklw94fNCYMP01Egw9LZtZ1/3y+CA39Db/vv5scGoXe2MQSz293db9y3Q+AkMq9AhUUf5bWQ
 wiNNbZaRJgFCDfLiiwlrxXPRN9JC0MQdeDLRb7
X-Google-Smtp-Source: AGHT+IG7+k4oDNEfXjpDutdjc2jUG0jm327Z+Q7pRyNF4Llj/9qVVnhWFZnSDMQk82x6EZ4hLXYxWQ==
X-Received: by 2002:a05:6000:1445:b0:426:daf2:ee36 with SMTP id
 ffacd0b85a97d-429a7e843e8mr967610f8f.41.1761601453772; 
 Mon, 27 Oct 2025 14:44:13 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm17139937f8f.44.2025.10.27.14.44.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 14:44:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 Oct 2025 22:44:13 +0100
Message-ID: <20251027214413.67587-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761601454; x=1762206254; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=UlXkuW1+RvhERA7pgY+xMO8uMTgJtKnTWqEjF0hZz0U=;
 b=TIE1yTcZycV/wDHYCyWDy87SMX6hdbnjNBFpJr3g1roAZ34RCWNHG0bJR7KBRr1ZNm
 iigf/A3bpO6OB98YwOHuraCV7OGMa3iJnux4RkAIAeLdYp0Yygc0YaRRcRkkTkaydGnU
 AJRAnvHUIwCiqm5Nm7940GbbzkTjVKUi/ym6zpmaCLwe6v7uPY+2yif4/Qqn7/2hn2Ni
 bYyZH+LGYJtkgWuYdKkcHcWPy/aGOA80Icc82QXHnspC1vSMgprjrY6F2dio0NdheeU8
 A7fQroa1Ifh9y85H9WeYhNNDq9+p+E/iqrkbTCE9PXBQn33tBF7BKQAwuGuJTA8A3ego
 mpdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TIE1yTcZ
Subject: [Buildroot] [2025.02.x,
 PATCH] DEVELOPERS: remove 'board/engicam' entry
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

In commit [1], the only 'engicam' board config present on the 2025.02.x
branch was removed.

On the master branch the 'px30core' board is present because it was
added in commit [2] not picked on LTS branch.

So the DEVELOPERS entry for Jagan Teki that match every 'engicam' board
was not removed.

This patch removes this entry to remove the post commit hook warning.

[1] 13eb6c293e configs/engicam_imx6*: remove defconfigs, broken
[2] 6e6bd098c3 configs/engicam_px30_core_defconfig: new defconfig

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index dc094eb8fb..624e9b8d62 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1462,7 +1462,6 @@ N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/
 F:	board/asus/
 F:	board/bananapi/
-F:	board/engicam/
 F:	board/olimex/a33_olinuxino/
 F:	board/olimex/a64-olinuxino/
 F:	board/orangepi/orangepi-zero-plus2/
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
