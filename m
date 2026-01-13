Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED52ED2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27C840DA5;
	Tue, 13 Jan 2026 19:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1CcYhdSlylVb; Tue, 13 Jan 2026 19:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2FCB40DA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333613;
	bh=fcCDU2sao61CTOYtSU3KopzyeQfhGF/RTk9bkCWSrOY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rDqtW43vna34c38WPuIgCR6sBxvJbieDaUTpqdxgxJWQabkg5e50N5bsuLRw7tklh
	 z5jWIAGZclbqUzJmYz/wrgjMQM8dAp4cOVhJPQUTM6tB/MDu1u+aCvsGr23gDqIJag
	 NO6H0VwyNUtb0bbYDN+rSQE0K9oggz98oRnNX3JfRE2SWcwYLcOrrXV/z8fJeFSkb0
	 SKTTD0LDbg8b5qKv3v7rmWVO08R+Fq54WcMxV9gP3jxTzqGDlqe3WKROUbLIWK4zUt
	 Zhy2bQRtW+WrDQIoWeTcEni41hwPGxgHtMmuMeYrqY1+ayZ+Jbf2hT9EtrjpfQhcLF
	 osorCX/iZevYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2FCB40DA6;
	Tue, 13 Jan 2026 19:46:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61C621C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4869C60BD1
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sIZDc2HXXBQJ for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:46:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45A2660BB3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45A2660BB3
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45A2660BB3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:46:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 75EA0B97A863; Tue, 13 Jan 2026 20:46:46 +0100 (CET)
To: Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:46:45 +0100
Message-ID: <20260113194645.99007-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230081917.18676-16-thomas.perale@mind.be>
References: <20251230081917.18676-16-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333606; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=9PmRDRO4RNNT2zqnyPFyHMdhz/cEo5x4+3GkJjZ2dko=;
 b=VkbPkkkLCbeCiguwAIlQnasOD/bFjV52vrKAATgzG7I4ePGgDms9tI+gbmOHa0IHG7oguI
 QA6XdFXk5hglb4y3B8CcDBI/0tpjE0K1vUuydy5jqJatVOvs/6fmEtD3r2hIFBzfLlis0A
 0boKVWVNKmFFg9cX24uR1gthfCex9Qaf1xRrHoXZTPDblvf/ZjQrkKG4pK8YoUJjWamzGr
 HVQmoCiaQIqmdStDkJ1I/DSdylogtFNt8LcLjyh/N3b9v/Kij5rJDnXzmU4lmMP8RIc49K
 henIffikAHK+lYt61eXl0BKfMhoU6kQG6VRbZ1M9CLlp0rTeo9o2vG9ME+2TJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VkbPkkkL
Subject: Re: [Buildroot] [PATCH v2 15/15] package/cmake: remove stale
 IGNORE_CVES
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
> Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
> versions using '-'.
> 
> These IGNORE_CVES entry introduced in [2] is then no longer matched to
> the cmake package.
> 
> For more information, see the explanation in commit [1].
> 
> [1] 35f376d88e support/scripts/cve.py: fix CPE matching
> [2] 5ce1e773b9 package/cmake: ignore CVE-2016-10642
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/cmake/cmake.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index e9752640e5..ef4f6aa98e 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -11,8 +11,6 @@ CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = LICENSE.rst
>  CMAKE_CPE_ID_VALID = YES
> -# Tool download MITM attack warning if using npm package to install cmake
> -CMAKE_IGNORE_CVES = CVE-2016-10642
>  
>  # The package is a dependency to ccache so ccache cannot be a dependency
>  HOST_CMAKE_ADD_CCACHE_DEPENDENCY = NO
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
