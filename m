Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2C2FA374B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DA4160843;
	Fri,  2 Jan 2026 15:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd3OM9SS-p03; Fri,  2 Jan 2026 15:24:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 249E360808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767367469;
	bh=XSV8GgyV5sib+d73do05OnM/98skKQY/Zkn9d/Y0zR4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j+WoQWH7bwqET2BRtav4IPsQo6EtluA65cY3Yjv1W4kmeSIQSKzSdiKmFdOjwd5Y8
	 GEMUR/Yu32yKxuzCgedk6Eh2GNi9naHsh8ZaWtOHkW8abibZpCc5NCKyJkvgp5opa8
	 HcrS+FS6kdZf6GnwJd4AypiNwxK8QU3Twh5dOCFEDD/8WlG7N+3GR42LgNh2OvVfNN
	 Crt9W3eDCgyvqYqe6FRiuBX2VpH3gGWlj7KFq+dFEaEiG0aXPjXcnRielSqMi02TdW
	 pfLlU+a5ultUSHPaostwwgAudhJIvhl1hRN+H6Q6eayd4f0rOOXmenRXLGUehBwQHf
	 4bEHsaKj2/eKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 249E360808;
	Fri,  2 Jan 2026 15:24:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CB7119D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 733F860808
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_BMQEOFb5sk for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:24:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2131607FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2131607FD
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2131607FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:24:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 54056C1C3B6;
 Fri,  2 Jan 2026 15:23:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 18984606C7;
 Fri,  2 Jan 2026 15:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E02AC113B072F; Fri,  2 Jan 2026 16:24:21 +0100 (CET)
Date: Fri, 2 Jan 2026 16:24:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>
Message-ID: <20260102162421.163e22f1@windsurf>
In-Reply-To: <20260102145407.917492-1-bernd@kuhls.net>
References: <20260102145407.917492-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767367462; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=KYE9xo5kaLoqK+GupSqSs3GeuYCKduYGcAiTi0+eEmI=;
 b=jAHQn+rgEIQesnCPfat0cpFDDTdL+hWRE0J+PfFw4kc9AQFU+r9MyPWuyIVmokneIUBAiE
 VFyLUklBeIzTIJrYSt5sKPv0loAunnnVV6byCm8p4p0gqIhSYKoCDboJfEqDgH6ZX+q7tW
 bksxC0g1hSiv5vi6rhcuOnedqru62GmzgBKpPDmlCklE75R8TJsSqzQfBb5LDbVW4cWvZD
 a/kBjddic1ucCzwEyZwrluVnMPw0gVR+ykT+zf106vqH+UtxEuOHQ8yEHrc9cE7Sfml1nI
 UGmj8efpGcXbDOjNwyqZpvbQA3zLK2VQOWZJ8XIi36lmSKDTeEiDgo1hcH/TOg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=jAHQn+rg
Subject: Re: [Buildroot] [PATCH 1/2] package/atf: update project URL
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

On Fri,  2 Jan 2026 15:54:06 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> The old URL redirects to the new URL.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> v2: initial revision

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
