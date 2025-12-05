Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CB3D374A1
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 20:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D7446F4B1;
	Fri,  5 Dec 2025 20:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffe0oQEWBnuN; Fri,  5 Dec 2025 20:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EF360D88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764967802;
	bh=ecfoJBduFbgpOUunalFTx665qT1mMJXS+kMcAHkqhMI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bObOG4nwJPSZhOFnnYxx6UK9fOJ/G7H3Nvquv1d/KHf33Mv1QMW2yTOMYfelpzyp1
	 ys/RnEf0ioa/BqV/4YalFgzoWkTjdLK533SBgiQdE8Ew5ogpTrmxhxzxsOk235NLSx
	 kqHPsXAieZqhKSaazfSnMfGzmmM4owmB1w0sb6aYdl3bkAUMtEifiN9RzWVr5/TWbC
	 Tj33bd5DJzFb85UJGWm7NKXUoZzkAnRtNXHA630Wbz8tEdBNK0paQNWyB6pkhlP2SW
	 eC8rDUBigOhkthC4e+7EXVpR02N/7lhl5KmrwjVswEuOWN11QoNmTPkfWck/rL92Fc
	 LzBPAvtaVOTXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EF360D88;
	Fri,  5 Dec 2025 20:50:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 106DCE7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 020C940417
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4LuFFtP5jG4 for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 20:50:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 077CC40010
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 077CC40010
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 077CC40010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:49:59 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1688659048; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 05 Dec 2025 20:49:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRckT-000000029pM-2rik;
 Fri, 05 Dec 2025 21:49:53 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251204215446.49667-1-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Thu, 4 Dec 2025 22:54:46 +0100")
References: <20251204215446.49667-1-thomas@devoogdt.com>
Date: Fri, 05 Dec 2025 21:49:53 +0100
Message-ID: <875xakejri.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qRqbcJiTlNZcUrZECgIzb/U1+bOxcS3wwIblO/q1mMi2/kKCU75iUpN1naafDRemDF0+lED/hU5u99jfAXKi3i37mXV9J1tFPFgRsGN1UFbz5RgfrzeurSWScqX5gK3wOLlF5EpRJdsIAMLeZoubjc5D9CSzp/R4wBus9XjaN4h4X9UE8y0DYftd0WYSFvT5EHUllBS5t3DD5l0Txc1o+m+znrh4wYgJi4EX/LEkgS8tDoxJ7CfGZJsrCKhizhUAsH3XLFDX60exfMi2rd03I1LaXn5RVMjDFL+VsiPYQnss9I8Dbb1af1RrG+LDMPWJ2bXABdR1wtAEpASSWIqtFw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=pcDi3eoOiTOVtMmaz+tOUC+Jou9TtUnDgaCSo0m1b5I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=qRqbcJiT
Subject: Re: [Buildroot] [PATCH] docs/manual: fix typo in
 migrating-golang-packages
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

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > Commit 00230e7 "package/pkg-golang: catch use of legacy FOO_INSTALL_BINS"
 > introduced a small typo, fixing that.

 > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
