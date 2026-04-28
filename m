Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DE2FF885A
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 19:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A83D610E1;
	Tue, 28 Apr 2026 19:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wv_ghjc70FhX; Tue, 28 Apr 2026 19:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D34E7610B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777403882;
	bh=DBDxO1WPJKoi9fpZEW6SZ+DohnNJdDYJ6q1oCptIPZw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FgzX9xY+w+AxKG5oxIA5huOvI1k0KPjCSgG9V8U7DgsqCrQA+KSTvEB5T0hVZnOda
	 VgC55Nv2IIsVYcZEc+QM5l/u+Qf8xqzuKUvkJ9FRxqjioO3+UHrMYvN+YduRHx0wW+
	 WcKY6eaLuho3i4Zao/vjVglPFYSxemPulCkhObFbjrYqX21VSAAppqvhLlQTBCVjR3
	 HngtymNFwSSH7ev5YomwJEwtp/6SJSBEDFH7LcbVQvo3NRv/+KolI5sbRdFxCl7GAZ
	 HvELk/FTqvAb2rRvlkTcOrfmbNOBMqnQIGNGs2WKtlgp+B7IID305fta5Fl51ShLN8
	 343lSc02kqd2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D34E7610B8;
	Tue, 28 Apr 2026 19:18:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC6C11B8
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE7C583BDE
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 19:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id USg1PDvrrCpJ for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 19:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD89F83896
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD89F83896
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD89F83896
 for <buildroot@busybox.net>; Tue, 28 Apr 2026 19:17:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C5B202003C3;
 Tue, 28 Apr 2026 21:17:56 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 28 Apr 2026 21:17:56 +0200
MIME-Version: 1.0
Date: Tue, 28 Apr 2026 21:17:56 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260427110029.71280-1-francois.perrad@gadz.org>
References: <20260427110029.71280-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.14
Message-ID: <d0b686a9aa6e9f9cfb984fed4bdbbbf9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777403877;
 bh=6zA9CKCxpNPDUVNa7MNNOONTcn+uf+IT26t2UH2Pqks=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cLwjFS5rzg0B68IgAJwwOuF+x0utYTTzIBs7Nj1pk1df6WVrsFNc3PZVxquJeLJms
 fzyxdrEiMe1SWdoPBbLOBdHjkKl8N1BS37awwszfRlLY2mFcQVOFuXvQgysMf/UMR9
 sCJO5FTQeGibWRP9kUFmsOBIpnpdJ58ZDTFUF/ep13X8WybhdISEi4CNwrvGYnV7+A
 fLfhtpNbRkCdq8nkIvjvVr7s6C8A7Kv4746K4u1aD9EeNWCAisiR4NwtZhOErQZbSl
 /ZTJzh9gfXPgNpgOUeouj47Y+O3zJoq7bsEHYv9Jc0unhU7etWc9ILU0VsB6RUiznv
 aVjYZyIWkkjhw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cLwjFS5r
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 9.0
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

On 27/04/2026 13:00, Francois Perrad via buildroot wrote:
> Changelog:
> https://www.nano-editor.org/dist/v9/ChangeLog
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
