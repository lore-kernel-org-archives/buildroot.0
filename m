Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD3ED5B86E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 220E760F13;
	Mon, 15 Dec 2025 21:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y7QUHiV_r__j; Mon, 15 Dec 2025 21:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AAC260EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833113;
	bh=tvtl3BpnglZVbCRh0xUmSBoBUfQI4sunAhaXJurSYLo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FiAP9/sye33qORTM0bHGvJ0VAWciRj8gs2hkiUN4sG/JPiRzzhNkOVe+vq4Fv7ALO
	 783fDvZRc57KlwUz/2oJcQwPRw71I0cEJt/0O1EmBRyIJiYlFe/RZz2mtW8fFvEs2W
	 t2TWitYjzCGmifMb6QPVR69Nu/9bBi6e4gwMLIBCHhxy9i1am7YuHLVGu1SPelEjty
	 zLWnvfE+j1JeWIQ4pXeUPOgqQBoRYBWSikv3NalPLZaEFkjoHrnS+/T+KkVDB+AlG3
	 GHQWbr1Yvij++bEpNR4kngEocxw+BwmpGN+JE1Fl8ZQ/JJP3+z7Jsj4dNqELUc9JOV
	 FeQgJBkjsgKSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AAC260EF1;
	Mon, 15 Dec 2025 21:11:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CE4E255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E49D8071E
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id as9CJDV-t2Du for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25E4080709
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25E4080709
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25E4080709
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:11:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2C71C20039E;
 Mon, 15 Dec 2025 22:11:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Dec 2025 22:11:42 +0100
MIME-Version: 1.0
Date: Mon, 15 Dec 2025 22:11:42 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Martin_Hundeb=C3=B8ll?=
 <martin@geanix.com>, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>, James Hilliard
 <james.hilliard1@gmail.com>, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251213140522.1322763-1-bernd@kuhls.net>
References: <20251213140522.1322763-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <f3e80a8298009902ba17ee213976d47c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765833107;
 bh=Xfywnq6Pff7SeJQKlX7jsPy2fAvjGbgHACz+bGZf5t8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UwBmI8/pRAUUqe6ZKfBHep4h950QWMr4ciOMru7tjJiPN27XvXrAOzUD6IaL02nwn
 o3NRvN7svy9XCbwl3vn9MfddnXPWlYhzRmgjbwaM9icupOvTjbdjn91hE3Aqx03E6A
 xcrUM2PVu3vCfrLHnxeW1oZcAw9Xkz2DeESLpBs3EO5O3uaAR5Mq5DvxCAPBTe/LBq
 Yn2mmT2STcoUUgZcw4htbOzm5GWpEpTTMlqGLOWCah+xVqPgVgh352GD/1QpgobOMV
 kSApgyz6wbaEbvWJ0iX3MlZh+0T30hOpYMRIZFFB1LexAqHVQQpSuSq1UlJcx9TnQB
 BFOQuyTnkIDEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=UwBmI8/p
Subject: Re: [Buildroot] [PATCH 01/14]
 package/python-jsonschema-specifications: bump version to 2025.9.1
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

On 13/12/2025 15:05, Bernd Kuhls wrote:
> https://github.com/python-jsonschema/jsonschema-specifications/releases
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
