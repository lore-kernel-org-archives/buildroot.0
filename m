Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870C3D0BB66
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509FE608FB;
	Thu, 24 Oct 2024 07:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYHErBlKC8tP; Thu, 24 Oct 2024 07:33:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E85C608E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E85C608E8;
	Thu, 24 Oct 2024 07:33:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 209D6972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8C544071D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXT_qnlM_ZUd for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:33:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FE4B40708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FE4B40708
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FE4B40708
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:33:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 85B8C60002;
 Thu, 24 Oct 2024 07:33:22 +0000 (UTC)
Date: Thu, 24 Oct 2024 09:33:20 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20241024093320.11f8b63e@windsurf>
In-Reply-To: <20241023221620.3328510-1-james.hilliard1@gmail.com>
References: <20241023221620.3328510-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729755203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6vZHEGUwq0+WRlcZ2M6mrD8d3FYDbpasd3mN5Qwnjv4=;
 b=fyX7dFtX0sjjdfdEJKTAR3xO4jpMK93UJTf361Ol2lEG794smnsle39L9dBNM89M6ZICuB
 x5C8gekqNEyOCmMXvmC0WVcMv7xuX4qsNXCNlQwKRb/ORFUu9dpccNICCtOJFfyDjW+tPn
 sb+r7fotpaMMonJPQuBtO1AOT8FKGqknH95JsnOBUk/NnGWx+OLJLJI6Pr3nSLY3SMLNwL
 JtjUTBdy20SXyeGJK5iFK89FC3msWVdJj/cj2FgSALxne2mqFp+jg4q977mVfb0aYyL1iV
 Y4jrN/G/r/XlDxEovhO0ovqNxfHwCpFMtgGQ48vqUte8VKEUW4+lm2FZJdf9Lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fyX7dFtX
Subject: Re: [Buildroot] [PATCH 1/1] package/python-sqlparse: use hatch
 setup type
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

On Wed, 23 Oct 2024 16:16:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Use the new hatch setup type which automatically pulls in the
> host-python-hatchling dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-sqlparse/python-sqlparse.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

I have applied this patch, and all other conversions to the hatch setup
type, up to package/python-jsonschema-specifications.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
