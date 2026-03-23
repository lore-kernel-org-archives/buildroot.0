Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC64F483F3
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 20:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C3AA6083F;
	Mon, 23 Mar 2026 20:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qrdt1WIRv4uh; Mon, 23 Mar 2026 20:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9294E6069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774297958;
	bh=Aon8bMQFr66c5zyAqVGqGJgeHOvJcyaOJsaG2drt7zk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=etC+Im0I9Z4ZSxUruJaUgUF98segugPFGcM4guCm/BpGd0CrBm0S/qdEq3uBRVMoJ
	 /zJ1xHY8nW7YRKBEv1bp10Vw5TRJ1pnoLmOiGEmnKTu9YpxBiax4gns9EQeG/urug2
	 S8xOtfo1GDJNRU36lcNt+fJz0mjKljS5PvBNYDWDlv4U1Sb6KTg8zXswlYH8vMK0Sb
	 Ltl51MjaO1f2SPeYPm8StUM8wdyjuPXOVHyfG8Edn29ArklU5Yx1Ye3e66zbAZ7vv5
	 MoVsPQdOQ435H9Pmgolhiduy1N4IL1oN3SlvS/LrRYRkgmhQIJ3tZDotc4IudpSqGh
	 iXyTt09WBlnMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9294E6069A;
	Mon, 23 Mar 2026 20:32:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62092F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52C116069A
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPZ2mqz3xxcz for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 20:32:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DDD560698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DDD560698
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DDD560698
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 20:32:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 14E4E19F576;
 Mon, 23 Mar 2026 21:32:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Mar 2026 21:32:30 +0100
MIME-Version: 1.0
Date: Mon, 23 Mar 2026 21:32:30 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20260323141556.492811-1-giulio.benetti@benettiengineering.com>
References: <20260323141556.492811-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <bf0bf84ebfa62cf19f347794625ba18d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774297953;
 bh=a5PKWw9mjoZ/lCJ5y6B1IL/jtD7eSG8iv0pz3Ueh9dw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nQkmP9SHWPBzPCrjDc8ZQW0flMQqrkJIGe/DgSODoi27E0xvTnBgqvsbNvsIkGxIG
 wZbhnVj4sO1a8V5tWo3WkleyuFCgVUE0qJWRHwDv1rznmTndo5m5LruxwT/w+x02p4
 gWaTo4uEtsmRzO4bhTUSXCgmrAfvAr5dUwHqLamoQCeYuJC0NGbRyBZwaBg0HzTX/1
 vwGlsLPcwYhCzWGbn2f6SBZLkzhA6OR4Lnc8nPlBYtsjdAdRHp+sGMDBBH+hVfYKuX
 S25OBD78p8eU7dXKR42E9/AOOu8BO8oNKL8BYa8sOmMMKku8TGM6p64qItsocjVoFO
 gVYaz/XYS5xDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nQkmP9SH
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.121
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

On 23/03/2026 15:15, Giulio Benetti wrote:
> For release note, see:
> https://firefox-source-docs.mozilla.org/security/nss/releases/nss_3_121.html
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
