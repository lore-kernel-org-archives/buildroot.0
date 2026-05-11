Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC77CD37BE
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 15:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEA5840C0;
	Mon, 11 May 2026 15:08:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imWLs4W857jX; Mon, 11 May 2026 15:08:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84B7840E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778512119;
	bh=q+AAVtLrsrIgsPqa9c3oE29GRw3TfvDv7tnWEwy5FNQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rbWJ+hPZTxJPKMYKVPbaiVmLbgbNqbJ7s0k6/R9Nsq0aYY8cpoK6oPXepK/Zij2Xh
	 +TPbwoqcAmTRXCNMnx5yzDEOGdqKBZAAPJK0FDRz6rz+inGeJhEVi/mpT8cM+nKpk3
	 8w8NI4ujndgjDXPbSdOhRKi7ywuk9smAn8gvsCTHJ59kn+LKIbOht+f1exbQwS8dCT
	 keQ5hRt/6x2cDjq3N0Cb2JFxjC8WSpHSMBpPa4s32su5oc53vQpSTWbMzGj0+CBvfS
	 favkikSC4eNvygaxWryPsE4QpQGYrweD0Pw2aJmWFpG2Pq06ZN2mIn/kjEHzpVEzgH
	 WO17OKpE3OF1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A84B7840E4;
	Mon, 11 May 2026 15:08:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8C8223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 092C6840E4
 for <buildroot@buildroot.org>; Mon, 11 May 2026 15:08:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWYoNbkXIxpz for <buildroot@buildroot.org>;
 Mon, 11 May 2026 15:08:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E5BD5840C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5BD5840C0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5BD5840C0
 for <buildroot@busybox.net>; Mon, 11 May 2026 15:08:36 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@busybox.net
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1577649624; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 15:08:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wMSFC-00000009HiK-0tXe;
 Mon, 11 May 2026 17:08:30 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Francois Perrad via buildroot <buildroot@buildroot.org>
Cc: buildroot@busybox.net,  Francois Perrad <francois.perrad@gadz.org>
In-Reply-To: <20260411080616.670069-1-francois.perrad@gadz.org> (Francois
 Perrad via buildroot's message of "Sat, 11 Apr 2026 10:06:16 +0200")
References: <20260411080616.670069-1-francois.perrad@gadz.org>
Date: Mon, 11 May 2026 17:08:30 +0200
Message-ID: <87wlxadlw1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=TQFeyAG7CmWm3OzGVQXe9TVoPrB84SUcrIzA2M6bsJ0Agsh7/isBR88FALwKaiIX2a7Nr5/4Am8QzRohneB0JVQDbsJSJhPMbkUIDMQbloJrhez8od0XEwbyicqs7d84AA+3ZqJz0PaRLzdCXaF/aHgTlSRT+60b6EgmzaUcvzZHzuC/nSIRubmACnAx74WWBqMYETu5f8JcubDaxQFeUOXGioA3GE7OiAlxKwEfHrqTkAmsZjft+ih86uKQToddlT5EePu0P1NcitlB3PQBm0QaXgamCaL0/pB0Xf4ND/8MSfh7yO85hdfVsARrEaMDBGGkb0KtyD+gmk1ncPbjPA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=ZJ1MC5SdsUJrw08/hrru5oX9tS6HD3IoNdcoTiKrML4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=TQFeyAG7
Subject: Re: [Buildroot] [PATCH] package/opendoas: new package
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

>>>>> "Francois" == Francois Perrad via buildroot <buildroot@buildroot.org> writes:

 > +define OPENDOAS_INSTALL_TARGET_CMDS
 > +	$(INSTALL) -D -m 0755 $(@D)/doas $(TARGET_DIR)/usr/bin/doas
 > +	$(OPENDOAS_INSTALL_PAM_CONF)
 > +endef

Hmm, how does this work? Does it not need to be installed suid root like
sudo?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
