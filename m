Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A025D2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1381C84371;
	Tue, 13 Jan 2026 19:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2hWK6NaFeA3; Tue, 13 Jan 2026 19:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A32C8437A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333646;
	bh=u3dy/ncJt39TIVdLyzwLG06lcifiOsQg+bj9om9LBAE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nOqk4YE3NCG7apz38hXLQgkkhYzLv2JaD4kVSpnlezw8Thvt+rdSR5RsYuO/zf1kt
	 Ss8r2BaclH0fEEwvWsE9ZMPqBoDrs8aqWTib7d0Zg6wyqCAT9Ztorid6tvfemR3osV
	 5YRmsgWFL57WLAkgQYcsuwSIHV4ysvizRdoPd9ZxOP9DCb/CMFtHuSeHqKIK5GpJov
	 Xy1E3gnCAD8z/ZrqXeOWEuG9IGXUs5aazo3OfQuLxIIKXw/zIdGxQBTPT4v2IOkV1y
	 kqT9/iNJ8yGHtqiFqhwMYRGBZVzSe7zTs9eEhxtvwacGLOkjfT0/5gxAJQ46gBpuD/
	 spGmmI8IAxbNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A32C8437A;
	Tue, 13 Jan 2026 19:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 863F2231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 829C484379
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uF1rQ-yseGOT for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D52484371
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D52484371
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D52484371
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:47:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7462DB97A885; Tue, 13 Jan 2026 20:47:21 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:47:20 +0100
Message-ID: <20260113194720.99759-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-2-thomas.perale@mind.be>
References: <20251230081917.18676-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333641; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=uTbg7k/IqmEnOdLphjqdsNNQI7ygP9o2zWdorFZbsRg=;
 b=gHzZ4mHlDHj2ZJjBgFA0a86KCGhNQ4G9iolB9ZcqQHOdwnmu/kmkxMIpmeWLzFsMpNl3hY
 3WhWgzSt/B/2Xt9uh78TspG34KcSR0yH64DxUS1B+BAh2EwkT79G3gcypJ9zdrzJ2Jxa2h
 4kZzP9NMCWos0Nh5TFMSDoyHZJw5rpDBMWNfrVAyzXiikzPtPtODmgTQwX5XJxHT4Y+guR
 RZHj3hDyC4ZPiyPl1RXO5U3ivgGHqU+HR9gFizGzI202g5tMn8AcaTVPH+UpUjsRwrwkj9
 ibevel42zfg2EztWqiYwIQVXToY4az5gAf4cXr5YMdIQIO7jyGDuPfIpotxKEg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=gHzZ4mHl
Subject: Re: [Buildroot] [PATCH v2 01/15] package/xinetd: add CVE trailer in
 patch
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
> Since Buildroot commit [1] the patches that fixes a security
> vulnerability needs to reference the fixed vulnerability.
> 
> This patch adds the relevant information to the patch header
> and adds the `Upstream` trailer.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .checkpackageignore                                             | 1 -
>  ...5-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 3e274f391f..4df0438291 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1124,7 +1124,6 @@ package/xinetd/0001-ar.patch lib_patch.Upstream
>  package/xinetd/0002-destdir.patch lib_patch.Upstream
>  package/xinetd/0003-rpc-fix.patch lib_patch.Upstream
>  package/xinetd/0004-configure-rlim_t.patch lib_patch.Upstream
> -package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch lib_patch.Upstream
>  package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
>  package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
>  package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
> diff --git a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
> index bb2ee1fc9a..c99879b478 100644
> --- a/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
> +++ b/package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch
> @@ -6,6 +6,8 @@ Subject: [PATCH] CVE-2013-4342: xinetd: ignores user and group directives for
>  
>  Originally reported to Debian in 2005 <http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=324678> and rediscovered <https://bugzilla.redhat.com/show_bug.cgi?id=1006100>, xinetd would execute TCPMUX services without dropping privilege to match the service configuration allowing the service to run with same privilege as the xinetd process (root).
>  
> +CVE: CVE-2013-4342
> +Upstream: https://github.com/xinetd-org/xinetd/commit/e7c1ba41f4f86b436fb82b0d55cd5d387bd4ecc4
>  Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  ---
>   xinetd/builtins.c | 2 +-
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
