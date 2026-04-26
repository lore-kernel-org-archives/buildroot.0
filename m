Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AB0FF885D
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 15:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E13584CBF;
	Sun, 26 Apr 2026 15:34:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DAEQ7uFpl_T; Sun, 26 Apr 2026 15:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DBA884CB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777217643;
	bh=SjKALTJ9MSSXGQO9i44rjze3khGak0XoDNVtAY7BFOs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OE+vllcpd0h3tfLepTDUhQSSbWMrH4B1XNP2vIhmFgd2BYx27UDKqx8PjcU9+r/t0
	 ZRGQjDYyEojrRLBacptJZq6JI9pik+LeLIIGprMKiX8EH9X5f1Kp3Oe3QeelvmOo5p
	 dys71o3ISDTiVZcfSaNrf+U4+Wk05EA7irG0thZul6XaM7skhuDOjB2i+JOwnrgqwd
	 QDWYPEw+TP4itiD4EYQsjhWwOzjfDrOP1lDlodO2d962L7CigEbt2vtSx5C6reGmYw
	 QL9ddZqvDJQdAXaYj/5Sc9WV8y/HS/0BHpYU1ETwcd6CXXzMpsIza9QvgADKrWmk8H
	 0IcRwVduibhlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DBA884CB1;
	Sun, 26 Apr 2026 15:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EFB9231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C27F4291E
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PayBVHq-GwIM for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 15:34:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D11542912
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D11542912
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D11542912
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 15:34:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1vIyFg3Xhd-00sV19; Sun, 26
 Apr 2026 17:33:53 +0200
To: buildroot@buildroot.org
Cc: Sen Hastings <sen@hastings.org>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 26 Apr 2026 17:33:33 +0200
Message-ID: <20260426153334.1026982-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426153334.1026982-1-fiona.klute@gmx.de>
References: <20260426153334.1026982-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:HBM4y3ChGBFDFY9Zjf4cIPyBVSOnuCajFRx1V9cTXzIQH3gaGw8
 4wj+J75J72Fv18XhepEO+cStozsF6C/qKQUG6Qsic3zhXsifvripqABQBL9hZC2Glf798m1
 3jI7X1+EMEn4r7tXjhhsTZqxHR0YkyQr/c386inyIvd82M1rTgUSCDMix9w75+0i6TGMbbh
 oKdxZGnxOlTJHC91kIIiw==
UI-OutboundReport: notjunk:1;M01:P0:eY4JZpQH+kk=;6sy5GNjPMUE4khAWBh3CAp2vnDr
 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
 CqHsQaJzEPdQ9hk/DX2wR5LsmUTiedqtmW9Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777217634; x=1777822434; i=fiona.klute@gmx.de;
 bh=ntaljetK6AAUshHJlfh8WKl5abzW5J+yr2Cla6NbwME=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=jN5Qywg237Cin1LlmgenDAKZftweshHOgyolEHqdt23LaflwaCg8DMoykdcfYVs6
 5XtPQ+sNezPlGLQI47htoo0gReNHZJJHR3enhcB2gO2aaLVGr8SA5hdI+fVxbeAen
 WS6NgrpR4awaiZR7aKDfc9O58Pn/o1P7mkDCwRcH0IARhDMDvQRUKj7cXMau6BsK0
 VyBl4eqIqkMucVvZKpA9s2FXtRGU6K8jbE0NA5GEO/qa3AeJGq+PgYS2D+HW0iqpW
 ciAcFU3OQQN4xEKrXvQAHzV9ORo09DeMUm40PrS+niNjeniPzDs0zItWAwbV7Stwp
 282wHKw/0dBqf7Fbqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jN5Qywg2
Subject: [Buildroot] [PATCH v2 5/6] support/scripts/pkg-stats: don't buffer
 whole file searching for infra
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The file handle can be iterated over directly and each line is used
exactly once, so the only effect of reading all lines into a list
first was higher memory use and complexity.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/scripts/pkg-stats | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index bbd1e3e6f0..5dcc812e2b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -197,8 +197,7 @@ class Package:
 
         self.infras = list()
         with open(self.pkgfile, 'r') as f:
-            lines = f.readlines()
-            for line in lines:
+            for line in f:
                 match = INFRA_RE.match(line)
                 if not match:
                     continue
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
