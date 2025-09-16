Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF08CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E25E611CA;
	Tue, 16 Sep 2025 20:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yvXTWFENpzBg; Tue, 16 Sep 2025 20:52:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A78BA611DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A78BA611DD;
	Tue, 16 Sep 2025 20:52:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1144C199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC01641D85
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ntcEEWnZW0rD for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:52:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36730404F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36730404F8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36730404F8
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:52:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 91691B00548;
 Tue, 16 Sep 2025 22:52:12 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Sep 2025 22:52:12 +0200
MIME-Version: 1.0
Date: Tue, 16 Sep 2025 22:52:12 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250915215819.1591746-1-james.hilliard1@gmail.com>
References: <20250915215819.1591746-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <b440dd28b906bdc8452fac7284eea3c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758055933;
 bh=tbJR5HtTpT2Oj+Oux3avtmp3LsroN2M7KWcoa0TI43w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OxzxpFkRZTbzLhlp9GHALYG7Kknm41ZaexaBkWhLhvBQ7N98FO0+jyhzlk177r+X8
 X1/hc+Z0vw6syJfQzK6TYRAQCF3EEVg4VdJPeaZURmN3gGbVPNx3KlQtKmqPMCwTFL
 IpjgeDqOm7HMSlqIfZIpQa3GH8//CL3XyE3uwnAQXEdqodnQIJS691nPhsAnt5793m
 KDnjs5YYPhbf7L23XNMyNxPM+axhoD44RMYyexNakCS3a13fwpb3m5GQSYFsQREXs+
 cfAy5E7k4odBLu4c+r0AtvuDKTi3y4dnsQtzkxGl8L/yEq5IHjtMmMT5sS2nA0XIeT
 QiOqKX8pU7+og==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OxzxpFkR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version
 4.10.0
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

On 15/09/2025 23:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
