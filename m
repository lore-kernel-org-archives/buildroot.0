Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B230CD5BC8
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 18:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E399E61065;
	Tue, 26 May 2026 18:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RBHdJgOmBwzG; Tue, 26 May 2026 18:28:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BAEC61050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779820127;
	bh=NXLer68xeeEqa/vgy47Mi+JLs31p2eLorfFD5YRwrKs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r3nOAItUmtMMZ5H6Oc2Qy31nLMEizlXUBU0RyJn0R0KQ2YrWr6BCpsixcUv2ojtOK
	 m1Jddf35QShLjwHjQvYgE9v10CVLG97UQEuAd3OLnHILbn4foLYKYYFbO1YSBGFFuu
	 xXcs+5pGHdlcfT6LUv8n+cm4qEnsJRMMOKWorRIYT8LHROkejYHLoKKADu4SZSPHHh
	 BWBXVLZaJEIE9kDvqohsW+m16GZbhpdlVPWMrTLvnBI17bzMn5T+Pg2D7oy6kLGbLi
	 FwW29rAzndGTjwc20do3kHz20Go3tuOzHTPLhesoVLWUFksJ31/Lw5IQyRmHBeEa4L
	 3Fd/xk74+0dOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BAEC61050;
	Tue, 26 May 2026 18:28:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 444AA21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35F6582014
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vta1CGuUrMbA for <buildroot@buildroot.org>;
 Tue, 26 May 2026 18:28:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4D38C82013
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D38C82013
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D38C82013
 for <buildroot@buildroot.org>; Tue, 26 May 2026 18:28:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AF5DE19F5A5;
 Tue, 26 May 2026 20:28:40 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 May 2026 20:28:40 +0200
MIME-Version: 1.0
Date: Tue, 26 May 2026 20:28:40 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260525195656.3833500-1-bernd@kuhls.net>
References: <20260525195656.3833500-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5c43271e555fc371e3b6032089ec408e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779820121;
 bh=FM0ujkLQ9sVoRSCOhnEHp1t4Yr6DAamNs6IRj0LfEhA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LebTAd9hMc+gi7W41MFvo5LSlkmlUlu7HuEoLsih9JPjaNgAleM9Jk10Uc+WkW9TO
 t4aZiTZlLDUh4gDutBccxaQhHL1Sn96LPyLfNQkyBZPgJQnh6iSg5BwLTprzNAyJzL
 jIKDuMDIsx6dZp8tCDRrKpfQwR4N4igDtPGZ+vlih1Enepru+BYDleSGlwFxYHT18r
 Ar1x72ApssMn1bGAsNt7CZxGydV0iqqHLFWFSZxT7qGJsF2leFiMLXTFFKZyO6BoeC
 XpRwIQ3UUWnNELtEDGL06OK2mxAKK1N6qw3PPQTZWqs3OJVVpwYLLGSrf07J99/WI8
 L+PkScBvwY4ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LebTAd9h
Subject: Re: [Buildroot] [PATCH/RFC/next v2 1/1] package/pure-ftpd: bump
 version to 1.0.54
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

Hi Bernd,

On 25/05/2026 21:56, Bernd Kuhls wrote:
> https://github.com/jedisct1/pure-ftpd/blob/1.0.54/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.

> ---
> v2: added result of Gitlab pipeline
>     https://gitlab.com/bkuhls/buildroot/-/pipelines/2551634401
> 
> This is my first try to use a gitlab pipeline.
> Does it help to reduce the workload when reviewing patches?

Yes, this does help. A lot!

This gives an evidence the patch passes "test-pkg -a" (so it also
checks downloads, legal-info hashes). So maintainers won't have to
do it.

It also records the parent commit on which you tested, which
helps when the commit fails when applied later.

The package runtime test can also be started, based on the
branch name. See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.05-rc2/support/scripts/generate-gitlab-ci-yml#L81

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
