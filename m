Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C229CCD5BAF
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 764B840D2C;
	Thu, 13 Nov 2025 09:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBAzs_1tnnip; Thu, 13 Nov 2025 09:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C2C40D01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0C2C40D01;
	Thu, 13 Nov 2025 09:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B3EB230
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7570D40D01
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yxl7cAHLBrB8 for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:50:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 691D140BDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 691D140BDD
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 691D140BDD
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:50:18 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2094622955; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Nov 2025 09:50:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJTxz-002Bfo-0j;
 Thu, 13 Nov 2025 10:50:11 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Simon Dawson <spdawson@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Carsten Schoenert
 <c.schoenert@gmail.com>,  Lionel Orry <lionel.orry@gmail.com>,  Fabrice
 Fontaine <fontaine.fabrice@gmail.com>
References: <20251106204522.3273683-1-bernd@kuhls.net>
 <20251106204522.3273683-11-bernd@kuhls.net>
Date: Thu, 13 Nov 2025 10:50:11 +0100
In-Reply-To: <20251106204522.3273683-11-bernd@kuhls.net> (Bernd Kuhls's
 message of "Thu, 6 Nov 2025 21:45:17 +0100")
Message-ID: <87qzu2ntws.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=QQw5PU3t3xf7TfEELH2ioX3j3xjmO2/oFxp8q0BRGIishF0tTtT3rIy8XcYq7HyZy8FOO6NP9I/N/NR4wrOPQv4ylCwcPRvQjdcCUJ8eh/Np+PtEYpnBSuCOTm6/0pCFPYz1gfcgi9hpGGg3XqPFkuBOlpWJl1bBNcrfVOFI38S/sD8KhJmqq81n0NKNpYy+CHcCCH8F7BhmjXaUquadOT6W7L9pREus8QjYyAAUGaiQ0yV181Q+VpIju7iKU8uh8OLQRGk+VjyzA9ybPcIBDUtImUeKj5NHJ5rNa9zPW/8u68Yz6//NIWUMNyo2wEyu+qYjb8Hk6qQ4OASvY60IMA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=DK7+bGWY7ImHdGEkmz8IxbQlNnrGUM3CyDXd5t5Q180=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=QQw5PU3t
Subject: Re: [Buildroot] [PATCH v3 10/14] package/mongrel2: remove package
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

 > mongrel2 is incompatible with MbedTLS 3.6 and was removed from Debian
 > stable/testing:
 > https://tracker.debian.org/pkg/mongrel2
 > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1075866

 > Upstream report from 2023 exists:
 > https://github.com/mongrel2/mongrel2/issues/359
 > but went unanswered, the last upstream commit was in Dec 2021:
 > https://github.com/mongrel2/mongrel2/commits/master/

 > Since no other package uses mongrel2 we can safely remove this
 > unmaintained package.

 > Fixes:
 > https://autobuild.buildroot.net/results/6c1/6c17827d21135886b1f4822174a4a963ca6325bf/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
