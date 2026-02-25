Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378A4FD45F2
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E196581959;
	Wed, 25 Feb 2026 20:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rynf3QhgIehA; Wed, 25 Feb 2026 20:45:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D82C8195C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772052301;
	bh=KSf9DAsJiyaRsGTu20FhjUm/g5hMMEYTiEE5xyTRK4g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G9RTlvUfQjxGbX3pjSJKl3rMMJ3DGk7yw1YwqG91OSN/Utz+arwKHcJbGsl82fp5k
	 lMMAZ5h8hwFWJlAh4RS7gRQc6vVAZ3iGs58sckEB+q0//z9udeguXKK83LatHeJq5A
	 lVYJ36VHXfbAtLNpgdTahN+lwkiI7w+qi83EkprMJoF1PYPN89UoSBriXtomZH0owN
	 9mAaJXh8om2K2qymnWLDUdE8I5EgU2IedMnKuR24OKiT5XQhWuUVXWZTnynUEkq5rm
	 YzyoMLUy4LjGuVeEvCapx1sVm8LPSSgytWUUzfV6hPj7y9loES/r0JW2A3KzJ6WAzw
	 8TplTbqI7c3yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D82C8195C;
	Wed, 25 Feb 2026 20:45:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AEF204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6749541FA2
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cF5LwvEH6v9X for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15FF041FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15FF041FA0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15FF041FA0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:44:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 016162003C8;
 Wed, 25 Feb 2026 21:44:54 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Feb 2026 21:44:54 +0100
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 21:44:54 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260225091006.238395-1-thomas.perale@mind.be>
References: <20260225091006.238395-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.13
Message-ID: <c89a9587c18dad4c2df30a7cbbbaa595@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772052296;
 bh=j/0m9xClHfCO2ksR+wQQJi8a0uWarRAc4rJFDCNbC88=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kTE33eW3GveqC5WaK5GFwHRPMVBsWqmEWvKrGZfxBMXtbiNqlm7/sRer8xZrp+2ni
 0QIregilxKLYDzmK9dTYkYYuwMjgYC5X0GVkDdlySgIWZqiUinfmPilMAzngbg8PNa
 9ydaP6QnC8eRU3+qocXpbrj/GmmacdD5qpkUSJjvZ+Ogrf9gzCW2AASQSKEod+c7f4
 XkGt+1Tbt6ayfPRZ6LYBkU96WTjkPUk//T7mF+zwFg78UwtIJdTacm5NP6F/28IT2Z
 zCjRtrJ22n16WwG39iMNZRlyyQt4U9SVRDbvZib6X1j4ucn5GvAyxLCgxQTlHMSRAQ
 GPD3z70admH3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kTE33eW3
Subject: Re: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.13
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

On 25/02/2026 10:10, Thomas Perale via buildroot wrote:
> For more information on the version bump, see:
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.12.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.11.html
>   - https://www.wireshark.org/docs/relnotes/wireshark-4.4.10.html
> 
> Fixes the following vulnerabilities:
> 
> - CVE-2025-11626:
>     MONGO dissector infinite loop in Wireshark 4.4.0 to 4.4.9 and 4.2.0 
> to
>     4.2.13 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-11626
> 
> - CVE-2025-13499:
>     Kafka dissector crash in Wireshark 4.6.0 and 4.4.0 to 4.4.10 allows
>     denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-13499
> 
> - CVE-2025-13946:
>     MEGACO dissector infinite loop in Wireshark 4.6.0 to 4.6.1 and 
> 4.4.0
>     to 4.4.11 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2025-13946
> 
> - CVE-2026-0959:
>     IEEE 802.11 protocol dissector crash in Wireshark 4.6.0 to 4.6.2 
> and
>     4.4.0 to 4.4.12 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0959
> 
> - CVE-2026-0960:
>     HTTP3 protocol dissector infinite loop in Wireshark 4.6.0 to 4.6.2
>     allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0960
> 
> - CVE-2026-0961:
>     BLF file parser crash in Wireshark 4.6.0 to 4.6.2 and 4.4.0 to 
> 4.4.12
>     allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0961
> 
> - CVE-2026-0962:
>     SOME/IP-SD protocol dissector crash in Wireshark 4.6.0 to 4.6.2 and
>     4.4.0 to 4.4.12 allows denial of service
> 
>     https://www.cve.org/CVERecord?id=CVE-2026-0962
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
