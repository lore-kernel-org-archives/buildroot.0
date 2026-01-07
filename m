Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46743D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26FD40D38;
	Wed,  7 Jan 2026 17:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOgonC53ldN5; Wed,  7 Jan 2026 17:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E8440CED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808154;
	bh=hDvQm3jnMKAk8MnRrSoN0vHBGOGsvBQNTi4kkTvFcK8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ny3LomZrQanzIW4tCuAnZiGZ5p4y16jLluB2++nVRoMHTAER4pt+Xv5DlbDymv8C6
	 9VycaeX2IsO4pHlRPahkgw5Of3ZFvc2T1kOb37v2TIQdKbKuI/gzZCqJukrtUlEwcx
	 mYAyy7io5gq7LStWUW2i2RqUFjBxtZchoHV8FxLw/bkWfT7Z9LWY1EoHFqEJ8miH11
	 JjZwRhNJDzUMZdUgvGHzg5r9SeHE1e/F1PjuyI61cUbtrAv4shX1wEr2H3vGizKPBx
	 qkuj45fG/5lB1eX5BFHBRHKl6aYwm0pB7xdf24xdXcYOLGIZYSGmNMpX2S3BOjDGUA
	 a63ILsYrbBadA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E8440CED;
	Wed,  7 Jan 2026 17:49:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A1A59ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1103822DB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWd2dz9DOytM for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 22D2281A33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22D2281A33
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22D2281A33
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:49:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3F011B97A192; Wed,  7 Jan 2026 18:49:09 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:49:07 +0100
Message-ID: <20260107174907.224956-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217220525.3815471-2-bernd@kuhls.net>
References: <20251217220525.3815471-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808149; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=GTlKqsaUnuJIiU7WKHi4RTSlZK+dS3jZ24QP26yFWBU=;
 b=ltKuKcTzErrffoLkl3O1PLHfLL/r+xCMJLLUn1sWMmcNQfl4wCp9pjejaFNaRiMc+VC6gt
 0K/jsuF0auVpXRIy+VbiT0ye4w0cfUn8cjdjxmRR8uxvoqh8JLxd/lEDg8FWHB3+x2eQqq
 YZAVhE29bH0/TQNDzd/qq4sc/dDMhgRPbOjPQxHGVaL7hUSZYG9U86As46o1rB+abe8FLH
 veba6tjKwz/OpSbdw14fZ6fETQ5ZsMMAVTH0zpb7O5D+P45FaHPtJuQF6NgbjiscQ7Nwm5
 jYGs2QceGf0Cd0bVqqqBzxn5Qak6t8KDbs3rxpaADTvJkcqZlPXReCYSdj2sng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=ltKuKcTz
Subject: Re: [Buildroot] [PATCH v3 2/2] DEVELOPERS: add Bernd Kuhls for
 libid3tag
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
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> v3: no changes
> v2: initial revision
> 
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 62b093fe2b..282c88bfd2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -420,6 +420,7 @@ F:	package/libglew/
>  F:	package/libglu/
>  F:	package/libhdhomerun/
>  F:	package/libheif/
> +F:	package/libid3tag/
>  F:	package/libilbc/
>  F:	package/libldns/
>  F:	package/libmicrohttpd/
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
