Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E4AC55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 20:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DC8C4075C;
	Tue,  4 Aug 2026 20:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6zGHVh-RFayG; Tue,  4 Aug 2026 20:30:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37CC24060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785875433;
	bh=BL3ty/9fifUFHg3j14RTdR56wzL5O15oNGdcISZXkKg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U2A1k1PVFqTgJPCK3WjKK4U4/VY54M27C/U4MLGe4DrHczFUjKnJ0zMMc/PjG/nh/
	 GG0/ic1UDuVeULNpvU7T1+icvQnuEAc2pUW+oe2lAICDrJLNoWfHDKvaT3pqWRkNzm
	 9RX4LmOG2iCjeSFqBRXu7ioANVRawoI/tz59qHe8EHQFXvbNCI8hqsIYwooZ9DT25i
	 ug53ADhFkO8/4wMLNRXDHWgLgsr27Oi7TfQmn2hHDJm7bFsjFDQo1iO9ChRYWsnJow
	 RbFCt0Kkw+S1m4xUeAWj/ebWvNrLhh8dKAnJ3CajjQNqvL6+qu/wqshZDawN0mKwyO
	 c68cTFayQ2Ksw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37CC24060A;
	Tue,  4 Aug 2026 20:30:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF4FD288
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A569860787
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ehQl0cf5bui6 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 20:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 04C8660600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04C8660600
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04C8660600
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 20:30:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9454F13F879;
 Tue,  4 Aug 2026 22:30:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 04 Aug 2026 22:30:27 +0200
MIME-Version: 1.0
Date: Tue, 04 Aug 2026 22:30:27 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <ai6stJaA2hWFBHDW@waldemar-brodkorb.de>
References: <ai6stJaA2hWFBHDW@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <0101c3458fbf1dcc8df600e6c1718bb8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785875428;
 bh=tbSLCMtJapxKpmMv+2P1UXnjukhQdMveHEiQH6ul2uw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=arDLQe2vtGvlRWuEUJjjkVx0+18NnZTnrm8olUbrJ9zdZK5R2kr53jXdBfY+mnant
 /dl88sqKDgq7AssQ/NY+fBJ09AMWIfQBB8iewgXN/Lw7ZiOcSuUeTYW/ra4iSxY5D/
 NrfqWl+y8H0YeRJpd/L03DsLYQ4zhio0CRbwBTPvs2QI/A39Fb8ha8atCygNyyJu3r
 GgoUqVAz+GZHpAqsox2XQsDLC3TJZye+iFo9ccpCjk1Jc6pmmbXb5xSdOmuY5I3gEs
 TT7smFYPXWiFmhZz07SAH7QsyAR8jLY4nP7EtLCkgUK4ADWam+VeNyjpw1V87hvvDW
 Xm30nEP1f5p8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=arDLQe2v
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix for noMMU targets using
 FLAT binaries
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 14/06/2026 15:29, Waldemar Brodkorb wrote:
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
