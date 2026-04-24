Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ABFF8850
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D399160688;
	Fri, 24 Apr 2026 21:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1xqtGf8bWAf; Fri, 24 Apr 2026 21:35:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CBF56068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777066518;
	bh=HFt9MpRxJPsQYy7mQjktOC+11gPV0Mo5Q59m5Z+aW/4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nj4qvVS9QWWoDSLPWqRzJN+tFhyLgnmjfNYDs0gNPFhBOPA1jER+IVmqZUTTL/mq2
	 QUQQGO0IeG3f8eZKezy1ogqHuSBsBi6Qj8C4A3rnHNGcl/9GBDntgsl0nHdyElDeVO
	 Rv9bjWv8ySe28JvGUmaDDKCV1svCAG5lNBZsjNfItJFRB00YaCdCFtURLI8DWGG+7K
	 oXaKppSUOJZiF6DUgd1AcbPhU2tlDf8Nqnu0MWUI9/E9YiHZTl978C+3oXpXVDRjPz
	 XpE0rBXj4v9Z+HXUfbCN5GqJSPh77u8vOTuVkqW64IFeat7KUvK2ARYMqGAZ1n5Sa2
	 cB4fEvE2czIEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBF56068F;
	Fri, 24 Apr 2026 21:35:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45ED72DF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BD81401D2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p_gMSX-Nc4vw for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7899A40073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7899A40073
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7899A40073
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:35:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 23235789;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 24 Apr 2026 21:35:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wGOB3-0000000ETGl-3cEB;
 Fri, 24 Apr 2026 23:35:09 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260424163345.172428-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Fri, 24 Apr 2026 18:33:45 +0200")
References: <20260424134443.3420911-1-peter@korsgaard.com>
 <20260424163345.172428-1-thomas.perale@mind.be>
Date: Fri, 24 Apr 2026 23:35:09 +0200
Message-ID: <87wlxwghyq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=EbXX5C7cP8cDjxn4H3JM6p4ROb3Qq+InrAdcDlnD9kcj1m/J+k2Pi8spdOivvriFDibMsx0Fx0tcBJVua7eHlI67cpScYju1nqx3WMzhBKDyIobIDsk0hQKFyYGOefL2aYmPd2M0HLhjWIBQQCzf9AtZ9X31gYnEXYqFzgueHJaEk4mMPVJY8wzkz7BrpPb37NGUS+e1DyhNL1oZndm7Xlc7etAt5714hcc8M0YRHRuFA7lumGKmsFFLAAS8v2rkFB4yD0+n+lqEnLfvRbNbgL4+sn827wqsO0SZShuVTWQbS6sa7NKfCPzaR2/2LqeRiaCthpyRxVf+skW1qokgSg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=eq9t/4ZzWFen6DN1A1G0oS7u88kgM/qV5dueixtRLnE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=EbXX5C7c
Subject: Re: [Buildroot] [PATCH-2025.02.x] package/xz: add upstream security
 fix for CVE-2026-34743
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

 > Hi Peter,
 > Thanks for the submission I applied right now the following
 > https://lore.kernel.org/r/<20260417120641.174060-2-thomas.perale@mind.be>

 > I think the patch is the same.

 > I tend to keep a small buffer for people to react to the patches I backport and
 > apply myself. If you think security backport should be applied faster let me
 > know.

Ahh, fine. I didn't see your patch in patchwork or on the 2025.02.x
branch, which is why I sent it as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
