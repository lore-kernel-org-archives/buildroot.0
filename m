Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88CCEA8109
	for <buildroot@archiver.kernel.org>; Tue, 10 Feb 2026 12:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 075BD610EF;
	Tue, 10 Feb 2026 12:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BimGHMCjmsZB; Tue, 10 Feb 2026 12:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79CE460AC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770726705;
	bh=yWMS1OiRNgB52+XwSJrvNFk9xP6LfrUo6Bo0/ZxgL2g=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EIsuJfNQnYyO3KXIwmvdScaGBJlKmMxo/5FEEQNVI01BbLpPvv0m/Qep9Zjv54yRj
	 c1q67c3THAN0mEurGoD778TJEbb9pxtq+zt1z/VLUeKqZIIvXeWQ5aT6pw+xQAU9x6
	 5e21mQ/wSGCM9iRBdXqQFAF8TwM8meBc+ydMYV+gy7ZQwl5NGC1wGGQ6LbMQN/BOS0
	 SuHIAVaQoLngvZO0CecWv7d0AdqUFtpYs63O1/cC/jSda2LHR8lNRZnXuMYvxta6Yo
	 L4cwquxmYE+cSUtMOkSRKrraAdMz5bD1rfSshPNHMvoYRotLLogwDr/Bkem7BkmoH5
	 68RL3+ZmtzwIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79CE460AC7;
	Tue, 10 Feb 2026 12:31:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD481A9
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8FA582400
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2khTnLIPKvS9 for <buildroot@buildroot.org>;
 Tue, 10 Feb 2026 12:31:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B0E9A826DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0E9A826DA
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0E9A826DA
 for <buildroot@buildroot.org>; Tue, 10 Feb 2026 12:31:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 72AD919F5BE;
 Tue, 10 Feb 2026 13:31:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Feb 2026 13:31:37 +0100
MIME-Version: 1.0
Date: Tue, 10 Feb 2026 13:31:37 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20260210074955.612849-1-peter@korsgaard.com>
References: <20260210074955.612849-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <d2590be635aefbfbfc49da62e3cac4d9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770726700;
 bh=eXupyAR5EjiWejCfLscI8yhTDwEDqpSygLLkdZ0t4mI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ag5hqrN1cMz/WXOKciMeEDvYheQJg7vsiJ38IBDamN4VgOmabHx8LZrxskzvHTDkl
 Y6MhpWxFnQhlfi3Sr21X9XvrJsj7YuuHqbiDdFZEWdw9PJTjGFfI7Nj3NHW8xwqk4U
 TmollwuXTupWJi2sbZxxJtm/nO6XT+Ydh+cMAySwSygLyh6PpMWg4E02ar6EpFuqHB
 Q/SLopOY+/cnwN0pnpEHf63NHQpAY7PMUFcQMqCvQqgpuBf5Nxj7Z0HJis7ODu41Ln
 7k3Mj3KkkcHU2d0/CYJPPOKE8fb017Icyx18dzdXkfLelUCAfB/ifpmg+CbeKYb4ak
 zTHTI3V65MF/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ag5hqrN1
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.7
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

On 10/02/2026 08:49, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
> 
> CVE-2025-61732: cmd/cgo: remove user-content from doc strings in cgo 
> ASTs
> 
> A discrepancy between how Go and C/C++ comments were parsed allowed for 
> code
> smuggling into the resulting cgo binary.
> 
> To prevent this behavior, the cgo compiler will no longer parse
> user-provided doc comments.
> 
> CVE-2025-68121: crypto/tls: unexpected session resumption when using
> Config.GetConfigForClient
> 
> Config.GetConfigForClient is documented to use the original Config's 
> session
> ticket keys unless explicitly overridden.  This can cause unexpected
> behavior if the returned Config modifies authentication parameters, 
> like
> ClientCAs: a connection initially established with the parent (or a 
> sibling)
> Config can be resumed, bypassing the modified authentication 
> requirements.
> 
> If ClientAuth is VerifyClientCertIfGiven or RequireAndVerifyClientCert 
> (on
> the server) or InsecureSkipVerify is false (on the client), crypto/tls 
> now
> checks that the root of the previously-verified chain is still in
> ClientCAs/RootCAs when resuming a connection.
> 
> Go 1.26 Release Candidate 2, Go 1.25.6, and Go 1.24.12 had fixed a 
> similar
> issue related to session ticket keys being implicitly shared by
> Config.Clone.  Since this fix is broader, the Config.Clone behavior 
> change
> has been reverted.
> 
> Note that VerifyPeerCertificate still behaves as documented: it does 
> not
> apply to resumed connections.  Applications that use
> Config.GetConfigForClient or Config.Clone and do not wish to blindly 
> resume
> connections established with the original Config must use 
> VerifyConnection
> instead (or SetSessionTicketKeys or SessionTicketsDisabled).
> 
> For more details, see the announcement:
> https://groups.google.com/g/golang-announce/c/K09ubi9FQFk
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
