Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF9BC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 17:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A8FF60D5B;
	Fri, 18 Sep 2026 17:53:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkbiOsJFiH0p; Fri, 18 Sep 2026 17:53:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99E8160D78
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789754019;
	b=FRC4w1RnRId5VG85jfWvRbBRWuoHtYf0SsN3uj9pESN8SCJeW6R2zHWM85YeiOPQRwpr
	 Ngp8lP5C4ukWLxQn6t32acRE7hCz45N2QuZkR0vjlrq48ynFDIWE5zVJyth5CDJXXwGEl
	 7iCKBpUsDZm7iGvYVOpRBOwzWkOkG6dJZXpCm67krbjmyYzUiOzu2LXNTDR/9o5W4t1jr
	 F9AO31anAKRN4Ql15uq0kMqqHpyCbtDYnv/VkZQw3U9oC0Qv2ihwHN9s/0lvye3Do1r+X
	 9E+V84MtUilqHw/UU5WlwrK1md6tCAnoEn/U+DQVJmdZ5nI5vSPp35+V9yh5bZpXaVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789754019;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Zk+tQ1BHW1Aesc7hkDA9l1Nk6e0enFGgt3VmrsuZTBM=;
	b=fcFQYMUq84bnf6c3AYMvRHIMLCCuZaSTgSaWe+YnIBbjTPDuHGBNuwrGPOf2CXqOUoip
	 IrLaTd2wPqxRKYfDGs+bTS68sdS8O/gLiSJLfxnyYZrjiec4G9+IVA3NgCC3KiE8/UqUc
	 DeHzTDRuJcgaSFqRK8SuhOJyMxs0T5UiJBiQmRsQgc/OeJWtTpneY0mNlcCEsQbatb25l
	 97SPGrrQhi5KqO7FNRO9k/D+LchnDJZMqqYHjdreMAsNs0DJYYAYvWfJ4J2ApUM8pfSj0
	 LB8ho0e5C/dfrnj15FgGHAWGkkR3rJgxc0cs93VIqeAbJUQGx61+Bzq0dY+V3alUtkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789754019;
	bh=Zk+tQ1BHW1Aesc7hkDA9l1Nk6e0enFGgt3VmrsuZTBM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dEZXNy3y7Po2yc9/QkVcICTrUgFBA2UYht0uHuAqqIKkjI7Fc65rHIcFTQxab5mI0
	 jUlWCwRXVacUIB0sViMO/pZyi5unBRy6BwxJE/YnYay+gMqsNyuePHRqOquWKIlEbB
	 W5ld/03ZRkERAFEAnfl4l5MaN2S/jPlpS4nUkiab7B20fVUYZxsc+MAl1lV4cE6C36
	 SX5pQ2FQAzJYtZx9IbmE8gY07atByk7Is//0GYYvIpvov5RJL+6T8nEC61vDZwDBJa
	 btdpg9EkqRwqQnim/jgGA2b3AoAInMsxgjwdP3/1Gt6Ok7y5rTl4Il1YwAEv7m7MzY
	 PPTKr++5BYDLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99E8160D78;
	Fri, 18 Sep 2026 17:53:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEAE0224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A500C812FF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cue6v3-8QlHi for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 17:53:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8E74C81306
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789754017;
 b=AU3HX042ZL+Lbql82jJycyF48NUMm2jMro4PKDZu+4y7cvbgBPK/48UcM++3wXA9ensE
 2UF5Nq3aAfA/P42JcmnFFIHYkIn+HsfptJSbN+ZEU+Gp7XqaU4MfTJR4MVAIan2Gawpiz
 LDY6BKBYF4BasLgLvvCvELQQJBo8FLVLe5erDsXD54UttIvGB1UVQ3pDQJFxPVfyM8mR8
 Cv5Td9Y8LByD88/MIrX0vS45sshCsmRaYqh0SgrZnIpgDib82HP8oXIIJeS/0479CBigA
 xd7J86zXYlTKexdb+NrVmBrhYfwBLgM42JkBQPSy0QBjWmtl+HvMQoNy+Bq9pDEkWgg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789754017;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=nEOl0nhTpjfdk0K9NVL4KVasnK1tsGHaogf2AX/DAdQ=;
 b=TToLHav4VOmTP86CKDf/SQMAmlziKN45+bLsun1a+YVLA3xVbzFn2pzClVlk4wttLn1l
 UjQpDpqcun3iKsjUlL/d8ozZuf35QDRnWjeyrJ66sUCMEfoyXPBMDZDdx4fjdAdetZqYD
 S9rPNNfHVOKf5FKtxig7fRUsO6xdd/RzWQELV1LxNZ4du6ZeeaNX4oec9y+G2Ko9rBXGu
 /OzwXFqX2tjXo1gQqvSJ8AEsKxMsX/B6Asbj5HraA+v+tr+JcL8EnDJ2wBZwsOW3mkgSV
 g2JTff1NKFqW/46UhBWpCPo04WThagWHNo41d8v42T0GnH7PPW5gz58/BF+WcXUJ5Dw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=EtAiD6ZP; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E74C81306
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 17:53:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 994922003C8;
 Fri, 18 Sep 2026 19:53:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 19:53:33 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 19:53:33 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260917200814.1721973-1-thomas@devoogdt.com>
References: <20260917200814.1721973-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <61646b5b0c57b8731a9c67f1ccfd5eea@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/lighttpd: bump to 1.4.85
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

On 17/09/2026 22:08, Thomas Devoogdt wrote:
> See here for changes:
> https://www.lighttpd.net/2026/07/08/1.4.85/
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
