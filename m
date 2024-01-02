Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A8BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D05464086D;
	Tue,  2 Jan 2024 08:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D05464086D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sRZHuM4Vbj5; Tue,  2 Jan 2024 08:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221CF40876;
	Tue,  2 Jan 2024 08:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221CF40876
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA791BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1247281349
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1247281349
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ppcpqMk29nK for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:52:35 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E7A681279
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7A681279
Received: by mail.gandi.net (Postfix) with ESMTPSA id F0CDC240005;
 Tue,  2 Jan 2024 08:52:32 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:52:32 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095232.44811be6@windsurf>
In-Reply-To: <20240101220818.14806-1-fontaine.fabrice@gmail.com>
References: <20240101220818.14806-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhkR3RF3xcs12t5RJ9fT1bu9WZUPVQWRtqVEkBl2n3s=;
 b=CMrgQhhfqT1n8BxpYOnEaXP7ThbPWyi/RMMl5us53WkniMb2AE+LsByu+Kp3PKe9bh2gqd
 XdOEC7NHDsTHlH0FLyabENCMvX4si8l/vxEMG93bz9//J89OQNOol6ZKOY2xCfOrLyhjI2
 Yns9KKvwIEOV/GpK9yQwt2sAi0dcmVPsVXyTKJyOcKFzCDgrem6+/FGfNPAdkpxi5AVn5S
 Mjxv7JFlUGFXzmhlnlGvzpkYgAQ7IvQDppzBoAdWKKOzKWgbqXNGds/+PVKlP0DQHh95PI
 ZA0Wg8SszUhxJu1kO4o8nScNk46UNfqAE8lV2Bus5fjh/e6aiEw0YtvLLKfr6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CMrgQhhf
Subject: Re: [Buildroot] [PATCH 1/1] package/dropbear: fix CVE-2023-48795
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

On Mon,  1 Jan 2024 23:08:18 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/advisories/GHSA-45x7-px36-x8w8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Implement-Strict-KEX-mode.patch      | 232 ++++++++++++++++++
>  package/dropbear/dropbear.mk                  |   3 +
>  2 files changed, 235 insertions(+)
>  create mode 100644 package/dropbear/0001-Implement-Strict-KEX-mode.patch

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
