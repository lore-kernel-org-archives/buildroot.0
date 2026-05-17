Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D7FCD4F47
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 17:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 567A48529D;
	Sun, 17 May 2026 17:03:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ahom1fo2U54; Sun, 17 May 2026 17:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A03D85788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779037434;
	bh=KLA8exNFUcu/6fHB6inUgXl+03XC+42qPdpg8a3MCOA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=tCjpfIi3WqWPu+CIkLWEtlRMqDupqQmtWJvyyRDPo1jKuQQ3ueZj1MwQSmf+YfI8R
	 /7tr/sWwYxvgz0ZA1cRIxDErGQfEkqR3Z9ottzJ3EWdZ021Tmgg2uHC5Z9T2r6zPLW
	 vytesQrpt3xD2luFeI1NcnZcwwRukwIrf6aa+aX+406oME4/O5YcEhQ49IosbaNu5n
	 RhNzXKJstOjlbCJmhwB96YIcnCISOdg0YjcbJH+jKQlhnqSG20B/B+YjPoJXPxNRd4
	 QX5xFJOAUfym+o9Lb/Vnma0/jAI4n9L6XDM9rc6cPjD18/jtv2BZicpGF5eW1Pan5g
	 LOBi49tCiyR/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A03D85788;
	Sun, 17 May 2026 17:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D1A7390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 17:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A5B160B38
 for <buildroot@buildroot.org>; Sun, 17 May 2026 17:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYMB2sAPF67M for <buildroot@buildroot.org>;
 Sun, 17 May 2026 17:03:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 960E960BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 960E960BC8
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 960E960BC8
 for <buildroot@buildroot.org>; Sun, 17 May 2026 17:03:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E729F13F8B3;
 Sun, 17 May 2026 19:03:43 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 17 May 2026 19:03:43 +0200
MIME-Version: 1.0
Date: Sun, 17 May 2026 19:03:43 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260517155859.3537176-1-bernd@kuhls.net>
References: <20260517155859.3537176-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <51d72013e5bd3438a72fbc11567b2bc1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779037425;
 bh=ewb8SDk5tzaWa/NNH5hXH1z1sHl32xv511BHUv0skaA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FkJIZZK/St6PKeHKGhOhH3NiTceSyryc3l3dRyJFECzsknCBLCtSBAm0oLZhIaYMy
 tWygAJ7oOMIKCBNp0HZp+0TjZK08liUxhy3J5G3we83HW+Fpf9uTVppgwBEgh5+1zS
 TOclvwPyiKoQeQ1AYXOR6RlyoAhWcEiBfIWWeS/X11PJskSw0rKWhlPeCe883XK23i
 oLZlt3JIL8D1ySX/CrXGMrECn0ryVZiw3a9Ei9H3Px2yGn+/AYSSgq/vyUlrQzg+QV
 j5iII2diBwJRIPajZseY+OSgnhjw1mD+L6IpEXBX+duOC/H6GHI/LFlXZpVBI6S6+V
 m1vzs+gZ8vMog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=FkJIZZK/
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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

On 17/05/2026 17:58, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
