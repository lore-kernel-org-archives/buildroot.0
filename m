Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7152FE6689C
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3223683DE4;
	Fri, 19 Dec 2025 22:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AeOQNlxKWkNa; Fri, 19 Dec 2025 22:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D54BC83DD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766183287;
	bh=TmiNmPL6r70c8NLAcM0wtCziZCjIEqlfu7FM/VOVmc4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PHh6HG6ur9YNFRna0QWlp48YhR5jdameR9Kjc+ecdPj8o1MmQhpJLpEaCuVBshKZ4
	 dM8XwsoagF9iainAPiL2Q/t8lSx8b0rDePIpxsO1qdcc/+X3dDwHBR74oRbjX5riN3
	 0ye7dOMGDd14KcMFZF4MNAzJ54SON6oCLvc7yVNLBKflym5qI4E2+iiIxS9FqCp6yg
	 Uh1MsZ5aEEZhz6gLNCV653Yza3izVf9l00eZUgv7+Y5I+N1l0ooGaR3J7MwF5Aryzo
	 ObNhuVXSPpAFGpI6Fzd8cX2EeO2K6o0eST3wH1uJy0N0q5n+3caRM/2oIX8mrW2AlF
	 GaSr4FOAyeWvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54BC83DD7;
	Fri, 19 Dec 2025 22:28:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A177A1A6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9304E60C09
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHS3Q4fEefme for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 931C660B4A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 931C660B4A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 931C660B4A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:28:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D255278034D;
 Fri, 19 Dec 2025 23:28:01 +0100 (CET)
Received: from 2a0d:e487:418e:8c09:857b:bc67:c232:7cba
 via 2a0d:e487:418e:8c09:857b:bc67:c232:7cba by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 19 Dec 2025 23:28:01 +0100
MIME-Version: 1.0
Date: Fri, 19 Dec 2025 23:28:01 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251218192316.940103-1-giulio.benetti@benettiengineering.com>
References: <20251218192316.940103-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <565a07cb3c737a704ab37c2692c0aef3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766183283;
 bh=8BfMzZPwmbcX1MrdD5RzHub18tKEUWjicqaLXXh++8w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pBdIr9uTsxhI7Yl8qqvuiUJgrP5I2ej4e/e1vIOCDPK8eqZaZ8K6lKB5pexUf6j/B
 JNQ1oum0UWPY3cJPUCWKA+ou1UdzkuaoH8h2sxmrchYl3EUADMCJijJVeRN37bEhhi
 PwbUE7YRpY8SPbDsvrS3f9JtvjgGQsJzplsde2xFCUbVBZGyyoa4WHt/9raO53QhEy
 DzKjCP12dz0r8hflB90RQMK1CYOf/FWjHa9SsLSzGkqBB0ciyn8wMKQY+KHG5Rlro2
 KW4iRqgvqOK9fQamxJHM4OwBWywNRYXbexg91kH6fe0hLzJEjCotNMRkknmvsDsLEO
 UPWuFgWgMrBWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pBdIr9uT
Subject: Re: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.8.2
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

On 18/12/2025 20:23, Giulio Benetti wrote:
> For release note, see:
> https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.8.2/docs/v2.8.2-ReleaseNotes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
