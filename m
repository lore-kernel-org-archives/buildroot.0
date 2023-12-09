Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097F4C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 14:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE0B360B89;
	Sat,  9 Dec 2023 14:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE0B360B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VN6d9_GwF-MH; Sat,  9 Dec 2023 14:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1794160B57;
	Sat,  9 Dec 2023 14:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1794160B57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BA5961BF2AB
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EB6A40930
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 14:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EB6A40930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv7LuYg1VcwL for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 14:54:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FE5E4036E
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 14:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FE5E4036E
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ECBBFF806;
 Sat,  9 Dec 2023 14:53:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rByiI-000ADQ-0H;
 Sat, 09 Dec 2023 15:53:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231208172114.1514561-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Dec 2023 15:53:54 +0100
In-Reply-To: <20231208172114.1514561-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Dec 2023 18:21:14 +0100")
Message-ID: <87ttorpgu5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/erlang: fix build without DES
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Will Newton <will.newton@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without DES raised since bump to version
 > 26.0.2 in commit 2cfa86a54882f2831b36a78a0ca642aa3a4bd0a4:

 > cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
 >    51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
 >       |                                          ^~~~~~~~~~~~~~~~
 >       |                                          SN_des_ede3_cbc

 > Fixes:
 >  - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Add a patch instead of selecting DES in openssl

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
