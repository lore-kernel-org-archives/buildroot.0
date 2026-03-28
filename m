Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7765A10D1489
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CEA40D81;
	Sat, 28 Mar 2026 21:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oM0ke8wQ58jn; Sat, 28 Mar 2026 21:42:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77A2340D7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774734158;
	bh=7Ijdd5KL5rHpjXZ3dnl0MHjkWKH1EsNy/yH9eKR0f1I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R006/CbTQYfUXAj3+dZnO84rkwKpbT92YkxiE5mVVrOnwzf7GmCbXOajIO27M6jyA
	 DpSVyyIdpOKhngOPgVmCqpghqDG6AXBCidX/N7fhZtQZGnkKa2uKSJTcR0bUi37GAO
	 mpRYQA6kLAuyUFS7kzaqubUEX1UPEZjDcv4lSDX3grT/Y27EbZpVvnAU/9FU1pZ+g1
	 GB/h4ZF8o037Xtr8q0hAZhZeajCB+ayW2BhBQNzMzNoGVt9LVwrZKXnQhDbCmxMEXQ
	 Iu/J5kyMpnqkIPRbcJQcOvhdZ8Z97W3CyWmMQ4yjrIkKwUrOfBdPoylrtx8okQL+m+
	 0NJ910YhleqLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77A2340D7D;
	Sat, 28 Mar 2026 21:42:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03FCD10F
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01C2381971
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7fzS0_aSVcy for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 21:42:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 396548194A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 396548194A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 396548194A
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 21:42:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AA99213F880;
 Sat, 28 Mar 2026 22:42:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 22:42:30 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 22:42:30 +0100
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20260216093535.20643-1-mooz@blockos.org>
References: <20260216093535.20643-1-mooz@blockos.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <b71e7810b7e4535c1ed3d57b2fd277c5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774734154;
 bh=xd2SRYuTnkZraBN8AeXoPUvZAXHfxGAMA4uhQvcxSzE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YODbNjLKzhKSeeMqZQN6xyGbZMHwN6DPX/gNyEOl0lF5jaRHfuHMk1Lu7AqV/ivQh
 fGZGJb7dLx+hINvvg7f7B2JmCMAUxgrNRcDrP/IB2coPXFAfahGVmO1RCaqeJTKQf4
 kL9HCg+zdqPMflB7MngTZVmthN2yK39x/wU3DuQYj9mFN/ownga642ZXJ+f0LLwGcS
 CWRhn+qGfWjI42XcNlxuiWZWfROJ1ODUvJtjDn1whhzkXyY9cCUTf8Meurh35Ursp4
 shURDfAodJD7q0W+IejRQ+MuE3c0zqrp6Q2nUF90mh+KORjr+tzo6x5ryrpz55sOrj
 GHm6XUasT/2sQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YODbNjLK
Subject: Re: [Buildroot] [PATCH v3 1/1] package/libnss-ato: new package
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

On 16/02/2026 10:33, Vincent Cruz wrote:
> The libnss_ato module is a set of C library extensions which allows to
> map every nss request for unknown user to a single predefined user.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Vincent Cruz <mooz@blockos.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
