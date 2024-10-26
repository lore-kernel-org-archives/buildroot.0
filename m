Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35822D10BF6
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 11:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE15A4088E;
	Sat, 26 Oct 2024 11:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TABNYFb2yjOj; Sat, 26 Oct 2024 11:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB3FF40891
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB3FF40891;
	Sat, 26 Oct 2024 11:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E95C5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F4FE60634
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tY4TeW_P6QXr for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 11:44:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6409D605FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6409D605FD
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6409D605FD
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 11:44:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 648DD1C0003;
 Sat, 26 Oct 2024 11:44:01 +0000 (UTC)
Date: Sat, 26 Oct 2024 13:44:00 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Cc: Brandon Maier <brandon.maier@collins.com>, Ricardo Martincoski
 <ricardo.martincoski@datacom.com.br>
Message-ID: <20241026134400.3621f46b@windsurf>
In-Reply-To: <20241009-check-package-requirements-v2-3-df3e7b79788b@collins.com>
References: <20241009-check-package-requirements-v2-0-df3e7b79788b@collins.com>
 <20241009-check-package-requirements-v2-3-df3e7b79788b@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729943043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enhIXtC0YR+YjXoygOZJc7XH8erslOE/RRdyX9lQeog=;
 b=WPos0wOeR2syx495Pntv06b+kyjtAIwaPMOEsqD8RGl4GLr/olykY3/gdJPOMwQbALf4g0
 Gf+6LjNvmk98RIvoO31Yf+5Hv20wNbNQvbbTVToqBIFAEfzKXlp1pSkqTaSO9Xf65YzWjF
 Ftobcpd64pE9EJ2TKajWym6GCqirnjbuBu5kAR1ZBcdtBd5giJ+6V7EJ+HqNz9sOOkpFw9
 uoawib0WbCecWV68SM0v07FDWRtwt0K5aN1iBQXYnxlqo0TIJqCaqsHY41WnVS8ZQbHenw
 E7V2jXCT03DSGWa7k/XVv5OprFcSdF4cC01Uj7TU8krhnsL1XEAm5jqkltRKGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WPos0wOe
Subject: Re: [Buildroot] [PATCH v2 3/3] docs/manual/adding-packages-tips:
 mention uv
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAwOSBPY3QgMjAyNCAxNDoxNDo1OCArMDAwMApCcmFuZG9uIE1haWVyIHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gKy0tLS0KPiArJCB1diBy
dW4gLXMgLi91dGlscy9jaGVjay1wYWNrYWdlCj4gKy0tLS0KCi1zIGRvZXNuJ3QgZXhpc3QgaGVy
ZToKCvCfkKcg7oKwIHV2IHJ1biAtcyAuL3V0aWxzL2NoZWNrLXBhY2thZ2UgCmVycm9yOiB1bmV4
cGVjdGVkIGFyZ3VtZW50ICctcycgZm91bmQKClVzYWdlOiB1diBydW4gW09QVElPTlNdIDxDT01N
QU5EPgoKRm9yIG1vcmUgaW5mb3JtYXRpb24sIHRyeSAnLS1oZWxwJy4KCkkgaGF2ZToKCvCfkKcg
7oKwIHV2IC0tdmVyc2lvbgp1diAwLjQuMTAKClRoYW5rcywKClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
