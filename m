Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B671077617
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711C683B7F;
	Wed, 18 Mar 2026 20:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zog5ZE-uFAQZ; Wed, 18 Mar 2026 20:29:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7060183B6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773865757;
	bh=9yW0E8grhOnY+asWKZ6RuWCVI/RCCEGJjt2aIFFMbos=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F0+XoI39u3KhbwfU05H+/Saq8xq4qgH348xGasM0oH/21evW1I29Q5cRlfAW5Q0bb
	 XJ5wxX6ZmxdtWdHxbNqu7ZtHXiqqAjbEt0ZeN2OqQo1ZU/OZqgzPa7DDAbWEHISGrW
	 6FDWN43JqODN7DP9i1yWHF5Ckq05STktpp8vTi3mvDF4/GMkczqay5F3IcTsQYmhH2
	 Ho++R8lXHz4W0RdrB7Wuex0wDUBncPcufvOg2OAeMw9HPSBx5lqMHvs0xCz2C35PtJ
	 Li7zkqeiziDyypT851yCyhM0QP+p5BrzhPWpOqVwrky/wYCHV3n2RLj0/cpBoiSdqA
	 fQywBiJ4xPbyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7060183B6C;
	Wed, 18 Mar 2026 20:29:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B341C1B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98A2341748
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yytkrko8gYRG for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:29:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07B9B41738
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B9B41738
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07B9B41738
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:29:14 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1394085267; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Mar 2026 20:29:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w2xVr-00000008LSy-0YOR;
 Wed, 18 Mar 2026 21:29:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260315080229.66759-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 15 Mar 2026 09:02:29 +0100")
References: <20260315080229.66759-1-bernd@kuhls.net>
Date: Wed, 18 Mar 2026 21:29:07 +0100
Message-ID: <87ldfog9v0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DD42jYB9saXy1Mr+lSCG6kjMCJEWCquMG/4R6Lee7l2wceOJocNUU8PrGTHH3qz2kSSxbjo6xrponYmpaW4Av2O8SAceWWtwI/uVB3GVOQYK62lTDzetjyZLzkTXnYI97XNTpgPKZ4lY8WymFqhvvojyxY/8n6IBUMpiMMsPc0cBAEvYc0HvMqfuwexsgkj0y+mwzSwTdgyYKzSFUFKww1vWHYGKOLK3/BJJiNTn17axJVQhcPd46PnvIeMXgk129dCalYwsQdUpHHe3mmysYe+DBBtO0l4hzGsw0Qv1MzgVeemSCM/rC/kPlAzlTvlA+r/fslXTfGF8fziLUPe78w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=DD42jYB9
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: bump version
 to 21.0.5-Omega
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
