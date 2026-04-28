Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4F3FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AD6B41127;
	Tue, 28 Apr 2026 18:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nE3zpVERuXwY; Tue, 28 Apr 2026 18:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE454412F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401212;
	bh=/s6xV4651SvXogeE2fizwIMDLDJ8I5M9onLNI5tjU3I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HAgyLHotMwCQ0COXzty/+xPM5ol4NWoexx1WLL8pRGAzx9fTp6paJFud6Kmdl1jA4
	 ZupqwavhU9L6Jqz+pF/zo9OIoh/A/YecQA7zZ+9rk9k/Hm0bssZ/ZRNzC6rrEJdKyw
	 iAQC+F62Aai6Uixo6Dd2Z+jSHnI5QWsGnEvToiJUcvesEkAhvVKIQF4wTAJlxYZkv1
	 Wk1rNmvZFtAewjZIUCQJybDkosyqlu1QNCzM3WRjyMrGNKDJd5ikJTz0jc6AkzuJ6h
	 ar/7uPxEmyOb+stnO/uBz1n9byhCk32DByUZpsfAgQt01vvdEm1yeknTES3aoAWSqr
	 rKTEacJ6SN8Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE454412F5;
	Tue, 28 Apr 2026 18:33:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9905123D
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E27E60F2C
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SDoiUkNOjbHi for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0913160F21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0913160F21
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0913160F21
 for <buildroot@buildroot.net>; Tue, 28 Apr 2026 18:33:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A6E3C7804FD;
 Tue, 28 Apr 2026 20:33:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 20:33:24 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 20:33:24 +0200
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Cc: buildroot@buildroot.net
In-Reply-To: <aex59F1QfRttdIDh@einstein.dilieto.eu>
References: <aex59F1QfRttdIDh@einstein.dilieto.eu>
User-Agent: Webmail Free/1.6.14
Message-ID: <aee6ef24a381f10bf2e3d0b9b8f38d02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777401205;
 bh=leTN7J27OGWu7Zc8TCcSzxvFhfYJhGClrD3XSqFEQZ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Kek4hT4aFtBUxtkfM/RD1ChPQxGYum99XV24D/+v1IqTw6fO4tnwBPVTQoP2cIUKK
 2jGm/9nRu4z6BZo3AeIWEUuf3QmwNLscxzlEsaTYptJxMp2AyUbMDWPGFBFEHiFwl6
 tWThpGQLUriMXGv0howflhAOFlTwW078xHxmAKtOuNmTOkd+8K/Bz15b7POfn38sI9
 V5aCEGGFpjJqd1001Vx/NKgBoHX9eSd+UPEVhNtI55QKnWNGFqWKpsem/i950U/DaT
 HGkS2EGzytGEA0QmVX6mWWsFGQCgbwG/+1TNT9LH4wYKgyCOTX+6nQsZ+WsOjMXW1A
 HRZEd4eHROe+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Kek4hT4a
Subject: Re: [Buildroot] [PATCH] package/uacme: bump version to 1.8.1
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

On 25/04/2026 10:23, Nicola Di Lieto wrote:
> Change log at
> https://github.com/ndilieto/uacme/blob/upstream/1.8.1/ChangeLog
> 
> Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
