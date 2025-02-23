Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683E8C021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 12:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21ECC60A4B;
	Sun, 23 Feb 2025 12:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6uFwJy4iR0g; Sun, 23 Feb 2025 12:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FB6860611
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FB6860611;
	Sun, 23 Feb 2025 12:49:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F1F920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62484608B9
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0YQ_XgbDPkH for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 12:49:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 798F560611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 798F560611
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 798F560611
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 12:49:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 982AE60129;
 Sun, 23 Feb 2025 13:49:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 23 Feb 2025 13:49:13 +0100
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 13:49:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z7mIA7MNvH7QS1Cu@waldemar-brodkorb.de>
References: <Z7mIA7MNvH7QS1Cu@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <14565e7f73942258c99526796b99f2ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740314954;
 bh=liG5eZnsToKuv4PFz/ZSrpLLfdAk7IN06tb3tDsuTrY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UhmNnOhgP9ND5OPK4hlS8QQzOIE/Pd/tRDOODQdpcJLpynFwtJ5cCxUMCyTzSrkGD
 brsetcyT+BwjooqQvVPm0Xo69JsLVwYjg7m89OhJscr/Ly6AXBPnfyeE8hyImcGeTu
 EVE5mqpsc1WV4YGTDe9MeIFlqfNXJ/CCAIqYwJiR94DKXg7aQ7GT4Of5jIBoiOF8n2
 p6XGSkDlauWBo1m/PAUb3OX203uT0N+z7kP6y4+2dDhAAwDWcg69QpsYoI3r3QcxhM
 /fiokgvXqUhS/DgvUVc1RhraDsAYRR06TNkQCBlhAee2jisX4GVubCSK36fJNod8T6
 NXMmzhYtLKlCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UhmNnOhg
Subject: Re: [Buildroot] [PATCH] package/zabbix: update to 7.2.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 22/02/2025 09:17, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://www.zabbix.com/rn/rn7.2.3
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
