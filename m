Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F803E9D3ED
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA0160C26;
	Wed,  4 Feb 2026 14:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2jc5Dc7hKkMG; Wed,  4 Feb 2026 14:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E968960D62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770217070;
	bh=nx/c09i+A3BqS+vtSsQh+jtmY+1x7DCDTzApffBTBNg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZLfzEc9noweNj2jH7tDwdiw1dbeDvTJtH8Cj4eQdiD7RHB2qs3nXvWGC3qPwUOlJg
	 yvkR/o/LzhBDJFTp8eKqmEaUrP4B8Nu4W4Dljh53OMsBu/FAwrMd61NfDbdICMXFF1
	 8uVYsxS8UKxtUAlJudmfRBqrfoEchisVx6LFIcsAUOvsRzVxXHYY69sfHAag6HKR+V
	 p8f6ywsJJ3OsXnJcjKxUcloXfsmVmqrEh4rv2ejs2Q2Uh67nFIgmweaEmlDcYlbWAc
	 dig0MnlZ5VhIq+KY9mVX9YnDX2I6Cr4J0EIKpKiAvTRtkAiBWSIhMPKJARQQCF4ZhP
	 ziin/LufRuaRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E968960D62;
	Wed,  4 Feb 2026 14:57:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB7F8173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 986B660D62
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk4OcAGO77fm for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A932D60D66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A932D60D66
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A932D60D66
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:57:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 555E21A2BEA;
 Wed,  4 Feb 2026 14:57:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1BFCE60705;
 Wed,  4 Feb 2026 14:57:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AD024119A865B; Wed,  4 Feb 2026 15:57:43 +0100 (CET)
Date: Wed, 4 Feb 2026 15:57:42 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: Anton Bengtsson <anton.bengtsson@plejd.com>, buildroot@buildroot.org
Message-ID: <aYNeFdNqBzyXkzdb@windsurf>
References: <20250912083432.3444568-1-anton.bengtsson@plejd.com>
 <20260106221506.40473-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260106221506.40473-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770217064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=myEbHAcGUbeB2ivDSaYJwz16vI/8qpneoIOHZa/lzGA=;
 b=Vnq7nt7SI4c5znYWXlP/ACbJGMfwLHWCw9K++w/qZnMg7HdRc/xizd7EIc42sAAohMqrWO
 edhBFjneHqxPS6JH9I7Su1rUCdOwfs8VaH+dvkt4z0XK8e9DEAyL+8E57XiedaCFDfhNc0
 0ESC61kqoGiaoXcus6gtr02ty0K/fm4tk3XTAsmhCLqNZSSxtQY8vRMU0WSd6vyr0z/prS
 IIMbUuPyizQ9YBQfSDz+5z0lWfvYiKc8ntwFfZHkzspVRBwC/55teWGCcO6QR52Vea3I7K
 WE5w9rspFQExCuZvaIGSteqvK+plkmaefaMxGeqz9HUPdRUHWkn0Fyt3vRQO2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Vnq7nt7S
Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/cve: replace
 distutils with looseversion
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Hello Anton,

On Tue, Jan 06, 2026 at 11:15:06PM +0100, Thomas Perale via buildroot wrote:

> On my system I'm running python 3.13 which deprecated `distutils`. I didn't ran
> into any error running the `cve.py` until now. The reason for this looks to be
> that the `distutils` library is provided by setuptools on my system.

On my system with Python 3.14, pkg-stats also works fine.

> Is there any reason to not use setuptools because I think there is an higher
> chance that a user have setuptools installed rather than `looseversion` (I
> didn't had it installed for instance).

I agree, but then, why did you provide your:

> Reviewed-By: Thomas Perale <thomas.perale@mind.be>

 ?

Since your question is important, and as far as I can see, has not
received feedback from Anton.

For the time being, I've marked the series as Changes
Requested. Anton, let us know if you have some feedback.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
