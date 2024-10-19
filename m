Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B821D3C92C
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 20:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 134A740249;
	Sat, 19 Oct 2024 20:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dEsGLuYEmTsg; Sat, 19 Oct 2024 20:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4E5B4019A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E5B4019A;
	Sat, 19 Oct 2024 20:10:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A72527D7
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BC326074A
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KU5u5IojISde for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 20:10:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 659C160598
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 659C160598
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 659C160598
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 20:10:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E72160004;
 Sat, 19 Oct 2024 20:10:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1t2FmW-00Bjjq-1Y;
 Sat, 19 Oct 2024 22:10:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Brandon Maier <brandon.maier@gmail.com>
Cc: buildroot@buildroot.org,  "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
 <20241005-dtc-1-7-1-v1-1-89550f828a4c@gmail.com>
Date: Sat, 19 Oct 2024 22:10:36 +0200
In-Reply-To: <20241005-dtc-1-7-1-v1-1-89550f828a4c@gmail.com> (Brandon Maier's
 message of "Sat, 05 Oct 2024 11:58:44 -0500")
Message-ID: <87h697c0qr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH RESEND 1/2] support/testing: add new test
 for dtc
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

>>>>> "Brandon" == Brandon Maier <brandon.maier@gmail.com> writes:

 > Add a test that runs the dtc commandline tools. To test devicetree
 > compilation, we use an example devicetree from the dtc project. The
 > example source is GPL-2.0+ licensed.

 > Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

Committed to 2024.02.x and 2024.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
