Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92576EA8109
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 558C8610EF;
	Tue, 10 Feb 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsI7BdevTd7j; Tue, 10 Feb 2026 12:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EC2760B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770726727;
	bh=pWTLPN15bRMnvzr7AphJ7jqybIHUrU35jfjSCVxcGFU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K4kAS8TJlSUe6VGjDf+ziKp5nSR/WjfomsHmQpJCKVuksY8EL5X0IcI9MBtS8zd0f
	 6WAn5ZoILrrFMutod0Qvs9/v+eAPUJlAgGV67HYbDKkOYw9DVf9T6BvIOCfvPGMedI
	 /cD021e1QjU4yAOnm+dMjksfzVcWnzhj0mnSIpvvZPTLvUvKm9VDoxTcFXLkuKc080
	 HevlHQIqcVGsWQArmamu2Vx7s1KhYdKXQHr/q+3rpj9hS35UgqgiwHfK5bZ34Dktwe
	 BhnXsm1k58BQypQa0E1nP/tliXCAH1iYJ1nXFQicqowbmznVXkOj0xJPOfywQ0qjr8
	 8cANv/XrpGtAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EC2760B10;
	Tue, 10 Feb 2026 12:32:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BAF041A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B28D840591
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Y271sJrGQU2 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 12:32:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAD2F4074E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAD2F4074E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAD2F4074E
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:32:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D0D9119F5A7;
 Tue, 10 Feb 2026 13:32:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Feb 2026 13:32:01 +0100
MIME-Version: 1.0
Date: Tue, 10 Feb 2026 13:32:01 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260210080153.767847-1-peter@korsgaard.com>
References: <20260210080153.767847-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <ec12df9fbbff4dbc346c7d321bdc9f6d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770726722;
 bh=QclUSG0c23RdB/IIHN9Do8azYj/5n28mxHe7//OblhM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HP3KQgajDDkbt8EXRx7cCwxIxIQ7Kb2edK3OKs/KD3xbmM9MLQBYZxNqCx6qk1V90
 Ex4/4PPwnIBMS3RRG13PufFsHRCyvx6Sr7F/s998HarFgRZ3P2NCcrWJgX3fleRoPr
 /dVt/pUt9A1ZmZNhLU6vkq8iGqRpaoSa1gwx7MtM5L/GhIcsra8SsOVShEs97C4wtY
 LdnOEj4dUGikWrMiunpugzRan2IG+XpNz+pxMfPG2Aht7YDhFlfxc69OmvIzhpBDCJ
 piffAICKvvZxOFt1RAwWaUIwKTAKEYLwSeTyvzhLNZtjnhKQSBR+CBrslP7nhqcgUU
 xGX/a90ldBfwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HP3KQgaj
Subject: Re: [Buildroot] [PATCH] package/gnutls: security bump to version
 3.8.12
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

On 10/02/2026 09:01, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2026-1584: libgnutls: Fix NULL pointer dereference in PSK binder
> verification
> 
> A TLS 1.3 resumption attempt with an invalid PSK binder value in 
> ClientHello
> could lead to a denial of service attack via crashing the server.
> The updated code guards against the problematic dereference.
> 
> CVE-2025-14831: libgnutls: Fix name constraint processing performance 
> issue
> 
> Verifying certificates with pathological amounts of name constraints
> could lead to a denial of service attack via resource exhaustion.
> Reworked processing algorithms exhibit better performance 
> characteristics.
> 
> For more details, see the release notes:
> https://lists.gnupg.org/pipermail/gnutls-help/2026-February/004914.html
> 
> Drop now upstreamed 0001-audit-crau-fix-compilation-with-gcc-11.patch:
> https://gitlab.com/gnutls/gnutls/-/commit/f5666f8f1f653cfe2bef808a9c9b61534f279ed1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
