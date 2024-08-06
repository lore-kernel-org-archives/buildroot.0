Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5AFC52D70
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 15:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFD754052E;
	Tue,  6 Aug 2024 15:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0ViXVO18IQH; Tue,  6 Aug 2024 15:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD1FE405C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD1FE405C7;
	Tue,  6 Aug 2024 15:03:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD671BF2B0
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CDD44052E
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 15:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1K0sjI4RHR_e for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 15:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EFCC40A21
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EFCC40A21
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EFCC40A21
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 15:03:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 410AB1BF20C;
 Tue,  6 Aug 2024 15:03:51 +0000 (UTC)
Date: Tue, 6 Aug 2024 17:03:50 +0200
To: Markus Mayer via buildroot <buildroot@buildroot.org>
Message-ID: <20240806170350.34b8af72@windsurf>
In-Reply-To: <20240806030701.618378-1-mmayer@broadcom.com>
References: <20240806030701.618378-1-mmayer@broadcom.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722956631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BA/KTkgVW0jooWK1zVUXb9JfZLiFUk9+jJgWtAVq6hU=;
 b=CIzIB6LQQeUDERf9fEj/b/FWdL6RD8Dro5tzztsWUCSoxxYb6rB6hH9af0GH1pyXMfE/i9
 3YzDnLD9qgxYsCPhC+Jp6KhCNxJ2PAmKrNvyt+oD0Ph/nCUzyywv1Z3yWD2VP7PUNrT9hC
 XoitDbJV9h8OIbT/8+H+ucP7aGM5uHcNqYK34b+cKE+76oc0L5xuzQz5t06dEjbtUTQDY/
 HB/Yctq3CKO08+ASjonC4KwdShsdFkvmVVnLPMBB+PGb99Vd97dfgexACjawTSl0LcQsn2
 f1qFKa/EhAfeyPFGzlSMvS7KLca4R1J1Twj+oD3Lxw22HWh/77wCn/Wx81rRwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CIzIB6LQ
Subject: Re: [Buildroot] [PATCH] package/xz: avoid cicular dependency on
 autoconf for host builds
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  5 Aug 2024 20:06:59 -0700
Markus Mayer via buildroot <buildroot@buildroot.org> wrote:

> autoconf has an implicit dependency on HOST_XZ due to extracting a
> tar.xz archive. By enabling XZ_AUTORECONF we create a reverse dependency
> for xz on autoconf. This is fine for target builds, but it won't work
> for host builds, as the two packages now depend on each other.
> 
> This problem only occurs if host tools are being built by Buildroot. If
> the build relies on host tools provided by the distro, there is no
> circular dependency problem.
> 
> Fixes:
> 4703a7ae9176 package/xz: fix musl static build
> 
> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  package/xz/xz.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

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
