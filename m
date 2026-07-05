Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CE8C44500
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 09:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC26480886;
	Sun,  5 Jul 2026 09:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5WjIc-xyti2; Sun,  5 Jul 2026 09:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12474807E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783243914;
	bh=gpZ5+47KyTlxYQQrJmgV4sdGqcBjxvRwKQ1PwIuU5ho=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bo5WNpNHblgFtb428FzKDMNcq5bVsTR5+igp2Rgrwtx3Kow29BdHwprm+f2yFAhL9
	 Qfl/DnVlGYbPjkG20HX27omdOeJXNO3l1V4p6aQHL20Pnly0e/H5ns+gdEhK6wI3VY
	 1ylm0q+DLmuAPTs8qXmAUmOPO77NwtwGYc2fspxb33YzjWgLzbEmHtO9APyeJK+tuM
	 sAaxh2NWu9D1nlIih8paS4O+YP8uEZ1ugiT6pkMewpKUcpeM0BwhLQIoAedVLwJ5Fw
	 M4kNmSU6TTAJDRtRdFIbQPqXyx5xrXRn7N7fsSI+V81v5JQE9F0RP6t1+w15mFXk+V
	 rHzSSJ936bZRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12474807E5;
	Sun,  5 Jul 2026 09:31:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D2215316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B89CB40237
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBO5TD2O3gsL for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 09:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B1421400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1421400B0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1421400B0
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 09:31:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C5F55B00548;
 Sun,  5 Jul 2026 11:31:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 11:31:48 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 11:31:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260705075745.3485915-1-bernd@kuhls.net>
References: <20260705075745.3485915-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <c8df2b12625c93a3812ac3879a75d7d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783243909;
 bh=89IlXEM0w6GHuzaEGaxMSb1DAGGvHxfIuOkrg22E8m0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SSmH/6gjt1lI6NRIIPvcFsgf8UTbxuL7j6hU18Xtg+gMh2Ms3i7mOdeLAvHwP/DDy
 xnqkiO3yH1Ua3xLeVjLxO9M6jPpqMRJQxG5CxxdfBaftyH7vIo/t8XuerHXbGIifF9
 I2BtL3mjyO7YcT9XrdmK8kZiNtNhRCnyuTdlkCfXQQl8nkNLW2HRK+y3SdscC3tfPV
 4O4dRl55DUZyXLvbGuJVSwy4RySzBw2+mcOfjpDhIi3QoCKBZ15xoKHW3j0YFArE1i
 ZY1g7Sh/orbustsbec4T9e2pASuwDPvCj7LKL5pYh1FxQuRlA9P+Zq9MIJFFysTkp1
 LPB3DF/DBjYwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SSmH/6gj
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.409
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

On 05/07/2026 09:57, Bernd Kuhls wrote:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.409
> https://github.com/vcrhonek/hwdata/releases/tag/v0.408
> https://github.com/vcrhonek/hwdata/releases/tag/v0.407
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
