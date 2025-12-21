Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5642E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68CC740734;
	Sun, 21 Dec 2025 12:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Db-lU2q9XKgh; Sun, 21 Dec 2025 12:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C6A4073C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766319231;
	bh=DOZ6wYNzFYABaFA6/XnaAxlqAdrvBavrM0AQ3LBIfHQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nQup9mQf5Fn5Qo+Z//K3CC3VRnBRPfTSx4DnGmsBp7HiZvFR0RdY8MWNn8DuDQl8C
	 FsN4JQazxFIdCtyn/cZo5m+DE8M+QojVP9CJ52ji/1EwfuISAJ3c41c8vXYSKRfQtj
	 zoiD80N32b8falDDNGVxBKKRECsT7FpkZaUnqAFONtJwJ3YgQS1zKDBV0n15gfdACS
	 PCUHee0ESbkJzQAwrfHABexyYTE1PmHy0amPPwBU5Bsnb6J+zycylMgKsYnTi14bD8
	 Rgjjqrq806/EpJAL8odiYipc+4OvJANOhvg+voJuy78NpmUEAJqQNoFj5CgwiWty7/
	 EPRYmQfnlo7Ww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C6A4073C;
	Sun, 21 Dec 2025 12:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18DDA119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AEDF60E37
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mjnp0BTseJbv for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2B0B760BDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B0B760BDE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2B0B760BDE
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:13:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 7B007B00535;
 Sun, 21 Dec 2025 13:13:44 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 13:13:44 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 13:13:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Christophe Vu-Brugier <cvubrugier@fastmail.fm>
In-Reply-To: <20251129080718.1667632-1-bernd@kuhls.net>
References: <20251129080718.1667632-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <2597d8bb7de2865428b76bab73422127@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766319226;
 bh=UrAbQXO2M1Mx9g4198ak4Vk3BspW/SHkr8rN+dIxG1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F0M5LwCK2vYTOGQowNH358QllrefaRVmfZ/qpHXxN/ZyeAULf1R7uZR1POa0LCy+q
 dBh4ZbL+35ld2ev8/ijzz3o7lyqK1MbtS8wXH282+iQ4ecWOmRkVOD06cL4ua02Psc
 pSD8eViXCG2H7ww5Y+GhKADZiMJyuuOru8pLSdBMHMlRvaEXsOXj/5FMFBFxlgYirx
 Ro605Gwe3di44E+UeOz4lUbe/bk8gctncu4qVM/U8OIQoLpg6/18zLM30PAWRL4Qbm
 h9dBtxOu4U1YJHiHfghamuVdq5Yksq8KLqIbNT2l/Y4sFejceo+A8TMlp1lrhN4/p9
 SeDRuKbkDQbDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F0M5LwCK
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: bump version to
 9.33.0
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

On 29/11/2025 09:07, Bernd Kuhls wrote:
> Changelog: https://github.com/LINBIT/drbd-utils/blob/v9.33.0/ChangeLog
> 
> Fixes:
> https://autobuild.buildroot.net/results/abd/abd9fe3f8b8051b8fac278bcd56e1c11aa056737/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
