Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77920C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 19:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1473840402;
	Mon,  7 Sep 2026 19:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JPdQEq8GPS65; Mon,  7 Sep 2026 19:46:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0EF640422
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788810371;
	b=gSXcqmnlLvU+uCB6VNhjZonq9y99EVtoGh9CSYfvct1ZyUm4cd82l1HyMPclWwcLUkP0
	 1IZ6+hUmOO6pXVrdgwhjhWoSSh+G81+0R7tpioHUZg8tz8YOEe/3ofrwJMmHgAaI6N9Ve
	 7KgoWaY804cgLajAR7PBBBKyVrJ2TK/aq3uhvVjTgzWufDEiTOX8nNDD/SlbddNqYTIPG
	 OSjxkFbN6s/gyHP+yfO9b1ac2T+sQm6zweBORiOYQlNYlRodU/qt4CsfEAMpyZaQh+70s
	 CgtmrNB3qCPWVVW0fAHtG0pI4OEm5C28H0AyM16CJU9+TaM103ukWdIGlv/bhQlej3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788810371;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3n11jZQsZDt5dNyVTCP6YXc9CDs/f84d+qZ7vcuHThU=;
	b=AZ0lxoALC6fkgtMfzXNq2z94Mau6kwzxnwB/3Gi4+OLY3fLVrm73r9DHmnPi6dwWAA79
	 rZwyGEW+98oEX0k80C59Mv/zqgJQPKCnJ4GMP9M+k2kHmVo3Rk12/mSeUfsZJsMqy8opW
	 tmzZT+VMkxP5g9dAF6wTxXP6nm6lp2ZI+E502g/71pH3O+hL4XrOHLMRXKWUG8TEn/T6y
	 zlqhVtTwANP0UWnNfBZhxtA/sexMAbBtgqJ28RsKmj5GbIKrivfMS8dLuLwOJNhdOVAjZ
	 FBFy5vOb5LWCE5QzFiiApl/lF32Hs2yCcloZ6kuPZBCDR8YT88bhIrg1tPI5UIN/pwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UK0QMTT4;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788810371;
	bh=3n11jZQsZDt5dNyVTCP6YXc9CDs/f84d+qZ7vcuHThU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sI2Jp4q6fl9Zqe1pQixLQPo1HOc4fccdnRaUMMiHNrk3yqe40yba3D6BdvyGIJkEF
	 iDyYe3B/YFyULjroRBJ4XiAHnEr649qrph8xy3LwD+A3N39Uen9WC0uP2kH4s3tvdv
	 mJbnxw/DMqaywN0R+jrr25fmJbG+7XY9kTvqCHVEx2LkgoHYC7Ss62VDGl9/HWhF+R
	 1CWVEzIhdtIDmZxIahGCvfaILQC4YfyujgezmjelgthFxMjonvSBaZILpvmTVWySlE
	 oLLq4UOa3+70Zn9HgEWWFprAAIwMaNJCZD0kIchRrKe61Zf4oK7MVwT8h7sMr7aZqd
	 D2iDAzUcwO2cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0EF640422;
	Mon,  7 Sep 2026 19:46:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C421AAEB
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D1340422
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id giyE4uphG9xS for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 19:46:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 729B340402
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788810369;
 b=l14AlTbZK+8dNON0sG7cxA1l6MMPoqd1YA47d/eZeL2oDE2WKyWVqlv/RG3dz1J7yo+b
 b++qvcsmJe1vvK4ijxYiGKKUNdtjP6PY35lA/rRueXkgaTSSFRDtLRAQlLjPiCt7K3QCZ
 GQAShEBse1DC6nIjZ8ox4Bhn0IpQtpa3cEdRJXWlCm+82GXXkm5nc+74THbX9McVnn8jT
 NUYEwqng9tE4fJFQpwmWWEDCVPtbHSESqE3Xb/Sh8YS6W3VJMscz+pBiZ9XsV238eu15e
 NcNFhhivLaINwhKOsgvAoqHufX0S/vFlNH4EBb7o/qmy6yyHEvn+b7a8nk563qqGKDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788810369;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=P7DPdXpMS6ZPDmANi/Miaqnceq8+LSfr/F2iis+sUHQ=;
 b=dDLbYoJ4BuB6rCSCumH7zEVsT2tdlyiNWigZcM+E8yDAfUzJ1uD/Zvy4pnqcnXng8EYj
 qMAl+iorx4JJ4VPLlAzP4tg4TMxORSLG7wLYPa7mcXx5SfuL65DBZbWXrhelaogiXfF1s
 iKSxRT+u5zbSHcXP67QhY3KCmzTjHS7pZnbxhx5JMGr8Kyi9lk8Sm7+7yMSBPlx3C/1Zp
 7ddz1TvYUnJn7auZppiYA5g2ebTEwLSrX5m365HNnO4zYHsjSmQgC8Qdh83MwdeC3k6qv
 JdQL8YB5SIz+Bjr1aWaxJzgjHTdgGw+i8vNmWy5BiB4dz78DySYirVI2YwQi+AC1VqQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UK0QMTT4; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UK0QMTT4
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 729B340402
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 19:46:09 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6356256so220131f8f.1
 for <buildroot@buildroot.org>; Mon, 07 Sep 2026 12:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788810367; x=1789415167; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=P7DPdXpMS6ZPDmANi/Miaqnceq8+LSfr/F2iis+sUHQ=;
 b=UK0QMTT4onXitb7JdMzOnxaJpnssZPd665Doa3grQLfS+BUqlx+nR6O/gr+xtSiIPS
 9jvT/Z7imtad6qCR5eZrKqHB8Dwv3fGggDeO1P0zMUk+7+FZCCL1EbSelA9/q8SEAuXR
 wYF83+BkDmlOxAY7F+1pR34eTi6yS5hvAu4IS8e7QwvoLJM9p+3yv5CiKDWPv8yKlbNU
 /16Epw4eqaxqLh5oVN3bV6Gt/7Iysw7JOyHx431pQqSUuLSvzx/DeCe6HTY06JR6kRKe
 LN0z/Zq0o6svA498SrJiet3Y7EJjvisOlDNoRJz6XdGxQLENfUJWtJ3fDOViLkrpKqRr
 mbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788810367; x=1789415167;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=P7DPdXpMS6ZPDmANi/Miaqnceq8+LSfr/F2iis+sUHQ=;
 b=NZcT0IWHdWQ1/rfob9sonFN0AU1AqUxcFs1ibHVFbjFVQU1o8jYu2pQRnK/CXYATA6
 zWsrYjxkhiLEiKOEezeFFY70kejqAgPAX8ytRwyNgAmAIyezY8f6xB0H+nZ/AamdxAi0
 CiRY7Bq8BmE3vBJ3UlDARxMr80c4s9UvLDuoI83nb/zNqsKIadI0Z+dsae/ttwlJ/o+R
 pLk/1Ep6eM0AdOvNAuLDl2do5ecw1xgjvCFJi/SzW6hbqBV+pRigjGsgoxfVQoQa07ez
 ihoXFssNQXO/cyHtRoIqxyhlXCUcMJl2o6z9SkuZPZpZNdwMGWTlrvQMidfH7dxjKqYx
 T+Tg==
