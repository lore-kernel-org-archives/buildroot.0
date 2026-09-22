Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BE4C98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 18:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69C9940834;
	Tue, 22 Sep 2026 18:15:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JLyJ9MS3Pmn; Tue, 22 Sep 2026 18:15:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A6866407FC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790100946;
	b=V4UdrvBbz2/e7YJLga9F0Y9FiP0SeNwOSuEpAHmqmVMmp8zxvfLiFdBpl2jMQN21X8TD
	 fd1kh+P17D5yTYfUuwkwl7ZT4NumVTsPn2IfjzLS5EgA3lE7KbBy+HaEooyNtaTfLiydM
	 cUx2ypeLToiirG6YJq9bFPZvZEZKrzrVI+kO22EKtJmph6/7WUJVXh0ohTL3pV40EBqKK
	 fTHdh0avMqkcFE9KqPhEe5TMb9ZY/pLtEDz8N8a+9mJBOCdYwVhanVm6iBVmXxgmXvXd5
	 WJiAD7JLexnNCw0GpESKOTeh0uLaeZo5j316tT6i2sFZxb5CZFS7r7ODQMf3JNnCykQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790100946;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Ud3NmMCZmfdP9sIwdBAInT24h3Coze+rpBNjHGcRo2k=;
	b=NEM5ZRXfk60ND7MAJJZtwvBQ3htWjpD4t23S42QkM639WBjQ4rG+SNCv0e0bFmqHVofc
	 6ifXJxdRhLhRWx133CWDN4Kl7n6m9jWOYIYB8Cci/QXCqrbfY3AhJXGV8dJaYTq0i9b+w
	 uLs08kYWM51We1OE/iHQCX6GkY3LNpVAwANr6KI/9gNq/78n9BbTpWw6xjWptX6aLdMVb
	 wRE7nmjhqoz3Gk/VK/AGi3QAunI3id11TbwiKP+rvyWry3x/xTn4Cva2Yn+wa8a+QW8PF
	 ttggeb3WNqdAV/5WuJk/C0FMFyHtsu8BBUvGyXJYU2tLBK1N8UXBIJRmCkNAW/89hLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790100946;
	bh=Ud3NmMCZmfdP9sIwdBAInT24h3Coze+rpBNjHGcRo2k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kZ9bicDqs5O/rBcCbDPcoIgafmRyPDwYKqOyA0dcwuOckgRLGdI1sEj1mk1hCE6F+
	 BZBXC0ZA/maOo9p9+Hr7WcqMmH5QcPVGT5BAtzDSr2kZ9FQrQxyXJXksuGPtNTG0BU
	 DVwuTPNHcSPYBXBTfrTpLfqBwFRi6aAFfGKF6WPXIyp1QTnVGPa6fWM2kXk2Dn8XaQ
	 K/4Lggnn27M2nRdMtZAQhfmHCM7BpwBW0RkKk6Dh2duttLN0yF4/BIlvq8H12KaQPA
	 bSnAiR1KIJmvaX+IRG4b1ZRgUsLyqDRVNJAHrW/SqxMs7w3vstzetyaxBJGeasmmmn
	 eMcBjA1u6yQgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6866407FC;
	Tue, 22 Sep 2026 18:15:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB60224E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1AE66069C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If_8XjUMxs94 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 18:15:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B06056067D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790100945;
 b=elcUdMm2lGLLpaRhAxRIdH2qAcvYbS8YwBlAJzjzAxYPQQd/OGMOWUIqlfR8Eg82FKRG
 6nMXkhA3SCOC2ONUXLl4SGr5EVphntqLMUIUddocTqvbZVPj6YyVUzxMT5dj+WH5yGC1t
 pR3Uh1v8pXld3GjN4ccD2BbcCpWbePwLP5gIi91FDjhpPHgYyCD+ZT2VCaLGieqdOiuSW
 3c1LPa5CBEVRHWOuzqM7ez7HvUcBjYilj7tydmTc2+n/7HJZqFUubqOxW/w/f/WkulQod
 YCr/0Rs98MNR4fBPmxUW18aWak+qHSJiob0qK2w5PAz7X2oClnMvN4aaZupzcW7s/Pg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790100945;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=f1urgZ9uUDmrLi6Y2a9KnZqiq8q4XslYwJufTA5wIEc=;
 b=FrqRBKmPTr2WAe0fB99jwXaWZb5lsfjRVQpHC31fFuSq4ozLj6gxsRzhrtBoxIjz489z
 ha7//viu7EUNcJhgMUmmrCZo0EQRoC0sVoGX3vrxqlQcXmhzoKPgWJ4K3HjmwN52bEpju
 uiKTVB8Nwd3mNdzfJ89eOUA6RWdriwoqkvqykk1sDQu6xFI/TthNNS/VxbQFhQq6h73n0
 Nh15qQ2NfYc5NIN+aQiI0y6M6JB6kSObAbW2u4Yb1Mk5yBXxyewXGK/1F3G7M5Y7s2p0+
 Gv/UZgBuE/9lCKPbzdXQzBeURAyUmx5P6M2eYcjAhulb3ceRRLEfVloQyxGorARPB5A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ivw0JogX; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B06056067D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 18:15:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5CF3278034D;
 Tue, 22 Sep 2026 20:15:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 20:15:41 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 20:15:41 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260922181332.1533919-1-ju.o@free.fr>
References: <20260922181332.1533919-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.19
Message-ID: <59b7188f2a2fc9a619b6237f25d2c08c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] .checkpackageignore: remove entry for
 mrouted package
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

On 22/09/2026 20:13, Julien Olivain via buildroot wrote:
> Buildroot commit [1] (package/mrouted: fix invalid daemon path in
> S41mrouted) removed script execution permission but forgot to remove
> the corresponding .checkpackage entry.
> 
> check-package is reporting the error:
> 
>     package/mrouted/S41mrouted:0: NotExecutable was expected to fail, 
> did you fix the file and forget to update 
> /builds/buildroot.org/buildroot/.checkpackageignore?
> 
> This commit fixes the issue by removing the entry.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16661195972
> 
> [1] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/d8f408b1f16d067d2e676f3db91e7b337aebe160
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
