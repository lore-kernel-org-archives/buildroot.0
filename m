Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8AEDCD6E68
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 07:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9780661B8E;
	Thu,  4 Jun 2026 07:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eh10oc5xqjb6; Thu,  4 Jun 2026 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F212F61ABD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780559918;
	bh=qARzrKnnskkvcBo4CaBaPDgOgROcmvz6hQPJ5BWIBAs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WEvxIcnT47CNTf/280vFLyBCvk7P6ARs4DhEOQfaCBhfjrzezshJmj3PkjJwOT1yw
	 Sj3EzpAioHuQLA4U44LEG0It/GvGtBuYUbPw1LYqUQ6DHF3j9NVf6SPZT89gfOL0GI
	 6Jz4bW46ck29wVGcwC8FmrqfhqZCrKd0VSyWUGPobtJ9SWEIUCmk5WDIiICPKP86Aj
	 3dLmaKh/revcNs6oqeKGov4W4qBVtrhf+b+QA0BGltzqrRfueUv6QHI+aapOzvvOiO
	 UbzzyBuErgs699JXMLywGjvQE7sZpqUpIKkoXXLz8AETQ2wpNwPTT+xex61l1M/F9v
	 E4PdMCzcDVHrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F212F61ABD;
	Thu,  4 Jun 2026 07:58:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 46077192
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 07:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C10D84E0F
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 07:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R3Eu0IaK65Gk for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 07:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1EEAD84E0C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EEAD84E0C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EEAD84E0C
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 07:58:34 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2065741597; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 04 Jun 2026 07:58:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wV2yC-0000000FVUP-1tcq;
 Thu, 04 Jun 2026 09:58:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260604063222.193642-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 4 Jun 2026 08:32:22 +0200")
References: <20260604063222.193642-1-bernd@kuhls.net>
Date: Thu, 04 Jun 2026 09:58:28 +0200
Message-ID: <87cxy6ka8r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ORrZiIgpmNMqkTySxOhQm8FZCjo+uffwHhYodejfBuFGtuG6+b5xEdzBpUUag6QDsj8SiJAeeS2nuZLwktB+bLdfpBpvIrUcGXln5ToGKCrpBp7NfjtC381sLHkQzXKYidbOrZrd8Wyh1EpJghu0FhFiu0IqtZ1DxDMVP9jfveJrYgTioXlz6h/uKxBL/aBDEZo+f/r1HW1iNR53y96aI42pnAgoG8jdQnndX74SLrd8z2tob+8Jlqi+xzpugEv3PkmYh8HM5j3caK6C/Z8/3dQXKz+T9jYt0ry55jeEKvY9MWqwjGZrZ2LGB58iur2D+0Rv5NNaOM2VBP5KrdbVZw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=DfBg9hgKIRXZ85VJxlHhbO/XimF9HQW+mUv0VTb5cJU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=ORrZiIgp
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.2
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

 > Release notes of this bugfix release:
 > https://sqlite.org/releaselog/3_53_2.html
 > https://sqlite.org/src/timeline?from=version-3.53.1&to=version-3.53.2&to2=branch-3.53&y=ci

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/7d0e0c597611f09bfbd51f5c34d3945ece58f346

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
