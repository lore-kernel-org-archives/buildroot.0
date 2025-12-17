Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65574D64083
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 07:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315E440DA0;
	Wed, 17 Dec 2025 07:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92mun7T3a_8g; Wed, 17 Dec 2025 07:08:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8B37409F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765955336;
	bh=/mVsBQ5YqEWdAxa5WRrT4eyDXHvHAV3Z4a8n63NJuuc=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2q7Jkgc1LGeCucvMOWFBOzaBRW9xnJOlsBytVaK/lT3pTm7tB3TFqrKhDS39T+Bd
	 ooLBTCmjjdwwKlFEpo5LUdBATJMGTP6+54IlhylW8uARhOuBACNRuIAm0lU0yQ7onM
	 ZNyzW95ulwpwnulPjl6z95C30XRezSnukfY8lbdso5HM+UYHbhR7MFb0+AamgdKWuw
	 DnLjgz0E5UHIRCgihv7n6oyRK7jVNGpTmv3Dsrm6DcLYRYTjsScurqHk8hbdq02Q4/
	 cNP7D7TsOHOhyOXs8R3jLjY1zzlLQOhgG3KZUmxmb2AeVb2ugWiKee9qwPy8SEO5UC
	 mBWMhKvDUIq7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B37409F2;
	Wed, 17 Dec 2025 07:08:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01CB835B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E748F607DD
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puNVBM9_QjTI for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 07:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3498607CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3498607CF
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3498607CF
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 07:08:53 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1923364895; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 17 Dec 2025 07:08:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vVleU-00000004K00-3BhY;
 Wed, 17 Dec 2025 08:08:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  Martin Bark
 <martin@barkynet.com>,  Richard Braun <rbraun@sceen.net>
In-Reply-To: <20251216182845.2575378-1-buildroot@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Tue, 16 Dec 2025 19:28:43 +0100")
References: <20251216182845.2575378-1-buildroot@bubu1.eu>
Date: Wed, 17 Dec 2025 08:08:50 +0100
Message-ID: <87ecot8u0t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=L2x7TkGdZDVz+Mwydh47lbLRuVBiogh+BQNMcIah+0xrbnnfEjAeNDlIuEXKke+/olEImykZuQGow4ps6f2Io+oZOXupgT7cpnRQ6qKAobQm6ELJMqXDkWVteaUiw2fwS1qafbUkRtH7gV/skf7ymcliAbsQcXtq9DQ4WSVG+WKKitTRAtHrKH6AuJxcZzp5jwllgfP2JYXu+SLsefynxeAB/FWUoZ7DXcpYicL4kpTKHK9xoG+wcAKoqdL5eScuZEkhqRDzFKO3r2BtjKLqJMOyInJDwzjGAzb9/NDdUYHo1edB6dvwxqfZYiEnhwO/hEQttnMLxHD2/+j9yi+QqA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=4Gl//6055bGTAADJilpee7FWBGO82R+dztGaA6nnOZ4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=L2x7TkGd
Subject: Re: [Buildroot] [PATCH 1/2] package/tzdata: bump to 2025c
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

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Release Notes:
 > https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

 > Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
