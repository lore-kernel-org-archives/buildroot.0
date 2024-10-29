Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8575ED2AB1F
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 11:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DFBC80C2F;
	Tue, 29 Oct 2024 11:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3QzwrV2kMGes; Tue, 29 Oct 2024 11:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E41B80C5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E41B80C5A;
	Tue, 29 Oct 2024 11:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3817F4EC0
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25ED940103
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RFZGzkkgrehv for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 11:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00D7C4010D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00D7C4010D
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00D7C4010D
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 11:21:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD5C22000C;
 Tue, 29 Oct 2024 11:21:42 +0000 (UTC)
Date: Tue, 29 Oct 2024 12:21:41 +0100
To: Scott Fan <fancp2007@gmail.com>
Message-ID: <20241029122141.50cd82d3@windsurf>
In-Reply-To: <20241029044843.703796-1-fancp2007@gmail.com>
References: <20241029044843.703796-1-fancp2007@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730200903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vwvEvx2jVB/bycsVj/TbqES2SN/4HP6bNaRY7WjzQYw=;
 b=PcOb9BONji/X05Ikvr14n6VZtY+drUjqo6k0Fd1omqBU6HQmLo3ZED5pH6ylLRMmS1EgJ0
 /4LYXFDdUOfSBLahoT/y4njM9y3atDIy2ljL5tMOtiQqYOoExan2JHg4It77Ao9C48ojFB
 RguCTIHnZcKLkIKdJx7N0NYq1a7wycptAR1jjX325Tv8WGVapRBQEs2MAUR8+Qwm00lk15
 /3iHvVU9H12OeUvQHca51UWyC0V6ldbRdGJNnf1BAZ7rOan47Vj7DQAyTDfYllPKii9KBN
 zjFrc5lfOheso9cAuusttxKtyRUtQBnrr/yeSgxvzVCGdMMB/7acPUXoXcxgXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PcOb9BON
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix typos in config
 option and help text
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Korsgaard <jacmet@uclibc.org>,
 Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Scott,

On Tue, 29 Oct 2024 12:48:38 +0800
Scott Fan <fancp2007@gmail.com> wrote:

>  if BR2_PACKAGE_PROCPS_NG
>  
> -config BR2_PACKAGE_PROCPS_NS_ORIGINAL_TOP
> +config BR2_PACKAGE_PROCPS_NG_ORIGINAL_TOP

Thanks for spotting this. However, since this option has made its way
to Buildroot 2024.08, I think we have no choice but to add an entry in
the Config.in.legacy file for the old option name.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
