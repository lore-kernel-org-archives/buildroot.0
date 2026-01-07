Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EC0D0D152
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED3C64095C;
	Wed,  7 Jan 2026 17:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUZZAf6sAomi; Wed,  7 Jan 2026 17:51:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278F040F01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808297;
	bh=jWmtIh+grv7tL+XkRN337tbHmjVaQ6/CnoviHNTQAsk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=k7Hj1PZrpHxgjSwjibjQa8oG7qf1R48ma+8noSStVIYfJ55sz8f92aDbsPNvhny+x
	 5RcLPxrHsLWQArtds95May3xMnof0jeBwtVJT9fmtsHYEt9lwF9uBeUmouGYIXyLnv
	 TZKNPZjzpcfaiopRv6+D7ArTic1ofbxVWmikWJQwQmQPdl1BohQSJLz/RftxRr+vOl
	 LqT+NWK14L7L0w7b3DjjnpRz+q/PvnugJtuoNAYObeSpYyNHmbXo3gBI3CX1aWf1Kv
	 fyVOTUvINcxXsjIge7c1Hjk5//MYkaJJdKDLuIBGJIKtUGvxtdvJwFQUtc9vR5wP2J
	 LofH3rggsGaPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278F040F01;
	Wed,  7 Jan 2026 17:51:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2E6325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9905440128
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk8Jk9UAhuSn for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 92573403A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92573403A5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92573403A5
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D6F7B97A704; Wed,  7 Jan 2026 18:51:32 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:31 +0100
Message-ID: <20260107175131.227986-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-10-thomas.perale@mind.be>
References: <20251228185637.58072-10-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808292; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=Tzwkn/qhDbrb1/JXJlWEScS31KOaPtg6ihKY/cb2u/k=;
 b=jhzTNOFEa8IEhyvAM8JnNA9EZeuuNY28hmTpI2hDMmPah9TNHNCwYFmzcN/yBnIHEwNs2n
 oJ/FsWbYYEk7v8ceEPop8QXCpUqkY0CytsMhhT3rvz0C6mwtkEuyyfcGJ6G7OnUHC6j1PI
 o4agnIOYdQoSwiLZ2a8Ymr5e4NmhSrxQSiqAQrbdFRBzCW2WpiVrSuImlG5kic5MisOZ0V
 xRfqzXkfWm2TStVb9IwreNv66yAKGq+hwqtBm3mhG5g1H9GVxxldqT4sW7kYHqSODFhbL+
 K41FdFBp5k9aP6HD84LiP4FzCruAx7Le7SPRHDCv0XNPmyMVu7rU0NUbHkY/0A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jhzTNOFE
Subject: Re: [Buildroot] [PATCH 10/10] package/openvmtools: add CVE trailer
 in patch
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
> This patch fixes the information to the patch header to have a single
> vulnerability per line.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/libsoup/0014-CVE-2025-32911.patch | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libsoup/0014-CVE-2025-32911.patch b/package/libsoup/0014-CVE-2025-32911.patch
> index 102acb4af3..2421e85201 100644
> --- a/package/libsoup/0014-CVE-2025-32911.patch
> +++ b/package/libsoup/0014-CVE-2025-32911.patch
> @@ -3,7 +3,8 @@ From: Changqing Li <changqing.li@windriver.com>
>  Date: Wed, 30 Apr 2025 14:59:55 +0800
>  Subject: [PATCH] CVE-2025-32911
>  
> -CVE: CVE-2025-32911 CVE-2025-32913
> +CVE: CVE-2025-32911
> +CVE: CVE-2025-32913
>  Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
>  
>  Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
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
