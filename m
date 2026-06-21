Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F6FCD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 10:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3033D819B8;
	Sun, 21 Jun 2026 10:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vj5Xp8G2cbiT; Sun, 21 Jun 2026 10:38:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7100A86595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782038303;
	bh=PtujRNpy5ug61YPSjnVSg4PUgu4P7Wes6nBXcoTjZyU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOW17GgF8elQ3ZlxpprmRwdJ6vQxI+GYk5YEqcwUT2+fN+koP5jtm1TcAQqbucicd
	 7OIDZYtf3DEoZw+TtTIZGqefZjkBJa5NI4WWtMzHzX4O+3oTBUKfW2W5hnawTfTL91
	 DxJGDS8ZyHcU1XAT05HGC7IFSTfz0PPUVeRcdomvfYTA6kN5glBmcMznAunUG/LlvV
	 ALahPpwEfmKEhMY4gVlcw78Ct1mtfdMF+JH90CkR4VbMqO01CmxO8EEejjY/vZz6LZ
	 248i4sUgvZhNUqkkb0vdMaEnz9qsSEKbPvxB9m2tSmxybLT39GcrSn9+fTaUS0vzzR
	 guYweG8Ju4fgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7100A86595;
	Sun, 21 Jun 2026 10:38:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 976E024D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E72342487
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OADQfg84HqS for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 10:38:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4341A4018E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4341A4018E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4341A4018E
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 10:38:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1533121496; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 21 Jun 2026 10:38:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wbFZ8-0000000E0T6-0SCt;
 Sun, 21 Jun 2026 12:38:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260620062208.18846-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 20 Jun 2026 08:22:08 +0200")
References: <20260620062208.18846-1-bernd@kuhls.net>
Date: Sun, 21 Jun 2026 12:38:14 +0200
Message-ID: <877bnsb2ll.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=H84VTyiucdyZEXZuW+3t95pPzkftp/ooncdgWPe+5hfslOc5v4yENfameQ81BZPet7KnpJNmGejhSDlksUffCp50JEAqP3rCef+FeD5aHfIfd1OB4QbtofY1ULlAivfpjlA7xEssBHlyJx1r5BkG/GZY4u4v49I2NFUzdQFAymZk2b1Zgvul8BRGt/lVyWAa/lOwtUifK207higoMGm4iifmb/rC0pjd6OH8m6anJunTk7dCGPpVboXXoE2I7gGAKazDeISEyXGfyUAIeTw1bYfxYtLFSxX79Ls+1qwiEA7NFCshhk8qwc4gjYOqQ6A4zam61ERzg9Z0Z3p5pIYt1Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jj762VVYPJ1SVw1DbkrRjRK8NIqqy8/HhI3f5iKnjT8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=H84VTyiu
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: security bump
 version to 6.6.5
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

 > https://sourceforge.net/p/fetchmail/mailman/message/59347909/
 > "## SECURITY BUGFIX
 > * POP3 with RPA: fix calculation of buffer sizes to avoid buffer
 >   overflow on long service challenges with long user IDs"

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/36fbe2c58ab4004f93e49a1e6f74fc2f0b77cff3

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
