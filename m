Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB8DC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 20:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27AD1606B3;
	Wed, 16 Sep 2026 20:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCf9Gckm1r45; Wed, 16 Sep 2026 20:38:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4B9D36062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789591100;
	b=BJG0VS5xU5P7Q61yMUaZpdQTSyqDMbNPfxP+YbtZeA28YQWKxvJ4sPWs2DSiq55XGBQq
	 cfoHP1sgPQaqeWe03XfuB+rm6tmwjEENjD8EXbJdncRq+ruVem546y9qyrfGUy+y3Pm8b
	 /7TF8P9duVEVWuPS2cexhHCGK6YdE+PUZbBpytiUtWGIQK9fbccug0y7lnW7ZGSIncBoZ
	 BY9Ac/T+Rkhr1uKXAY+LUJYRFOSM3BapYIjIRAQuIz6ctY9tJ4Z6FnYiddxRg+3+5554c
	 q1ln5rJ8hvB2Mc3t+u5bP48SXCK+D4ZDJUfZX5wzTOyH79/YFbaqtaUsDA+6uWojtjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789591100;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QjWUb7bfF/eLDT6BPHQAL6lxqRdWcSCmQ6/fqP96IA8=;
	b=SvgFNhqFiWLXl/u7T43/OgmgvI6qC6GpcqihYkghw8k8kOskdmbyMjMvWgtvCcEZVDnF
	 0MxDtTBMJypM6xpiqapxUUZRL56ITNbjwTYJVG88giHEP0TWxRXlVXNekvC9jsGQX0u4D
	 3KA2V2/a6nBVtcuWHZakmMfqZHMZ1VlsuS7LvpcOVDNG5mMPj+kwylxXWkPdZNv1RNRMc
	 H2XrU2JCv3C7QdlrYBZoOtvt0ikeG19UnS14O0VfiP+xsvBavzRYoHJXLzEGeaY9qCAx0
	 r+Ekmf4RQUXrSRABGaVjqNT2MWRxo9d7GX44YiVRwS4DyTpbJDNUJKKexTIf3k+xbCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789591100;
	bh=QjWUb7bfF/eLDT6BPHQAL6lxqRdWcSCmQ6/fqP96IA8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Tn1iCMI6pCObkBNFnCXLJq1z4gE6fY7FbA/+DxuhVN+O8b+deLufn4r1PulETXrS4
	 4oRvzLW3anjeEMq5+DyW39SnP6BBC4ESwZAUCNNdA6EL4dTfbLJw/TTTcMgk7GelTh
	 Tm+b0jGZulaBcOUSmhiNXER0fG8ptCiTeSQogZ6eEcH72GAdtQbGCConBn5UDWi1An
	 HK6gFmXOjRFt29g7Z8rZm7UtJzVndsNPq+XJA8XXFUfmHMBfKEOK3dJlUf7MAM7buR
	 /l/XggwVe5I9leNWdCfsJ7bMLwn595+i2LJUOo9CUPsihBL+WBgJHPfOaIuBvnCOXQ
	 K98V4PJHMXPUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B9D36062D;
	Wed, 16 Sep 2026 20:38:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08ABD24D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2B826062D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:38:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPGvKeMlnysV for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 20:38:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D91226061D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789591098;
 b=pPAkBb8K8JNul/9+c299htB0OZw1lonDZjB66peJnGEcGdSNMQMoX+CMDEQf0ALznasv
 obB2lHgxVllxXHawYG8FwfYmr0szwd2MZtoat7kB10A32PAve9ZHRZbfb9Lnv+k+pGJbs
 jn5Gu6bjCuxiUSpUgimgHeU9wuFI+9oRzhxMPfEz5uvw5dWvlZm5Alk/L2hwz+wsIp6lC
 B3EG4pui7SUku42gZWrCK24SYeOdRlZ9GWaTadJ2+uR1Z2ReCMwJofLXK/uBQpt7Bpbdc
 Qe5Ofz/oHKQwrn0R0GtJINlxpLr8HK8LRFj1Xwg0E3tItEdZmcor7grfhZmvQd/U4ag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789591098;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Vld2CXziPkup7RYA6eUV5qS+cjQH9vA/wHm9LoziMEA=;
 b=b6FwYkwSHQUOI2r1VXYdlHrDHMjGLCtI0yy8f+OQnBOSyvTnMyKi51hDQOw4YlF1iaaG
 CXTkEzo/0E0KK4+shb0znXC0HKuIxZqjq87BSlcBp7g452wOnCS8TJ/Z0N4OLzhkmWJEM
 MG40lzrwEOSubJQ+anpUt0iEhMOUdJrU/eHRoJijfgaywxbxjL7kYxcFxeBNC2D+BWzY6
 nrK13mMQfIdqYYpziXqHY63c24s1edoDBEgi0WibVrblYhtw9kBRfm3F9exn8UpIrB+dP
 vUjn2efVoJrCquHpetvTZxw7nMUBI4kZHCsJp8CVfuVZZfL9UlXDLiQqH1U384v5qOg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=tW6j+JCp; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D91226061D
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 20:38:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EBED1C5CD6B;
 Wed, 16 Sep 2026 20:38:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D042E60337;
 Wed, 16 Sep 2026 20:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 47BC111C7B062; 
 Wed, 16 Sep 2026 22:38:09 +0200 (CEST)
Date: Wed, 16 Sep 2026 22:38:08 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <aqr90eN7Am0CSVbF@windsurf>
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
 <20260618065137.3987932-2-james.hilliard1@gmail.com>
 <aqhkbaMkRynOxfoT@windsurf>
 <CADvTj4qjk_fMqf4M8Mq4C=w34GuL4e8uYBFsUSx2grCC2Dukdw@mail.gmail.com>
 <aqpraYAviEpbIuPJ@windsurf>
 <CADvTj4rPA8urFEnyVqdHwB8ZcfiPoPUG3tcxCmCmGpZxaNTb6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rPA8urFEnyVqdHwB8ZcfiPoPUG3tcxCmCmGpZxaNTb6w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Sep 16, 2026 at 10:56:35AM -0600, James Hilliard wrote:

> >   $(2)_DOWNLOAD_DEPENDENCIES += $(BR2_COREUTILS_HOST_DEPENDENCY)
> 
> That dependency provides b2sum -l 256, which support/download/check-hash
> uses to verify the downloaded archive. I added it following Yann's
> review about supporting hosts with older coreutils.

But then that doesn't work either, because it only adds
$(BR2_COREUTILS_HOST_DEPENDENCY) in DOWNLOAD_DEPENDENCIES for python
packages that don't specify a _SITE variable.

But the blake2 hash support is completely unrelated to Python: any
other package could use it, not necessarily a Python package. Or could
be a Python package that specifies _SITE explicitly.

> Resolving _SITE only uses awk to read the digest already recorded in
> .hash and format it into the PyPI URL. It does not calculate a hash or
> invoke b2sum, so it does not require host-coreutils to be built.

Indeed, but see above :-)

(Also, this line adding $(BR2_COREUTILS_HOST_DEPENDENCY) the
dependencies would definitely need a comment)

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
