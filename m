Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C48C5472F
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 16:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A5E401F0;
	Tue, 27 Aug 2024 16:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sMx25ZXNTEzo; Tue, 27 Aug 2024 16:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 747544057B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 747544057B;
	Tue, 27 Aug 2024 16:49:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84A491BF4E5
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E6E54057B
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 16:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqWHpqNhYXNy for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 16:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1E273401F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E273401F0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1E273401F0
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 16:49:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D72960005;
 Tue, 27 Aug 2024 16:49:41 +0000 (UTC)
Date: Tue, 27 Aug 2024 18:49:40 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240827184940.423ad60a@windsurf>
In-Reply-To: <Zsw6eH7ZKW2oXJni@waldemar-brodkorb.de>
References: <Zsw6eH7ZKW2oXJni@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724777381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmZp8qfG2JjSGYEEfIAlNoWNgkVu1VowGwwnulMF9H4=;
 b=HLdhk+0Ry8QbFs9K3mmAo3kVgrhnRz0YzPg3GlVO97mBMcI6a2kCdsEFyncLw+LR9jmiMk
 0k2QKnwhe27Ieg9FFiNSPzgpqAg7c4YDskEvIKM/CQoLSLemMq1gGszBX1SbU7Onwn3MUU
 YPTToebVy5/QKbtjzHWO+c8as24GInnNjmbJ7abm0Ba6T6uUGdO77mgR3ZvP1sepW++XJ4
 Zt2JrDWpGg3Dvrp9ccqKpo44HYGrt8NXM3+siut7yRCaItILCJZMPQUCJOI4HwV9TYt5YW
 O2WKINHsPQzNTqoUOC9Qq9mm7vX3Qm2FTwPCEM1EM7tH/U3NrZ0CfdF+P6+Ehg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HLdhk+0R
Subject: Re: [Buildroot] [PATCH next] package/freeradius-server: update to
 3.2.6
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

On Mon, 26 Aug 2024 10:19:04 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> See here for the release notes:
> https://www.freeradius.org/release_notes/
> 
> Patch 0001 is rebased to this version.
> Patch 0005 is upstream.
> Patch 0009 got renamed to fillup the gap.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  .../0001-jlibtool-cross-with-host-CC.patch    | 17 ++++-----
>  ...dules-rlm_sql-remove-mysql_version.h.patch | 37 -------------------
>  ...les-rlm_python-fix-build-with-Ofast.patch} |  0
>  .../freeradius-server/freeradius-server.hash  |  4 +-
>  .../freeradius-server/freeradius-server.mk    |  2 +-
>  5 files changed, 11 insertions(+), 49 deletions(-)
>  delete mode 100644 package/freeradius-server/0005-modules-rlm_sql-remove-mysql_version.h.patch
>  rename package/freeradius-server/{0009-src-modules-rlm_python-fix-build-with-Ofast.patch => 0005-src-modules-rlm_python-fix-build-with-Ofast.patch} (100%)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
