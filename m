Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E3ED59F67
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAE3C40726;
	Wed,  6 Nov 2024 21:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9ZoqaAsfzBi; Wed,  6 Nov 2024 21:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E4C4085A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E4C4085A;
	Wed,  6 Nov 2024 21:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 269573B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1493A407B4
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2oxm6JJ91lE for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:21:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6D1A40726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6D1A40726
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6D1A40726
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:21:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68773E0003;
 Wed,  6 Nov 2024 21:21:43 +0000 (UTC)
Date: Wed, 6 Nov 2024 22:21:42 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Woodrow Douglass
 <wdouglass@carnegierobotics.com>, Julien Olivain <ju.o@free.fr>, Asaf
 Kahlon <asafka7@gmail.com>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241106222142.429aa425@windsurf>
In-Reply-To: <20241030190020.1444105-6-james.hilliard1@gmail.com>
References: <20241030190020.1444105-1-james.hilliard1@gmail.com>
 <20241030190020.1444105-6-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730928104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CdYr3qBNxe+oiwEU7xHoU/ELX9DkLM/tjwzfyvK+W9M=;
 b=AQbAbM/iAG5LF831+8nZQOUWio/i21o/V4McTMv3aWOgkYADMUj/V/uC7q4N4A55EuDnlL
 3viheN1cMRCEGr14h0gw7bt8w9obSmBe1qSgNZW+SA/QMEtd+SFKYYZuypOoH66wex5/QR
 cVkS3K4qE0gWGHqjqMl5jDQJC4bcBiAuXiGOew3qpo8pXqnbdYPTuUakRaljbyxmFpqddN
 qzNh/HNDVJOmnTsVtiCOitEP9Btj9ebl3kJwh/KwVmTAmGsFH7JxXx6XmdPqE5/Z8hg/wB
 gk/WToaCfxU4ruE58JNbnFPtdhzSF0ONRzr+l5ZdVYeHWehhQ2tOLPki2R5brw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AQbAbM/i
Subject: Re: [Buildroot] [PATCH v4 6/6] package/collectd: fix protoc version
 check
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

On Wed, 30 Oct 2024 13:00:20 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to add a patch fixing the protoc version check in collectd's
> configure script.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...onfigure.ac-fix-protoc-version-check.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/collectd/0004-configure.ac-fix-protoc-version-check.patch

Applied to master, thanks. This should have appeared *before* the
protobuf bump in your series, as it fixes an issue with the bump, but
also works before the bump, so it really is a preparation commit.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
