Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219DFF94CAA
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 20:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC1996153B;
	Tue, 21 Apr 2026 20:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEcuvejDrCeP; Tue, 21 Apr 2026 20:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2890E6139E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776803506;
	bh=SlhiLPqySYSHYPO+U3XiXcL1l59kRsCux19upovyZ5w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HxFQeioLg+tJsfQjohyfCwqlCPTILH149RFmd4x4ng2ctFRhj+AJG39+Ag9ow6mAQ
	 QqF5oQvj7KnoFUCDz2Bne707JZ7lKjHD4dGHiMmTFI7i651r/MU6eC0L1fRPVVU5BI
	 aoM2dTstqyxBbcb5TmyGXdkINqCYUChEDZFzNdUWcLd9x716YwzNsHzt+UHaua1yw9
	 8hVjYJ4BxhpkoY+cQUN/qGyWMMyCdCoObnD3GJ2i0q4sGR6d7gpRtK2AsWNMvk/sPD
	 Isb3jf6Xpgie+0AUzzn03o238YHjM30gAwhgRT7eS4RgIdHrtrfvvuCAw4E6NTILuc
	 0HcRw9s+1rhCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2890E6139E;
	Tue, 21 Apr 2026 20:31:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77368183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CD896139E
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spWerpIxi8Zg for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 20:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52F5F6088C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F5F6088C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52F5F6088C
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:31:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 309BD13F8A9;
 Tue, 21 Apr 2026 22:31:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Apr 2026 22:31:39 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2026 22:31:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20260421190034.2722046-1-bernd@kuhls.net>
References: <20260421190034.2722046-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <298ce08d9470b561f99f8d0cae25d2ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776803501;
 bh=R5lP+e6Hz5cMZlT367ofRcte/tA3I/G/NYPr2mz9vAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KiitZMshpR+uMoumC/hgNqIGXbeZtCfjC8XQyhVSCtHBWwk22kDrX0UzITIxbyhwC
 42xl62kARiKkqyQ8X5RkFAaVsZF/uTyB9+MPWWAin0hq6EL5HtNuY76RffZApsY0Hn
 gUFlXODgaOasFHeGnAPHK0pobA2kSiTellZ+qoxYi7hDphnrKhKmkI7FA+C4maH3Wx
 gIDbwzkDDtTJuGxgXxV17Li6IqvEebHlciOQ5FuNqBO7aYLnCefw5cGkK4aN1MD+th
 h9qQ067VsuCJHqwAo6UHAm0PpoqkbyaJEGOzTQvXfcJu8ldJAhvNFSiG1oWtC/RYOI
 eBj3ObwdsZTkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KiitZMsh
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: security bump version
 to 3.8.2
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

On 21/04/2026 21:00, Bernd Kuhls wrote:
> https://github.com/DMTF/libspdm/releases/tag/3.8.2
> 
> This release brings a fix for the security issues described in
> https://github.com/DMTF/libspdm/security/advisories/GHSA-j54w-759w-xj3m
> https://github.com/DMTF/libspdm/security/advisories/GHSA-m4wc-xmvg-369f
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
