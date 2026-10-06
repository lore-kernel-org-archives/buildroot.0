Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38E8CA5FFF
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 19:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4389460873;
	Tue,  6 Oct 2026 19:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ffRZalkZB1s; Tue,  6 Oct 2026 19:03:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F354A607C9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791313409;
	b=in0xwfUER8+WU5gPP1mpcWenOQsyVPFUGTiEQYP/M39DqRqS5Fun8S2Q7RmP9Axgh2mG
	 9pIYqbumxJypR1oGj7xP/C5FF3m76eXfa376YBBX00UGzvUwQrzDlsEK9sz8wMNmZd805
	 M8p15AkH46MDyRXSkyI+3Ll+EJb9IWl8FgjXMEj7UuNa51B2t2K3ZLv84wG9/F3XfdXAU
	 X5xVyi9OkSvB3YtIYBtb8VaPJsjUZbzv/pf2TJYjLF54IDgl8I39rP1lzswZ1PHoVZEvN
	 XJi5ZzctPYVfgyTjJWjs6wVxzMB8VhZ0gsKdUepVIpAnYsva//yN8sH7P+DZXjKh/8g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791313409;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jsmQ0xuPsDEqA3m0BH6ZHN/iBqQQL5Opc59mZpAC9xs=;
	b=V6t7nhEIjifnA9NeZPd9FcVRrL9/o863pNCABAcaYscfRE81w5z2n4qXMHla7UrjC8qO
	 Yk5OulZjuhuWlEDX3ub5mKwOaOCidPiRCsgmI+4336sNfwCMgZ2geqHkQ0wfbSF79gSWa
	 H10PfgxKbVPFlyd2l0OGLIS+j3CTcOh2gaH8I4L7mHIkEXL2FysCdAXc9mE5/EQ/Yty3R
	 DejyLAu2gJugPJensJfIZ0S/nG0vmfTM9Jv2WE8ItvuvJ8Zs/8Js9GlHVWdDt5dLh+/T/
	 oo/aJRKnv6iF7i/BVceiwlMsGlR6vbEmvvBYzdGSNmgsZynVjnESIwSAmmQCG2ceKcQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791313409;
	bh=jsmQ0xuPsDEqA3m0BH6ZHN/iBqQQL5Opc59mZpAC9xs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=qFyttbj7NX7wDRFSVUMiA+bTpqR6E8vbtLKTaV80cHwe1WanqpB6RqatF+waD8rhf
	 orGzmPwU5Bph+Iq+UB3qgUQEi5cKkVx+Cwbk/7qbHZlH3qTaQUGtr4PnOmmwyuUFo5
	 FfbofCYTzQwtCj29pddfnmjO6C9+nCxFm0p0W0J3+N+QqCDt5xudaVVH6oF1NejrIp
	 vpenX06HBWhguRVI2f4WgZ7q2w70m07RJf/Y1OG/gmnaTRpU3JRrAeD3yP+V4LYhj4
	 twOHWqTXPd/58LTjjiXRwCZHRK9Uim9A6tyjvTG2vzcTe7M3Ws6QiyV2eadO9SnEsc
	 I91SKHzlkNPxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F354A607C9;
	Tue,  6 Oct 2026 19:03:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DBD4322B
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:53:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD1D402D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:53:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PX8OpszxA6lL for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 18:53:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 76BF6402D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791312782;
 b=Pf++AJUX1yGitxPdA2HLK5sSPyOp3fw9eoN6txN+KaRe9t11Tpb3qUUSsyPV/AletqcQ
 lLQp3CKcz51Wcu5USd+Ca9el9HxA2yGRE9S9dVRmZca3c/PVFl0XvGr7GadNs0rqPZ2Ii
 nAfwkKpBEjLvTp3+F4YBME9PPc4LZkgXhcEvN+ub9vwyzMybvnJI5o/rX/ZoUFCW8i55r
 ygtElE+0BJ2qliB3fxlBipMXZcj2mIpY/cGRWeg3SxeevMR8v9QdvEd3Ls0YjvCiuHkQ1
 TufT+e4IJheE6mW9C+BKZZzhsx9DfTQNf7CgJvMRM29X84By6TXBpS4y8XMvrgHrs6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791312782;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=wo6R2cREGsFixG8BUMn3OxrUm40XLZ8omlM2xf7R/fA=;
 b=fbzVm0er/H6gc5tfy1IYsl07/x1kunDUFl6Y0r1RUFtNqwRvBeleHz+uvMclWFBK59cQ
 p8S6h7OGsqPjkTzZ7hXDE6spe+QyU1Vq1zJXcbQi2qL51ImsEtRKFe7jDEbakD7sFIs10
 odHv8wlSEBpfsy0CLHGR3YFcvsBH8z82Qf5Exz87eKy+DcYNZfGVzOZHzMHuxy/3ICXI+
 mwOVZQPu6JCCBTxYzNbRWOGoDVbwGWwjdBDdk/qw/iGghp6jX4yW0rjwq3ocPAhGryQqy
 QlULshHfPtTa74WjcatwZMarRfYBmsR378uJ1FCIwLw/e//TsjZuTAcqWLotqcZnOuQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NF6P0M+N; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76BF6402D3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:52:59 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso31331675e9.3
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 11:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791312777; x=1791917577;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wo6R2cREGsFixG8BUMn3OxrUm40XLZ8omlM2xf7R/fA=;
 b=o/UqPXvxQix46XskWxQW34rXtgrJ6fh4y69FlsUr5eXnDgu/bRmIFNzxkRykt82Q9n
 Z+LaeJZpCT3hy+kwnzMxiGXz6vszd4Fjpdlguf+HdvPzZe9KMgyTS1rE4IZWXYzJVqDC
 zWy0/Qp9c6Ap3f+OCwJv9LMBAq8XqbKE5POSyvkUJa1W0vfxw9XYj4zTCkMB45vZFlj4
 WYa9V+biimH3XFKw2AS2PRZo2OFXYXbE0KkqlG7H2Tt+98YOyJW5dU0earO4Xu3vGuFl
 aCnCo5pWtnDspxXzwPeO9jyuM/IBEuQTkriGJxRWKRquTdpRZDJ/FZL7v5FXTMH3KueG
 6f3Q==
