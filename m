Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F47E92714
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41FB8607B6;
	Sat, 27 Dec 2025 15:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsBzu11GzBvg; Sat, 27 Dec 2025 15:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2310F6069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766851117;
	bh=I1tjRB/IfgmkGFTZyVKrGbjqNXJy0BNpsAfooOn+rdM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=K5NGCtnH18XBFLoQdDNR0p6dJRAv99bcPD4ol4i20TTTi2p5UjMvJ6qcXnLJ3FPo/
	 oEwmwilEUVt5N2zL2TFGt/q+01yJTdB8smUIpULXj2JVPt4/K+N9lt6E7VcJqJdVm9
	 2BFVKvuuW1+MI1cUt5ATqQpVchLW2uBrVL6z2GW4RelPfy8fE7lQ8PX5s4i7rlbAaa
	 lyn0VWKzpcNlaJnLOVGqMMNBq72cDxSUk6JOuQnC5VdchGI+yiwjsjmYU5gisQxG2+
	 oru2ozHwKgEo1+qc4NfBpMMSv/VuvVipU6Dkzp/886i9CZQlXD2k/eAzWd++2NpB5K
	 cDBZSVi9ZGAAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2310F6069A;
	Sat, 27 Dec 2025 15:58:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF8A9D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D655880D59
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9dCMZ_S_cKx for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8C0180D51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8C0180D51
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8C0180D51
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:58:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 98FBC78035E;
 Sat, 27 Dec 2025 16:58:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 16:58:31 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 16:58:31 +0100
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251221212621.1146875-1-aperez@igalia.com>
References: <20251221212621.1146875-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <84d6d96d63b255be0d7497c4ef044cb1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766851112;
 bh=qhyMJNqFVr6lkQlU0bAW1A9jKhJOw4Pq7fKiaO66Ka0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yt8o5j+ULfqdiE17CYrg5oHdZozXudZPS41v0+zStbo0YvohSrAhftHniyycF18Ta
 2gdaccI8nuoHjI/f9JD6AZBx7ZJlaOMU+88PHWFd/jyqD60CMmCewhNJ8leYMRKTJu
 8iiwGarA71kj1FBrT+w5FArbxQXZqy7gQJtjbri4L2Ec1Fx2kLP68Z5DYGNyeZ+RaW
 0UX3KuMLFRrcz6vxKlGjVtGvQRckdNzd6zyq7ikPyl35ZbNR+YeTr66vgOma1n721o
 QhGRLCo8sNUXqKonqBtyMTwLGOUJv5FIaAVmjI9OCPfItWGKrtTpLPQRz2c4VKHdgw
 DDFz16pv59mTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yt8o5j+U
Subject: Re: [Buildroot] [PATCH v2] package/wpebackend-fdo: bump to version
 1.16.1
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

On 21/12/2025 22:26, Adrian Perez de Castro wrote:
> This maintenance release introduces support for newer versions of the
> Mesa library. Release notes:
> 
>   https://wpewebkit.org/release/wpebackend-fdo-1.16.1.html
> 
> Also imports an upstream patch that is needed at least to successfully
> build when using the Musl libc.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
