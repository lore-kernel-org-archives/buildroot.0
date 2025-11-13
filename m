Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5920BCD5BAC
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C793960FBD;
	Thu, 13 Nov 2025 09:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w33DZQ0UnSka; Thu, 13 Nov 2025 09:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A49060EFF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A49060EFF;
	Thu, 13 Nov 2025 09:33:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDCBA230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01788123C
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPN-nWV9Vqxb for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AC56680C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC56680C1D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC56680C1D
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:33:45 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -219114958; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:33:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTht-002AHo-1V;
 Thu, 13 Nov 2025 10:33:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Bernd Kuhls <bernd@kuhls.net>,  buildroot@buildroot.org,  Simon Dawson
 <spdawson@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>,  Lionel Orry
 <lionel.orry@gmail.com>,  Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-3-bernd@kuhls.net>
 <875xbeqoek.fsf@dell.be.48ers.dk>
 <aRWj7LU4oqfhuCK8@waldemar-brodkorb.de>
Date: Thu, 13 Nov 2025 10:33:33 +0100
In-Reply-To: <aRWj7LU4oqfhuCK8@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Thu, 13 Nov 2025 10:25:00 +0100")
Message-ID: <871pm2qnte.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=NAj4NfB6g0KKyZY1lfl7MZUIoHPGGomgeWdPRVfY2r1vsd52V+/wFnANMQJlOlg/D4PrhwqY2tQX5sB0u5yercRv4gCkI30mamWYsdvJ73xVGe4sZ7EjQiNc2NR1XteA7VEmEM2a4Uj2Wut+8+7w3rOklK6uFvDdfL0XOdlYyYLNOZwjljzp2DJnkBE4jay5U8XqCFsInOgLG4s/9cHKuvY6aiWrEhH7KK9kXGQF6wI0igEhThujBvJnMjYWLNG0YZXOk38HiYjEHFTHGHn/Vly1t0HlfswptlJA32OrLdEPPf7HThu+KfLh/pE0LRT0Mclvrq6wU1PvLQLBRj55og==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=nARhimk5tIT2BkOov17Uh3XTFyrE6qb/v4mxz2tMuYo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=NAj4NfB6
Subject: Re: [Buildroot] [PATCH v3 02/14] package/libjwt: remove package
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Hi Peter,
 > In my opinion it can be removed. I was just maintaining it because
 > of asterisk.

Ok, thanks - Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