X-Gm-Message-State: AFuF++kNHTuSg5vNQkShHC63CzlbImXc14pVSMWCo9w/7HFxKecEO5dr
 G3fhZV5HmyJDJXIYH39/B0S9zTx/jiaswjFGmvfyQiTYteTpJRGq1pi3AneECUQD1/vvVmdWMmU
 5RHdmoes=
X-Gm-Gg: AYBFou0OCwMirjyysdjh3k/uRMMDdKma39ssNDO5rlEPvLXOC2sgcybBaMvmzYU71/a
 S5rnBdohO9uMdWH2lFdrlJMFz64VDN6SEg8VUOhj0UgWAsyaZFjw6e8fPiFskVBVMNa76i29AoX
 3DuLHjyXqA9yf07pdpAZZ+EieE2kFwgNsL4+7yR0UZ1I8yFgLSQhExRQjSbSuGYzJAztA/0ptYu
 F0aTHIHIPaoGhthdvXWXm6kOoYQ/ahfuusw6EiVxxZ9t2pbrdEgZoaiBOSqlunX5/mX4iMsrLeq
 GhUO17+tHEkGCaSZ/F9L/afDl08Tg8uJT30fuJGczpjyoTl5R3SfUIsqPT0AMaRLJ1GNXFRe+TA
 cyHsWP1V9/E8nZJJL/uxa3ZaaQZQrtZNwE3dMZvgleCubKbEaYlIbvy2MXTG8e62cd46b1XTg8w
 gwcpqKfWf3EcUSFGd1CfcGxXaV5ygOYLBtIwx3ZgtQUIVJ4QXo3cyrIukqOzuhbOYMD3pAZcHzH
 EoKeualgTDawxUP/g6ZGZ3pnPaCdXGAk0K6iGkEyEyvBpkIvSdtq3d9SgBNLUEz8YBhaSsZIkxa
X-Received: by 2002:a05:600c:83c6:b0:4a1:7b87:8d34 with SMTP id
 5b1f17b1804b1-4a17b878dfbmr34334065e9.21.1791312777610; 
 Tue, 06 Oct 2026 11:52:57 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-921d-194e-a4e0-3a75.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:921d:194e:a4e0:3a75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178c4008esm85927315e9.6.2026.10.06.11.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 11:52:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>
Date: Tue,  6 Oct 2026 20:52:40 +0200
Message-ID: <20261006185240.408314-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/redis: security bump to v8.10.2
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes:
https://github.com/redis/redis/blob/8.10.2/00-RELEASENOTES

No CVE number are mentioned in these notes, however it states:
"Update urgency: `SECURITY`: There are security fixes in the release"

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index c3239337d6..e0dc5fc521 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  60166c95ab7aedaa9dfe516de685be0a4dd87be95ded59ba429df14c13f1b663  redis-8.10.1.tar.gz
+sha256  b9ffee226b5eecdba98a679260dad764b2a4ebd90dce4ad5ac9e9f3eef9c02b3  redis-8.10.2.tar.gz
 
 # Locally calculated
 sha256  4a0e416b9537688f30dfe69ddaceb2ca64d96b7df02a0a6760d376890ddc4e40  LICENSE.txt
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 30142bc0e5..8b03f79cd9 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 8.10.1
+REDIS_VERSION = 8.10.2
 REDIS_SITE = https://download.redis.io/releases
 REDIS_LICENSE = \
 	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
