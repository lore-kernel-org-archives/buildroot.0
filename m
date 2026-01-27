Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51331D2FEE3
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 21:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191B381EBD;
	Tue, 27 Jan 2026 21:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtrAYLCW_p45; Tue, 27 Jan 2026 21:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E11981F82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769549209;
	bh=q5+CXtZqmj6rNj2pqq9XUjpb5GpjuVWsfnADpuvPw6k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fPGruRjt1Rh4Zn5sDNgYvb5AjBRynHY8VE8BC/zd8Ps4QY2dJLel1fEUAb3MsMAZ7
	 zsWW5ZYOoSk5iXhRHx5ofz//2PDlpq/4qDH+WYrNhp7wd7Wa7HTMl20eeXnNqF+4OK
	 78+CmBkeLRIi/np7VKjPaaWHva43P4I2/7RYrStFmNwkVUJb0XGc5k6jSXowVXEC38
	 N1kJObL22V6A+uVIombADtjtSD2yTkAZpcUEY25oCp2k5onI+dZ5NUQH++SHo+VH/l
	 dTUdtUZBMed8UQ3W32Pw7veaj0xqVJHytg5V+JwLNv+tlNGprF8DPhbhqH0qsY0NIB
	 oZ91EGBfbEbzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E11981F82;
	Tue, 27 Jan 2026 21:26:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61C37118
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 469C340223
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rkv1i6VN_Ic3 for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 21:26:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 536DB4020A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 536DB4020A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 536DB4020A
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 21:26:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3359819F5A7;
 Tue, 27 Jan 2026 22:26:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 27 Jan 2026 22:26:41 +0100
MIME-Version: 1.0
Date: Tue, 27 Jan 2026 22:26:41 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <20260127164715.309118-1-peter@korsgaard.com>
References: <20260127164715.309118-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <4c84b9fad4e07c3909dc5e6dfbc0f3e3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769549204;
 bh=Mc0W9bYQYboz8WYfW1FsCZZmdNiglVdJ79kC5CeEAQE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VLINuCLCw5splq8LW0FEkB8vvWuF/UyN4ocR6ndU/vs+g0XG8N7+VXCNKMq+6Rwdd
 JggX04OROC2TF3wKSFbabaJajOvbbw64a7FccE6lUouKvz/9X49HhdpvtbT0FDBb0r
 8+tS56xYv04saxELiGcu8AhoGB/cm0tV5Ff70l9lEh2H51YnuCcFOkai38UwD9wfEv
 B/tt03QzVOyXXT0l8ozhbGgd+8bXMCR+isgGcm+mduk0pes98VrT6hQWk//ao1jxGK
 GlQdiBJ9p3A2VWvdHxSZWLj1I/owmhwzo58C/ai7FkehDxbB+7L81ZDyHVKAU716KO
 ZfQwhO9qvnJkA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=VLINuCLC
Subject: Re: [Buildroot] [PATCH] package/go: security bump to version 1.25.6
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

On 27/01/2026 17:47, Peter Korsgaard wrote:
> Fixes the following vulnerabilities:
> 
> - CVE-2025-61728: archive/zip: denial of service when parsing arbitrary 
> ZIP
>   archives
> 
>   archive/zip used a super-linear file name indexing algorithm that is
>   invoked the first time a file in an archive is opened.  This can lead 
> to a
>   denial of service when consuming a maliciously constructed ZIP 
> archive.
> 
> - CVE-2025-61726: net/http: memory exhaustion in Request.ParseForm
> 
>   When parsing a URL-encoded form net/http may allocate an unexpected 
> amount
>   of memory when provided a large number of key-value pairs.  This can
>   result in a denial of service due to memory exhaustion.
> 
> - CVE-2025-68121: crypto/tls: Config.Clone copies automatically 
> generated
>   session ticket keys, session resumption does not account for the
>   expiration of full certificate chain
> 
>   The Config.Clone methods allows cloning a Config which has already 
> been
>   passed to a TLS function, allowing it to be mutated and reused.
> 
>   If Config.SessionTicketKey has not been set, and
>   Config.SetSessionTicketKeys has not been called, crypto/tls will 
> generate
>   random session ticket keys and automatically rotate them.  
> Config.Clone
>   would copy these automatically generated keys into the returned 
> Config,
>   meaning that the two Configs would share session ticket keys, 
> allowing
>   sessions created using one Config could be used to resume sessions 
> with
>   the other Config.  This can allow clients to resume sessions even 
> though
>   the Config may be configured such that they should not be able to do 
> so.
> 
> - CVE-2025-61731: cmd/go: unexpected code execution when invoking 
> toolchain
> 
>   The Go toolchain supports multiple VCS which are used retrieving 
> modules
>   and embedding build information into binaries.
> 
>   On systems with Mercurial installed (hg) downloading modules (e.g.  
> via go
>   get or go mod download) from non-standard sources (e.g.  custom 
> domains)
>   can cause unexpected code execution due to how external VCS commands 
> are
>   constructed.
> 
>   On systems with Git installed, downloading and building modules with
>   malicious version strings could allow an attacker to write to 
> arbitrary
>   files on the system the user has access to.  This can only be 
> triggered by
>   explicitly providing the malicious version strings to the toolchain, 
> and
>   does not affect usage of @latest or bare module paths.
> 
>   The toolchain now uses safer VCS options to prevent misinterpretation 
> of
>   untrusted inputs.  In addition, the toolchain now disallows module 
> version
>   strings prefixed with a "-" or "/" character.
> 
> - CVE-2025-61730: crypto/tls: handshake messages may be processed at 
> the
>   incorrect encryption level
> 
>   During the TLS 1.3 handshake if multiple messages are sent in records 
> that
>   span encryption level boundaries (for instance the Client Hello and
>   Encrypted Extensions messages), the subsequent messages may be 
> processed
>   before the encryption level changes.  This can cause some minor
>   information disclosure if a network-local attacker can inject 
> messages
>   during the handshake.
> 
> For details, see the announcement:
> https://groups.google.com/g/golang-announce/c/Vd2tYVM8eUc
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
