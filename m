Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED43D10854A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD01C60FB4;
	Sat, 14 Mar 2026 20:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WS9XhY0LehXL; Sat, 14 Mar 2026 20:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0159D60F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773521194;
	bh=q9NU9Jf5l3LzolJl9G4rSr0cOLgvA3Jb0BVKMPJxXxs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TZLwYN8O2iDGkbe93K+fCglz3c9VsJOWx6El8xp6ykLvzNxJxUlRAzSC/e2kjACMz
	 Z9ro/h8f5+OlLYhFJ5wm6N6CTaxaSqImTwj7ofdYajTd49zCJekEHip6QOIXu1WBFT
	 qqHh/+L01iGYJwymCD0LT2F7hlPRfVCEd9B8GJOSRp011n9J9uZZRKHv4kUcuf+Txs
	 A6zr8Hk9if5Cn5BSUcrEr+y0UU71KoYPQB0nQBY8To1OXTlQ8zvArIljmb5YFuoUCS
	 FM0Fq2trgRr0+6+qyECXRi+DYf6bPecNwJWVMBuG8lFudg3XBx6H3abyaWOI7EXu+D
	 h6qfBU0/G4b8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0159D60F8B;
	Sat, 14 Mar 2026 20:46:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A325118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BFA3412A4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejTfVoFSCp4E for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4E694412A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E694412A1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4E694412A1
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E478E5FFA3;
 Sat, 14 Mar 2026 21:46:27 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Mar 2026 21:46:27 +0100
MIME-Version: 1.0
Date: Sat, 14 Mar 2026 21:46:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260314185101.3226151-1-bernd@kuhls.net>
References: <20260314185101.3226151-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <7107d21d1fff16e08ced1fd9b5b45e47@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773521189;
 bh=ns9Xx2lC4hnNvrj/8AkoQU7dO0K4sUDdWbjP8M0y3tY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b+4Uf/Sbe+WVETs64BXIAFGWq/9xUf8ykniHTd2y8883kawTCbJgWF2tpHBqY2WPc
 D9/DUMhwxw9sflDCVWHSdUqgk3CYE+eQC1TjNycF1uTJKsSy+kz6kKNsrnKw/hSmSK
 wd6KqjnmednvaCBLFph1h4KVQGk+R9kmCqXfvOHV3VGJ7Xb+OX2G9/WUgevGAaeTSl
 6wInGGfHLG1yvo08rCeMvXzP2OcMZGA9YMYq10ecy5/YaYIuu/jdBDJlgaJG5KIk70
 9qkicDfwtM/jeBgkGJFSMqKJ7NZZ5NGMhlbCGISvUfrVjaAG647ctGD+aKD2RYcHFx
 jQieZNyn+KGQQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b+4Uf/Sb
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: bump version to 0.83
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

On 14/03/2026 19:51, Bernd Kuhls wrote:
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog?h=0.83
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
