Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF77EE7DF0A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 779FD60623;
	Mon,  2 Feb 2026 16:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX1fKR1b1Tq0; Mon,  2 Feb 2026 16:53:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E5306076F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770051214;
	bh=Ihwdjvch7InlWETAbqp/ZE7lYj9jGQCeMseie00o+oE=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVHaQb6SkW+Enntb9xkaD69wpFdWtscjPEwiggGUjpm7GAlPkWVwrIgaL7YleOumf
	 dUSR2eaXG4ah31A0VJv25mYb1mgW34J28wkg2Nterrm70stQ3GQQMvsqgaLOdXDchA
	 y5HTku3zKNl5lBtKVzaeIRsxvBPCZzfRdnRCt2wxgaslZNQwVpTS9DUhMtPv2uv9A/
	 ubA84IaE5ShXq3dEn5SIGgADCmpPQmPxCqq+vd77FXMhfbExfQLRXHfDWp4wSIZ3t3
	 I3ijem7UMvCYbv+CHcMwkZGJFtnJzYlEqutQe0sRzEcesxdXwe7EnZUJ7nkMgBpAo0
	 Ql26TdaniDgiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E5306076F;
	Mon,  2 Feb 2026 16:53:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F041E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6F7840332
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZowwmuw6G2G for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE5084032E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE5084032E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE5084032E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:53:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2015284136; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 16:53:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmxAs-00000007FEF-2Xjm;
 Mon, 02 Feb 2026 17:53:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260202142750.937246-2-fbstachura@gmail.com> (Franciszek
 Stachura's message of "Mon, 2 Feb 2026 15:27:51 +0100")
References: <20260202142750.937246-2-fbstachura@gmail.com>
Date: Mon, 02 Feb 2026 17:53:18 +0100
Message-ID: <87jywvytmp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=qsdwzR2nF5y0XoYa/kUGf+QENjIh2tFwb3QNB2lujW5J1F9hKFixfaMoF0lavCgSnsoHncOd3wmQPteXQtLy0hd6gZZ0IATvvseZKoIVaNPHHuFUkzk89OdzInwh3myY12aaJPP9wJTWvQEowIHmYJH8S9YsioFrkdDO3t3fhx9WO2sog42nohqK2Fk8DVbI33YlL4bteTrHULxNhqt7fJGZdMQqALpX4pXFlw9PPEh4MgWQtHruA2Wysp59G8DeVYDNTYXKC5WH2Iz4XN0rz32w90/HAgQleLtpSaChmDYe9xAsJFLddjUBrb5+T8UdaGoEgfsjTONgCIU/t/sTIA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=V4zoZ9N+90DJUaLoUcEgselWZ2qj/6FO+U/iT5hqUz0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=qsdwzR2n
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: replace bulix paste with
 sr.ht
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

>>>>> "Franciszek" == Franciszek Stachura <fbstachura@gmail.com> writes:

 > http://code.bulix.org/ is no longer responding.
 > Fix paste list formatting.

 > Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
