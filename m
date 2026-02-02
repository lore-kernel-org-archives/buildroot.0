Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD9DE73153
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0752B831BD;
	Mon,  2 Feb 2026 10:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22Xg5AhYwbG6; Mon,  2 Feb 2026 10:27:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B68980DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028047;
	bh=Ok9xLrQ3/IRHj2L+x590XkrCApSPsJJsGQVzQPJLrzI=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BC2zc5igwnOrQRHiHuQAMFsa9ZTQBQBV0DKgfb3rDQiZEWPVJ0DDWN98uPszPJ7BV
	 GKDn8JzsjE4wrX0LHqxkktCDfjMhCNKCsz4nmTp7c4tWXEb8WIPKCuEECw65NP/Hlp
	 a8PRWjDcQrry8Fa9wHvnenxwpwjbvatVgSWvq+Yauxo3U7LDhNz3lA3pi2cymiTuqT
	 W0Dw2G/tQTxDjem/z2cAtrSeC+/J5r4Hq0iBy/I4cCVGFdVaM7ANCywEbOyd49XsBa
	 ELpRjt6tAaNu/XsyA+rowQs8qBUFoI9fVn/TdY9K30OW+/gMsU+SkgSmts8mtHyMHb
	 a/3GSRadWjzhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B68980DEC;
	Mon,  2 Feb 2026 10:27:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6281E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CB5640265
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BP0YvDYBOiH2 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:27:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75E46401FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75E46401FE
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75E46401FE
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:27:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -264588513; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 10:27:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmr9M-00000005sYA-2gud;
 Mon, 02 Feb 2026 11:27:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
In-Reply-To: <20260120222835.29577-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Tue, 20 Jan 2026 23:28:35 +0100")
References: <20260120222835.29577-1-ju.o@free.fr>
Date: Mon, 02 Feb 2026 11:27:20 +0100
Message-ID: <874inz5tkn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=L42FYweg8r9FjelI7Qsu2CLmAHmr1/SRqnmJ6AP/t+WaXuThWJ3C2UxCK5kVl8xdYlnITJZRBpqHVY/iCtCie0+BPotbzxWlmG4ZvcH6/lc9W2KcSbInKkjd+SW5fLPwKQBpZFHGY3CuUOc8lNHY5i/N3UepNejKq3o82A8qivQ7+8eHxCif2CO8qic1Guqz7QX09IMokMpazW5RxiCnBJhJYOgsKJEW8BhGVyNV6nh405B8ZLxSoaJpKIcQNYym4ENtM1kM76BJMnaexnabKXtWkHLytMt1XXWCioN/zpfzP0zDozk/qoJ4Ws0RO4rARncYVTFaAyTD+kcJIjiUaA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=3zhmgG5jMQTP8yducmGgP4uZ+tr3WP4IXkroOEWaXyQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=L42FYweg
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: bump to version 10.3.0
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

 > See release announce:
 > https://octave.org/news/release/2025/10/01/octave-10.3.0-released.html

 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > Patch tested in:
 > https://gitlab.com/jolivain/buildroot/-/jobs/12788116046

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
