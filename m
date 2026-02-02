Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEFAE7DF00
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35E2A40BAA;
	Mon,  2 Feb 2026 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrFqynY4u-cx; Mon,  2 Feb 2026 16:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF20D40B69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770050089;
	bh=EfiFmIHsw5Ap/ewPkkkHO2+ReTCc68HAXvkZ8O/zFvI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q+fQwF5/BxhwpIJfkNKtWDFseSY95oOZX2zueUpNk4Bbcdjq7F+nGAye4d4h3zznD
	 pRA2x5MkefH5kQI/I68TbA11dRp8CxU+SMYckoYgBPl/1o1FpMd24e+BLEq/1oPZQv
	 RC2L8k0a6O4ZaI6P7OGr+f6RttZPmXG8m0dgZ6FyRcAUmLUnTdJj4lceoR/fs5jIW+
	 mbBRE+meDi8hqC8Tqd1Wm6w/kGC1iEd0vXheo4I+eP5AiVG5YE2K+PAzBt+/fzDeHh
	 DdG87uu4UUZYa7Po2Mkz2KjC9lSOhDAvMDkgomqcU6lx41BLIYFCB7NIz8w2oV6qIN
	 HGZ+l9m4acjwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF20D40B69;
	Mon,  2 Feb 2026 16:34:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB0B2149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAABC81300
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZvJCQK_XweP for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02AA0812F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02AA0812F1
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02AA0812F1
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:34:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1756245080; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 16:34:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmwsj-00000007EVt-120M;
 Mon, 02 Feb 2026 17:34:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260104131718.1613605-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 4 Jan 2026 14:17:16 +0100")
References: <20260104131718.1613605-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 17:34:33 +0100
Message-ID: <874inz14va.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=n8pX/lTdgtP9PqCS6SVE+d8poQFasNm395lxhx8dNfMKefx6kGgEqmH1oysRbTeqjrut8iSJYb8sLAFOjIdUWcsPvXh0KXMULlNyO8S0VAiL0v9woyarttPWwsXjEkhWQmdU3s1bHs5GXYamPpKG5Apg8+j2mLKeeLI2bMlQtVpO639ZvMNJsM7oNb3t4TQnHdsSvduSJ2SKb3nSCFFPBgsQudGTcIlb8E5iteRLxTRspbWhZzSTojVdRXNVGI2nb5s8V8DGTzbcbkVzQeRKWdnTCrM7KPiicyGsby6nJR8xHu8fKeF/1pbJ0ILfRT1PndBSeqj6rZbQQOqno/vtZA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Yg27TXUFDf2i3ZGvGvnf5OOHyPSPYUCRCfTkUnkyPZI=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=n8pX/lTd
Subject: Re: [Buildroot] [PATCH 1/2] package/zeek: fix build with cmake 4
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

 > Fixes:
 > https://autobuild.buildroot.net/results/d92/d92e7280203f62e9baf94161a28b68c3c899e4a0/

 > The upstream package is currently at version 8.0.4 while the buildroot
 > package is at 4.1.1. Due to the huge divergation in the codebase the
 > cmake 4 fix needed to be handcrafted based on upstream commits.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
