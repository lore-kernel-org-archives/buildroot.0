Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9BDCD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 19:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60A59615B8;
	Thu, 18 Jun 2026 19:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qz5n48v_4F-1; Thu, 18 Jun 2026 19:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91BCE615AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781812144;
	bh=/k3Ze26LrHfftjRFrTmoPSbecrS5U4DK0o5ihciHRw4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TdIFwWU7eNU9dg+C/Gyta0KZ9si7r2NkOpYbKVMxgqw6EQRkn/7HcppdAKPmlVCuW
	 UeKfvi02LEyUrCTrPAG96fgwbgyKWE0CeZ0ttl/fD5vqjshk2hzlQ/ThNQycdsU+f9
	 EB7xnBb7RGt0oCbHpslF0h4r1I1tAKlvldQ0z7zzHLmnr9sXnrND1v3QDUHfGTjr2t
	 M2DdFeXQzshEe96ohEqDIi4Rj5ehQgItvoqL3WDwF3cUCtq+n7sRIo/BYdgSqudK4g
	 hjBGjycIyIWmKec36aQhOLL//pNv2YR3P78Cq556I0V8Atd06DMZZl500WW4jwmAGL
	 ns0iG3EpCXpTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91BCE615AF;
	Thu, 18 Jun 2026 19:49:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E78B6358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE15141BAF
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA9OwTlalMSo for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 19:49:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C3CD241BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3CD241BAA
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3CD241BAA
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 19:49:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2114021702; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 19:48:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1waIjP-0000000CpYO-0UWs;
 Thu, 18 Jun 2026 21:48:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260617175950.2925532-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Wed, 17 Jun 2026 19:59:50 +0200")
References: <20260617175950.2925532-1-bernd@kuhls.net>
Date: Thu, 18 Jun 2026 21:48:55 +0200
Message-ID: <87jyrvd3yw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EWd5nXEITAoP0NxLyz+mtP3U5xX6J/xbKnpRcW5FFQCdLixCEf+yX8ZwzLYxq7eVmhT3ZDPoNMLCQaL0rtvq8BMak5cGUFq50RCo2Y/BupGxs9JzUVHCPrOSAfClW8mT9GttWsxK6iscDIXDPw2VXbI0kGE6A66ShgcmcT/3iW7DzPdWCVvH4LVQR1hG/0lvw4GB0ZuCFkC8cXydvlVzwo0Vi+qbMK8ANs2j5nX7xkfd30313F1Wibg9kqCUEOrAj7QcB2eDwwhnltQ2ZAWm/3S105fQUyJOhef5OvLqGFmFcEJhWJFuAeds1i8EpIvGiRGzHZL9nOPchjuXsKAAVg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ps6GLi5nAIGZE4pXQ3TYvJKjWxSIoJ4SSrXfqIZaYCc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=EWd5nXEI
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://discourse.llvm.org/t/llvm-22-1-8-released/91084
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/be8733a731fbc33bb5bf2d53420ae6eb7627ffa4

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
