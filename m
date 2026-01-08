Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E495D185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5379382B3E;
	Thu,  8 Jan 2026 11:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKZ_bZjFvmnU; Thu,  8 Jan 2026 11:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F36780F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870713;
	bh=BAIaaVzfajPV/6rikOdc+LrUM4kEqwR9/RQYvBxzqIc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OeCdOQSbBDdtf3ueqDSUCXQ1k+/eonXpc41aW+ZiFEZBBxFhrNESP19BOAKUqzSYp
	 ZKNTOa++S7Aw1+nLx4GCjmWIdIxky8miK+2jYTKXnS6rV5ETbk06xHxoo0FjMD04Eh
	 /XubCooeG6rahzWodDl5YWifJ1ZCTck3/EfojpharIz3Lnnz8FiLL65lwfjryzZxO8
	 RVTEfeC9ZUhG3uFuY18HThzSnU1MkDrhr2yBo15rrCAFvQ9GRAxD251yBRIzwuwPhz
	 zsFsBdiejQF9aJqz7KanuYbIovz5J1Xgv1oDcgHXjH83YYX+uz7N/saXB5bvB3C4jX
	 3+J8T3hrGHclg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F36780F73;
	Thu,  8 Jan 2026 11:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F7EF436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D08460DB7
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjA6SztX0vFL for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1ED8960A38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1ED8960A38
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1ED8960A38
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:11:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 44CAB1A26FF;
 Thu,  8 Jan 2026 11:11:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 188D5606B6;
 Thu,  8 Jan 2026 11:11:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 80079103C8828; Thu,  8 Jan 2026 12:11:48 +0100 (CET)
Date: Thu, 8 Jan 2026 12:11:47 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260108121147.2318be80@windsurf>
In-Reply-To: <20260106023341.2237312-1-james.hilliard1@gmail.com>
References: <20260106023341.2237312-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZJccSdnlTQTpT103FxHd+ZEswf2N9+abDRm1JVegcnY=;
 b=dqQ16T2t4pkiHNi2EFtPjSTdyaMEvrN8IA5tXXU4gmNjGjP2/OQvioIELWqsVAg70Ss5m4
 QVBpXwWVwQulUE+K8yqOm9fgJvWJHLJSD0dEx/l4LhhwqQPlMv0z44duk7HKk3TgwGz5dm
 e6+qiZDSu98YYxa+LkEKHSn7lK2fkWAV/65lQNFINVTPJq+M9jdANzkZtliAILHCW0IzBp
 XYhsSCy/WfRMfjBXbJVLNJEwiOuhlZz1RhIFlSa/eTRWarHZttTHvPEHgN9zpzwsLLJZYr
 LAmgqc0Y0A9PLNeb/EDUXKGbI6wyzvcaVw9shPjBs2IpBNI0V7tDJR6mXPEMrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=dqQ16T2t
Subject: Re: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2026.1.4
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

On Mon,  5 Jan 2026 19:33:41 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-certifi/python-certifi.hash | 4 ++--
>  package/python-certifi/python-certifi.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
