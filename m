Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDC9ED7B9A
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 10:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 965DF61CDC;
	Tue, 14 Apr 2026 10:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGnL2F44-Dm8; Tue, 14 Apr 2026 10:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B22A61CD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776162788;
	bh=4MRZGosESfQ3nYh8FP4NMKQBKe7SWTzCM4bQP258xMU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IWedOo3cUdu+sGrRSZyV65/JU1leDwWkE5tPHT2Wz4NiAo5hDpYrjzaP4rV7j5xjp
	 5FJBkvjOJu/SCHcpnBMalNRY6VyVHrx/MfBIKsr0NuH28dC6lvBACozEI3wE/T7Vd8
	 DMa3fo7dtyZgx1FTIJ2nQ8qNT+WExVxLW4KRh4BrKDwVFvRS2ZiZMTSlL6WgxmT443
	 erxBwxLFfL+mLTlpY9Oz2vPh7D7+3dsbFBdM721zGHPFNGRZFN/BxFTlVKltOANcuH
	 IPEalvxVATihR0h0pQe476FegZy+4BvSKGdCex0bTvDLrDlKEJ1hlBI8dMGlI0/07W
	 +3Ar9OCihCkYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B22A61CD4;
	Tue, 14 Apr 2026 10:33:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F175F283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7BFB403B1
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9nW2gQ1fjJ0H for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 10:33:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7011C40191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7011C40191
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7011C40191
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 10:33:05 +0000 (UTC)
Received: from L13942.iliad.fr (unknown [213.36.7.12])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0FC54780383;
 Tue, 14 Apr 2026 12:33:00 +0200 (CEST)
Date: Tue, 14 Apr 2026 12:32:59 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Julien Olivain <ju.o@free.fr>
Message-ID: <ad4X26Xy2BCoXlUB@L13942.iliad.fr>
References: <20260413151148.42226-1-maxime@leroys.fr>
 <20260413151148.42226-4-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413151148.42226-4-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776162783;
 bh=vWpL/3UtJTeMLTD53BSyAvKbPlxD6JjeHHJMcSVQdko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XPxnoCyYTNqe/Vb3dsvUc4ipYI43HPsRrD4axUtMiFVc+Jrd6KBkHjvLt3iDdyauh
 c9htsmDWJSUCwM5ShRYYbed9cAt+lHCofbR4eIPiCtNHgy06UV8hxXqFkDzNs9FXeI
 tc+ivYRNlrdgZlya5Ir6gq2JjKpYuyd4IzzsmVA50+K5VkBAsmWONFdiSKXYK1vH7U
 soPYLcV1JipI4ETLPBj3rlqZWHkMityMdJmZmBsg5iWc3jDtXXFqnu1xZaSjQ30Jon
 zHbvx+5ehtMxMvMVwLfp0JWxDd2G259z6f0AIHvuE62oPDCF70vpHsep5V6JfrSOkM
 dztowdGa6L8lw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XPxnoCyY
Subject: Re: [Buildroot] [PATCH 3/3] package/grout: bump version to 0.15.0
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Maxime,

LGTM

> Drop util-linux dependency, libsmartcols is no longer used.
> Bump GCC requirement from 4.9 to 13 for gnu2x and C23 enum underlying
> types support.
> 
> See the release note of the new version:
> https://github.com/DPDK/grout/releases/tag/v0.15.0
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Assuming the build checks from:
  https://gitlab.com/maxime-leroy/buildroot/-/jobs/13897336249

Reviewed-by: Vincent Jardin <vjardin@free.fr>

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
