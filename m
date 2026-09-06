Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389E5C79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1E0180D85;
	Sun,  6 Sep 2026 09:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rEBXTDAnOsow; Sun,  6 Sep 2026 09:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E099D80DDF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788686686;
	b=k3b+/R1kcxYPe92bKO90bvKN5mwnxZy1kpRIPXz8K2F1GugdyiCUBlHfgO0mFyFKDz14
	 66YYcw84QyE63ja2StMpI3cE6SM1hQb+GQWX+MacuZSYYxxm/S2gy7/+/ySn1similJxV
	 lHHFr8iydwWzrKcyS3mJ1yMa3PFlatvQYmD856DGLsoTexRxP2hGqXV5idzR64+twRwyc
	 kP5IfnBLmDArACXFJzp6HbCOksRdyNJiocKWZXIZUmkwTN9MNBhyjLbjYezG7jAew1+HU
	 /qNREHL9heYS2+b7Og2GKHpgbAMLA3GR/EWeZi/jx8cud37dQC1Ii00Ecq6Cz4JG/Jg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788686686;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=NaFQQ954seHXbPun4D9Ro29FOScOB/sOgntmhF65pDg=;
	b=e8pj6GMBLj+nkDuufQlHJ3W3NQDO2SfRAx5wINo/Ppat7DVHx6ZM7xaHC4S4evlao2r8
	 SQYFl7p0E8o8hJMuvY3GnSDIdF92gXgpfDNDlvkpHPtB+Ak7xx/qK6jj6/aszDVTm6Q1G
	 PI5VeYqgCWoA3tbPClDh4lRr+odydMP8v0Mds1pHVPpfoZw/nEXma6Nt7pzR7pTp+FbMM
	 2dkt9l6Nj9n/Iyoxzi1aNoej1GCf4l/SQbKMeejSPoz/FMuWmP2Kt4kmYrfRvBAoGxmVP
	 5kp1x7FcVTS1dDPVi43k1g4qOG9PQipokf4bcgJkTdlTSWs3W4V1si5b6/yOEsW9KrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788686686;
	bh=NaFQQ954seHXbPun4D9Ro29FOScOB/sOgntmhF65pDg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lktUBzjXI3pUlPo2w4l1LOnQA7nS6/ChY3Nij9sPHEC8VYqWLgYhc2WNdH5QF7Tmf
	 U+bD0xkBzRr5XGQ3ew4d6tRnMESSUvP3ALzNmShUgqJ13v3mppAhvXeYv9m4ni7/SM
	 pBhV8EEvSBgZSPUft1FI2bnzmZeNkzmdZ3Jpt37Jg5YV+xdRv+HgXsB/u31ANYw2uU
	 nxTAJptfIgtzZ0AQ8VSb1Q0OlIllx4A0V2TeWQomIQ0VVJR0YJ58w/CF617Ufjx061
	 cmLkhIcAKrfUhHYkdIYVmqy8gBg61niIUJf/w5EwJ0A/dJehRUow++oICWApmqxm1U
	 1Z75urRdnNaQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E099D80DDF;
	Sun,  6 Sep 2026 09:24:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E549872C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBA4E4008B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mx_kRni6Bk7W for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:24:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 90A934007B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788686683;
 b=kLn2fe9CG0eVWbyv6qJnTBZnsJ6BFrk9zp44fKzh0fv8mFVARY1/nM8UbI2PiT9oyngq
 rGNAVBHNG7csRloz3v02HZGtlgHyxuJaxUfmyo2TUUpzC0adZ5a8ByOWZwdQt1cwvSgwr
 aNfDJBVLjJPh95v8Rc2lISnO3y/TD9fTGhWK1V9QbdNU5+PWtySbAdXjdp6R5eu5+buKO
 D+Jg4Ex2nu9rPecirhAGy5nJWi2UqfFdDpS7sipt9m8fdXRMIb+m9valgsyNKNhE1muud
 aZOD9KNzv58ct2PXW5/rjH/yhkA8mu9j2k1IP2aL5wqhycGwG8Yq/gqNXJeA67DYzqw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788686683;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=BODCyDCFN1IIt1P6pL09rcLC0GoYr5iLu85zqM0p3hI=;
 b=sEVkHbBZA+7Bu3qdnXvsA2gznXrOaecUYRd5HvUxJXAhlaoa3s5stoWJDhbJbfITdc7r
 IAw7QccZe+6wTI8viEDnq0Haf7cvTGkFKnjCbCAPEhK2TlECKIA4mFLT4t7QKy8fKcVSu
 lzXwUYCi+HcrWgVDC00fwFbWFelXPazC7HqvP/DEiwJROnG+mY79y8dklaNi660DXooey
 W3tlKdIJga/Kg3/eGfRhK/pkbX0LwFWFyolIN0tuJ0uGXy+j8GPJKm4lM8s0vvhicIPnK
 uCyD5xwnTRvpmMHRBjrHALxo8uXfMa+Fux+dxGxrsHQx94/CuEVokefnfw+3ypkJCOA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=D45R+zmp; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90A934007B
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:24:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 23A4A13F8B8;
 Sun,  6 Sep 2026 11:24:37 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 11:24:37 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 11:24:37 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260905192904.3794181-1-bernd@kuhls.net>
References: <20260905192904.3794181-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <bf49d17fa9e2cb65f84bf5a12cbce36e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5knx: fix license hash
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

On 05/09/2026 21:29, Bernd Kuhls wrote:
> Buildroot 262a7f6d2f406ed21b2379bb3c4a6c8f6fa0edd7 added the package 
> but
> forgot to provide the hash for LICENSE.GPL3-EXCEPT, instead a hash for
> a non-existing file was added to qt5knx.hash.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
