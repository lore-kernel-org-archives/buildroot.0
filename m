Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF84C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A43B340B9E;
	Fri,  4 Sep 2026 16:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-Txx_J3gvM4; Fri,  4 Sep 2026 16:22:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DE1B940B38
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538955;
	b=KP72ZJ0j4ip0HFkcZGExwZmJMZ5/zNS2UoAPCYoPpJuzBEH7Dw0qrEWspxqyNGrWCAXp
	 0xEZgZSmMSYHi60UO6kD2zjDBq7txxor8293r2x+7r8P4ipigLSyV5KzJjqNafaGoEUeX
	 her99gi1HmAqFuiiMcS4243oyWKaVIZ0D0cKMr3BN8T9u8Ci/SMvqSZBs/2oRKWEujK87
	 huaAigwcjdZgo1esZBliWeBtDWvRmL94BuAEHjb1b/lOYSm9f8s7Sds3QiD9rQp/CICwh
	 FSc7JCNyFV4iq+qO1vdduprTh7hwspG3eOs1hc16qtEwi8YuwtGe1XZkKcxEjFXUcSA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538955;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Gn49qpK/oqQzoHANmAXuZET+pU2ej4VMqo5juJE0vd0=;
	b=FAqKqsMq+e1OB8k1FdIrJMhxfOBQ4+ChylCsR0gQDsNahFy4kjLos1oP6vDlSGbKyQft
	 2d2y7ErdwRzhi1GIw+whVJEYzhUaDkQl7l4NX5Lsgh0B8o494/W7wEMHMIcJuywxmGfe6
	 +tVTJMotRUqbMTWPapNXH+zP/yG4hHKotDpO9y1wZSPr+S8BbZ/tlNLcJcIZ97IwEoI+K
	 QJ+IxIeRXkrUuBli2gp/u17I2oMwHG6Xyym1HIRsR6YXEgV4C9hM2PruH20BPwEIjKWUY
	 +zooBHsX3KsAC6EHg18CNvDAW03tB0qLNdy1xXSRrbkKeODZiOpG46+KIUlcWX3Mwjw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538955;
	bh=Gn49qpK/oqQzoHANmAXuZET+pU2ej4VMqo5juJE0vd0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dWO9zbXa5KUXRoJnfivkz6kg1h3hNE7+sKWbbdzwYWnUNhMtCQQt5F2b1zYq3eEDK
	 ZY53tQDXQTsDgEx5w+8SkdGH+8gsr+iyXXqPIrAxtEIb0SaNw2OD/Qemzx9Oi4cB3U
	 6pF5z45/5pojjqOb+TkBhrtcuBOV7LnFDx9IrDWWxRha+bgepVp0rrkqF7KVzeU0Oi
	 AiCHiQnCfAwMS5cpGyed3P5ROzpA+oejEC7de4PvTUcxkC8THd7SezV1ZSoO5XQA0+
	 ixzfaCAFTe3cOAyA3oaf4OB/4M+Tri3pBdIOFgNpuW98ZWfdem4brqNK0oSq1ee8Te
	 f6Lki+Z3N02NQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE1B940B38;
	Fri,  4 Sep 2026 16:22:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF29710E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9514A40A68
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PozX-PO3m-X1 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 937F340AD4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=cA2j9bbDiWsruBn6seMzsonitxVR06MIIWQ0d4pxRdOsJkPSElsDEYuu1E+KUR9xlerc
 uh/M2OXrU6Qy+lgczlL9o0JspeEKL0nNPcd+G6WWp50wziCDkVXAXNpgtMUdUYd+mC+3X
 lNmvl535tsUtkVfBMpnBm+OZq0q5nIUOfwNn8B+8P86EkPWZCssYd+zqzWvu9Jtmo9sJw
 UBZURJ4pUthdsdOG/KmYJxsQ7p43vWgrV4iEqpOha5uFMUeItOIjXOJJryPWf0aRTjwPr
 9GaEtsJbhVcTqTSNPrmH7GrmEwfAtNyvkofkT30w4OALHY8F09ilTAaBqzpxkHnTiIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uS6zbbIpawCgKUaopxmdAb60VsT8WDTNlHYLoQ4+LJ8=;
 b=mx9j3xaxFXN2HQSvRgmgpsAZLRECAVrjpk3nEk8ok8RlbrgJs+oBhZGWGTY3KmVzk3tV
 2mrwAJvFr91hvODOTUkji5eb1Xkm53iu380Ti3ex9WPrv2AkIRaAZyTJraGlvQcaTKwSf
 tPPuBr5PkSgR7Sc8CysMsTx5VHC1/PrxgM6ow5YeUoAU0UqH25C/iaXNAi2bp/z20lD0M
 iwgellHJJtEIghX5032/n3Q32+55c9y8kWPYI95y7ebh2sZvNY4P3KB+5H31PbkohvaNb
 D636cDjEAjWYTqVFzpuJa4rsin8LVenb0DNZ8/UkZFO7CtwQqAgVymp6gw+VpXRQzLg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 937F340AD4
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1264194C40; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:56:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c18b1668b068e48364fb41c1d62a7903b04d03c
X-Git-Newrev: e9c340a3947b7ae2c415bdbee6f76b568a257424
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.1264194C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: add udev optional
 dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9c340a3947b7ae2c415bdbee6f76b568a257424
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Udev is an optional dependency used to directly control cm108 sound
device gpios. It is enabled by default since version 2.6.3:
https://github.com/cminyard/gensio/commit/c1b5c0a214b85026f1d8c97bd79aae038fef733b

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 8fc21fab01..0c3ca5e03b 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -34,6 +34,13 @@ else
 GENSIO_CONF_OPTS += --without-mdns
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+GENSIO_DEPENDENCIES += udev
+GENSIO_CONF_OPTS += --with-udev
+else
+GENSIO_CONF_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
 GENSIO_DEPENDENCIES += host-pkgconf libglib2
 GENSIO_CONF_OPTS += --with-glib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
