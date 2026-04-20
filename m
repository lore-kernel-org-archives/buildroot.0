Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7359F557EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 10:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A17382B97;
	Mon, 20 Apr 2026 10:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZHo6SIWUcW1; Mon, 20 Apr 2026 10:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA7582B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776679963;
	bh=1Cuzc/MMPFYbX7FbTwLKg+oJKRXl7E7dcHqlEQf5/S8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BDtxQr+qOld9Fs9Y39yhGNTYZ/4ZdmDN62Y0iRDRwsbParql9VLUJZOPKc8xdgEI1
	 3YksFCzizNqjV4DtlVDDzImTG6EOI4pxxRV/X6f0YpYJlMpud9g8ynPUyFv1pYIUx9
	 jesFEcJ8tRrXq5CxleGg37mHKunyl5dXFuKQJ09JrH1BdRe/JGHhcLsO1arLrghMaD
	 DtlR/ES+MSOtUDXMf1h9d/0iixby1a2ni07cH/NqicgrhrkED7Ca3064WpGCjgU3VK
	 ChhLoorAfWpQ0J7h4Ae7VAVya8Z/Gcsu3wD7DRSCvBh9g7ZKfHD10fwI8o1dgkwwUm
	 aaEsMJbfqlW+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA7582B1B;
	Mon, 20 Apr 2026 10:12:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAAE3259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D06FD610C2
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GB_YmyJ8CVq for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 10:12:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FB7C610BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FB7C610BD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FB7C610BD
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 10:12:39 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1120352877; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 10:12:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wElbz-0000000Auve-0qpL;
 Mon, 20 Apr 2026 12:12:15 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yann.morin@orange.com
In-Reply-To: <aeXymikPfNmmnA67@yd-6wlzhs3> (yann morin's message of "Mon, 20
 Apr 2026 11:32:10 +0200")
References: <69e59cd7.050a0220.1ab584.974e@mx.google.com>
 <aeXymikPfNmmnA67@yd-6wlzhs3>
Date: Mon, 20 Apr 2026 12:12:15 +0200
Message-ID: <87fr4qhreo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Tevx193aBaYUF04RZ6w4mfp/VrySSCJslswKltSWXYXBj5N3r7OlDYyyy6Kne7FVcLU2RfDhdhRAsfeTT1GG7DcaAxjK5qCINfyG1a9Dka3jOg+nMMS0FyKqMw5gkbwUWKFuMacUpnttWF0B9LWEZizqCdgbmgh3gentPlhS5auLxLG3iYAhyxJHqXYYX1sSmEuCvDIEjTIbL4PEUp43CN4Tq6biDCBGcRKZWDexAOBq8fPHlt18w5ZDNcVI5idJaKJzzcsx4jqez4O6gT97wcAosPsp2yV5zZ4lLBHOhcC5RUP+Pggm1woeeUNXs7hQMjurXoZbA71/wPidThyZRw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=+4AwE8SiajsasL8cvKtBZ9eE3rtjJcobihbaCm8ajoM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=Tevx193a
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2026-04-19
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
Cc: Romain Naour <romain.naour@smile.fr>, buildroot <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "yann" == yann morin <yann.morin@orange.com> writes:

 > Peter, Thomas, All,
 > On 2026-04-20 03:26 -0000, Buildroot Notifications spake thusly:
 >> gpsd | DISTRO | https://release-monitoring.org/project/006846
 >> | 3.27.2 | 3.27.5
 >> mosquitto |  DISTRO  | https://release-monitoring.org/project/006078 | 2.0.22       | 2.1.2

 > Not sure what is happening with this weekly outdated packages notice:

 > * gpsd has been updated end of February, with  commit 13daf36ee2dc
 >   (package/gpsd: Bump version to 3.27.5),
 > * mosquitto since mid-march, more than a month ago now, with commit
 >   583a02e39888 (package/mosquitto: bump to version 2.1.2).

 > Is the git-pull before the check is made still working?

Yes, I noticed the same and mailed Thomas as I was away on holiday last
week. I'm back now but with a big email backlog, and I will take a look
once I get a bit of time unless someone else beats me to it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
