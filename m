Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D80CC79F9E
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 20:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D544059E;
	Sun,  6 Sep 2026 20:14:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oI6PQaZ-G8E7; Sun,  6 Sep 2026 20:14:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F13964059B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788725657;
	b=lROfgGeXW+mN1i9ShoNWAIU+W3fjdHWZGWAmNMtNwicivkba76zyXa3JUBEtUebO3KLI
	 odUK9oMTGR6OF9PTOgJLDwJN/gnL6Vfe4e/FmP201RGeCTLPs4h6ltoj39vAHFQ3awlJR
	 u3vERbonl1qx9Co7oj6RzRAjE5wixoYK2wr3cFZrIFHzYsMDq0FsD6cq0F/nzOJGuZtAw
	 HvfACxaStB/mM977pHFjkClNwqdWiwEPAP35O5IfecgXLTZb3BS8GRRfZWmtECXp2RZe/
	 EZ7weQOrTSaTKZk1uCIyrbRieRWwYV9IHFTXVF3Tekdi0fxPARrkYpwjZmXEEHBUtrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788725657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Nf+SXpssXwV6u5zkjSdt1wwtxJHn3Lv6BPD3PnIcNlM=;
	b=OkU7zcpP8vnDeCYUCVQK7MjT8+oASwdAX5ctB9E43Z64p93Xie9HXMjZQEoUSFIPzHjg
	 Xqb6DmefkKRnu3OA1hWN3QHfAIsCVyQWCAtiGtQw4ExpgybSdPEkmkfVPUBe7HqpQxAn9
	 DYRMxSDSwl1xFYd8rPucvZtUMI0s5mV5jUimcRIJ0MHfM3MRVe1zL4jIkX1QLJ/8xYptZ
	 gW+3LQ35PaFjbegzUK2MNYEQY+4IYYsY4bKvCyXQ144Nt9eeqQ/4Gp74ft8EWWJ1yB0ed
	 VzoNGp6nxW0f0lkOJcYVnrYB1PWRtkuseONfM9/hKSqVIn6GV9QGXvhaiX85Pix6AeA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788725657;
	bh=Nf+SXpssXwV6u5zkjSdt1wwtxJHn3Lv6BPD3PnIcNlM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FY/54Gvh2c8jfCPDNNM1fwWKEkGUXgCTvVgHLwiOEoRA8dB5xvdNZG3SGQAWBpF1u
	 LU+PW/1/09Ggq9eZ2RNnrIkhxwiklp77s4ztknYHqyhyI+CvRFrPRloJ88Of7/DJkl
	 IsRRCnKsUNVA0EglwEoiT8DojcB/sVhTVt5HSZSRJemgUUaZNvwB8JgOsWfOzooxh5
	 1OuOGDCpOnTkA2/6ZPNIPpE3ouwUODk7mTa6KmxGb8873Jt9zK2Ziqw69PMmIhh8tn
	 b9uhIqi8VXBA7OSzg91w+pxNFCERKKfCRh8Ra2euiVdUqK+uO0lDvQRfLM+CLj0DEE
	 jnKguc3nN3ZOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F13964059B;
	Sun,  6 Sep 2026 20:14:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A9C5970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38378400AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:14:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XbPF75GHRqo for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 20:14:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 23F6A40079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788725654;
 b=bq9BYQo8E0yQU6v5MFKdne91YyOgbKuhN8pO+pZvFZloxCiD3h4BkoWY3OCgcgb6V7F3
 9fHgAJHyPzW5TPiambE8trsnJ6rPNVFQdHrbkgT3vR+9xHng2wz+2SFckgT0G0s9LKmH0
 7CQako3Ia7Wy9IWhiLOZVCR1wBiXfa6G81lZgGao5lS/uFnsfbzdxG2+7Z9oBabACstLh
 BnUljmtFhrfXSRLUqdF/t7zgxl6mBy5iXkWfYQYaTEqw8NnTC9cXY4ntWZWoeDITp0t5I
 mFS1y+qYmmDldLcw9ZozxHSg4CBXIA9x7usX8R2HNf8qpMuJg5M8A4vqu3M+uYCTBxw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788725654;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/rR2DmsU7iKJhiymXmjkahcAg/8yt3gerXZzogeqoxY=;
 b=qpnCRTFpPfLYk4WE4Vj8DiBWCL6+Ho4JbqeKfBC4df/FzLpY7TRA9k7vtbf+RVWRSCBK
 d+kg/WFIILg1vSHByqti2/Do9Zcw475ksbYRT9BD2p5tm+apCvQ1VfTJ+MVfaJ7i82KCn
 WPO6e5mHYYaG225d87U4ipK8XRTWHdpI0nd1o2Mkc/SqhwCNVXlA7zf63PfLpS7dbveYy
 vn6t19I5WihNIwXPMNK+HcUPPIBMjELg6OHLeCWZ5KCNOG/Gn1ZDr0HrgLK07wBx/7GGz
 6iqh9dPMYxsBF/4YxTKRrTnpB/b4ifCu5/GDwQTYf3+cqgMcuXQGKvsqSNW4jjS0XVw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Cab30jx5; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 23F6A40079
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 20:14:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 40CA413F88F;
 Sun,  6 Sep 2026 22:14:10 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 22:14:10 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 22:14:10 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904184457.876430-1-bernd@kuhls.net>
References: <20260904184457.876430-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <cca92562196dbcd785a3d3b06e48de4b@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: bump version to 7.7
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

On 04/09/2026 20:44, Bernd Kuhls wrote:
> https://github.com/squid-cache/squid/blob/SQUID_7_7/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
