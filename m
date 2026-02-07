Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265E8EE0AF1
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 19:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2211141A4B;
	Sat,  7 Feb 2026 19:34:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rrCghQDro2QR; Sat,  7 Feb 2026 19:34:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6AF40CC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770492894;
	bh=3MlfaPfV45MQlWHWcem59hOHk2xY+V9WweczSoKmjeM=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iTEYULHY0iyx91Jixfo/NpXeB8WG76jWpPBMgeQthlT0VGpNtr/KmGiQ1cPj5CzX5
	 4ns9Goqv5nQfBVWpRzR7/Y8oVGqaqK7W8yQV4dCBaomaQHBKIR6gebeVDmbTsN/1BH
	 MIG6FpmZ3SDqhDsfO7Gbu9kMh5juJLgXOdTuHmWzj3fepyzQDKwcZIF+aB2JP0CqdT
	 B02/CSe9SsxXTPFauqopwSKWm297B9Ocfoih0tDJQS5ccqL840RbCP7dyj/kUTyW0y
	 l54J2Mx1fg/udnY6uigheNlWh9N3z3gaKFEi99L2dkAM6F5CdowaNKjalFPv7J2xbH
	 +01BKDia24C+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB6AF40CC1;
	Sat,  7 Feb 2026 19:34:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACBD42C5
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E317812C6
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qhsyr5q89NHh for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 19:34:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08D3E81268
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D3E81268
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 08D3E81268
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 19:34:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -655830429; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Feb 2026 19:34:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1voo4s-0000000GxdX-02sK;
 Sat, 07 Feb 2026 20:34:46 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
In-Reply-To: <20260207170754.4022536-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 7 Feb 2026 18:07:53 +0100")
References: <20260207170754.4022536-1-peter@korsgaard.com>
Date: Sat, 07 Feb 2026 20:34:45 +0100
Message-ID: <877bsotkiy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hyHInoDjOh65S3QVSwZxHmD/+MuGfjZa0ouI+3Bs3xE+8didwnF7yB08cD5YB6gJPbLg+aFOgCm6YawKrJb6eNBk2ivi5zv1YsPZQ/JXlIIl7cDB0VeYd69H40I3t45pBiNbg/QX+C/glqhNWMwAt69Yp7iAJI142Yh3KQ5J0IfBC3MVxBObkBE6Rxk9UiW1rSDPmNSgE9Xoum4dWOr9W1LJVWxHPSO4/dowjgFF3qywPsn4Iq/25COb5AzNtzluIfsWa9wtG49t2ZRhD8x8VYgxXvcOVT0MiQL9HnvtKDszxap/IJiVJD4wXK8bUdIM9wu64q8No4EEoi1PT772Xg==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=9EavscabRwj0YbDqogFKYWVrSYxhd+4Er7fc47bnjTw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=hyHInoDj
Subject: Re: [Buildroot] [PATCH] package/swig: swig-wrapper.in: handle
 symlinks
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes https://autobuild.buildroot.net/results/e656684298b0462f8044667e7384c64d6508f22f/
 > Use realpath when constructing the path to the real swig so the wrapper
 > works even if it is called through a symlink (E.G. the swig<version>
 > symlinks).

 > Reported-by: Bernd Kuhls <bernd@kuhls.net>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
