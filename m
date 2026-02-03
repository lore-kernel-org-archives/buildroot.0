Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D705E8B370
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F110606EB;
	Tue,  3 Feb 2026 22:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKsVbFCKNLo5; Tue,  3 Feb 2026 22:38:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29DE0607F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158316;
	bh=f7UQEjlpbpOs2YeoXOZNw8mDxHQ733EXzydrDqXRxH8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tx2J+/1gib2oVDZSCAv0zsl2OS5Z8VYsTJblHbodFuAo7fKddTJ5ANzHOBP8lcv7g
	 qeVf1oVQTV/MKD64OyB/i1dnlWRkjEaE+39yCxb6Jh+VIThBnOC5g2ry/qsYEj4087
	 3cDgkbf8EEqlcQLHodabOFv+Zq+0gmwp5a3oHX3jE8fbIN7ZCX/smmCaOsXjHPIRVO
	 VIWjz04am0DkGVZKE52lxh3ttTxHbnUjEtfiTUVzO0Cb6NkD8BGF2vC1sg+QFzZ36Y
	 Pef/5YOgpjeCQtTwfzILP45WDX/GkkF8TJEIcPKcdSuyKvzcDP7AA7jqC0le/WLPW4
	 3/sccU6Oowuig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29DE0607F7;
	Tue,  3 Feb 2026 22:38:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76FEFF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DE4D81240
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoKVjh5oVPzW for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C207C81202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C207C81202
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C207C81202
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:38:32 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1882245069; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 22:38:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnP2T-00000009RWM-1Vzo;
 Tue, 03 Feb 2026 23:38:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <20260203145620.806729-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Tue, 3 Feb 2026 15:56:20 +0100")
References: <20260203145620.806729-1-ju.o@free.fr>
Date: Tue, 03 Feb 2026 23:38:29 +0100
Message-ID: <87y0l98nbu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SYwQbz9s3yaADse48S/dzLvBV5aa0XePBWPaLRZqsKJDzrih9olECoN4N93hFYW+ZR9x1oUcY5cb81z9LuOdxcayfj4z6UHGHw/WTBPLPs3Hxlz+RV+rThNBVQewp6xbC8bdoRBicxmS9fMqyFWKHn01V2T8JJgVf+hN/HCqnkgNASi9g75pzB8ZA5ioc72MCsmIQrMPsTZIOA+iZ5TkwD77F7znCpabo7A6LB34902dhT4buDB/B3AQupVdy806Yhw4SBcz8gFEyeXky1YMdhf3kuszVaQ4c1S2vsIr90hVFssR/2FomNkZXkcZ5OJI5RShbHzeahF8ZJyGl5kYpw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=Eaxxl4EluXyRmdQSJUrB+f+0w5ipSnaOuqLWyuuUlNo=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=SYwQbz9s
Subject: Re: [Buildroot] [PATCH 1/1] package/pico{tool,
 -sdk}: install sdk files to $(HOST_DIR)/share
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

 > Commits [1] and [2] are installing host SDK files
 > "$(HOST_DIR)/usr/share".

 > check-package (see [3]) reports the error:

 >     package/pico-sdk/pico-sdk.mk:23: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
 >     package/pico-sdk/pico-sdk.mk:24: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/
 >     package/picotool/picotool.mk:15: install files to $(HOST_DIR)/ instead of $(HOST_DIR)/usr/

 > This commit installs the host SDK files to "$(HOST_DIR)/share" to fix
 > this error.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/12970341499

Ups, nice catch and thanks for fixing!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