X-Gm-Message-State: AFuF++kmTuiaIDDwrjrFR4BKn3LJveHPvK2pZ+Xi6XvxiQgIFtg1rlnq
 wbraWdwekdCntxj7IJwmg5KenaXZaVbkpJkHAntieqB8AXYbGfe/CaDpmzcFZ1s=
X-Gm-Gg: AYBFou2/mmBbuUvPSYHZVxlFMfOumq5zjjSt2V4UTN/FzCN1IZRIxNv6ac3i6lXsSRq
 fNN2YQPZ+nXkuz8vL63hTZRBoox7BLmqvA0K3U6OSpPYD7VNHF4g2JrEB2V3ufRZvI5P+miXG7Q
 lBqTxty/hTUkTJyisjeQ/cmFaOxP6/wZmW2eCQqIhtkXGzKEMmrf2j83/bKXZykHCzS1YvVXei8
 ipfoXH7YrQ0RaiZaaJuq6UkVUjH0lYkd9RrjIWe9NHNYujJAIRqWd7s86kgIc646U6GyBKGMlbj
 eBWy61T++WG8R4nqFgIzzIEfgSlMe3AbYGfDe5mTmaKRMYqfb8bWaT1dKzyyCSeV1aMV7btbtrl
 8f1gNngRPTUd5DPUeTYfuobidKiyUq2IByPFweJv2lhU1ivKT0AjxHplgSma/Wk76Rzn0B96i9h
 +APSVLrlkeZVMaqMZhczCtV3lvZnsTy54cK6B4svPkwKDDn18o04gBqPT1H0R62kWPb7wFcR657
 H0=
