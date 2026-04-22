Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E54FA1FDA
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 17:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC9084ADA;
	Wed, 22 Apr 2026 17:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ysTmzVM8rjhf; Wed, 22 Apr 2026 17:44:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAB0384AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776879883;
	bh=xdOf1ihi9jxBtjd//a2nXYSNLwffckfuLKUr3YJ/bB0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YU5P7TRU2kcprNCC6w+YI9yuJSeK1XVmn/sU/81NmaeSbfwqCIjmEvYj00XTzF47s
	 L4qi7T1laEpWZcwKLtOCzZQjNENdZDqK7t+hcY1Uz4p/v6r8y5V4rxNb20GYGAkU2k
	 FkOf5nz68XpdP/0KH0r0bIR0YDAY7QrWFLG7SBPfgEPxk/5vO+DLq3PoEXxNcgnfXw
	 eRdF1AKCqUYYNJAOtPde5HrCGT4Z3jDhO6ikzQZRBsc8hAyTINZEX7O7/AQwMf8EY1
	 8gENFwFOa470pPPnDi0gfUdw/jNUJpsYq0ohZHu62Pz+V2zxW6vJ8JnLh9JBCwR0DC
	 ukxRFmVWUiiJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAB0384AD6;
	Wed, 22 Apr 2026 17:44:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FAA124D
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 17:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40D9461B21
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 17:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ub8RTLO3DJXu for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 17:44:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B33F961B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33F961B0E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B33F961B0E
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 17:44:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id EBF68780383;
 Wed, 22 Apr 2026 19:44:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Apr 2026 19:44:36 +0200
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 19:44:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260421190816.2723435-1-bernd@kuhls.net>
References: <20260421190816.2723435-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <915f4fb0c5ce165e7ca299e9412457f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776879878;
 bh=jL3c/4+1WzoFDRO/ffE2uh+EthXPY9EWYU3gu4PZiJY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tqiNf1Q1g8DXZMQEqLyzHDECW7QF0e1/+wK6WUMwT9+91ZlVxPpihW3P21WqeHxIr
 Kj4f9AN77xO1+6E0O9S6N7Vl53eqy+TAquJV5Y3G77dILhNSU6X/FO06YiSj5xXHNw
 t2V2Yn5WcTz7AhFV5wfqZqpspZmkPsLOumc8ghFt5khpjvuAqshW17yAvbLPyKTEgq
 AFCPgpH3AhnnGSdSwu/HNVBDKOT7lQVaEXwmq3huWEyH8erApYaS5uHOves1iZBkTS
 cWbcErq9GbEWz72yuy30JPmklOtob7vVTeW89uREZ19VeGzI13ASquAuAnR6akrsBv
 +BOzaoiKM5DFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tqiNf1Q1
Subject: Re: [Buildroot] [PATCH 1/1] package/squid: bump version to 7.5
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

On 21/04/2026 21:08, Bernd Kuhls wrote:
> https://github.com/squid-cache/squid/blob/SQUID_7_5/ChangeLog
> 
> Removed patches which are included in this release.
> 
> Switched to tarball hash provided by upstream.
> 
> Updated license hash due to upstream commit
> https://github.com/squid-cache/squid/commit/30a55c0819d96a16aab59fc5584d54be4a83f765
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.  For info, this bump was apparently
fixing 3 CVEs, so I marked this commit as "security". See:
https://gitlab.com/buildroot.org/buildroot/-/commit/59906743401c57a551d7e198d8dc2a508a200ddd

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
