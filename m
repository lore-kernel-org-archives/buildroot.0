Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F13E92714
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF90A607C7;
	Sat, 27 Dec 2025 15:57:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FGQyI92X8YK; Sat, 27 Dec 2025 15:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09FD9606D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766851066;
	bh=/DklCvCgnseBd3Ti1PpRaU5sMhWap+ryZfSSmPl8DfA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hXU9tGtkvta70pE4cXUQPtUu86Hwl5eje19wuj76Ue7XpbDZh1rMw2Ppcd4SgpM83
	 Lok6hU3Rnysb7LHPcmxoZb4UVd7rzXWDBodn7heMi4SfdpKfWXLf6d4AfqEL7BHy8T
	 Qn1NxcDyFX6ycDsEswZAQKAxMzw1iZKjsbenMymDIbxYpBoMGrFWsvKORiR8sQuPDY
	 OG8iIGCePPeIgIPmLQYHlAeHGkPyEl1qw4IjREvBmwlNYNUQLX4c9TQPfYgPZpKAtu
	 kT1OgE00dUrJPJOSwpFwV9AlifenzeHYSB5ERnKNkeMIZKMvYnBbHmgXetZ9Y1jFk7
	 44MbW0kyIq2Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09FD9606D0;
	Sat, 27 Dec 2025 15:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E3D6D8
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 445C480D47
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3Q2_O5V7OQ8 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:57:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7402280D43
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7402280D43
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7402280D43
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:57:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 07F30C1D1A5;
 Sat, 27 Dec 2025 15:57:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33D3A60725;
 Sat, 27 Dec 2025 15:57:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 072CA11978559; Sat, 27 Dec 2025 16:57:39 +0100 (CET)
Date: Sat, 27 Dec 2025 16:57:39 +0100
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20251227165739.031d2a96@windsurf>
In-Reply-To: <20251204190609.3846747-1-buildroot@bubu1.eu>
References: <20251204190609.3846747-1-buildroot@bubu1.eu>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766851060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Vtx9obUzwwHGonbyrn8Hmmcy83yUSV3FwMmYKDJl2rA=;
 b=0kmKMftXdW5fcyzXFapwVR+9jqbuNUOG5GvhO4jdq2ZmEisUKjyFJceyi+M0mQ+cra+BXE
 uOLyxQRdOp4AM7y32rbNLZPQjpWeetDhv9imGGX4ScFyqHNU5JNrldM1y5CfDrcqywoZ0k
 DNDSMA713QbxynTWKE7swkCRgHJAIuIiZqU9/R1Cep+n7tRfH46MPiOSN42x8nMjRPUXS3
 GT8+M6deJ02WSTfeSDYReB5IXpLNIa5ExS/JCTp+X8emSnCnnjXNhDe8ypIkkh18JGiVg/
 bdj1GQDYGyjpbfQlRluVBnv+iT4vXWQw42gKSQGVMrKcwrJAAP+Zw/Spk8Nt8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=0kmKMftX
Subject: Re: [Buildroot] [PATCH] package/python-can: remove msgpack
 dependency
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

On Thu,  4 Dec 2025 20:06:09 +0100
Marcus Hoffmann via buildroot <buildroot@buildroot.org> wrote:

> Dependency was made optional in 4.6.0 release here:
> https://github.com/hardbyte/python-can/commit/6058ab9dfe8b3ba5d23cbff670c0fe767147390a
> 
> python-can has a lot of optional dependencies, most of which are not
> represented in buildroot. As msgpack is used for the virtual multicast
> udp can interface[1], which does seem like a bit of a niche usecase,
> just drop the mandatory dependency without introducing a user-visible
> config option to enable it.
> 
> [1] https://python-can.readthedocs.io/en/4.0.0/interfaces/udp_multicast.html
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  package/python-can/Config.in | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
