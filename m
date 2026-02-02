Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F3FE73149
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 701FE60B0D;
	Mon,  2 Feb 2026 09:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X06JCU5swwnk; Mon,  2 Feb 2026 09:02:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35A9E608AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770022951;
	bh=S/O2YpC+x/E7XONs11nfrMatqLSeqzVwSfAocMv9yno=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dCTjEC9XkTzJ8ArrVgBF/F82ypeqKPYZyZpbA9ttWhhdz0aMQNoxd51F36UZNGyVQ
	 q+j56OmLUUigmpClZPG8NYRRLfbFG8z8VykkbEU/CSSv78Tk2vZXuiOWwqyBHTlXIy
	 4egFTSA3WPiEsiu9ljTWivRn4Iic0pFkytvBox9isH3mzG8KtKctJeLYgMqlmkIySM
	 BeQmB/27nKBXYcb2Z+L7hXgAF/Kjbl8zCHht7Hoe4JzkvexQaIMoGKDIzDXmj4hY8k
	 npE3CRJtjdqnzkl/kJQ9os61ydgyy65MsDPRyV096qGlfusdlx+pAQc2UAA/bq6Q8g
	 J3W90+09fFEKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35A9E608AC;
	Mon,  2 Feb 2026 09:02:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB812149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCE94822B5
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vL7zq6F7wdx for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 09:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25CAC8100F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25CAC8100F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25CAC8100F
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 09:02:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1403888215; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 09:02:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmpp7-00000005poa-0PGf;
 Mon, 02 Feb 2026 10:02:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christophe Vu-Brugier <cvubrugier@fastmail.fm>
In-Reply-To: <20260122182713.998581-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 22 Jan 2026 19:27:13 +0100")
References: <20260122182713.998581-1-bernd@kuhls.net>
Date: Mon, 02 Feb 2026 10:02:21 +0100
Message-ID: <87zf5r5xia.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=MufSr6VStYigGzNwBMIloufzpa7CeG2BjdQZhtaOMgB/ZBlpC1a+rgP63osid81TPBiyW3mzw0wVLXkgdJzPm+OCIM1TOemhFmwFA+a1Z9lynFv0hirVwttO1KWL/LD3x3gae/HUxRuWHztNGIqe6fPRUhe0IbN0QVHelimMWVx4HKHRoIW3ksZ+wJsLF5lrgFzUwL14kV8aKdwAxQs38zAr+Iwf6tER+7+yFf/xsYuf7Byo7RDImjU0SMw5lhwU4+Hw3R18ANkn9RUFcC67/RcuieSt3fjeUJMEmeIBhVsFBMNowpZ+r4pSzCMEfjoYOyAImnqj9kKOkwcD4F4uwQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=/BnKVWqbwzPjwvMdrB+9dEE+/+qYkJsjDmNYt7XIc3Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=MufSr6VS
Subject: Re: [Buildroot] [PATCH 1/1] package/drbd-utils: drbdmon needs sync_1
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

 > Buildroot commit 99585db1e896d7a75e204335af86f0725a30d357 bumped the
 > package from version 9.21.4 to 9.33.0.

 > Upstream added std::atomic to drbdmon with commit
 > https://github.com/LINBIT/drbd-utils/commit/3baf945732fc144043822b50a2a03daad0994d44
 > to version 9.25.0 causing build errors:

 > /home/autobuild/autobuild/instance-2/output-1/per-package/drbd-utils/host/bin/../lib/gcc/microblazeel-buildroot-linux-uclibc/14.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld:
 >  MessageLogNotification.o: in function `MessageLogNotification::query_log_changed()':
 >  (.text+0xe8): undefined reference to `__atomic_exchange_1'

 > Fixes:
 > https://autobuild.buildroot.net/results/741/741606000c26bc994f243b0b865d26ff25592caa/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
