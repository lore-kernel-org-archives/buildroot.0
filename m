Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8635AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2688A404C1;
	Mon, 24 Jan 2022 17:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eocsNyc5Pxer; Mon, 24 Jan 2022 17:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1ACDE401CA;
	Mon, 24 Jan 2022 17:41:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2181BF97D
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 88AD6400FE
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tr1zl7lb5CkO for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:41:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fx405.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B9EF401CA
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id BEBF23237BA
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:35:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1643045724;
 bh=aX7HR8Ycbc30ijWqtn18XwB9/tGKEiiDjFw+hdfLvso=;
 h=From:To:Cc:Subject:Date;
 b=FnMiIwFXNogcjSVQ3yV679TKeB8WT3EG6y9Z22gBRekoopIGIvYEND/gnQNSmakMe
 RljftThNWthPVqO/cigAxfuipO75vg1cP1kqjs3YurApFFynFVPBJz8XxhwkvqJ1Ow
 uFMJhRZzJ/fFrbq0jzZNlhzdGJXdS2c5rMnDkBTk=
Received: from fx405 (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 52BA1323747
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:35:24 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <169ca.61eee35b.e82ac.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx405.security-mail.net (Postfix) with ESMTPS id E99D53236A9
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 18:35:23 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id C531327E034A;
 Mon, 24 Jan 2022 18:35:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id AE47027E03ED;
 Mon, 24 Jan 2022 18:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu AE47027E03ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1643045723;
 bh=mYPgA72LONa7P8wybJ02naDmmkX+Be6QJvsN9bpwoLE=;
 h=From:To:Date:Message-Id;
 b=M2Nz9+brKbb0LeTb+4C+w93Dr+NknMvPVNgoghz8uKjv2ASw4PhYFvQqHFrGFyfhu
 CC9hRv50nwoM4Q6deHQqPshHTUnMpdPoawJDVZoHsna0YdE8GKDIPJOKWnEFZqjc95
 JxuRIE9kgHZ7TZ5m28Pyy262wzE5R6JgSDRAakQU=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id NDwgO1PVVTCT; Mon, 24 Jan 2022 18:35:23 +0100 (CET)
Received: from ws2021071901.lin.mbt.kalray.eu (unknown [192.168.37.66])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 93E8727E034A;
 Mon, 24 Jan 2022 18:35:23 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:35:20 +0100
Message-Id: <20220124173521.2236-1-jborne@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
Subject: [Buildroot] [RFC PATCH 0/1] Fix binutils/libiberty target install
 directory
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
Cc: Jonathan Borne <jborne@kalray.eu>, jmaselbas@kalray.eu,
 ysionneaux@kalray.eu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,
I stumbled upon a suspicious line in binutils.mk.

In BINUTILS_INSTALL_TARGET_CMDS,
libopcode and libbfd DESTDIR are both set to $(TARGET_DIR)
and libiberty is the only one set to $(STAGING_DIR).

Is there a reason behind this?
Sorry if this is an obvious question, I am quite new to buildroot.
I assume I am probably missing something.
I though it was still better to ask...

Thanks
Best regards.
Jonathan.


Jonathan Borne(1):
  Fix binutils/libiberty target install directory.

 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
