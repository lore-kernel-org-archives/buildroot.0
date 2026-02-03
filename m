Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB61AE8305D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 08:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A64FC8100D;
	Tue,  3 Feb 2026 08:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ebid7uTxAXfR; Tue,  3 Feb 2026 08:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB39881046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770106511;
	bh=mCMvto8lJslOTQmplgfJps1L1oJKkBuzThF+3NsKqec=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aReEZrcoF4eNR3xqBO65VkQkFoX8SjIabPPQ532Op92t2U+aNtm6q9X0AaW3HXq2/
	 OyEVylpYXTx41cnE4xdyvwMNWDR/gks+deXx7wqDKLNZthHRTUdUoaHU8jMQDBrpMT
	 mqROKkpM6sPRZJ+rfSU43AF6K+MQOSXb5Zr4HrXmUeIubcsDSsmB17Mz2szIWjhmtt
	 QK1E3Z9imqk4BvlfF3bkdj+7lgAdpJmWOYpnchpNY2mSZC3DxW2FhWOIRPb0On1Thv
	 cib1zD4Yu+1URUvB+ufJ+VHkNcmVdOYf2VsVsJryUIDEIbv40pVgAh1AquB40jZxPZ
	 y/+qfE4JYxBvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB39881046;
	Tue,  3 Feb 2026 08:15:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF726F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB05E81046
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USEueoXbnQpP for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 08:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 769E48100D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 769E48100D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 769E48100D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 08:15:08 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1381735473; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 08:15:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnBYw-00000008BBT-0isR;
 Tue, 03 Feb 2026 09:15:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Marcus Hoffmann
 <buildroot@bubu1.eu>
In-Reply-To: <20260202212814.2607588-6-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Mon, 2 Feb 2026 22:28:11 +0100")
References: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
 <20260202212814.2607588-6-thomas.petazzoni@bootlin.com>
Date: Tue, 03 Feb 2026 09:15:06 +0100
Message-ID: <87ms1qnsz9.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RauzB9wMavzw8BIfGSR5j0pU2QemEbymkFEP8zmggKEpsWLaCJGia15y9fQNXCC+27Wr5EP7t7uX60US+KuSQbR19hQC+OCl4aayR9GAlXJSGyoDyG5yMtRjrFoytYD2tvRLFh5vSXPQC0z68z/KIAhnrAQuzyKqSZw6N0aYdEwzNu5LYXsEtBsLGIKcw1vCC4Vs8QuVnz1xMjCy3KHriDWkClICQtHddfDUF9N0hX7UTBlryCjO/hBhkf+UjAYhYTTNAAXNWXIorsTG3XCxT3EfcVPcfmJLK0wYM+DtosO4m6e+mN28cFWjIzQ3RudSqRHY5jWLabnhG9Sidf5poA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=BebGTOpC1uFy/ouiCv5HMSpFtiIuul6loX5KrtwelMM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=RauzB9wM
Subject: Re: [Buildroot] [PATCH 5/5] support/config-fragments/autobuild: add
 a really old toolchain
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

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > Testing with a really old toolchain is helpful to catch issues related
 > to kernel headers version issues, gcc version issues, etc. We chose a
 > glibc toolchain though as old musl or uClibc-ng versions tend to lack
 > a number of features that are needed by modern software.

 > This toolchain is placed near the top of toolchain-configs.csv, so
 > that it is used as part of the "base" set of toolchain that test-pkg
 > uses, even without the -a option.

 > test-pkg takes the 6 first toolchains of this CSV file for its base
 > test, and actually the comment in toolchain-configs.csv was wrong
 > since commit 53a8c5150e5eeeb6dbbead0275dbf9141f507511, which removed a
 > toolchain from the base set, but not realizing that test-pkg would
 > anyway continue to test the first 6 toolchains.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
