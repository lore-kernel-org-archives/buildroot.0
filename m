Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FF7E8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:47:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4C12608AE;
	Tue,  3 Feb 2026 22:47:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oGT9l-1r5okh; Tue,  3 Feb 2026 22:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8B1F608D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158870;
	bh=gmriJtZAIIWleZRsJN/1CQXviSo3C5l4//OcT3GNDg8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mGGhlC5PqXQ0xDVQuI2Ol/rJgZAb4KbKDltroG6teW0ooOHYXvxoABlW416Qjjch/
	 9XWkhJ60sQo+RyC7ecLPCODmF1NCjA/HhEn8fZBT1U2/VvkelUgBVGiOKDtp+80daa
	 pNHmZcW29USoJ+PCbqNuU/YvWjD7JbapC/4IoQDNpiBgZ58eVOq2XfTbYOW4RlJWyl
	 wGdJUc8djayUTga6iGehBzPe+dc3MApeqn1SGEDXu9+iEubq9qEyJijtwmE3bXVeOh
	 6I40U95YoL8xi408grW7KVBoLKMoT++q1opsMdlrHCqvCHx2JIXSh4Fyjk6StHvZHQ
	 qQpWFtO1RNP4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8B1F608D4;
	Tue,  3 Feb 2026 22:47:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B064F13D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90F3281E29
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SruAtemNkkml for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77D8481DEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D8481DEC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77D8481DEC
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:47:47 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1600840755; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 22:47:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnPBQ-00000009S6h-1ADR;
 Tue, 03 Feb 2026 23:47:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20260202213637.396090-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Mon, 2 Feb 2026 22:36:37 +0100")
References: <20260202213637.396090-1-romain.naour@smile.fr>
Date: Tue, 03 Feb 2026 23:47:44 +0100
Message-ID: <87jywt8mwf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QyEFND4HGs0f7+CVdrjKsYrhhAToz0mHxTkfZXgyCo6Z3Emafi85Y6WpeFe/wTKoY+Q72jeibQh6rw5cyJnPUR/8BvRb2gsyKuAQ1zx18pqO5JR+vAPlfLmG53ddcWdKOSNDNeO0q4q0/fJm+I0jzApNTm63nsKgikZWOwcMObmp5yOqPeikc3RSdAmuCEv64zFGxiBkJezOjsH9GymWiIpNNe2ti/QkJMRPvNe9nHJ6tJzcT9tCKX2GnAB6T+PvHkHzsMu+N6w8iN2ag1ZPI++D5iZQUetTHnYBQkrdssgQFuEuWOwF/aHa8cQTslN2MWJSWtmaJcWpR5mN+cm4uA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=5LmStLR5F1gqXnVRIvWisNi9HmW1qeFouja8vuwrPG8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=QyEFND4H
Subject: Re: [Buildroot] [PATCH] package/php-lua: add support for php >= 8.5
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

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Our php package was recently update to 8.5 version [1] but this version
 > removed some old function like zend_exception_get_default() [2].
 > But php-lua still uses zend_exception_get_default().

 > Replace zend_exception_get_default() by zend_ce_exception as suggested
 > by php project.

 > [1] aedf131da66d2f2ebce64788deab07be17ce33eb
 > [2] https://github.com/php/php-src/commit/a812a74c2e60a0ba080057067a7634e4da3f2b9b

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797268 (TestPhpLuaLua)
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797270 (TestPhpLuaLuajit)

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 >  .../0005-add-support-for-php-8.5.patch        | 34 +++++++++++++++++++
 >  1 file changed, 34 insertions(+)
 >  create mode 100644 package/php-lua/0005-add-support-for-php-8.5.patch

 > diff --git a/package/php-lua/0005-add-support-for-php-8.5.patch b/package/php-lua/0005-add-support-for-php-8.5.patch
 > new file mode 100644
 > index 0000000000..de0b00995d
 > --- /dev/null
 > +++ b/package/php-lua/0005-add-support-for-php-8.5.patch
 > @@ -0,0 +1,34 @@
 > +From 2c8b642b70edf5b0602b10a25d3f04874e175276 Mon Sep 17 00:00:00 2001
 > +From: Romain Naour <romain.naour@smile.fr>
 > +Date: Mon, 2 Feb 2026 22:12:48 +0100
 > +Subject: [PATCH] add support for php >= 8.5
 > +
 > +php removed zend_exception_get_default() and replaced by zend_ce_exception.
 > +
 > +[1] https://github.com/php/php-src/commit/a812a74c2e60a0ba080057067a7634e4da3f2b9b
 > +
 > +Upstream: upstream dead, custom patch

If it is dead, should we then not drop the package?

Anyway, for now - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
