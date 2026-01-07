Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94419D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6733D82444;
	Wed,  7 Jan 2026 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZFLJQISWrTh; Wed,  7 Jan 2026 17:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D468257D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808308;
	bh=V+ywyQSFMFSuM/Gita7LreGAkBn0tOCaT1Psu/mEbMI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hYgT5diOuqkm2aE0h6GxelHkLu/3Uv8lRfIRoi/kWdg73ed0YqZwW4iJ9Aj3RgMyz
	 dYfe73Fd6+FRtjlPFfqWTotRlYyPGiZJI4h6E+IVUPJ08nr9JJQtvaA91vwH6Uq6ou
	 ZNNgkV/EmvScT4yVHfeK/TeqnQ1WcE1GTUGvwAEU+X+NNY1Z3gRJ9haQXL6Vv5RJid
	 IPev0Wq1nHCquBsfv8fGxtGUMCw+BQNUq74qOMbBS6AUvDsJkh/C3XPygHHtw+7Zmj
	 1YANLnkZv94O+Z8Cfm3LwhaV6zFUQF1cNCLh3GzsjPyA6xPvTzekxuB7CyhaQxZhuJ
	 QIEjD/6wQAjPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D468257D;
	Wed,  7 Jan 2026 17:51:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C62925B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EC1F82244
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOk1LUBVFG59 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D0E382444
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D0E382444
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D0E382444
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:51:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 627F1B97A70C; Wed,  7 Jan 2026 18:51:44 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:51:43 +0100
Message-ID: <20260107175143.228237-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229090719.13291-8-thomas.perale@mind.be>
References: <20251229090719.13291-8-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808304; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=EXYX7lhV8AWmcsCyOcUbg2r4++CgK61ZIcZpkIvYYc0=;
 b=QsRvPlGmP9Gkh0C0Ga9x3jUd4KzCcgP2OAswh1sFpmb9QjLwefiHgud7HGtFsQus4/bUrM
 zT4Z4W7PduNYLj77geLajB6tCMlv0tfvAG+n3QlJeG1VgmnCvLPrKpQBe68yBAJx0sGgWN
 bDJQQnM1gGTJ9himOWS75m38KvO/Qwpv5IUYs0mxLvCoBW/OQETFHrrFSpGVrQa4+8+l8V
 qjDPHEALO04RpFtRe8qFX2ytS1Yd1zZICa+3Y+4Eth3cWhetH618OI0odOcfhCFWIuVyFN
 +d/dKs4lbcrlrh0yfuWpBgMUELCicEXb/lrzejBIB1IuUqJcQBhhAvGOPBY7Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QsRvPlGm
Subject: Re: [Buildroot] [PATCH 08/14] package/cups-filter: add CVE trailer
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
> This patch adds the relevant information to the patch header.
> 
> [1] 1167d0ff3d docs/manual: mention CVE trailer
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  ...-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
> index e527b20f91..fbe2bfac4a 100644
> --- a/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
> +++ b/package/cups-filters/0001-beh-backend-Use-execv-instead-of-system-CVE-2023-24805.patch
> @@ -32,6 +32,7 @@ In addition, done the following fixes and improvements:
>  
>  - Use "static volatile int" for global variable job_canceled.
>  
> +CVE: CVE-2023-24805
>  Upstream: https://github.com/OpenPrinting/cups-filters/commit/93e60d3df358c0ae6f3dba79e1c9684657683d89
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  ---
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
