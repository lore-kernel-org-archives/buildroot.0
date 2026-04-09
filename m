Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD85F364BA
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 21:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B7160907;
	Thu,  9 Apr 2026 21:29:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVGWnGwcgAdT; Thu,  9 Apr 2026 21:29:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D2160A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775770171;
	bh=m5wot2zQFIJdZDWjWJSuhqn6rsmQXQIc0PoJb5cUciA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l9zs5VmoWn5TSVDs9nwwsg/x68KOCwnxFmLFIAAu9MpEP3j6IhtanOZFkGVtqcmoX
	 AskEhFWyMjXJEuN1G89nLmlYU2PUi7bki1y3c2xnSrzStAKn35WtSnx0DoMTXRSKzz
	 KNLiCNTmYEByhLE+karwvcMfMyo6gmzagciry4Q3YbUU7l/8rv8wYtNOYjHKVc2jsK
	 DaZovHQZBAeXkYfqxE8Nmnq5MQ1TzZykzSQjOpdWP+A9KfO/fmiCkdftrWrnw5joe+
	 wpHYlol63BYG1hMDnnwaNGTEBIkrKxiIHmn2VpBJuVDlji7P2htBwxhNg5/AlPUbs+
	 JMtFBPCdS+D3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D2160A4D;
	Thu,  9 Apr 2026 21:29:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80E231F6
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 21:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 724F460907
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 21:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sVguwnTC7siM for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 21:29:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A06DE6089D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A06DE6089D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A06DE6089D
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 21:29:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 230A4B00535;
 Thu,  9 Apr 2026 23:29:24 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 23:29:24 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 23:29:24 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>
In-Reply-To: <20260408171717.3533474-1-bernd@kuhls.net>
References: <20260408171717.3533474-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5ca4535252a18b975f884068b0f447bf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775770166;
 bh=5LPgRlbTDdG2RG9pdZLbz+Lr/Ei6TSugqlWWRolzgz8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S2MmDXGmbZH4CAbWWV1vMeMNEPoiQMfxBjae0HmOY6p1fibNVpaROrIf2cVfPnfAq
 4tf+EEdz1TKSwBKNwItuzjNsTbOc7q+I6DNx2rIxyh4JhbLGfpoF9X7E9TBvWUjyGZ
 vCU+y+RM9YfpXIbtLjGcGI4q6F0cLH89a2t+9irKuTu6CPuR8k/XV6x/wTcPFqtgpn
 //kYuM5ZTfVwJpVBjiQ6J1fZM9kSWXJu4+MPPvpKFsm/qM394D3+e3i3Pj1bzin0To
 2RM7qROuryYEiZroMh7omluf5A+TUOOQMsXBfX7SPzreLLikZ+n1VY57BhKeBLNfxi
 u4NfS9tBmAoPg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S2MmDXGm
Subject: Re: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to
 22.1.3
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

On 08/04/2026 19:17, Bernd Kuhls wrote:
> https://discourse.llvm.org/t/llvm-22-1-3-released/90467
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
