Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E87FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2869E610E6;
	Tue, 28 Apr 2026 19:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuXhhW8bdWJM; Tue, 28 Apr 2026 19:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E210610CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777404273;
	bh=lvw4jTETGQr0ixusGMqgyIqzWGvWHvKMXh+BDwykm3M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=siFg0C8Hao0eq67ZZ0V/dn6Q7OqnTHJ67uSQCY0j/bZ7TkepTxzWLvhbwA4qN9zh7
	 FQHbMSb2Ef7UFAr8wzbvzJn5uQ/Puc+hXU1TVcZ3LCByHKarkrPIdfJ/gM+5/jerZT
	 3BMzihS2WV/DhFdvsLr3lVLCJeLtCsmgxrv8oseemTE8c5f93ha0riTsr5rsl/2lWv
	 imI4hiqOf4Pw076NyD7SjX+pwdsxix5gd8zuj7qUbD6eUDaEy8TB6Va149uVPqnP80
	 i/5YC61x7kAkbBYI8wmr0hqt5is9MqW70cEGU/aWD2M+s2CfioOKybnT0QOvInoU+o
	 xzdhL8azrB2WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E210610CE;
	Tue, 28 Apr 2026 19:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21766231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07490610BC
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54-JEv-Bgbyf for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45D60610CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45D60610CE
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45D60610CE
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:24:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 70E1E19F593;
 Tue, 28 Apr 2026 21:24:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:24:28 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:24:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260427191055.113258-1-bernd@kuhls.net>
References: <20260427191055.113258-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5aa975626964bb0dc55101bee54be30e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777404269;
 bh=5rLS7S44yTTA5ePkKrGeps5M/8+BNC2soUOIMkLKHLs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kqV0ACeEktN+8KoJSqm6spTqZlCKjUpZYOD63ltLJtFLjdkcN2Gt9rPOsfD5l+Or4
 5IeIP6kikIdm3HwzBTcWBQ2smN7Kkawq+ZciDWb1IkcBh8SdMK8aRUJ1RmKVrn4i1A
 4VXuoiJUr52gOVwkgzsjqyS9SjMNQRNLk2b8Ra6BVg3LyAX6fFCRQBOah2sU7l3J/z
 cgRpjN38CQZTMraIrLjPrEKRUKb2XJX8hK1GkSTlHO+v7svfW4YeafwpxeC2Ya1y8o
 bFGjASaOzsWqOOyhqcriz7JoCG0i1Ufsuu64pa5T1ahuOFANyqVP6XcBzXklyfufvp
 gErYsWNkR0dog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kqV0ACeE
Subject: Re: [Buildroot] [PATCH 1/1] package/openvpn: bump version to 2.7.3
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

On 27/04/2026 21:10, Bernd Kuhls wrote:
> https://github.com/OpenVPN/openvpn/blob/v2.7.3/Changes.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
