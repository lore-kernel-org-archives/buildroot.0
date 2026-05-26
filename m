Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576CFCD5BB4
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 07:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2138840F14;
	Tue, 26 May 2026 07:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BL9Y1n5J0Y_X; Tue, 26 May 2026 07:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34ACF40EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779781374;
	bh=CPs/w4hjYOiHC89uQVCSGkrNOBDKtZPRl4nwZzREUys=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jyYx6RuqY8Q0268t2ls4j9KcJCNBf1mHtXfnZ1iEyowUikDO6GPlEOPCONacEn2Fw
	 HyX4/kpiFpLxaldwwvbNWKR57X4cbAzPqez4gZ1qARoLEZ7DA8LzcercwRKwjjpKNy
	 RLkrO3yatwJkFHMBXndM73kF2D3cYwcjY8mHJKNruSE3o5pMjrFBh+mlXUMDOntZb8
	 BCnaBkfJEhEwcxgCAwF5ZghrnyJ6cVpseGyp6juB7MPcyAEbEcB5H8mn4yr9pPi4rj
	 hAl9euGM99MPnpcX5sGnF8yBA3REEVTHzVflM+RWx0IOh28zPL8wG6WFS5nPNUhZCq
	 LZjZtExBG1tTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34ACF40EFD;
	Tue, 26 May 2026 07:42:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EA36821F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFA7E405DC
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmwlWfHG1VRL for <buildroot@buildroot.org>;
 Tue, 26 May 2026 07:42:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 679F44030E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679F44030E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 679F44030E
 for <buildroot@buildroot.org>; Tue, 26 May 2026 07:42:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1473169631; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 26 May 2026 07:42:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wRmR5-0000000El6v-1k9r;
 Tue, 26 May 2026 09:42:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: Thomas Perale via buildroot <buildroot@buildroot.org>
In-Reply-To: <20260526072249.15442-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Tue, 26 May 2026 09:22:49 +0200")
References: <87qzn3aarf.fsf@dell.be.48ers.dk>
 <20260526072249.15442-1-thomas.perale@mind.be>
Date: Tue, 26 May 2026 09:42:47 +0200
Message-ID: <87jysqmxag.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KBJnXJFB6bnKLcjzhEkr717f5ORVEaIn0ClfSIw6+nSNjiYjUXtRVE0C0c5zHG29wseQCdonbS5FYtyh/zXakg72mUKpFPCC0cN+wAg0wOcN2/BIMw/luhlPDF2rLMDUYZLn0Jf9yxRCyh2iXC51BBE9QEGNkrUtr3DQ6UI9+6QcG1yBXGicwpQ5OCaa+/wcR49bE1nZmpT189YvLMoBaECAdxPoNKewPr0/q1M5z8xObNZh6fgM384QxrW4hL56P/NTrZZ6Pcx4nRQTYkGRE0RgVnsPBJ9Nypz7oZk0so+YDznmyzWFA8th/RMKKCzKbHTwjlQKDAlJdnc0AThGpw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=dmmeDSRTzQosfXlCCN6PUb+t3UylrkqaY9V6kDnVJ8Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KBJnXJFB
Subject: Re: [Buildroot] [git commit branch/2025.02.x] package/dropbear:
 patch CVE-2019-6111 CVE-2026-35385
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

Hi.

 > The reason was to avoid regression induced by bumping and keep the change
 > minimal, but as we can see even minimal change can trigger regression ...

Yes, it is always a tradeoff. In the years of using dropbear I cannot
remember encountering any regressions from upgrading though.


 > I will bump since it doesn't include any notable breaking changes except the
 > one that is introduced by the fix for the CVE.

 > Thanks for the notice.

OK, thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
