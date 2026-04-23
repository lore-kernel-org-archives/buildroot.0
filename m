Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142C7FDEE45
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D6E83D73;
	Thu, 23 Apr 2026 20:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ylAp4ZRttpKd; Thu, 23 Apr 2026 20:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F3483DAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776976121;
	bh=38TRc23cdPA+3b5BHgouuZMea1I14Dqq8K8swDjaDf0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aJ8XmdceTtWPAA8aPkJz31ReuzhKMp0karodur4MxHc3R8qJ9Xn6GfPfcjwIXMU/a
	 T6+EEW2x4qxUR7Bmm5bLUbml8GMGbPk7YuYJja0qjVPd1kxolMwGTd8zuUIcvoYY9I
	 tpX89N83osEWZKJkrvJrwYOSueYmZvK6WUzAwgg0s/w6VsQAyLYhk8JrBJnNq3+ApZ
	 wBwFqnOlhKtxq+pTgq68ZUlRtnGgmTgHp5PphGJ2ut9iZ4z605EOT05zfydGsBy7au
	 4FVmO13maF2Y9aZhlHaI6UX4IX6knTGWb9jH+QbHWqhXEowBv6tqWM/5yQSNZgMZhn
	 cmPDZ2GbBJvyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F3483DAA;
	Thu, 23 Apr 2026 20:28:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E517206
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14FAD60F4B
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmEjpgQ7rV67 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:28:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0FB6D60F4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB6D60F4A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FB6D60F4A
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:28:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DFE2678035E;
 Thu, 23 Apr 2026 22:28:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 22:28:33 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 22:28:33 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20260421190443.2722764-1-bernd@kuhls.net>
References: <20260421190443.2722764-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8d4ccaef562187a95ee572bf1e3f70b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776976116;
 bh=vALXf4n0P9p2uylzapRBIgzH1GLwbE//VsT0yfcEVCw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pM1e5YWdvjsDk6kQTGZ4QPi4iZHeYWRSzp2vs5I4j2ftCBd+IzaLcQ3vec4rk8wnk
 10NOYNueUI275qApyOCCG6U+NIHa6drVFMcfs/WjMXlip2xn1oxkyTKGz10/ck0p0P
 2Ay3H3EkJA7Ps5m29u+JLq7kCdVO+cJjaL4HzZQRdntyvVv/rc6EmGBlcaQH9rIwqX
 0YNtN/3SRxaAtf8TuAxeMbqjlcKvvR7HjAPBKXRwPfG7oRaFhgxUp/Snu6O7ErNDrb
 eAHenpOnDo8jU9TbtEv8JwJH2WgUAC5KPYs48zJlFdDUkTKE8dovYJ7fxoEtPdxHJs
 vNmWOuTmfor1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pM1e5YWd
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: bump version to
 0.43.1
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

On 21/04/2026 21:04, Bernd Kuhls wrote:
> https://github.com/yhirose/cpp-httplib/compare/v0.41.0...v0.43.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
