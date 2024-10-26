Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AE5D10BFB
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B775C403D5;
	Sat, 26 Oct 2024 20:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z3FAwmFgltvv; Sat, 26 Oct 2024 20:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C3A6403DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C3A6403DA;
	Sat, 26 Oct 2024 20:05:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 247A35C53
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0562D40166
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a3-J7t1D1jKL for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:05:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74D2F40003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74D2F40003
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74D2F40003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:05:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7DF9E0002;
 Sat, 26 Oct 2024 20:05:47 +0000 (UTC)
Date: Sat, 26 Oct 2024 22:05:46 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241026220546.2bc2fb22@windsurf>
In-Reply-To: <20241026172741.451347-1-ju.o@free.fr>
References: <20241026172741.451347-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729973148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjPkNcHRntDJZBv7kn65DoXZtal0xlNX4EvH0owCnv4=;
 b=D8vSVHc+2q1/q78ZecIBLXFm1slQ0Hw+YFvCWdXSvjCNKVJTZKjdfzrw1fGXsVvwrSpE1G
 HaLJzLt176Z0u6Ue/aMphWC3ZqSFFIvL6QE+qCOKtNr4n771iekVlNGk6miK3EXGBrEoPM
 IE+ODk7aoPLELqUk92WYPt6mltMJpWmlVg4BzsOLDvBFsqaxmdUc187ttbrcowHWlgAnAZ
 sShMcD2jdMChCHaXwd8nrVuGup1z1wx8uWi0R/aDUndvKzkMwpwGH3OT6eyV/pljZfH2Wc
 k0pKRCdNTsJTiWjUCJZcdFVooNQDtbTSkKGex1NCAwNiJT7CpCc5nbN6Ejwepg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=D8vSVHc+
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyqt5-sip: bump version
 to 12.15.0
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

On Sat, 26 Oct 2024 19:27:41 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The versioning scheme of this package is not trivial: the PyQt5-sip
> version number does not corresponds to the actual version tag name in
> its Python-SIP source repository. For that reason, this commit adds a
> comment explaining this peculiar mapping. This comment will help, in
> future maintenance tasks.
> 
> To better understand the upstream changes in this package explained in
> this commit log, it is worth mentioning that:
> - PyQt5-sip 12.13.0 was generated with Python-SIP 6.7.12, and
> - PyQt5-sip 12.15.0 was generated with Python-SIP 6.8.6.
> 
> The package license has changed to BSD-2-Clause, in upstream commits:
> https://github.com/Python-SIP/sip/commit/0ba3b233ec8ed7f22f2f2f950b64f61b50ddfc00
> https://github.com/Python-SIP/sip/commit/4dde1491f7b8ace15833cffb86bee82d60683968
> https://github.com/Python-SIP/sip/commit/f32039b07c47280039dcdcd0f8a2b1323fda912e
> 
> This commit updates the _LICENSE and _LICENSE_FILES macro
> accordingly. The license hash file is also updated. While at it, this
> commit also adds the MD5 hash published upstream.
> 
> This commit also introduces minor improvements to better follow
> Buildroot package conventions:
> - the .mk file header is changed to lower case,
> - hash file comments are updated,
> - the locally calculated license file hash is changed from MD5 to
>   SHA256.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  .../python-pyqt5-sip/python-pyqt5-sip.hash    | 11 +++++-----
>  package/python-pyqt5-sip/python-pyqt5-sip.mk  | 20 ++++++++++++++-----
>  2 files changed, 20 insertions(+), 11 deletions(-)

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
