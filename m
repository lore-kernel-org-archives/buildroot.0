Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C523D26D9B
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C95C60F38;
	Fri,  9 Jan 2026 20:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FrSw3YywT-1c; Fri,  9 Jan 2026 20:52:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8631C60F10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767991920;
	bh=UqrNWIFVS2SGd5tPuSWbbVE+4hU4W0Z2cdEGNBPzSrI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KtzUkzhG82yOKqrOQN7EFAyXMFP2UFNK7qeez2/TOkkGAp3pkskaRy2lAgivweNbl
	 PyLbAeLc3/4HbGAIzrwDGNPTQJIbdyB+Pr3GNwL/fDX1wgG5CqcTT3HSPOAl0g3x3G
	 hSVTzjpGVNXny+CFa3yIuRwzDGAVcO0zI/UPC5yPoKUXRFpik+GqpEnt22ffGH1GWW
	 NuZeU3tRUvW8Y+l+rvwVKwMWNPXdDDU6/AYaOqlLTU8dDfcxEsDqc/UbWdwLv4eHKx
	 MNdCRcVE7MA1uX/tZQgz6kF+8T6UDZivMXql2pHMoV/Ngu7TGTxc0TdoopFfIACoz1
	 ODZN0IzHhpJig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8631C60F10;
	Fri,  9 Jan 2026 20:52:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6364E12E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A5A040109
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 20:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRmD9SHu8LnJ for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 20:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C12140105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C12140105
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C12140105
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 20:51:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id A46FC13F86E;
 Fri,  9 Jan 2026 21:51:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 Jan 2026 21:51:51 +0100
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 21:51:51 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260109191950.2245931-1-dario.binacchi@amarulasolutions.com>
References: <20260109191950.2245931-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <d9da5cf044ec6f632e5ec69de420c74b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767991915;
 bh=WzHXLLwbg+AawyyQ0zGcSBOK6nCQx4xGG5m8n4lgZU4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SIdpPFdufX5Y5adJ2UUeaGU9szxH4rH3wh51fEJUsjGMsYdUZLjwtz69mdT8SiSjt
 d2+anMNXHsX9dcdaQMxY1bMritvVdmwNDaxn89SneJMvk71n3GFoYjwzDkAcZep9Qy
 3YOE62zKTsYPhz4C4fkWCRlm58CdZVUYpfOgo7jnCgQEXzlIw1Uzzxq2pp/Jim62S7
 HfiXH6OFZVXbmMyd4zPjrXrIp8XZpfRdU7+48fcaUaB9ELPEKCZdhGCnZ7Sx0k6ptr
 N49lYXSRmtC36MY42DH8rs8cZt/Ubjss2NILEAnR3PpruANg0DcdOpCS7iZ6j2NKwl
 rI/XVfBPd7x7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SIdpPFdu
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.197
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

On 09/01/2026 20:19, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.197 and, for the SD
> configuration, also updates U-Boot to version 2026.01.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
