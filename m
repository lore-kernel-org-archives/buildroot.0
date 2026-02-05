Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1557DECD983
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 16:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8D6A41232;
	Thu,  5 Feb 2026 16:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Had0gg4eCkUq; Thu,  5 Feb 2026 16:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF3241233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770308665;
	bh=+uX65zBNhXaGE/jyawRztBzQAq2MGqXepPfljQ0wxbA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=py7IaxldgA2QpGNGB0Ci4uTyxOJqW2YnulYxzhmqeCAktPaZ7fjThBakQft0zV4Iq
	 ujRDow1lxsUd6ncXdkX9Q8pnbzdbmjZa/HcMWGBHMV7t7nwlhilhz8+U+OZEiRNDyt
	 wwqllemQFtNKsPjPL6giagOeJ++zZWh3zPRD4pAyd5zoIx2kjTLqlXmHi9Fet2mZ99
	 ax6DVZj+PMprvGiYpXyd+IKZGKuE5d7eKAj/EfKypJD+zYhFuXNMQYyNlISUVBctjM
	 BVOK2MKuUNBkx5AWEsq7JqktJiRPlGyMA2FgtEGVdAEOgsnNdRf36ch37z+S0lN6LL
	 Pff2NPkcd3X+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFF3241233;
	Thu,  5 Feb 2026 16:24:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F1A173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 613EF40824
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkexn21hC-Yd for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 16:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F8BB40823
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F8BB40823
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F8BB40823
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 16:24:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 547135149; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 05 Feb 2026 16:24:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vo29P-0000000EOc5-3VAx;
 Thu, 05 Feb 2026 17:24:15 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org,  James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260205103500.169542-1-vfazio@xes-inc.com> (Vincent Fazio's
 message of "Thu, 5 Feb 2026 04:35:00 -0600")
References: <20260205103500.169542-1-vfazio@xes-inc.com>
Date: Thu, 05 Feb 2026 17:24:15 +0100
Message-ID: <878qd7p39s.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=atut5WiJqKsmQqmVAsVNAxCP5JgaZPCUZshGkKOq5oyTHHTqKL0BkgWGKzqvz6zQ+FdhOec4aJo2N2WEMzJm14pzzPCCc3ZG3aAMnCCWak4g5nG7MxQfvA+QKs/rLnMo5KkVUhrwYk+JcNzLNKcy4eWkVfZgfYhi1BCxKxlbeJSKbe1k0uLbCc4zFMb3VVD7AC3CNNEK74IZo41P/+2Ib8VWZoadUx4I71xWB101u9DEZjiJQ0j5egsjUMH7bl5MX23LRaEf/nOtFNaVJC5Mi7MnSkprfwpOvNk+FQ8mAjA/b6smhW5EXtk+Iu6W42Co2lpvpUtA2dCJAztUUJ+YuA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=HQCUyqJh/RrxUBVV2MhQYG6t/+ASMcAfKeHYlZe/Yb4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=atut5WiJ
Subject: Re: [Buildroot] [PATCH v3 1/1] package/python3: bump to version
 3.14.3
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

>>>>> "Vincent" == Vincent Fazio <vfazio@xes-inc.com> writes:

 > https://www.python.org/downloads/release/python-3143/
 > https://docs.python.org/release/3.14.3/whatsnew/changelog.html

 > Update the hash file to use the sha256 hash provided by upstream.

 > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
 > ---
 > v3 changes:
 > * fix cut line typo

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
