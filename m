Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ABFE92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 19:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F2240639;
	Sat, 27 Dec 2025 19:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtEqLgucAfdG; Sat, 27 Dec 2025 19:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67577405C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766862572;
	bh=nOg+OKOIxykNKhUQypp8IHV7Q9FgCULyLQRgmU5uFb4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=L+Q+ZoRzfvniHkdcFhPFykcBOiqdhbhUAA4a/x8sjI8E2ZomMyV2bo8NlLNu0XA50
	 HQrKEtdhK5hSpX59vQ4v0XChVHBLQOo1a1ArDF6luwktNqLYwpS38lfhthaToVrIeb
	 2Qgc1sx9ag/dCxqP1fkV60djPmPE2DsLszAPswEcfkKV9Lz7nawF+5NElag3t0oi1D
	 io7ZkTbOw+Sbw7JGCN2du61YlGpgLMss7+3uZPtXiwk3Bh43YwX2viwAZjA46s5e9E
	 tqAxZvuBq9/U5YZohj/msWSL9pJPMG6CL3DBLEaYG2gQhqV792WJkIh9p9dQ+NSYVA
	 XzPl/+WhSS4bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67577405C9;
	Sat, 27 Dec 2025 19:09:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E84FB9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70B6C405C9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6gpzKkrYi6o for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 19:09:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EB6E405BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EB6E405BB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EB6E405BB
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 19:09:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E84AA6012D;
 Sat, 27 Dec 2025 20:09:25 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 20:09:25 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 20:09:25 +0100
To: Alexander Shirokov <shirokovalexs@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251215194716.116592-1-shirokovalexs@gmail.com>
References: <20251215194716.116592-1-shirokovalexs@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <bb3c2594b9de39d6de00653ae1442e46@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766862567;
 bh=WxVwCQSBq2dzIqC+nwHb2dty5V1hUmuTsYJGWJB7Rn8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KijR+LaCEdC11uyWuVNqkGLhNxWOuL+x+GsmJmq8D1U3PP/4+qvsTw+GXv6gw5oP5
 Mbee3gGtl4MdRFSLwkb7JE68ZtEoCADZjbWLd/kwv6ReSxw9H6avya6vWOfpLwVXw0
 vl0MbDpAhULzqFjlNWzfPW906BAw9WYxViJYRQ+VG3ErWJSujiSR+jt73lecWSG0dl
 Kt+/w9hvywy+u8twYaPnoV6+i/EGlLXYthCEA4b+XEnJkdnF2VQuODw/WeAip3Jo5s
 gEuigvai+8PWIn+WWASh7HW3Hen/yw7L04AkW8cAOSW4eL2ZGlX9aWXDgILuL4VKF7
 VrrdmFeexZGXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KijR+LaC
Subject: Re: [Buildroot] [v1, 1/1] package/broot: bump version to 1.54.0
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

On 15/12/2025 20:46, Alexander Shirokov wrote:
> Changelog:
> https://github.com/Canop/broot/blob/main/CHANGELOG.md
> 
> Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
