Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2941AE668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 16:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF21840818;
	Sat, 20 Dec 2025 16:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tLZfJ15w5rYY; Sat, 20 Dec 2025 16:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46753407BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766246834;
	bh=1z1UME25Y/ZQ4yCHCqQcOwMI46QlqTVhfAPfz9lwFhQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kuf688KaAogmTwRAI33GILj6GipChgkutoJ0k8w5Y4+oMG6krv7OsT8kPhFtUMv+4
	 6jc9yDIyyId8bw/KdKKMrJdwzUT+bAKoveO/KyBuBJcHIp7SW/dP0invJ1vodnCLKK
	 xpa1fAXAhxC4dtTLWsMuConlgjoxEyOLMXhwngSV7DwNvOHJDcmtbW8yIuDOHUHFmc
	 6zcNE+Z496HEXTyFvY+rM6ch8EK3sX6KkljW3Eu76bnMRyqB0T4Sn3sgGH8f5U2tac
	 8hbMT2svyMNDQdWxVIMyv68DO9KommM4L1y40w1mdPIU7LIELbyHs2EpFL5UXMh4fr
	 S3WWUUFOGhTfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46753407BB;
	Sat, 20 Dec 2025 16:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7521A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F27C3400BD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUyMC3F6pflv for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 16:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D8E14008D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D8E14008D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D8E14008D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 16:07:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 32F2219F5C6;
 Sat, 20 Dec 2025 17:07:09 +0100 (CET)
Received: from [37.167.178.5:29315] via [37.167.178.5] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 17:07:09 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 17:07:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215212924.2618218-1-bernd@kuhls.net>
References: <20251215212924.2618218-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <ce340fb730342f4596f7fd5de5bdf80e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766246830;
 bh=mC8mpsm14VB1avjLjKpVOly6bFzve4cRG9azw+eN+rA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GZEoAOr5Lk9dL1f6LpBCU88zAMB0ydqQS75d8wvWqzhntjkABHgOuwYDffxMxP0tj
 l4Qhb04VhK71VCbCKuV1OI7c0cOBf/cCExobbupcymTR0l3K1i9UKnj9OfFF8f5VZV
 E/xABWf4z63INYNUnhyypvEYSiCSrtOi+4/4eLWdxAkurNHFoWo+VlSyU0fzC8Go3x
 UHdVqa5o+HUDK0JwC01Odz6J9SZepnAkkeqVAxlqDCeBVRaRNMjoX+6w8Pk+XA1rRB
 yF9xQwJJ26JBCeKLEmMCFMjXB+J7N91+ru2wGRKyyTPWp5MOmYEpWDvhNW1qG1juyd
 X7cpuCui+oX8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GZEoAOr5
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.30.1
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

On 15/12/2025 22:29, Bernd Kuhls wrote:
> https://lore.freedesktop.org/wayland-devel/20251125050917.GA854973@quokka/T/#u
> https://lore.freedesktop.org/wayland-devel/20251208024732.GA3642318@quokka/T/#u
> 
> Added optional dependency to lua-5.4:
> https://gitlab.freedesktop.org/libinput/libinput/-/commit/9461d1a9a17337c6ee5a4baee836fb9b9e12906c
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
