Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDC0D116F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01115613DD;
	Tue,  2 Dec 2025 21:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UizOkt9qWHTU; Tue,  2 Dec 2025 21:16:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C2C61374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764710194;
	bh=A2BYJG/jx+dW6fNhV6ry2/kWa0ZszrNIn/ZYEMqZZGU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e67nMt8mcIleaZjamSlZCNRPJAqzPwrh6cNkrMujTmx1z8iDl+w8dQGhvvQ+pf8VI
	 8mY/GEzi0hyTAt2+PtMxtLdJaarVXVSy3xtm7f/8hDIzMNcM0efAF8PXijWrmHgqTr
	 pCEK1a/0BhuwsnUaoTc7QCsIOZT6t86SQiIyKBilQnu+GuuSl3wJGYIfvTpSbLEfh9
	 16SxYgJr/EZZE0C82fyMHPuh/NbUb6OfxQyIwx4KSDiHmGi0M+vfuJ/wKiYwfeGD61
	 Mfb4dOXFVmH0g7tLKX/XeiHrnGUQGRSUA+Bla1wRZwWDyxKFi2rfAT8jIHl+5lxpmx
	 eSUDT3TzX9bAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C2C61374;
	Tue,  2 Dec 2025 21:16:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DBC8E4
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F92983E39
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:16:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJaxn3JXGv0K for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:16:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0932383E34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0932383E34
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0932383E34
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:16:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A5D532003C1;
 Tue,  2 Dec 2025 22:16:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 02 Dec 2025 22:16:26 +0100
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 22:16:26 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Peter Seiderer <ps.report@gmx.net>
In-Reply-To: <20251202063031.493123-1-bernd@kuhls.net>
References: <20251202063031.493123-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0497659688b6b996e14c35a752bc7b66@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764710188;
 bh=pZs8isi5+D2g3ErWjFIwSVgqJrmNhEPTkOzbzI2lk+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WfpsFR+OXYgWvp86HVlwkcY4tJHxwpgC1mDSrMiQk43y761bw26e+0moaqLtQZosP
 fSo8f5pxx4uoSvouKMhN3Cfp7BLPlC5iQVik8c+eWy9ySnb6jX2qtMgmZ7OwYFhyGx
 +hHOKpojozyu/osCpffUzWodT6O+FhnB7aKPew6hM3sMU+zeIzgVVX19hT3aAxtySF
 7Hx/jkkiKnv26j/Ho6uNurrsUuBqI34QKNSm2qFDnylLN5eOKrcDmQgVXMxiQua1pi
 3Z3EpzYkZIzwncNtPrPr4d8hiHjITooZvuV7ju1WRCc7jJjxq7R4ezFu56387LG62N
 /RMbJRw/yd09Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WfpsFR+O
Subject: Re: [Buildroot] [PATCH/next 1/1] package/speechd: bump version to
 0.12.1
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

On 02/12/2025 07:30, Bernd Kuhls wrote:
> Release notes: https://github.com/brailcom/speechd/blob/0.12.1/NEWS
> 
> Added configure option to disable newly added pipewire support.
> 
> Fixes:
> https://autobuild.buildroot.net/results/271/271e44f5ce9be0a2e16dfa2d9ee65701422a49c5/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
