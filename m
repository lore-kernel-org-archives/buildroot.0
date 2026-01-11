Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37805D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3C181286;
	Sun, 11 Jan 2026 17:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1R3t7aM3rMeM; Sun, 11 Jan 2026 17:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B18FD812D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768151937;
	bh=kG5X+MjGAbEY2kLwu9RCLBPR9DWKLMmdOLkQhWGr6X8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XeMGeNkVVK0IdTtPPga4WpawXHASDTyewWlBNJ8nymHq7PIf/FOZ5CDzabztlqwBN
	 LhxQRLSa45sNB47qhqY442t6qW9aydNqrG1jyYeyWmHXXrSCFx/Tvc3evX8V4DQE43
	 6Q9DevOjp+9PpjF43vXJws3XPrqZiggHNhkAK6vG1teepZunNPSTTlEbUg9QMTTJBq
	 whgBaa0rBo2xDPkgkij0SR39I34G7ryfi5MyrwOXjEVNixuP4xjjkLDkHaobq+yyFX
	 9yh7a7utLtIBBnX6lWZBmlOUq1Q0ZVlektK6mwUkIwwylc49fJOy5HuZfeBOqI0+IG
	 hng9kQst7VEJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B18FD812D4;
	Sun, 11 Jan 2026 17:18:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A9E071CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ED1A608A0
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vlr6NS5mD9Qp for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:18:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FCA960898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FCA960898
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FCA960898
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:18:54 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -637176878; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Jan 2026 17:18:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vez5V-00000006sZq-3oZa;
 Sun, 11 Jan 2026 18:18:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260110180655.2221592-2-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 10 Jan 2026 19:06:55 +0100")
References: <20260110180655.2221592-1-bernd@kuhls.net>
 <20260110180655.2221592-2-bernd@kuhls.net>
Date: Sun, 11 Jan 2026 18:18:49 +0100
Message-ID: <87seccysna.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Cw8mPC0hDUKTJggD3Le4+9tClCZBBoBSyVe65diW1JIjZycz/CcHK2tqC65j6AhdF3wXiuChCsB06CPq0XmEsIuTOPZp/EQg8rQdsPSplA9O2hh9XbEOGZuQtWuKuHjMqz98Nyu8S7y4NLkzk2GYuN6bs4THMSTt47AFR7CQPR9n/FUnLg/t5cUx73oHGTmOXoCbmPLGNb97XPgvFs8ACQa7nQ8/QQt7lkWO6AE0Doc0kUi/G3QiA8HA6Sfll8qsBVjbOuSnMqc2BKujcFJcIWL+1o3SSAZ/jwEWmqtqahlEcrVeIWa+qm+WJKqGWMayfw+eI9BIAp+z3yCvG+Xnpg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=TCK6YQxCAvcuXU58Gn+cj/6bs0kWBtqq8iqvRhxmUdM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Cw8mPC0h
Subject: Re: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to
 1.2.15.2
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

 > https://www.alsa-project.org/wiki/Changes_v1.2.15.1_v1.2.15.2#alsa-utils
 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
