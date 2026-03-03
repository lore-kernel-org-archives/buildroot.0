Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD51EDA6BC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 17:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C39BB40C2D;
	Tue,  3 Mar 2026 17:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKv37VFdH5dK; Tue,  3 Mar 2026 17:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9333540BF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772558557;
	bh=kcrJsyTfSY+UQDgb7TED+NXHrEm4LqLterTlirRZ8Ic=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sZH0+fSUTFRXNso/vsOB4eaLzwTgUsTQ+K3LaD0jbXY+qV5UmeCQwCQXLjyVMwwMr
	 49njaBFw7w2j7kkZr+0AzD0vI4eRNDqGdWjX2tEsH9JlV9PjGr4tvCHcNT4qHO0WOb
	 gm6PnRo1iQG/V3KlgOVsM1D+g0K2+mQyFYUqnSb5ffS1QLAd649yghNsRpGf+g2mIN
	 Jo5hd0w8UkzjT4OMrM53uhHTIlREhzaJgyRa13bPwF4GtMWTVYoTcBZdjzcLxJQOCY
	 pcTzc8r+OEXM2BS/B4QuRKTY0ck8zcBY8GZ8bbJy/gn5WiAKpXD/LAED+mResp7YDO
	 uNzdA94f+uuiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9333540BF4;
	Tue,  3 Mar 2026 17:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E02371EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C627A40BF4
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izmzOMCjr4Po for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 17:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DCD440BD6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCD440BD6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DCD440BD6
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 17:22:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 54448B00585;
 Tue,  3 Mar 2026 18:22:29 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Mar 2026 18:22:29 +0100
MIME-Version: 1.0
Date: Tue, 03 Mar 2026 18:22:29 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260303110445.306426-1-thomas.perale@mind.be>
References: <20260303110445.306426-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <96afdb808977b68849b142a880b31180@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772558551;
 bh=z+z9XF7TUAVakYJwhEMm/ORuDq/Qy17WiMjESTApP5o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KLOogwEsDqPn2dPBqgEe8FPTsJT8ABpbOuHmYUiKdytrEB13os/jBRle0XYYoORe0
 u4aFUb2R4vFgi7NiDVO2lpaqcMueDJ28i+aGX++1ioHzDP7vBT8vwbI+4TQZ5hNnKH
 LX63N5tZaXeWH1aOG1etrJJD2dfD2A11Y7mO74orX1OAH7ujd3ozgdylxF/crQEEph
 KHuejbDuEwz1LdCDy1Vbj56ih+f+3/aHD4nKct5TO5hyo7idtEwWipPLNf0NOIknEB
 A3BaCf9VsOU6/22PHVsHszC8RJUWdfkti1c6riz5z0bfq2ho+R9X/hljns9svxrW3T
 GBjr69U/TDj2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=KLOogwEs
Subject: Re: [Buildroot] [PATCH] package/vim: security bump to v9.1.2148
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

On 03/03/2026 12:04, Thomas Perale via buildroot wrote:
> For changes, see:
> 
>   - https://github.com/vim/vim/compare/v9.1.2017...v9.1.2148
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
