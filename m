Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62936F5A8AA
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 19:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 738FE83022;
	Mon, 20 Apr 2026 19:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bcU-wMkOgWzD; Mon, 20 Apr 2026 19:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF0C782FA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776714259;
	bh=Hf89C3z2TGWI74THEjf0qpVcksILGMecb0ct5szPG9g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eimahiqEbBu6KC3OjEd2zA+EXLkH2ycOaAG5qKEdHUIHyUa1mjOVC+U6265gOq4wq
	 X5XiY2jJIGiLqTwvA+Clp4X1VVjzQrb5TXbapVfeOQvYqKCWiOkEfUzP6RNscY8MQK
	 eqfjTRx0wHvGjsHQ5ooK4U86E5/xdw2BrQh/Icx9v/SoD/9+IVzFBFVW1cf4gY0eHM
	 m9cQV7wTNU9BP/sF8CWKXHJp3k0EkpFGJV2avK+tRoCzHIHTEVbyKbMgtkxSmHi03i
	 4LQZtENy0bWaDcke3n9of4EAWJcb0nzSUJAbS2Nf2dQOEikED9bpwMCKWxaDokTo8l
	 uKlXg1OqGoq+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF0C782FA9;
	Mon, 20 Apr 2026 19:44:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A8952257
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A0B441122
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjfnNVr-rRBR for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 19:44:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C74FE40D9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74FE40D9A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C74FE40D9A
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 19:44:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B3FFD13F8B3;
 Mon, 20 Apr 2026 21:44:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Apr 2026 21:44:13 +0200
MIME-Version: 1.0
Date: Mon, 20 Apr 2026 21:44:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260420175839.3705382-1-bernd@kuhls.net>
References: <20260420175839.3705382-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <7c38f0e84f538ae5b10b276472e5d536@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776714256;
 bh=tWrbg8fm191IPnK7l50dwq61vJmKI5yo7ksUSJFbjTY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HuHj6iOl4Bx+WMlK8trzlBtV8JMcoPU3Mj4aVzHYJaobbJsfdJh40+OWz68fTF9K6
 hizfwT8PTXIQM9hy57ZFsr+jfUqVzSCe/pCmaw5Q+C01TKPflYl+fjzBmB5MwEp+h+
 QbzYUvfZPyQ3VfSCIyn3vUXxB4tvtzkr6fVw4bwkSY+eNx2+NZPP0yNcou6sUNwmn6
 TE3AnOuJMNtnteOADknaTF8QD3mkSHy0tTPseKGPZOCsTJLybbTIv836FLKtXUAahw
 mHclLQcm23Pd0c22TAdX3M5tpH+rVEN1Bl8so4wtPAYwjdSs3iiZ3x1yyPpEm4Elr+
 fMa/h7a9wCyvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HuHj6iOl
Subject: Re: [Buildroot] [PATCH 1/1] package/libpjsip: security bump version
 to 2.16
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/04/2026 19:58, Bernd Kuhls wrote:
> https://github.com/pjsip/pjproject/releases/tag/2.16
> 
> Fixes CVE-2025-65102:
> https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
