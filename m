Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79F4C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 06:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A306F616B3;
	Sat, 11 May 2024 06:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Com66vwHeagO; Sat, 11 May 2024 06:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 875B3616C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 875B3616C0;
	Sat, 11 May 2024 06:58:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4AA481BF398
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8850400DC
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 06:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTOTPVB2sbdG for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 06:58:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56AC64242C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56AC64242C
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56AC64242C
 for <buildroot@buildroot.org>; Sat, 11 May 2024 06:58:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 681D960003;
 Sat, 11 May 2024 06:58:21 +0000 (UTC)
Date: Sat, 11 May 2024 08:58:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240511085820.0ba23225@windsurf>
In-Reply-To: <20240511061931.143405-1-fontaine.fabrice@gmail.com>
References: <20240511061931.143405-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715410701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wzx+O0Z7Fge/HkmQm8w01TXB0LdwA5zm4AlPJ9BuTR8=;
 b=pyRrn22wWjjpYTvq/GWGyrLPaBiCdAv6MDlbKDGIrccb+fk7tLxYcoCWNSoSdxhKbdd/5P
 WbuX3WDRxZOCqMQ7V3+hueaTvpveAS8f0tB/ZvBG/4Jjrty7tVBR+VmsO6wlW8TYzcF+yB
 PcP0xKGNVwxdPnU3rbrh8fS/4KlBn/P8VMtXnMQMySCs2xrnRtV0/9Cxkf/wpecnJDcZr/
 mqSlsvd1HErRVYqFctZo80IFaZFhlIaoDEaFfQjEIXh4JD91rKxFJptMhKTqygqDuBZhJx
 h7OLM2GqBGQCFvezguVMxO0Ln7xu8tzpoNuzTCMsRQBxdliAfnzmvOZtbQyO1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pyRrn22w
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix uclibc build
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 11 May 2024 08:19:31 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following uclibc build failure raised since bump to version 3.6
> in commit 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443 and
> https://github.com/SELinuxProject/selinux/commit/cb8289c2b237e5f66e4a7608ecc6c68abeaeaf55:
> 
> selinux_internal.c: In function 'reallocarray':
> selinux_internal.c:25:29: error: 'SIZE_MAX' undeclared (first use in this function)
>    25 |         if (size && nmemb > SIZE_MAX / size) {
>       |                             ^~~~~~~~
> selinux_internal.c:6:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
>     5 | #include <string.h>
>   +++ |+#include <stdint.h>
>     6 |
> selinux_internal.c:25:29: note: each undeclared identifier is reported only once for each function it appears in
>    25 |         if (size && nmemb > SIZE_MAX / size) {
>       |                             ^~~~~~~~
> 
> Fixes: 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443
>  - http://autobuild.buildroot.org/results/7e627744beaa4f7fdfd488dfacbaafc074a999f7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...se_linux_internal.c-include-stdint.h.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libselinux/0002-libselinux-src-se_linux_internal.c-include-stdint.h.patch

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
