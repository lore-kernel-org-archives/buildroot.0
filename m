Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B308CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E83C26144E;
	Fri, 29 May 2026 15:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YigtszCkvY3r; Fri, 29 May 2026 15:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBC956132E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780069159;
	bh=Bp+rccpO5EYL/BRiVtliH9IEA9Wk8gBsEeDBshFOicE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LHjVfiVLUFsZ3i9fCjukdkiibUk5RrToHWNKAJ4lAn/Lqzcd8/IA5I+JxDtSBsd5Y
	 fCACNYyWydwcvBJGKN+2bWYM5MKH4rW5wMVmQ968XyUtDrptkylwWwvvOcWPdpvqZZ
	 6vo2Vk0l5pbD9EW3iCKIOdZCEzY35MTy1neQ4ptfWldGVcwyiCh7u5lch6AoH+61aA
	 dazmXxRbA9U3tGiRTe74WcSb1OB6v45q43aSs1znA8SC8iAaZlGL2IuhvDkXGx9g3W
	 X3REdFH3V/Bpw/iI/tOcEdSOi+rLm9t1gg7TAteq0AFacbemYmcDrXZy7Gl/eLo8qv
	 CKy9NFNZQAFzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBC956132E;
	Fri, 29 May 2026 15:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 401F1D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC5741F70
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJBNFBdeVkeT for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:39:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38A5241F6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38A5241F6C
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38A5241F6C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 369E9C6245E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:39:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67246601FA;
 Fri, 29 May 2026 15:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7401910888CBC; 
 Fri, 29 May 2026 17:39:13 +0200 (CEST)
Date: Fri, 29 May 2026 17:39:12 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Message-ID: <ahmzFP8arYbF-s8e@windsurf>
References: <20260529150631.447940-1-thomas.perale@mind.be>
 <20260529150631.447940-3-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260529150631.447940-3-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780069154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=jfl0FJtTzmiBuPJr8vcufrjQqCOXnhCdqNdwMxEq7ng=;
 b=q3nfiLGkkZkOiLNa7pNfOrqCfw0KMxjxrU7+Idr4Ko3DUkzRxELwo+vnCQev91CBz7BbCv
 gNE8zHOlCR3xK2/oCysuXJIj0Cux87MQsLJVoZk6FK83pphlS/XObb/5uJ91aEnN21oWWO
 ib7YWIkzXqXmGt2JZuJCohFyt4zvc+oEmGeWLPmFiXIDBQeme7lC99NyHSWCeFmajuIlgB
 aZuivanDN5wtaXY1XINFMHLnUEQ/BeRB6kAdiXDUjB78p6IhcLoBXjzgThfFLJRqoZS+oA
 qbsgtSGLOdP+N9LraTiCf/2qUOOAEi65hLQOd51SPFQjhHNNYnBhvZfamROmqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=q3nfiLGk
Subject: Re: [Buildroot] [PATCH v2 3/5] support/scripts/cve-check: remove
 'bom-ref' for vulnerabilities
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, May 29, 2026 at 05:06:29PM +0200, Thomas Perale via buildroot wrote:
> The 'bom-ref' are optionnal and since we don't reference the
> vulnerabilities from anywhere else in the SBOM they are not necessary in
> this case.
> 
> In the following commit, it will introduce multiple vulnerabilities that
> have the same id. So using the vulnerability id as 'bom-ref' won't be
> correct as the 'bom-ref' needs to be unique unlike the id property.
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
