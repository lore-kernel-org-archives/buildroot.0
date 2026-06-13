Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7993CD8CA8
	for <buildroot@archiver.kernel.org>; Sat, 13 Jun 2026 21:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45AF0605B3;
	Sat, 13 Jun 2026 21:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tba-2zxMIzVo; Sat, 13 Jun 2026 21:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71E10605B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781386380;
	bh=/yl6U2ExyEoz9IUDTwYPENd8hzl0BjVTmVCV5AxH1aQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ABGc73iwQJSdIzGHid2Xm6FvTnS0hF4lGUdqS3VUQ7MfjZm2EjXbSYFvQgz7dQpPp
	 pXuXZFu5WmzToTH4IwNXXpsf+uUZ3Wy4wfYb+99d6SA2gPdwwtu9iGr+GN0nrJjSwz
	 ZQhjuzS349j+/me7scs+LvhrHcmkgfffwFM607Mvv+s6GoC40L4U1RbvzlMe4fjW3m
	 B53B0KobJjRDm7Q2j6R6OdArNp0ksccoapiGOWBE8JdEscD6hY5DeraEsbAZtiFIGC
	 k1nFhi5Rk8/sHUgiEgSz9VXtmva1o65Y/NuT+ZMLtUF1K63ufiqbxuj9pczJc1NXsw
	 Jt3XkYG4rXcvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71E10605B5;
	Sat, 13 Jun 2026 21:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD5BE322
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 21:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE87540358
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 21:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inw3WIw6Zaqt for <buildroot@buildroot.org>;
 Sat, 13 Jun 2026 21:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8AEA840343
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AEA840343
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AEA840343
 for <buildroot@buildroot.org>; Sat, 13 Jun 2026 21:32:57 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -288673178; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 13 Jun 2026 21:32:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wYVyI-0000000F2wg-2OkW;
 Sat, 13 Jun 2026 23:32:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20260611203534.282013-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Thu, 11 Jun 2026 22:35:34 +0200")
References: <20260611203534.282013-1-ju.o@free.fr>
Date: Sat, 13 Jun 2026 23:32:54 +0200
Message-ID: <87bjdenn21.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CgcUyDEYUwlI0k4d9v94kBqmdezwOLqw1mTZvj9gTxm+jkPUGUNSRNJxr8zFAZB8OOzPpqAK22ChGs1z4g1G36HIE1er1FHiX0PkXqazQhXm8yqczY9Wgw6qzXlg72jBCIG01EPyq2DCrfLtdQnP3NRde5nldpAySyKp7eIdrvoqhFol6vmMAMC0G3HWEDNP12IwDvY9jBz8yLyyTHUN0hmeu/3J6A0BnzrpXgHuGG5oVd+4wLi71ZvhwxppySc9Cp1mGsHQa1F1PbVjZ4Y8KPTWIZ2lUQRV6v4e4wLq3oxhkceosR9c9gtk8Pr5kAgr/uhjHuQ0s20VKiEASQpgpw==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=AfSuH1TVaVG/4C/sYjn83RPIuipJune5Zf+vAJAbmRM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=CgcUyDEY
Subject: Re: [Buildroot] [PATCH 1/1] package/genimage: bump version to 20
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

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > For change log, see:
 > https://github.com/pengutronix/genimage/releases/tag/v20

 > Signed-off-by: Julien Olivain <ju.o@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
