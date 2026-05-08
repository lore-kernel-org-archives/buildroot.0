Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBEDCD3445
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 19:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FB9361B90;
	Fri,  8 May 2026 19:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brj-e6LznzcY; Fri,  8 May 2026 19:54:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6794C61B88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778270060;
	bh=7NZV0GC+jVWkbRSX+Mv1IVEhYQHiMJMX19HWgD/Nxiw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bG5ATiSQQedjaB6eY7dMhb+8cF2h0DWbBWelUT/NpNHa5os6nhPSjG1ZVxu1ImZ1O
	 lbBVlkRdKcl+VjCsrfaDN8MskSoomYAc3ry7qcZsLfpfTI7pR67ZTCaw6+GzZdXge9
	 oWPtjMU8QJRyP49zEZqvL52aiFBc5plpaSis9hc/4YKIy++BGBOUvqIBwMwKuWburT
	 IsBeXIni5itwmqrUMa9oC3UZ6axLT52Fgo2/bZSP+qLD2nlCSUQYDiBVEOYFMu1D2E
	 xDZyJkeEXw5v1wQVDgqkQCFDZA3PQBe3EH24ItLQO3xXJ/sJxnVKPgCH5rY86/sfAC
	 AMVpdSYMcp/vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6794C61B88;
	Fri,  8 May 2026 19:54:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 529EE28D
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4209261B88
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsZEIUeGgZD4 for <buildroot@buildroot.org>;
 Fri,  8 May 2026 19:54:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 624E761B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624E761B87
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 624E761B87
 for <buildroot@buildroot.org>; Fri,  8 May 2026 19:54:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B268719F5A5;
 Fri,  8 May 2026 21:54:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 21:54:14 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 21:54:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260508193549.4015030-1-bernd@kuhls.net>
References: <20260508193549.4015030-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <54cb78e833a3c3f5400854f17bb717f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778270055;
 bh=1T614znZNuCqOQZWE5X2AbxE+0elq+NiVUclQKGYig4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kFJuUx1Cd6jrwxSoLT0jaAVEMNpyJfpRMNja+Elp3po8Pij0kb1u9aDVckCt+vK0/
 bGzY3T0q3RlXObaX4TicRW6DhZyMCgYZY7JBZjlSb9sZ2Uxcg9zufH3EQl+m9K7o0i
 rcWLCnBy5GLFhxR0cZVV1HpQw4KC/xeBOwvkLSnfY6KmvxHhCyzTgjI8u9O5o9wrO6
 ymJ0Tzfm+5hFVbhqkshtS3dGNe183UC+5H7ZpQlt2btHjExTjT2N8hWnLPiOCx0lYN
 hUBtDcUj7x18O9aubFQSxJm6yQ2Xk4hvBhu0EJDbnk5Hg2xs6d6a9XCobBWX4k5fjj
 4rPn24Upy7O/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kFJuUx1C
Subject: Re: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 5.{10,
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

On 08/05/2026 21:35, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
