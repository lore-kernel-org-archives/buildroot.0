Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B5FCD5BAB
	for <buildroot@archiver.kernel.org>; Sun, 24 May 2026 11:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EAEA41232;
	Sun, 24 May 2026 11:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBlIdbg14yF5; Sun, 24 May 2026 11:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DC1841210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779622400;
	bh=atvzJcI5Ig5BxqsgsWY3x0rLNWjBAkU8jQMTB6utAgw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rqcTAUgwe0EZlGnDVBE7xIKfEczAeP336MbHTr/hOVVCclpjGMzP2Pi8cmdCjGhDj
	 802z/yJaG02L/9cFm/DpUyD9wV096DdBng3YQISQTzVaZ0um0z3oth9Mr8aLOaBhmO
	 uddIKOJ0OXTPYw+FCW86OTAf/fdwC3Ca5Wu/+fHcV+TASubsbXwoCPaIL7spbpMklw
	 kqzRArRuZRZVKOif/Fbh0DXQ13XjWjXPondlsM545z96NtRfIjN98xTbbXlRCOqPzy
	 2fCfaMBeKEpjaPucWGXY1UB+HZkUBQGXAtKHlbNVJWNL4ZsScSRnHMsxCko7Ttq2Aa
	 mVqXIRBbXoNTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DC1841210;
	Sun, 24 May 2026 11:33:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2514B263
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16A1260E5F
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n5fdeFB8CVo5 for <buildroot@buildroot.org>;
 Sun, 24 May 2026 11:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42C7460E5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42C7460E5E
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42C7460E5E
 for <buildroot@buildroot.org>; Sun, 24 May 2026 11:33:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E880D19F593;
 Sun, 24 May 2026 13:33:14 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 24 May 2026 13:33:14 +0200
MIME-Version: 1.0
Date: Sun, 24 May 2026 13:33:14 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260523084557.106578-1-bernd@kuhls.net>
References: <20260523084557.106578-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <88ffb7b0b31ef7faaff4ee3a3af79668@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1779622397;
 bh=h2RZ/baNblnk5KCjbYsPnUe7DsZCFGAlUy9RCODR7mU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aNfovRY3aqI9tcP3tfNspToDsxNRWakpO3VhqLlUAtZQeiTkdQdecb9qEZj8QygLi
 n7Scoa6WBPJ6jo1jnMyC3sK44FWtLdyDzgifDWcKxRp+1xfAmnnwImfDmyIsgfwPoQ
 JgpDnQXglSctMe+vd7DcT1E3XYDU0ue7jlaBBWYIv+lcFLytzF6CFfm/ZN/mZKUGlT
 YsCDljdsDctt5hUfLjdNLDgtPwV2YpJoaXmcgTVqxtDm7z/0GnapVCuHu97b5L3EoE
 ra20Rk/gfErEAk1Nm4t7Tnx17jUAmyET55HF83jzNT25pT+Om8+y6wGUcsGdm6TjE4
 s9zPE1fGsD1QA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aNfovRY3
Subject: Re: [Buildroot] [PATCH/next 1/1] package/cmake: bump version to
 4.3.3
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

On 23/05/2026 10:45, Bernd Kuhls wrote:
> https://cmake.org/cmake/help/latest/release/4.3.html#id3
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
