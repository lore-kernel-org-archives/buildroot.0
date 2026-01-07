Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F341AD0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8E3341119;
	Wed,  7 Jan 2026 17:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVRJDwvImShS; Wed,  7 Jan 2026 17:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9693241107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808564;
	bh=Xu//p6c8zltxJrRQLYsegCqz6udMmndzF45PHWNZ7xo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hxqeSwBHlfKWSZj91HkgkLNpYy6qSrwdYmmirxNAI+lZacXda16dJ5lBjr0yww1nA
	 Zhtiez2fB3k+aOlN/eCQWY9tEJYPMLoU3MIwrddnNlP2pHfA0eqtj/WCwxXM8PiXFd
	 khEV+PQyhGpaWdJvBlu/RY4WjbW/CTKqHfc/AWodLkBqN75NUv7d03l18m/8r9+vJE
	 HyvBDKOr1+or4dNMsMeGZyim6HZH5VTzKQw69R7GTJ+DqP3/gi8c7RGJcVBuzOo5pU
	 kBoOW/8x10W0uLJ1SRweWcqfObVUaWSh9JXxcqN9ddizv3s4uLN4X588pLbkBnkyrs
	 DOgzt5oYw3uWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9693241107;
	Wed,  7 Jan 2026 17:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB298A58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B192540160
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VP0If5w88nN for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:56:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B170840128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B170840128
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B170840128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:56:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D490BB97A70C; Wed,  7 Jan 2026 18:55:59 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:55:58 +0100
Message-ID: <20260107175558.230684-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221223441.185169-18-bernd@kuhls.net>
References: <20251221223441.185169-18-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808560; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=DzJoDn0fKUsIrYD3bCoC8bieNSUqOdVL18L+n4igVxQ=;
 b=n4FHw55eqyleDSCdlzy9IMmHVVo+xd4PxeAufOwnz/LlkXbIL6rwEMl5B36Bw269AxxMDe
 sDNeIWVIrvyGVop1pPWE680nOKQaiG72tUv5VpKxN6sAnwwMPQdMpYoTH+8NsWlUwM7pUg
 ODAIikwDXaTKjc5O/rnZlZt7hBzpERxE7zxuE/5a/JWxZO18ISl2jC83Fg0Y0sK/wnbVwp
 pf+SSyive4HrL9eRCajKGyu0V04teofp3hzHmHlQogHWE7BicNqLgdC6BddsKz9F+KZq19
 LHd6tH6f/R3PrVel0cL552acORhKIMi9MX3KLzG95KOJmEuwtKQXpvn8VmRvLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=n4FHw55e
Subject: Re: [Buildroot] [PATCH v2 18/23] package/python-pyfatfs: add md5
 hash
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Updated package as computed by scanpypi.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.11.x. Thanks

> ---
>  package/python-pyfatfs/python-pyfatfs.hash | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-pyfatfs/python-pyfatfs.hash b/package/python-pyfatfs/python-pyfatfs.hash
> index 05e940779e..58f02ed7a0 100644
> --- a/package/python-pyfatfs/python-pyfatfs.hash
> +++ b/package/python-pyfatfs/python-pyfatfs.hash
> @@ -1,4 +1,5 @@
> -# From https://pypi.org/project/pyfatfs/#pyfatfs-1.1.0.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/pyfatfs/json
> +md5  df7f61cdec5567ec16956cbae14514e0  pyfatfs-1.1.0.tar.gz
>  sha256  9725ccd0a4da1c09c27358abbf10f08c043ac84210af576803e087f51a2b30e0  pyfatfs-1.1.0.tar.gz
> -# Locally calculated
> +# Locally computed sha256 checksums
>  sha256  df8f053d3cbf23fe7002e6a34b06580653a74d40dc2e54f3b717a963ea9b70cb  LICENSE
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
