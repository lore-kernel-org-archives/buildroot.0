Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCCC108E1DC
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 10:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C801417FA;
	Thu, 19 Mar 2026 10:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06Dnb-gVpBRN; Thu, 19 Mar 2026 10:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49DC417DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773916293;
	bh=XCD56J/bmQ7yv+ELB3LZY2wABJDQYDOaYs4ZSu+Vy0w=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VE6ITRmpfQlb9BnAhz3xrIpezqsbhp9BCsz7wDUmuNDnVPpzJ+Bu4fBgsMW9QAshR
	 d2U1IJjdGTEmfvA/GZHraCQA4OcKvGdwUTLHXpTpu5rqaNT0cTjJX/4P1jRxRWf2Yf
	 rL4aFHQZx9RHDb+LolvSZApkaK8fqpku9wq13QWD+I6rtOq19iYPmngg9Lw5xOGe4i
	 GOmvPAIns4tZgf6rsWhjZg31+HlMaXLms1+Ld8as8xk04l0GkXROdrq3KpqFcu84gv
	 fxUiLcJ6YBOQLl9Sgcuks0mUsHy4c5sygIAw+8yKW5GwzumTEnKp6eK5D4hiw13xDU
	 0qPe0p8YHkusg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49DC417DE;
	Thu, 19 Mar 2026 10:31:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 482F21BD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 454CA40188
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1mE-KL5dXpJN for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 10:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B8234013E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8234013E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B8234013E
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 10:31:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -551005311; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Mar 2026 10:31:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1w3Aew-00000009I5e-2Hgu;
 Thu, 19 Mar 2026 11:31:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: Christian Stewart <christian@aperture.us>,  Julien Olivain
 <ju.o@free.fr>,  Julien Olivain via buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  James Hilliard
 <james.hilliard1@gmail.com>
In-Reply-To: <20260319101938.68045-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Thu, 19 Mar 2026 11:19:38 +0100")
References: <87wlzehme3.fsf@dell.be.48ers.dk>
 <20260319101938.68045-1-thomas.perale@mind.be>
Date: Thu, 19 Mar 2026 11:31:22 +0100
Message-ID: <87h5qcdsat.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=KokjSHBakQ9FnJXyrx6TQjGipi57XVfLTw35O4pfDM2lwoztd7K7DDmLlNSDMMQNaqMnufOinhTc/hYtuyAQPC6ic10Pyhw5V1rNJPlGyVzCGI0aUcxw8e8+sVCn1B6ABMMuKfFLt1c5HMmLdgSIlALXyKnTNGJ6PN/uElYn91umwSFerRsI+O7M0EUALnXxGWpmTt70iVl6oO4S9GMy1ovVBcMQKXSpMQ5SCUjKFuRVzh92pQT6aGQ5aDfkeZH1cW4wrUkHBLACocKmhvLfHibx9bqiQqCw0iN2r3TrfVj2LYc6yRWRFxXuGmBE+tR+7dqqgim6BOrGGMgNGGO9lQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=M8pAp5SKVx3FUjCw2JgtWqF0V7N4jrij0QP36ZumAnQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=KokjSHBa
Subject: Re: [Buildroot] [PATCH v2 1/1] package/go: security bump to version
 1.26.1
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

Hi,

 > I'm jumping into the discussion. As I'm not a Go user myself, how do you
 > (Christian, Peter, anyone) see the update cycle for Go on the LTS branch.

 > Should we update "late" to the last maintained subversion whenever LTS is based
 > on a version no longer supported ?

 > Is there any other source we can follow (Yocto, Debian ?).

 > How much breaking changes are those subversion bump introducing ?

I am also not a go user, but what I have done in the past was to move to
the next release series when there was a new security vulnerability and
the series we were using in LTS was EOL.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
