Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24926D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34C1E60B29;
	Sun,  7 Dec 2025 16:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TvgH356sOT1y; Sun,  7 Dec 2025 16:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF1446077B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765124259;
	bh=KoPGRZBVadrKsxaH4L5KUsqfDbgZr6zk/pVYMQxjyZQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxm2+bqambNOHWMjfyt/9EPLzlSx3xtXvJlVxF2lBO2j3hZ2gY4xVeBvqUdMtdiQv
	 eEeoaWHzL9ZWd5xhIggMTYmttphjb1hMOIy7gA4u9Jrh2om46b4rhrmt9QnPAgNarD
	 6MunB2sCjimMTZ8yA2a4zpzt39gC5rprCPE69n33Uv33RUAvDSbMWCikpVRg/gq8w1
	 M8B2fR1yvVDDMYJIedzH+G+paVC4u9zc9+ZExhBtmHLdQ81b+P80gT7wM2k72DMsLy
	 3Y0IAljTGy/4RM4OVRO1EWHySzOdQ2xNkHgkt/ETurgV/BgT0ND7QOKVRBL6Q3yZgD
	 Yl0rg3thOPNKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF1446077B;
	Sun,  7 Dec 2025 16:17:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A67F3151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D3BF40686
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoYBBIhk-E3d for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8872640681
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8872640681
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8872640681
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:17:37 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -954129895; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 16:17:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSHRz-00000004UXC-37ST;
 Sun, 07 Dec 2025 17:17:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207121406.3506520-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 7 Dec 2025 13:14:06 +0100")
References: <20251207121406.3506520-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 17:17:31 +0100
Message-ID: <87y0ne9sh0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=LpXSWb1BFUhMx/TGhhrKHX/j7mxLfO/RfeJv6Q1DAm+x3NeMAKFwe/fGalkyUcg/NeCtcQEed5SLhR0Djo71Ll6aTlAXu48wxuQT+hf5PZJYsCN9aIo33DZSkC5tOK2lrRrLVPbwpJF5XPKhG5EAPJJzmHj4+IW6wwqwFTUBSltHtQ/ZenRs4i+eb9ZGWAIEbfs8mqIo++GgR5zXxt8X4NxVmFK03gKp3xE5CSfll7bg+yVoddsecAiCND/3otoXz31XAQ4s1hkxZum8f0bThQI+pImRfHXEfEqiOCn1MHWlA9wBjhEshCZ1LmVWH5S2JXeigi0ZLbrg0Kgt4899DQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=9f1C2q0KNTvOQdGmaT0bgNo96g1oDkgZ/hlrnUTxbPE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=LpXSWb1B
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xkbutils: bump
 version to 1.0.6
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

 > Release notes:
 > https://lists.x.org/archives/xorg-announce/2024-February/003448.html

 > Updated license hash due to upstream commit:
 > https://gitlab.freedesktop.org/xorg/app/xkbutils/-/commit/6dbcbb55951efb25af2e38034bdd86fa095aa9e5

 > Fixes:
 > https://autobuild.buildroot.net/results/eb7/eb7d32e65eece403538032a9006ea2f573ea10f8/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
