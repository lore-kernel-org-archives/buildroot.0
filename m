Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B3ACC6B1D
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF8460705;
	Tue, 13 Oct 2026 17:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rcWjvYjf5Y0; Tue, 13 Oct 2026 17:52:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3725F6073B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913960;
	b=kq2xGRFOqc/k7iMEFSSjpfaM2NG6wjsQNnYr4Kt5y0aB/LzgDLaf8PI3Sh7trPmDkt4K
	 b2xiSyKq11C2i4ks4+SA3w4OFYYqSWW/KFh1xBPK6ijhi8PP6yd67I8I3XicYFlzjBYrV
	 1aDY83z2yy93Kr/4zlhZsI4k3w04qL1RQzguiSCI78a/Qv331YRNtEOq8/SXW5RF2Aho/
	 clx2yqTpqBQIKeg5/tYtehL8q+X2MG4/Fjy9nn2nAZoVvwHqvt0OtQxcn1rzp1jHFkdht
	 mSXGvxq23K3vVK+rmwIGSDZfQ/sNUGVstOG8vE74yNk2GzNHD7wfGoXFMnGVv3CZ+rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/TvBbgiPwp8WwoFEXciLDoSJExGDuI8Bd3z1Ubwl7aQ=;
	b=g4qcvHzGuunrhdHW6eYc9eSUtzwE2Q/hN4mKSB84x+NKs3u/99gG1LYIxrwhEHoLSgxq
	 8vp17DRD/cQs/XcVk2KfiFUvFo5sFpYZ3KbX0W6xNkCeReJH8mvIYUFoNFSuOGuPywT5J
	 GJjnyO0Hxg7OLXJC9nprFCvEiPl+NHBfBXy4W7cxJeC3zJwCNU06yIyE6g1VuDJD4IyVY
	 9z3LeBtRywpB9JxLRt/3qSbgDX64onC0+E0W+6fwitizwOcN+VJ1q55X11J2XzB4ryVGa
	 srICfk9/o01mUU3UtiI6tTcmKfUHvutwiUAdBWJ3inNGZZbMZ/slXGG9Fu/K9C0hqQg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913960;
	bh=/TvBbgiPwp8WwoFEXciLDoSJExGDuI8Bd3z1Ubwl7aQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=liqWJ0fTboSWf0sQLisLoJ1HLv3AD+q7q7VfPLcMH7FHqR8L6fpCfO0/+9VWgxa1o
	 X3olrtmZkx8LrtStg10k0nxI6AuYD0Kdue12VYZHZHVKgdBpYEngbOW1ufopxnqxnZ
	 lmmk72rs337/ISF7ff4MuTRov23AIKYP+cqjLQO4s4/parGV1QHva28uQVW3F2RTMw
	 yQXc1ktrj9EfwCDjPM2oZv4nW0yGQVud8EuoqvYcbB1V4JRA8iYh4St3uMg4jzeiI6
	 76UhOjjecNWwGXxdxUqcL0JGpk9nW5x3MASrFaeatKzlPcSUQO1EKi5zXh9NtNpQfg
	 HhreKotafmJPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3725F6073B;
	Tue, 13 Oct 2026 17:52:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 99AB375
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FABE4031B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfeqsmYeRMyh for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9687940581
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913957;
 b=CZMzST8HRBDsaEWCGQf3PzFrbTSM45UveuLXaJKY2iELkeKohwjuJbyTwVjV8Mcc0mgE
 Bog5t6nl/pK7FaqD3dj+hj1ZZGp7kboPcigykRZIL9otvGivXNC9ho/UGKLsPP5RUFfBM
 kk3SnGJqnONmK0VOpfqLH0Wu1XSBWpws9nhGZ4Y6oXrP0P5ThIttkXy6RN5eKT7yVGTQ9
 sFF7qNn1viYuN8J0cvtLpgLu7dfKvOoXq/d3itntAOB82cQYCoV75OIWSOdM9z5InYOxC
 Uaasuf5XZRe6hHzMQTaodunOlCmrRU8edUFhGe8XmKReLIBdxbOZcaYGzDE5ctkTGug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913957;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=/ZXZk/IFdmhwmKvrXP55ibIE5vd8xjzLfaI8hb633Io=;
 b=q6nQQ+cqh6KERTVML1YCLg0y+vecCIQ24PFpqcqMEh8lwHf4f+/MQZbWHbMnay6JMroK
 q1SS9Y4vHGuat/jdHNRPESejMjd6bKE/XCjRjr/J6oYihVF6kxnPyl9jaDpfQW+YIFkP8
 C8fI1uYSf/YtA2z82s/ZcI+Lbo7cZ49etsaCRyF3s95804RMEQAe+mW3Z05A24va1ecH+
 PmMdEmAG1vwaEJbio2l4EfxtzqtGJKb6tAb5Up0KeUYvoimhlh3C4PwIPiM580CVF+eQ4
 y1iowMRJ8y3vmdwGO4en29xypWHxeI8iULwbQZRRSdBXx7xjR51bZ4SsR8RGOi5mBHA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sW94V87K; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9687940581
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3D1281A1216
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11C446075C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:35 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 9570011D7189A; Tue, 13 Oct 2026 19:50:38 +0200 (CEST)
Date: Sat, 10 Oct 2026 11:42:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andrey Yurovsky <yurovsky@gmail.com>, 
 Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <asoIaQLjgxWu_zD1@windsurf>
References: <20261006162106.3439373-1-bernd@kuhls.net>
 <20261006162106.3439373-45-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006162106.3439373-45-bernd@kuhls.net>
X-TUID: FInBAFGWY0um
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 9570011D7189A
X-Spamd-Result: default: False [-0.23 / 30.00]; BAYES_HAM(-3.13)[93.18%];
 SUSPICIOUS_RECIPS(1.50)[]; DATE_IN_PAST(1.00)[80];
 MID_RHS_NOT_FQDN(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 TAGGED_RCPT(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,gmail.com];
 URIBL_BLOCKED(0.00)[kuhls.net:email,bootlin.com:url,localhost:rdns,localhost:helo];
 RCPT_COUNT_THREE(0.00)[4]
Subject: Re: [Buildroot] [PATCH v8 44/84] package/rauc: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 06, 2026 at 06:20:25PM +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Andrey Yurovsky <yurovsky@gmail.com>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
