Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F192CCD5BB1
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 11:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99BCE40F91;
	Tue, 26 May 2026 11:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Ck_38Mal18h; Tue, 26 May 2026 11:23:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFED740F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779794618;
	bh=FJezaXV/KzzifQS1ekQURs5hVD8q0UuqwthzYxs1ujc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sc+l9Qi+62MvLFsPMJ+eAhzVLFwBDWQ8fv7P2upzxGFsKzKDdQvYf/Rsp+7Mk0jBE
	 CRUyxBVLewMRXmH0N2x3FcKjzsXmI0XcyWoEW/G443GrRg6lWURP8XOdGb8M2P/xUj
	 fQp3+RikeESdY7i9BN5SLZtH93IlqAiWFyZfCHlY8wRJEuT4l5bR4yTRT3gWNofiuw
	 zTTU94ZZ/Np+R7GbGrTdKOlzeUeEMEOVnPxFS5EXZu+BmVPOFAAUVuQ+k8iLJcy6qh
	 NNqcAVGOm1iCAnKMh/l8rn1uU+To06XKkss2uuIls7rj6UnzTzsq0mMHq3vkwxCoQV
	 LxszoVArCDtzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFED740F8D;
	Tue, 26 May 2026 11:23:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1664C21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7920606BA
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2waMFkkVEkf5 for <buildroot@buildroot.org>;
 Tue, 26 May 2026 11:23:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4465760EB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4465760EB4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4465760EB4
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:23:35 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1020180314; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 May 2026 11:23:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wRpse-0000000EqhR-0ibe;
 Tue, 26 May 2026 13:23:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260523083556.51535-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 23 May 2026 10:35:56 +0200")
References: <20260523083556.51535-1-bernd@kuhls.net>
Date: Tue, 26 May 2026 13:23:28 +0200
Message-ID: <87fr3emn2n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=sqzVbMs/cXUH2P7G1pcz5SpzO/+VZaMiA9gl43fW52CgNuc/J8AyMXf28fzLlUygRcnS/LWvnmO9KMnfRc1859yth7xmIUlphXPEeljGySmFNLoS4hLpix9e4Ki5Rz/RE7Vj/3RI2WcHJQK9w7gBxWVZIGPmoUkM+efSvVL5snJU6npHQN6Lj13yS47T1wz7ISHTk2xLKVfTCwHOl7MtUbc+s7FVWa6JmrwagKGsClGltPPsZX+q5AITZ7/NQ7PCvMsHHIM2d6VaeopOyhpmCKEEJNaCJUceG+zxQv+2nPkidLpsWEL47xNTXWYYErspdntw3T9ghZl6ajEqxt5mCA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=LO2aV8ggnYdwjA1YftlEgqE6IhkWjqeXy5xwilYDUKE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=sqzVbMs/
Subject: Re: [Buildroot] [PATCH 1/1] package/nginx: security bump version to
 1.30.2
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

 > https://nginx.org/en/CHANGES-1.30
 > https://nginx.org/en/security_advisories.html

 > 1.30.2: Fixes CVE-2026-9256
 > 1.30.1: Fixes CVE-2026-42926, CVE-2026-42945, CVE-2026-42946,
 > CVE-2026-42934, CVE-2026-40460 & CVE-2026-40701.

Notice: CVE-2026-42926 fixes an issue only introduced in 1.29.4, so I
have tweked the commit message to mention that.

A bit unfortunate that upstream does not do security fixes for earlier
versions, but oh well.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
