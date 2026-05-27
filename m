Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3120CD4F54
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 22:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5655B42699;
	Wed, 27 May 2026 22:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruz8bwRgk27z; Wed, 27 May 2026 22:57:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6550B42680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779922625;
	bh=l/WfCABj0PvccwKPKWdFRdIUC5T/xg8lV3kvlZ1MmSw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lw0FbkDJCPfJ19/DdFJiu3MchBU4zxMfXcyjWemajLCDIQANXCEF0t17QzkrB0gCG
	 xpJNEf4Jgv0Oj0MYgBL6LEEP8/G1rPCiZ5YOTMduwXLFn2M3XfizrqW1F9PX3w1kHz
	 eP8NzQ7kBCQQYLHCoydzSiTQGXW8TF9hqcU9tgbe7YDr9Nm0/YFTs7Xs6erab4wcjC
	 fZYubTbbUvKaBqR07rj2qwYGOdc+u85UWuTHmWjS82mRsz6ylo663f1xsTGeGbhDUM
	 j5shCUoCNqYHUG0EUfYBbZhgumogdKbu7I6nhldVIZ0dL5cUcs2TZqSMwefM1aJm/d
	 Jp/hKw0sfphLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6550B42680;
	Wed, 27 May 2026 22:57:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4446B2E9
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33BD4847C2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A89PYCZppptm for <buildroot@buildroot.org>;
 Wed, 27 May 2026 22:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF296847C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF296847C1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF296847C1
 for <buildroot@buildroot.org>; Wed, 27 May 2026 22:57:01 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1670230049; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 27 May 2026 22:56:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wSNBH-000000014e3-00YN;
 Thu, 28 May 2026 00:56:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260526200641.939539-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 26 May 2026 22:06:38 +0200")
References: <20260526200641.939539-1-bernd@kuhls.net>
Date: Thu, 28 May 2026 00:56:54 +0200
Message-ID: <87tsrslavd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TkVFf0Rzzpow5/fUcqkptiiXwieCEo9IcLglW9dEMTga6onYyyCgnsAiiSuEOxmAjLLTt51e8dkOzXluQBnWryX5VBdQxtjyFNQ0TNhhJQ5Dq8KOOaJHFDBoLEZ64rIFaFPa+3GMTr5PbAbwA81rv58OmxsaCQLc/oWtTGZcwb+6odocQPqFe+aUqeFcv21DxG+3n/YiVzkZcDVYfcFecwm0VoEhI+WqwswBBDauR3qPcbDpcJvWcwKt20eNq/JH4+MfmbLkm4se8SKOC1Gz3W7X0zfQDukhtluU8/g1z42K9M53OnCyu1lyTZuwOZG8XmsuAkaC3lI8Oad6u4p9wQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=T1LTchfQJM6UfFg+I3Bj2VDcUCFmgerVNjxOwLSAIVI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TkVFf0Rz
Subject: Re: [Buildroot] [PATCH 1/4] package/libde265: link with libatomic
 if needed
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

 > Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
 > package to version 1.0.18 which introduced build errors on sparc:

 > /home/autobuild/autobuild/instance-21/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/15.2.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 >  ../libde265/libde265.so.0.1.12: undefined reference to
 >  `__atomic_fetch_add_4'

 > Fixes:
 > https://autobuild.buildroot.net/results/605/605dc19e86f113662cc35fe055c64c52698d70b4/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
