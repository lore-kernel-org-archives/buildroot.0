Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE00FC5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:44:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC0A60DC6;
	Thu, 13 Aug 2026 20:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OZ3L_jkW1pra; Thu, 13 Aug 2026 20:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCF3C606BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786653849;
	bh=AA1AcBbh3WEQoBAL+Fgq9ANaspjqmtUPyxcvY+3DNMw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NC/C0Q1C2JXtUHTRzORuc0tnuAvzoUxn5nJueLBKzi+ooTUMEUC1Dnci+wkB91ZVx
	 ZjS9/mjNmVBx9DJVWYQntdRoxq7WYglAVkrhlwWwammT407Ez5dRViqnNq0Vz4+eSi
	 7bhIXJ3Mn3UumLiYXGiJa/aHN/pJzx+T1KMa0SLjhbto7WdSlE4N1QJM8Mjh3s7wid
	 61B+IcUwmmhmpodxWJcVNk+c+FJGf62YxgJowrZUwjBxa1M4bi/pDXD+QvnbjWOUsA
	 TGvPRrfw/WBLY9BYnThGruLQ9Yu2nlVyJX4FzfQThuKfIveC0Pr0T4DhblG8uox2TB
	 yhh2DBwIbQOwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCF3C606BF;
	Thu, 13 Aug 2026 20:44:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 594D923F
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 487A880CC3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2JrfgXrVyMg for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:44:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 95BA380970
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95BA380970
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95BA380970
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:44:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0973878034E;
 Thu, 13 Aug 2026 22:44:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Aug 2026 22:44:02 +0200
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 22:44:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
In-Reply-To: <20260811173719.88537-1-bernd@kuhls.net>
References: <20260811173719.88537-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <c8978f9379f77db347fe01887dd6c8d3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libmicrohttpd: bump to version
 1.0.10
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

On 11/08/2026 19:37, Bernd Kuhls wrote:
> Changelog since 1.0.9:
> 
>     Fix race in thread-per-connection mode on wake-up signal
>     between daemon and thread that could result in lost wake-ups
>     and thus connections that did not finish processing.
> 
>     Fix rare assertion failure in relation to suspend-and-resume
>     processing (harmless if assertions were turned off).
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
