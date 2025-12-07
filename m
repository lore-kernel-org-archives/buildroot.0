Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9009AD1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 16:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60EE64067B;
	Sun,  7 Dec 2025 16:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1JrxQQfc_B9C; Sun,  7 Dec 2025 16:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9366340681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765124108;
	bh=mcro+C/p+ZB11lmJ2iiRdUMa9en8gzw2kOdPBp/6oTs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VK9zDyC1YK1TJ0qWyoQt0SYqr4Hsk1OoCNJKew2IT/GJQG+VYE3YcG99JVTIp8A8L
	 p4Vofsivc3oVXJMSFBJCi91qWYryjzBU7l7A4ue14R0aTyQ0X/FmA5FE+h05oq3MEu
	 CEuTVyz1fgHeRgX3AWUo3ZR9W/KJuKqJBPyH44hO4MQa2V+g2dwz5XIlWm7BeYOB4o
	 goOz9D5xWzlZ/HmvfQ463vdrqeF/K6ZRThgFpRuH+iN4xdJZ2NdtsP6LgQ6Ov/Dwmn
	 J5BlG7EQGr2GgVLqcss5/K+hm9eeLtgPC1L7JVPcv0623cMFhi6zw8w4sRiHj9TN2w
	 EluYRk6I6VTnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9366340681;
	Sun,  7 Dec 2025 16:15:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10124151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9DDC80DB4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOicqKoeqQSX for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 16:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 958E180DAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958E180DAE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 958E180DAE
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 16:15:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -577853117; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 16:15:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSHPY-00000004U3A-02Sj;
 Sun, 07 Dec 2025 17:15:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251207144816.3699081-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 7 Dec 2025 15:48:16 +0100")
References: <20251207144816.3699081-1-bernd@kuhls.net>
Date: Sun, 07 Dec 2025 17:14:59 +0100
Message-ID: <877buyb75o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qF5tlR9bs0aJxfFA48L1kJW1/DZywAqtr4MM/RN2OCNhjL1zyWq24X5epfNxf6E/gppZpRjoev7u24A7f+Iy5uuzwfWr+9bRPblEErnvxlyvAcSHy3q1pNZiI5yVBSSNXot1B4dnzsPCAVqnPZDwOQ7SalPKe9FQWxIV5pxQPlfVXIAT7qM6o/tXKvjPT6vfOMGVK2yF5nyEXRgHppBFihS3pS5kTIJB3TRrMEV6E5CfvSMQFY1+3AJ2CryLzoZRstc2Fe/uME5sU8+lnzF22Cbqo0g/k3Qhy8JwAj6hGzHogdyy3JcgGVi5BzzTScJvwO1tg0Y1GSGc/M9wt6kSYQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=q81uxFaOe6LsTd8g/PCc+JoeKiKeO+rVDkd/MH/wdJw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=qF5tlR9b
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Prabhu Sannachi,
 boucing e-mail
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

 > Prabhu's e-mail address at Collins is bouncing, so let's drop this stale
 > entry:

 > <prabhu.sannachi@collins.com>: host
 >     mxb-00105402.gslb.gpphosted.com[67.231.147.145] said: 550 5.1.1 User
 >     Unknown (in reply to RCPT TO command)

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed after fixing the typo in the subject, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
