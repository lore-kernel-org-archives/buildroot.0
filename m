Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF9CAC587
	for <buildroot@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA37B61AB6;
	Sun, 14 Sep 2025 20:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQbVAOpl5ZGi; Sun, 14 Sep 2025 20:33:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 153F66081A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 153F66081A;
	Sun, 14 Sep 2025 20:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52D51255
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388FB41237
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iXBfQ3y_y2r for <buildroot@buildroot.org>;
 Sun, 14 Sep 2025 20:32:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A8CB741227
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8CB741227
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8CB741227
 for <buildroot@buildroot.org>; Sun, 14 Sep 2025 20:32:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2A0702003C6;
 Sun, 14 Sep 2025 22:32:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 14 Sep 2025 22:32:54 +0200
MIME-Version: 1.0
Date: Sun, 14 Sep 2025 22:32:54 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250914143440.51414-1-peter@korsgaard.com>
References: <20250914143440.51414-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <50a756bce788c581287f35257ed88604@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757881975;
 bh=EA8/S/rHFbMHp8HU1YkHqSzpltmFsUPTWIux3shg+NE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fSuEmk0srkrP86ZkrJMc22/f8msVqQ9F4c0+UirHrjQKAFvbLQzqHsSa8Cv63Y7zJ
 JDomf0yIE57NsewTEvKP6dLwoLzRFUwLIdK5a+sfl9iUaHqJju+/IEhtuMRvtUihxV
 bE0CGdSQ8fhAUrsIYPmALBCBFjLeukq1duG/9R6SdZ10mQBIqvj/HLCEgssKGYZrQ/
 EMq5QWGxPxSPsnHnS0xyC55kLX4nHSnWPp88YxYXTvi/sZhJTTIWwWe7DERQtP4gRp
 opKkssE9M4IP4hXg1nhRqD+RLdCiCNOjVvYSYqLpF7zgt/jp23HonDRhr9Vbx24Wy3
 fpgLcYGZInB/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fSuEmk0s
Subject: Re: [Buildroot] [PATCH] package/pcre2: security bump to version
 10.46
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

On 14/09/2025 16:34, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> - CVE-2025-58050: PCRE2: heap-buffer-overflow read in match_ref due to
>   missing boundary restoration in SCS
> 
> Compared to 10.45, this release has only a minimal code change to 
> prevent a
> read-past-the-end memory error, of arbitrary length.  An 
> attacker-controlled
> regex pattern is required, and it cannot be triggered by providing 
> crafted
> subject (match) text.  The (*ACCEPT) and (*scs:) pattern features must 
> be
> used together.
> 
> Release 10.44 and earlier are not affected.
> 
> https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-c2gv-xgf5-5cc2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
