Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A235C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2189460693;
	Sat, 25 Jul 2026 11:09:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSpFyy94l-UF; Sat, 25 Jul 2026 11:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD0DD60674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977781;
	bh=2VDg6AFYrtmfTpAXihyVzdRJoC+D9oCW70zA2ozF3yE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=B5FxgK7HQsEYlbrowKUd56ZnfC1RBBn1eG2faHrO6pKNMPU7JPhxXiURVov9M0xle
	 6SV8yzYEcrQHOULNQgekoNXCUub2jHdqofk8uj2GpK9nFswaYDLdiumQR4M6q7SLr3
	 N5SYUxWGV+1V9tE0y7wZh5X8/XNU3vw8zF3Ma/l3XffyKdr9XsrYNyLD68WLTgZLuj
	 kv/ySza1Zn66UGjCY2kL0sFsuluW5eLNoIh9FMWIG/p06iOe0np0IEz1Wlm32Lq45I
	 jeE2ePbtBB3Fdj/Ip1E52jT/GiUF/IQBtJOhIuxkA/8TCbs4KEOw8CBQeuIq8gDxDa
	 WQbvVVQFIztKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD0DD60674;
	Sat, 25 Jul 2026 11:09:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F25D977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6509940769
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZ8aRbYe2dkO for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:09:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51EFD40767
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51EFD40767
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51EFD40767
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:09:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6E55213F8A2;
 Sat, 25 Jul 2026 13:09:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 13:09:36 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 13:09:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260724174318.324344-1-bernd@kuhls.net>
References: <20260724174318.324344-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <69311664da7501ca978f66f43f2f614a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784977777;
 bh=LllBSztw6Oq3yTAiusLSaR6PhqtZLkIIYekcUJAM8co=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CeC0ZWQlAk2Q9lya5jQStRnS+seoaTy55auxnuuEDRGbBN9cilLzBwo/eknmJ0xNK
 85tHiXjtB+BXxBI20SFyVt/tnKy6nHNcXXDQbP+qTAvMH1OHmBIofRJl+C2jFN8Jmc
 5oiJJjWZJThfsxeWs8ljwbA/M9OGC2EXEhikF5gHXGs8yuvF03M54ahzvylqLLFlhL
 pJuPVVi4owYwdmd/9viO4goF1cZ9OaVGfyWGa4fotzPPDU18pBeVPd7058SXrY8LWQ
 N2Y9Pk2iH2uNbJrmGRsh8yS07jTMogrA09cm4EDcDgwMQhNlPi4PSozKrTncL48XX3
 VhZt9UmGchLlg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CeC0ZWQl
Subject: Re: [Buildroot] [PATCH 1/1] package/openconnect: bump version to
 9.21
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

On 24/07/2026 19:43, Bernd Kuhls wrote:
> https://lists.infradead.org/pipermail/openconnect-devel/2026-June/005539.html
> https://lists.infradead.org/pipermail/openconnect-devel/2026-June/005540.html
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
