Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98150D374BD
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 06:29:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1714092D;
	Sat,  6 Dec 2025 06:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNAoZV-s4541; Sat,  6 Dec 2025 06:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3093C40911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765002566;
	bh=55lruRlDMiVwyAh7kEcjlkBbBmKpodyHFq0NA9Rp0P0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkJ9/b4GzzxVSEMu8L3d+nxC0T+DguhLRZlLSp9KalFZwtQCg7bXcoFlJP2FwJ7kF
	 J/MuISAhpRXVz4oyf3/9GLyPzaT3yZeTv7Oie/Ttg6QdgKayQ8ucCY10qRQ/aQi0Za
	 SqQgSL4AFooeBFJZHP4jC7LA2JVxIie+HL2k6X2fQjdmximb4lrC8BK4djgY4IeWX+
	 /kx/MmSthXHNQrh1YnpNTSBW+9NWTeCbK3bNXV1nyll525TWeu1Xsqet+B/9i5g4g6
	 JHij3VBCwHTneFLiW0Y1G1IRSULB7ostWTT1jfezrw8/5gH707rZVsm2BzCLMG4+fM
	 AFe2aUosfriGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3093C40911;
	Sat,  6 Dec 2025 06:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75D881A9
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 678C780A83
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-aYG5Fcgcwl for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 06:29:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 05FAD809C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05FAD809C4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05FAD809C4
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 06:29:23 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -961613440; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 06 Dec 2025 06:29:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vRlnB-00000002ftw-3Gu4;
 Sat, 06 Dec 2025 07:29:17 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251205183502.1740567-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Fri, 5 Dec 2025 19:35:02 +0100")
References: <20251205183502.1740567-1-bernd@kuhls.net>
Date: Sat, 06 Dec 2025 07:29:17 +0100
Message-ID: <87qzt8cede.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ovyPTfduEcYtsX55wymvl69dK/f8sugo5CcEmQt1ECOknBSjqiOPAo2+5H1qcq9OOj+bkD5Wun65kleou5qb0sHdRiGFkLfvbTJaxO0yzUpW5Dpf57OKZyRZLgQBuw8+FPKiDe18b36eaQ27UGACJBkBIPPtF8TwQg/2xwmjgPg7Mjh3FcFs8RvXcRr2SXLhdW0QUpHplEE5JR1OhGpoLduE3xJdODInYkUIZ+Lag4K3a4xUFlElDdp+zjmK7Qd9I96sUY20NLbe9DrdhAm1uKb0du2tO5/HOMsyLZSU6REa4N2kIYMNeryyT/gYEsBLK+syig7x+kTEZduy9UXetQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=zcWNj3lnnEguDPiNGm7k0kKnBz/RW4tA/ZnrpUCDbVg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=ovyPTfdu
Subject: Re: [Buildroot] [PATCH 1/1] package/lugaru: switch to github
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

 > Old site returns 404 for the tarball and does not contain any repos:
 > https://bitbucket.org/osslugaru/workspace/repositories/

 > Switch _SITE to URL shown at https://osslugaru.gitlab.io/

It is a bit odd that the website is on gitlab but the tarball on github,
but oh well.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
