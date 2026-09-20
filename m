Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF95C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E7580F01;
	Sun, 20 Sep 2026 12:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AchbN79lNpDd; Sun, 20 Sep 2026 12:23:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2F58C80EED
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789907027;
	b=fLZGzikjWUTDk6fMtNH/YaLE2cNkDW7y3Rxya9EB0HLNCrRyQYzNBaKGZ1c5I0lu9oA9
	 gKJKmtOQ9xFTOCFghIw+gIyoDReTJfVA1QJTa7nFFZGmcNvKeBNmqcJNbAsUQ/JIX9qj5
	 puvsAUKJkxNQPwre0EjsO/jEOKSBt4bZcMrLFg6dwOjAqluIlB4bEe7+Gmk0iZl/9iiyX
	 Oj/sp/tl4y+vWW7X+zMLX2at9wGkYbgiKeaByVCZXnxQG3aEr33a4R79MJ8bTLMNj8h1n
	 jtgDqlY6h1srUa1bOc/LGtd4b8Lo4Uq5nmzJKhwO+v3GNXUGtOnfIkyvQx+iw621uCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789907027;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wicC1PT/fTR38a0s2fl23FFEEBOGI3yH/z4MMYcLLsg=;
	b=pkAfImCm0DK35G405hq88t6av0BhNrrqxEfO9ZIpAOZveVS0MQk3qi/hJWjwrVrd94qV
	 SIFaoRc6ksN+JTs63vdK9qKXSM3YSCzG/pkRR8gsEBVwaUojwdt36Y9Y3V3pQRqDzGk/8
	 HpYvMxNf5XrUrGA8dAriKW8bYLaurxTpbOF4VlOAc40+DHx7AAhZXWqHqzLmn1htv2yqo
	 Isif8OEMnC8mU2+wWKY6FxEomP/iNsrHT/5lSglVrCPm/5kij4VS5YWdc+qCl0m0BnygD
	 bOepLYEqv1gb6SktE900Jkk8QIYn8CDf0XEge/8n7zY57sUR9PYcJK9ICKwbqSdUTUg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789907027;
	bh=wicC1PT/fTR38a0s2fl23FFEEBOGI3yH/z4MMYcLLsg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HxUYNrFZU7/1xNIMMawYYIQnHQPlo7y4e5dNvGBIQnMGRjfliLFmC8AsjKk/ubVv1
	 P/kxFiNBai666EZd6fKl+FqA18r6wQXBzp1VeVae0SBQ8b7GAUaPC9WqXx5LsWtYGc
	 LYYMIhwuJdg0NE9EapBb7e+SScCAxnbv5RCV6he4yMrechP653rkmi5jxfni+ElA03
	 MDhp0zZP5/samuiszUT2N+X/DKYPaxQlsN/KqWWPXgoyYoEsGmIRLNoY44jgKpx4YB
	 D4+s2KfBKoeFCqaQHRrPSyDEq/X+NGsMllTJdS8eBNFfTFJwggVAmWuTROFIK8Gdj3
	 V7bp8TIppSf3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F58C80EED;
	Sun, 20 Sep 2026 12:23:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3F113AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA2204081F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHdz2mpBZ-E9 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0E74840811
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789907024;
 b=PihNt9/f8p2PTnSgoZ+p2kQ3KH2YTthgxathUHL2kptL6CIls/G/+wbMVsjtmhQs+KZB
 eQ4lxDEDQWqeRXgaDiywwTzq+qOX6egpyB/nTP/mZrk5qPGXG5Ug9WnD0P4IPdwRmLShu
 sgI/mB8kuuZghXkfe0bPvjmGiRqfuWJwQ+L5pQtaM8nq4CiaP/17Y5HRPsPxii43xt2LA
 8l/kCtXKDSEFBzwKLpnoqjDdz7oPfgZMTfAxrJxzYHoag0+Ce0ZGtYHZMadgQ0VUK8rbl
 0UQc2AlM/UHKs0qEaEmzmUFeg/dk9fZIeTt1bM8Ln74y1bhGmw88dgTzKJNb05THvCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789907024;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kT3LMzg/AcAeV34BvepmGwyMcqPiJHuIWJCsQzbu6rI=;
 b=YG6YqH0dEGBfTOQpEQJjyskZeiQcPuvGbkdsaO4p4I+firkp61WmzBDElojDG84m/Wfa
 VHsZbtFJc9SGOhA/gUgA48YIAza3FjTIUBYkcjnInGtd56b5nkv6AEUmthhfC7IOmIuiZ
 orhKqEPyhIFOnK+Ddnz9C/FG0kM+mbugmI/qzxvYPvvOp6I/1hcBnsGFlqyNmJVS/bvgx
 jxGlhG3J/sl491CYztnN9mchsckTBH8IT9NBadO/w29+sqym9FEzzKzvlKZ4eNPJ2C1d/
 cUZnilFylfg2sFa390y4WS5RUFySfA1e08tfZoSFMunK0QgMsLXH64nMh8P2+BkLmnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E74840811
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:23:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4E798D9F0; Sun, 20 Sep 2026 12:22:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:23:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b0424588200cd1b067bc50ff265a333f35a0321
X-Git-Newrev: 69d99305e53560a4375eb93d089e042bcb435148
X-Patchwork-Hint: ignore
Message-Id: <20260920122235.B4E798D9F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add systemd support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69d99305e53560a4375eb93d089e042bcb435148
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When systemd is enabled, configure strongswan with --enable-systemd
and add the systemd dependency. This builds the charon-systemd IKE
daemon, which is designed for native systemd integration (using the
systemd libraries) and is managed by systemd through a service file,
with configuration handled by the swanctl backend.

Pass --disable-systemd when systemd is not selected to keep the
build deterministic.

Signed-off-by: Wei Dai <daiwei@sunkaisens.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/strongswan.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 8eb349b4a2..4927ae0e75 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -70,6 +70,13 @@ endif
 # setup piddir if BR2_PACKAGE_STRONGSWAN_PIDDIR is not empty
 STRONGSWAN_CONF_OPTS += $(if $(call qstrip,$(BR2_PACKAGE_STRONGSWAN_PIDDIR)),--with-piddir=$(BR2_PACKAGE_STRONGSWAN_PIDDIR))
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+STRONGSWAN_DEPENDENCIES += systemd
+STRONGSWAN_CONF_OPTS += --enable-systemd
+else
+STRONGSWAN_CONF_OPTS += --disable-systemd
+endif
+
 ifeq ($(BR2_PACKAGE_STRONGSWAN_NONROOT),y)
 STRONGSWAN_CONF_OPTS += \
 	--with-user=charon \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
