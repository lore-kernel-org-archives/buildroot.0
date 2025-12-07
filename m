Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED911D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5EDC406A9;
	Sun,  7 Dec 2025 17:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-JQCBiwN2u3; Sun,  7 Dec 2025 17:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0BEF4068D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127372;
	bh=mWxGGTrhU85v54uR/7+5paB0FaoYV5yRXWE2uVq2kFM=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NenJTF1fzIFYZFJiEKXI3smO/+DTCPLBNgzl3Z7yAWaqDy+aTq+pvhpiQUBDNk/XS
	 TscdKoY1s+HSPfOEPszuZSIslv+eR49BBK5gs8GZD1Q59TjXfiL+apmEbJ6mAsmpuX
	 hG6eGmocTrGA8piKMSVTnf/Tvyqq+jHEkxOIo36jdt34So+6qdbvzcsxMZxdraz8AV
	 Jb65HNKSUaWVFi7AhEWCKqZhAZvxv7fhP3DqrkCCsG+7/xT+AuYReFX+fHotfJg6Ot
	 m980N6pelO07qlNKZ5tBX2VQwY8Kb923UGg43GqxtEIZBh7A1tfH6wC3BYrO4BhoXY
	 GwEF4Eu/CaMmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0BEF4068D;
	Sun,  7 Dec 2025 17:09:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E759F2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D89774042C
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfoCeX9AYPss for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC86140423
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC86140423
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC86140423
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:09:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1842936240; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 17:09:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSIGA-00000004a3E-0nDA;
 Sun, 07 Dec 2025 18:09:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251206214530.2307283-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 6 Dec 2025 22:45:30 +0100")
References: <20251206214530.2307283-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 18:09:22 +0100
Message-ID: <87bjka9q2l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=k3DQZSs5+YPwhNvO3vFUL2/XSZripbR4rmmflSoXo+yupHZ+L45dsS+dEK9ITejaxDwdniOIl8uN+uJdZmjnCU3pTwfa1uOxbrzuKKL+PeyNOUbvttJ6fTrihQmF+juh/jpDtZygRspMgzgqPhctEJu60MwGXaAm/LDkJw8JUqaLLKlY0PGjGeFjPlWhKVl78/6AKYQSfTOsbS5vpuphl9pBdyIiDxRKF8aJDWMOQK9r7FDW0vR9CkByBYComzePKa1gbwMUYcULrFe568DnGgwzBNA6TQFrGRtFH8dqPBSOzjLQM7tFfazCKDVOKJ80+a7arhVfkEZxoMDVRSX75w==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=Ce1YFwQhKqK4C/ElAVTmbu42WvAd2/vQCYmNZCG5FrE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=k3DQZSs5
Subject: Re: [Buildroot] [PATCH 1/1] package/audit: switch SITE to https
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

 > The http link is broken:
 > Connecting to people.redhat.com (people.redhat.com)|209.132.178.26|:80...
 >  failed: No route to host.

 > No autobuilder error recorded.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

dmraid also uses http://people.redhat.com, so I fixed that as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
