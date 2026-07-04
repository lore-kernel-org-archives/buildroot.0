Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A29C43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 17:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178C180EB2;
	Sat,  4 Jul 2026 17:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aimrzgCVou63; Sat,  4 Jul 2026 17:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A5C180EB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783186837;
	bh=p5ie0L6ut253zwaAWB0rTMy/WOFgQFAO/2o3JxV5l1w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HLAFcDCgVDsOl/j4w/knsAiT528MgjhiqXRI4EZPjX8NNmSXn9SbTurXPW79TZH0f
	 4xrj2efpzO618qMHUm3Z9TIso8KHRWh712Q/uBdY0W1msdIyvsQfEZDoo/x+ZAc71M
	 Hicfk5IcNgX+K795x0f3uFkcOa7w1emFAYwZwsWOmjhLNRxRByxXWhsZzUfdjnPBWd
	 EhJsG102hqPljoKuLHg4hA9Myp/yFdW/5EkLgYzjKrbpBFk1vKptLFQQO0REsHDBxA
	 pjQ7MKolXnrQHs+qB+E4qP4q0hEE3flwQ6iYz9BbSbpHXOuvFKOAS3E+CVeB9PJp68
	 bkrPn4V6YC1wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A5C180EB7;
	Sat,  4 Jul 2026 17:40:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A8E9363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 715FE60615
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2p2_AfgO8cTB for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 17:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97623605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97623605E6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97623605E6
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 17:40:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DF6F05FFC0;
 Sat,  4 Jul 2026 19:40:31 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 04 Jul 2026 19:40:31 +0200
MIME-Version: 1.0
Date: Sat, 04 Jul 2026 19:40:31 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <akaoFOYUuiUwVnnc@waldemar-brodkorb.de>
References: <akaoFOYUuiUwVnnc@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.16
Message-ID: <30b0147c627c815ef0ad46bfa4fc0636@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783186833;
 bh=Ul8WSRDZC+NwaAjpNCQQn7jCvTwrutVRoySc5ciKll0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BVqSwM0+L4BNm1jjZyhdY+Ggj2+YGvcX6WUXZTg9nr6u083vaGeDQInemFtiTlAnr
 SATxBDHtNX1I6rbBlVn+FWBTAtTjXJjX+JX7UuUSyUjHRej/Mgkl1f27cSMHlrRYUU
 RVi0N02lXSk8zlteEz5eN4ZppwbKy3Zw/LnV7RbfIIt5RFqqk0NfD2XgE3d1o9XJGp
 73DcfX5yynMQvnI2rdKW+KmMYywegZgmJSICLFYpU/+HTcKaBnq3gXE3LEHQMBOUeU
 bFS9+PpZVLNrokz1EOLLWQvV2Tklnmd5IGYqH++kxNVH36c+zsXtjWEYcvxRbdnxMq
 anWwbl+LTtzYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BVqSwM0+
Subject: Re: [Buildroot] [PATCH] package/lighttpd: bump to 1.4.84
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

On 02/07/2026 20:04, Waldemar Brodkorb wrote:
> See here for changes:
> https://www.lighttpd.net/2026/06/17/1.4.84/
> https://www.lighttpd.net/2026/06/14/1.4.83/
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
