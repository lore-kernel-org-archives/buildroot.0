Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DFBC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 07:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E6D360782;
	Sat, 11 May 2024 07:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY6BT6owDcxl; Sat, 11 May 2024 07:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32B8D61632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B8D61632;
	Sat, 11 May 2024 07:01:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA2981BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91A04843EA
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 07:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTdOhIUowj98 for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 07:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93DFD84395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93DFD84395
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93DFD84395
 for <buildroot@buildroot.org>; Sat, 11 May 2024 07:01:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A48FD1C0004;
 Sat, 11 May 2024 07:01:31 +0000 (UTC)
Date: Sat, 11 May 2024 09:01:30 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240511090130.3bd51e9a@windsurf>
In-Reply-To: <20240221224617.1672544-1-fontaine.fabrice@gmail.com>
References: <20240221224617.1672544-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GaSxZcZjk44XLdLyNLPSDOoyTJHFfYr76t+meCapDyI=;
 b=Mhp26S8VXkEHd74UM8XnknwtJJUJEME+PqVH+pXaLU+keYWcoRoSPLWG5MdkN8jT6/1Yi/
 rsZdaGVJeGOZml+m5/Vl9HHeTRuZYPe0K6nBUtqs2XBd0qPSIVMHYJ9Z7r4NCnhqWU1E7j
 179m/DE1U3nsNLLnGEKI/D2GKJiHORMWJSmCiqBs/Dsp4B5L7UozaKs94YzqfSApVLTObO
 N94Dnh0wDYkXyrFk821+9fdI0nhNA1BfXFnIpu3iP37e443Tz3AP96nCyEI3bG6VB3UOWX
 qB2DkmWgcKZo83kVLClcwkMFpDxdCVYosdKbLIbs1bFHoM+4AOeLGvWQ7Wg6tA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mhp26S8V
Subject: Re: [Buildroot] [PATCH 1/1] package/libxmlpp: bump to version 5.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Feb 2024 23:46:17 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Drop patch (already in version)
> 
> https://github.com/libxmlplusplus/libxmlplusplus/blob/5.2.0/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e-it-compatible-with-libxml2--2-12-0.patch | 145 ------------------
>  package/libxmlpp/libxmlpp.hash                |   4 +-
>  package/libxmlpp/libxmlpp.mk                  |   4 +-
>  3 files changed, 4 insertions(+), 149 deletions(-)
>  delete mode 100644 package/libxmlpp/0001-Make-it-compatible-with-libxml2--2-12-0.patch

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
