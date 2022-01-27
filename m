Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB2DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 13:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C207401DD;
	Thu, 27 Jan 2022 13:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eGaEwSkq7ast; Thu, 27 Jan 2022 13:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F86440157;
	Thu, 27 Jan 2022 13:54:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5B881BF29A
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0B5360EF1
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 13:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="nPqQqB3k";
 dkim=pass (1024-bit key) header.d=kalray.eu header.b="POHzgtQM"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3l9gv9LpYOZZ for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 13:54:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fx301.security-mail.net (smtpout30.security-mail.net
 [85.31.212.36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2F6160DC2
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 13:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id 287EC24BD112
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 14:54:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1643291678;
 bh=WrDDNhAwM6V8ybhpji2hO9e5HxmmLOHWcoJZ6W02Wtc=;
 h=From:To:Cc:Subject:Date;
 b=nPqQqB3kC1rfk6bT5jwzwGQGNX0tWwPrl3ReiN0cD3JZwSyO8Zf63wSgLmtbtOd6D
 +zpxsPOTT5ltBDkWIH8GsRXDQaVm8qbiPKSa2+YG57b7AZS1snCfh+XDjjEOd/xHIs
 pQns17UgLYwsH2JvSqmG0cA/f83ztsZdGTmkSICs=
Received: from fx301 (localhost [127.0.0.1])
 by fx301.security-mail.net (Postfix) with ESMTP id 35AAE24BD15F
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 14:54:30 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <ee2a.61f2a415.668e0.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx301.security-mail.net (Postfix) with ESMTPS id B8C3C24BD146
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 14:54:29 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 475AA27E03ED;
 Thu, 27 Jan 2022 14:54:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 307C927E03FE;
 Thu, 27 Jan 2022 14:54:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 307C927E03FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1643291669;
 bh=bobuByNFNG4iuhce7rKgCEvA1FgcrpH6raAH4CdK4vo=;
 h=From:To:Date:Message-Id;
 b=POHzgtQMB3iZIt4YIpDfwID1t1XVDumoGW33sS6sDqrANkV0DcZMSc2YvV3nDjMtu
 OMGzqszn8iKgH3sPbfW2MoZ6sygrTCA3Q6p84y1DCDPeHcYTkXernRCn4WcMzFYOgA
 LHKpWkDvZzHf00ZZvvHxhNujJaeyO4/x/d4Vyb+w=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sOHTSWSb3txE; Thu, 27 Jan 2022 14:54:29 +0100 (CET)
Received: from ws2021071901.lin.mbt.kalray.eu (unknown [192.168.37.66])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 157AC27E03ED;
 Thu, 27 Jan 2022 14:54:29 +0100 (CET)
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 14:53:38 +0100
Message-Id: <20220127135339.25430-1-jborne@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Subject: [Buildroot] [PATCH 0/1] remove libiberty from target install
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
From: Jonathan Borne via buildroot <buildroot@buildroot.org>
Reply-To: Jonathan Borne <jborne@kalray.eu>
Cc: ysionneau@kalray.eu, jmaselbas@kalray.eu, Jonathan Borne <jborne@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
Following my earlier request for comment and your answers,
I'm providing this patch...

I hope this is Ok. This is pretty much my first patch submission...

Thanks again for your nice answers.

Best regards.
Jonathan.

Jonathan Borne (1):
  package/binutils: remove libiberty from target install

 package/binutils/binutils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