X-Received: by 2002:a5d:64c6:0:b0:485:7d6d:e0e0 with SMTP id
 ffacd0b85a97d-485a23c620emr3308420f8f.3.1788810367051; 
 Mon, 07 Sep 2026 12:46:07 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c81c3sm30968422f8f.26.2026.09.07.12.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 12:46:06 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Mon,  7 Sep 2026 21:45:37 +0200
Message-ID: <20260907194602.1646514-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nnn: bump to version 5.3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb21taXQgdXBkYXRlcyB0aGUgcGFja2FnZSB2ZXJzaW9uIHRvIDUuMy4KCkNoYW5nZWxv
ZzogaHR0cHM6Ly9naXRodWIuY29tL2phcnVuL25ubi9ibG9iL3Y1LjMvQ0hBTkdFTE9HCgpJdCBh
bHNvIGJyaW5ncyBzb21lIGltcHJvdmVtZW50cy4KCjEuIEFkZHMgbGliYXRvbWljIGRlcGVuZGVu
Y3ksIGFzIHRoZSBsaWJyYXJ5IGlzIHJlcXVpcmVkIHNpbmNlIGNvbW1pdAo3Y2U0OTEzYmMzOWJj
M2IzNGEwZTJjM2RlNzE1M2ZiMDlkNDg5MTUyLgoKMi4gQWRkcyBhIGRlcGVuZGVuY3kgb24gQlIy
X1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB0byBwcmV2ZW50IGZhaWx1cmVzCmluIHRlc3QtcGtnLgoK
My4gUmVwbGFjZXMgYSBzeW1ib2wgaW4gQ29uZmlnLmluIHRvIG1ha2UgdGhlIGZpbGUgQVNDSUkt
b25seS4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTaGlyb2tvdiA8c2hpcm9rb3ZhbGV4c0Bn
bWFpbC5jb20+Ci0tLQogcGFja2FnZS9ubm4vQ29uZmlnLmluIHwgNCArKystCiBwYWNrYWdlL25u
bi9ubm4uaGFzaCAgfCA0ICsrLS0KIHBhY2thZ2Uvbm5uL25ubi5tayAgICB8IDggKysrKystLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL25ubi9Db25maWcuaW4gYi9wYWNrYWdlL25ubi9Db25maWcuaW4KaW5k
ZXggNjRjZmE4ZTBhNS4uZWI0MDk2NzdhMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9ubm4vQ29uZmln
LmluCisrKyBiL3BhY2thZ2Uvbm5uL0NvbmZpZy5pbgpAQCAtMSw5ICsxLDExIEBACiBjb25maWcg
QlIyX1BBQ0tBR0VfTk5OCiAJYm9vbCAibm5uIgogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBm
b3JrCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19BVE9NSUMKKwlkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKIAkjIEJ1aWxkaW5nIG5ubiB3aXRob3V0IHdpZGVjaGFy
L1VURiBzdXBwb3J0IGlzIHRoZW9yZXRpY2FsbHkKIAkjIHBvc3NpYmxlLCBidXQgaW4gcHJhY3Rp
Y2UgaXQgbGVhZHMgdG8gdW5zdGFibGUgYnVpbGRzLgotCSMgVGhhdOKAmXMgd2h5IHRoZSBXQ0hB
UiBkZXBlbmRlbmN5IGlzIGhlcmUuCisJIyBUaGF0J3Mgd2h5IHRoZSBXQ0hBUiBkZXBlbmRlbmN5
IGlzIGhlcmUuCiAJZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSCiAJc2VsZWN0IEJSMl9QQUNLQUdF
X05DVVJTRVMKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTkNVUlNFU19XQ0hBUgpkaWZmIC0tZ2l0IGEv
cGFja2FnZS9ubm4vbm5uLmhhc2ggYi9wYWNrYWdlL25ubi9ubm4uaGFzaAppbmRleCA2NzBhNTkx
YWZiLi4xMTA0MWU4YjlkIDEwMDY0NAotLS0gYS9wYWNrYWdlL25ubi9ubm4uaGFzaAorKysgYi9w
YWNrYWdlL25ubi9ubm4uaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBjb21wdXRlZAot
c2hhMjU2ICA5ZmFhZmYxZTNmNWEyZmQzZWQ1NzBhODNmNmZiM2JhZjBiZmM2ZWJkNmE5YWJhYzE2
MjAzZDA1N2FjM2ZmZmUzICBubm4tNS4xLnRhci5negotc2hhMjU2ICA4MjlmNDg1ZGM0ZjJmNTFj
MjQ3MWIzNmE5OWUyMmYxNWZmMjE0OTY2ZTE2YjcyY2Q3OTc2OGIyMzM4YjQxMzJiICBMSUNFTlNF
CitzaGEyNTYgIDc5ZWU2OWYzY2VkN2MwNzc4ZDIwN2RmNzZiNGQ0ZDY4MDYzNjk3NWNjZGEwMDJl
ZWIxOWQwOTE3ZmNiYTNkMzYgIG5ubi01LjMudGFyLmd6CitzaGEyNTYgIDIwOTIzOGU5ZWZmMzk5
N2E0ZTQzMTc2ZGFkZjdlNDFlNzFmMDc3ODRkMWE2YzhkODkzODA3Nzc5NzZmNWUyZGMgIExJQ0VO
U0UKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvbm5uL25ubi5tayBiL3BhY2thZ2Uvbm5uL25ubi5tawpp
bmRleCBhY2JkMGNlMzE0Li4wY2VlYmU4MjYxIDEwMDY0NAotLS0gYS9wYWNrYWdlL25ubi9ubm4u
bWsKKysrIGIvcGFja2FnZS9ubm4vbm5uLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKIAotTk5OX1ZFUlNJT04gPSA1LjEKK05OTl9WRVJTSU9OID0gNS4zCiBO
Tk5fTElDRU5TRSA9IEJTRC0yLUNsYXVzZQogTk5OX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCiBO
Tk5fU0lURSA9ICQoY2FsbCBnaXRodWIsamFydW4sbm5uLHYkKE5OTl9WRVJTSU9OKSkKQEAgLTE1
LDEwICsxNSwxMiBAQCBOTk5fTUFLRV9GTEFHUyA9IFwKIAlDRkxBR1NfT1BUSU1JWkFUSU9OPSBc
CiAJUFJFRklYPS91c3IKIAorIyBNdXN0IGJlIHBhc3NlZCBpbiBlbnYgc28gaXQgY2FuIGJlIGFw
cGVuZGVkIHRvIGJ5IHRoZSBNYWtlZmlsZQorTk5OX01BS0VfRU5WICs9IExETElCUz0iLWxhdG9t
aWMiCisKIGlmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDKSwpCiBOTk5fREVQRU5ERU5D
SUVTICs9IG11c2wtZnRzCi0jIE11c3QgYmUgcGFzc2VkIGluIGVudiBzbyBpdCBjYW4gYmUgYXBw
ZW5kZWQgdG8gYnkgdGhlIE1ha2VmaWxlCi1OTk5fTUFLRV9FTlYgKz0gTERMSUJTPSItbGZ0cyIK
K05OTl9NQUtFX0VOViArPSBMRExJQlM9Ii1sZnRzIC1sYXRvbWljIgogZW5kaWYKIAogaWZlcSAo
JChCUjJfUEFDS0FHRV9SRUFETElORSkseSkKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
