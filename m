Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55633C79F82
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 04:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B02FC605FA;
	Sat,  5 Sep 2026 04:03:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tv9gcxA6qQYM; Sat,  5 Sep 2026 04:03:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 516A060BED
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788581015;
	b=PI8T5CGPVX+INr+KcawFsPCnespy70ArSZIw2v7KP/ejjOOizHgenxmoiou1yFYT/WXW
	 l7KYML+5FGK8M90jiH8eW5dzjEQA0Bazst9pbpTw6Bmj8pfHttJE5PjbM+0+mq204Y4D/
	 fPVPb/cxKQ6vz9HW6rUkuVoVBxhYsaMdNDas3RAhNPquDWJh4yQDxUTSL4z6PPBPZVYWA
	 UV7+067sBQG1oQmAH490xiWHc7jA8QPxaDomp9JM2E28QgPhonmRBmSCRp7Ga/MBhT2hW
	 uRtGByco7pxM5yktrFV7EQ3dZ1m8jLhR+go/TqizZoQiXalgrGNtFK8+qdwCRfbsQGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788581015;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Virus-Scanned:X-Virus-Status:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uRtwijM5oQgYQNaFuexwbmj68qakQoq66nd0Jzq8QbA=;
	b=Xg+CjwBHOXbP8StkDHYCicbvrnMc088vbhx26HiUwENGMkBmfa7KeuAs/XEkLlfWMG7M
	 VW429kcUqXGDr4As95Zr3sIfaau+FQIYTlnaPoSfaGTp+TBmrNXy1g/TEfkwTL2UgVZIE
	 pSb6KFc0rnbQ652xNAGbo++bpiqlPwbcDwXXtLl2j5PjczSA5KP3hak72CscDKyVFlxVs
	 AQBCRwwLjZl0giYx1wE5ucIziHZisKvKJ3T79YRK4rAF8FK3cUG8qyb78eIIyde4d5fPw
	 U/2GrIaQSoWjjEx36ZDsOjrPYhniwaAwvR0Y/fsDJMPnD/P+js+Od3NWpddnyYIoRCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788581015;
	bh=uRtwijM5oQgYQNaFuexwbmj68qakQoq66nd0Jzq8QbA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S+GdEc38WvHynuzXB1b1CV8XIpwfZ5HIACptMX8hPyOusJ/xnHNSaZCkfzm/bwkI0
	 zUku64QQ3Xc+xas3Ipf4EZD6xhtHcSRiahZU3Xf8AR2dBLVNNwWC45hYAQxB8lBuhC
	 gua/f1D/rPjDDv9dNmq77CwL1Ljgf/GvkMKByYGRF/SCpN1E/vJ/v6w4Dvj8pd3hdJ
	 T0WAHVUdOX2hfvu1lAX2oyxpU5tQjCeWLN00I0ysDh5zEj0/F6YTIE/6K7zNS1givf
	 tiGmxMcI2eCj87B2cCURq3EeRx88/2YZHTZpeA1SPmowf/mTOPCHLnKa0UMgmZVaTA
	 MRXBPTIfir6QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 516A060BED;
	Sat,  5 Sep 2026 04:03:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 51DC7118
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B44581099
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubqOGXeEGQ5m for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 04:03:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C1EC980FF7
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788581011;
 b=hNqt9S4cRWMJ4vnRO05fXh+9NWEL5qO6u88n3YeomzrNeFA8BVtK51cMNHu0O7eNGksT
 I9NsfxEmgqLsIDYomu80+tY65Hv6bYFq5AB419J5+b2eHXwpaWR+lPwRwJ+6Xe3V4QA2O
 KYLOKd/w9g4sAJ0kPBeBaDBIY1Ze9qOSohPjpTfY9EWQEvRL4ZMkMHE3Rv7TfAXR9dISH
 ptRsChecuq9bXj7h5UDi2bMBczujZQ9m5yS9GEskic+eSJfI3EVUGsIpO+Dd24JMDMzgu
 GfjLwr+5XPkbUjcVTP4DXxYA8D2Pw7bN8L5SMPbLAtVvkkHubi01ANGlCBkBGdJFcpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788581011;
 h=Received-SPF:DKIM-Signature:Received:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Virus-Scanned:X-Virus-Status;
 bh=egAyOsD90aCwcabHDSn3m0Wz/C1FoYWzWz+OZXvNAY4=;
 b=P61DNDrXcGDCtnxVGQsl0dNoISjp0TJBZ0aWBkWNYINNpUZg6C1OZie7OiH9rybZWvyz
 M0nVZjn9jLQrtezdNAiKqvxoWft4P0o+xZuSQBDRzPEpOkoIAj5b2510THwrGFjcbMEB/
 OutgxZ897IlSN0lIYjY3rlle/wp1pA5VaVaPg0BcD9gQbuxxAtXVrK5CVrlhR4myy3pFu
 P/CgV+vWKz1f2ehT+teBbvU9MA0rn5E+nwL1+lnyNspvfsTbIhlveCBJFu7IzzZF6gyXx
 TKuJqYmPjrM8iETQukdOpKFY+nNv8SxWUFgaBkMwyDf8U78xaogQglI7zgQ6SQe+Kig==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=mFjjpegv; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=mFjjpegv
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1EC980FF7
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 04:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788581006; bh=hFciQ2ptfcrvCh4iGFwFeQ8QAsgpynTJ2Ctr5kltUQY=;
 h=From:To:Cc:Subject:Date;
 b=mFjjpegvFh4LnwU+r+nxlejAelVxkwEwbTO4qGAK5z1e0ImFemlMmW8vZBmlcihPT
 hYtrjaQo+8qWjy2SFMV3AgXnHS4/Y1Wnrb2e+RyAJa1mTwu75xsUk3Sma8zKdzSTXP
 kjJVWf3VdlOigl/Z6hyhCkI6SGUuYJ8OCXNyuFuw=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id E600CBDE0F83;
 Sat, 05 Sep 2026 06:03:25 +0200 (CEST)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>, Andreas Ziegler <br025@umbiko.net>
Date: Sat,  5 Sep 2026 06:02:51 +0200
Message-ID: <20260905040256.2221199-1-br025@umbiko.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: [Buildroot] [PATCH v4 0/2] Add runtime test for mpd
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

Unused presets have been removed from the mpd configuration:

 Config.in: libmad, libalsa,
 mpd.mk: Creation of directories.

The configuration file contains a minimum of presets to be able
to start mpd.

Andreas Ziegler (2):
  package/mpd: remove defaults, add minimum configuration
  support/testing: add runtime test for mpd

 DEVELOPERS                                    |  2 +
 package/mpd/Config.in                         |  2 -
 package/mpd/mpd.conf                          | 31 +++---------
 package/mpd/mpd.mk                            |  2 -
 support/testing/tests/package/test_mpd.py     | 49 +++++++++++++++++++
 .../tests/package/test_mpd/busybox.fragment   |  4 ++
 .../test_mpd/rootfs-overlay/root/test_mpd.sh  | 35 +++++++++++++
 7 files changed, 98 insertions(+), 27 deletions(-)
 create mode 100644 support/testing/tests/package/test_mpd.py
 create mode 100644 support/testing/tests/package/test_mpd/busybox.fragment
 create mode 100755 support/testing/tests/package/test_mpd/rootfs-overlay/root/test_mpd.sh

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
