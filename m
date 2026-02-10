Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3206FEA3F09
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 06:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47D480D93;
	Tue, 10 Feb 2026 06:44:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDBzdCPQKkjA; Tue, 10 Feb 2026 06:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A85780D99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770705885;
	bh=upQ0Ik9XdQD0LA/OPLQoDi1xwbqQPLfKg/uyjak6vv0=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=keNEbta7GGH/ijAk5gHOtVkfQmpnxIlb73uG6eCC4lttPw+212HlpqCPlhPeI074l
	 O8SgB8EfRsTJlQLeCBE6gswtmS+PRov1u1xfNwrysfSQTyFLGIFOoFrp572QZth7Tg
	 5tg5mjwtMKExvEH+wyxZX6EXs1BU+8OHHKK/PyqdL1uDQ85fHgejSFpMOnczmf8oOW
	 bm3vcACLlgEehyz/ZpbAbdpZCl6D2g6EC842jjEWBjyB+FfwR11b4ya/EjYmEI8SLL
	 HqrgvDB0ks8cqgb81nkVRCEnYANvK5Wo4eCpHFNjqIeVj/Tvm/9LiWOtlvxlI55zpQ
	 1tgd9kYYJb7Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A85780D99;
	Tue, 10 Feb 2026 06:44:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 363171A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26FBE80D77
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ibCje3gReeA for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 06:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7C67B80CA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C67B80CA4
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C67B80CA4
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 06:44:42 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 761427093; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 10 Feb 2026 06:44:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vphUC-00000001Yb9-1QVZ;
 Tue, 10 Feb 2026 07:44:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>, titouan.christophe@mind.be
Cc: <buildroot@buildroot.org>,  Scott Fan <fancp2007@gmail.com>
In-Reply-To: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
 (yann morin's message of "Tue, 10 Feb 2026 06:58:39 +0100")
References: <3c42d6a8803c28ce34156eee659e25875b916075.1770703119.git.yann.morin@orange.com>
Date: Tue, 10 Feb 2026 07:44:36 +0100
Message-ID: <87tsvpqeqz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gvYhgdVppbn6mT6RIq07fhVgSBuS+lUXMe7krEIjlCq2zT+bIToiJQUAJHwdmDj7jrdEgyTlG1z/wDvgSCqwosET5HeTBfS/5dF+GV9RsFuR/4HpAFnC3POnCzGZDjGNgubRjCpsa5ivQSDxY8tvTMDP5DQjMBcdJ0pLJsvnPJgyfSQqtOBefKXA+1KB4AQUZ1RphX7Kk3RPc0lXkTBAQ+QctMkFWuQgjW/BugmLQwhX2a4sx6gsy5Ud1/X89WMifs6VBqXTw846Jht30IV9H9A5ZWy2FWbZkRB8b5UKQaGOLu67ujNuAeDmAXi5utOuYlfZ7Fab8yKiOQuJVJ0wsA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=md2n8EnGCwKt9NOnjRInb40VkQ55X9AFexK/ZFgiri4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=gvYhgdVp
Subject: Re: [Buildroot] [PATCH] DEVELOPPERS: adopt mosquitto
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Scott Fan <fancp2007@gmail.com>

 > ---
 > mosquitto 2.1.x has been released recently, but has changed quite a bit,
 > which needs quite a bit of tinkering in the .mk file. This commit also
 > serves as a sign that I am working on the version bump.

Great, please coordinate with Titouan who was also working on it during
the Buildroot dev days.

Also notice that upstream released 2.1.2 yesterday with more build
fixes:

https://mosquitto.org/blog/2026/02/version-2-1-2-released/

Committed, thanks.

> ---
 >  DEVELOPERS | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/DEVELOPERS b/DEVELOPERS
 > index 225d1ac917..296b79f9e4 100644
 > --- a/DEVELOPERS
 > +++ b/DEVELOPERS
 > @@ -3481,6 +3481,7 @@ F:	package/tpm2-pkcs11/
 >  N:	Yann E. MORIN <yann.morin@orange.com>
 >  F:	.editorconfig
 >  F:	package/gpsd/
 > +F:	package/mosquitto/
 >  F:	package/skopeo/
 
 >  N:	Yegor Yefremov <yegorslists@googlemail.com>
 > -- 

 > 2.34.1

 > ____________________________________________________________________________________________________________
 > Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
 > pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
 > a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
 > Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

 > This message and its attachments may contain confidential or privileged information that may be protected by law;
 > they should not be distributed, used or copied without authorisation.
 > If you have received this email in error, please notify the sender and delete this message and its attachments.
 > As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
 > Thank you.


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
