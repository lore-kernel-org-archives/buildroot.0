Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD11CFA1FD9
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 16:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EFF88097B;
	Wed, 22 Apr 2026 16:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rrz6eBeQGrLY; Wed, 22 Apr 2026 16:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A110808A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776876616;
	bh=/MgLR+dfXhJbxe1MbR0fQc10+yhyX3HD5AsCHERWdxo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RS2JnQlfdEN3BP/s7oE/zGmxiiVBNKoo4bAd2cWYoDHrn0vrJP7iGHTdVvOgUMBLh
	 npABmLMAk++SlJj0Bzk930Whp2ewwkZ6ilSz6576WtiFC5tf/a/gzkEuVplp8zx9qO
	 oGWL4Vk0LPqocfSbIlftEpRBpc/4+n40BVNPxM33Z/Y1x1FGYjbGMPluoJJbvzSilg
	 dKfkVm+C830OxaPMl8y1M5HOHKXjUBJGzLLcUQvOb9v6cNHQC14qcIMs5OrWLd/cFJ
	 NT/qWZIjkZjpQqz0Ju4N5kSxLMwu/5Exo/TJrRjCsRniOg5bi5MbxoWEK5eLPOQP7y
	 b9Bm4+HmB4/fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A110808A2;
	Wed, 22 Apr 2026 16:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 818A8257
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D87808A1
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfCHHbEacrcC for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 16:50:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FEA280756
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FEA280756
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FEA280756
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:50:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 98D5913F8B8;
 Wed, 22 Apr 2026 18:50:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Apr 2026 18:50:08 +0200
MIME-Version: 1.0
Date: Wed, 22 Apr 2026 18:50:08 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260422135456.3109434-1-titouan.christophe@mind.be>
References: <20260422135456.3109434-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <1c53d27fa9a08d23111c87bb1b28097c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776876610;
 bh=TvifoKXedrjtHgsGD8dKegEtPk0Vaa57+BAsNhtSOSo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nitrbgv8mbE54s3mO9N175VmMS9ecYaRZtJMQKIJPNfzBbzT3KeFaAwKJQnIJ9uht
 xPh8sBbUTpqxLMCW3w+34lmhYszymtAiJlc8rD2t1eVotDEk5E0zYILDiY3n5nrz19
 24xGZexXWxD4mDs6voObFN7+5rVLRpkWZ0fi8dLj4J91HeINr9dssmPMK3SaLfVJVN
 dy+qtanCXCE79h/bAkBwIcXGvi8XEsAb0qKnf5j63D5u9yi71vJPNkE66pHsGkp3Ud
 DdCE42/GT5ai6Y20IxKf2D2FdESAIkhdtgqQMmbBQuBFvfjWBr9++xtg4ELJVVL75F
 k5mQ9b+itsDLQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nitrbgv8
Subject: Re: [Buildroot] [PATCH] package/log4cxx: security bump to v1.7.0
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

On 22/04/2026 15:54, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerability:
> - CVE-2026-40023:
>     Apache Log4cxx's  XMLLayout 
> https://logging.apache.org/log4cxx/1.7.0/c
>     lasslog4cxx_1_1xml_1_1XMLLayout.html , in versions before 1.7.0, 
> fails
>     to sanitize characters forbidden by the  XML 1.0 specification
>     https://www.w3.org/TR/xml/#charsets  in log messages, NDC, and MDC
>     property keys and values, producing invalid XML output. Conforming 
> XML
>     parsers must reject such documents with a fatal error, which may 
> cause
>     downstream log processing systems to drop or fail to index affected
>     records.  An attacker who can influence logged data can exploit 
> this
>     to suppress individual log records, impairing audit trails and
>     detection of malicious activity.  Users are advised to upgrade to
>     Apache Log4cxx 1.7.0, which fixes this issue.
>     https://www.cve.org/CVERecord?id=CVE-2026-40023
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
