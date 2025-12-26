Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395A8E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 605FB606F6;
	Fri, 26 Dec 2025 20:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9JfLfCOGZOp; Fri, 26 Dec 2025 20:07:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5837E6065E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766779662;
	bh=AUeybNOwIkS1jKzT2OVOLd9S6GP07KBAsErRHp1RKIY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Pl74yuXPiQjE5kQAFcrna+esAKw2Md+0BreKFQCbeNg4zATCF2+ZG+EJMSew/yzu6
	 yJOzy7RKrJ6XPB0PZSoP87KS9H7H8t/7iM1uh+Xi/m3fwfxfg8Fvhw8RJHDFX72Rl6
	 zIf4+H7TnSTbYiAhG/qTYIXuOBmw7Hwc//q0tlMFXPsXY4swBxkzxtmhETk/XAsjc/
	 EYeSDS689TGnrUxUq+DbQoercKzjjc8mESwJ20JQ7y1Tgd74VwXEU1lI8ywQGJmISq
	 ojDrpqxHxX3ybPfX1/uTvTTjTt2UC+9I83z2q3/fkeAlSYSMrVEpjqc7u/m4KttNCC
	 xuq5ZyeoCJGWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5837E6065E;
	Fri, 26 Dec 2025 20:07:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 218EAEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 127B56065E
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GlX1scyY_uC for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:07:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3A37E605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A37E605F0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3A37E605F0
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7D9AF13F88F;
 Fri, 26 Dec 2025 21:07:34 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 26 Dec 2025 21:07:34 +0100
MIME-Version: 1.0
Date: Fri, 26 Dec 2025 21:07:34 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, vjardin@free.fr
In-Reply-To: <20251222215636.975668-5-maxime@leroys.fr>
References: <20251222215636.975668-1-maxime@leroys.fr>
 <20251222215636.975668-5-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <51391af1196e5af39c588eadc91df746@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766779656;
 bh=N2BdsTRiWRzTH8W3DNv4DI03GUIozUJ6k/DYbBgmVQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yoapv8izmQzDYCetyN9rzjpdXheEcS2VRNZoMX/A5SscmAo3Fzaatlu8NUEZTb+b5
 eU6rOXLKbkG4ZaY9WpfrEVKFmuAD49JZsM9WGkEsFVED+9mwF4K7Z8zWH8pNGQ3avG
 ARLysQpb7UfyyMAVa4LKildCzKArfgMzyhfdd+HshbfF/J0MqqEf/30cvbFXHNMAU+
 L6ObR+Qdc6k76lyeBvm7RNPujCdP6XZ8KkCgQ3IO6VPsfFyoy24+5Ki2naPhNgDGG0
 tZn4B3dIZdquF2LDSl6vIWOwbY8gHMLmamWrE5Dj2L8E7udMCAy5TVE5hxcbsCNoCb
 yhI1C8JoJZKTw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yoapv8iz
Subject: Re: [Buildroot] [PATCH 4/7] package/libecoli: bump version to 0.10.1
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

On 22/12/2025 22:56, Maxime Leroy wrote:
> This new version is required to compile grout v0.14.2.
> 
> See the release note of the new versions:
> https://github.com/rjarry/libecoli/releases/tag/v0.10.1
> https://github.com/rjarry/libecoli/releases/tag/v0.10.0
> https://github.com/rjarry/libecoli/releases/tag/v0.9.1
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
