Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48BEC5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 16:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9DFF606A5;
	Sat,  8 Aug 2026 16:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBqL9OIn3zc5; Sat,  8 Aug 2026 16:05:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1AC6068F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786205115;
	bh=5fSdawTj5Ntn2ARhMIm/TEkIIKRQ0JqHunw9eHjCGXA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Cwn9hbgx53wJPhJpI1mxYOC4FU5YHrsYT7I0YA2EJXNohAM47/RmvYEXu6i9xPp5+
	 UEcpu4gF6LMykT6DiJl0UdDc0r9cv/GSH8txaYTVfc7PvjVQyT9o5FtpskA5Jf9wJq
	 QTIPmMbjzJrqDyPuRORRYS+bfyPmJRx5Q6Dut+LGjX2dZClSWcHKoO/ZnUIDy3VRUw
	 oJlxhHdfr+LqIZ0aIBQ7WxIbRLFQWR0Mu9ccAsUUKrPrbZGJD51idxs0+Ly2LdCtpg
	 p0VVuaI/lsL2YVYjlI0myKl+42jsToEtnOX2YnU98qtoJhn/O0p0Cos2qPwc5eT+Sk
	 jWofUw5m4Wrvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1AC6068F;
	Sat,  8 Aug 2026 16:05:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1517D3C1
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4F46067D
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:05:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LOYJUsz--E5Q for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 16:05:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D90BB60667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90BB60667
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D90BB60667
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 16:05:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8996719F5BE;
 Sat,  8 Aug 2026 18:05:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 18:05:09 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 18:05:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260806164033.1428655-1-bernd@kuhls.net>
References: <20260806164033.1428655-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <63c38aa78ebfe0778aab0ddc6e8de492@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786205110;
 bh=LwLjHYVoGM2FCeiO5VaLlJ6s93rWE8IUPqZvIxSff7I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OMdpx6N6EE61xFszzAFCKaMx4jX/kOSGQ6rZ9XaZbwWENxQaSS+I5vyDy3DpXxZgn
 s36AmfLhxrxa7btSjzRU+0LL2q6fQzyZ4wFPl7Qxyksn+Y54bFgQ+S75YLoSxtVli9
 k2lk3p7XPdF+PbJNal4FWhit3UpSF9XQp+p3/MJATWYo06+seZHdppSgDbKcafXBIN
 3//pZf0l0XIU5D42RSNx24lZaWFI38JvziYzhdLnimm861wzDxj+rDRPd4+oek7A4S
 2SD6r2pSgQjt/Wr+YOrZhyYxyrQQSj/GzczK8pvSHCh++f+C32LAVSCjnBnE4VVc1l
 pu8DXttzh+BWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OMdpx6N6
Subject: Re: [Buildroot] [PATCH 1/1] package/libudev-zero: bump version to
 1.0.5
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

On 06/08/2026 18:40, Bernd Kuhls wrote:
> https://github.com/illiliti/libudev-zero/releases/tag/1.0.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
