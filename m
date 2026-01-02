Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133CFA3755
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 593CD81F11;
	Fri,  2 Jan 2026 22:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2s2n25JNKXJX; Fri,  2 Jan 2026 22:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78B7281F1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392856;
	bh=KoY/zZb7XNouRLBz89s5phyjY0Jcp4sx4sjxN3sMYsQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SAje2hIOODVsK4Fwsuv4H3TF8tlYX2HN5+m0enJHV3ieUKJg5UfUExGXPU5IkL9Wn
	 Hnxwl2nai9JSD86E5Z8tYKv2gE1EuJfo7s9PdAkwhw9F9a/gv/cVmIMDVNPCdljHXj
	 G77l2gObGZC3wkU27SsT7V445i/RdApJvcR+neuOezo9tYiZRJ/qVHSXp76KSI5cBK
	 bI1YLjs44ONty6LSu1vOeayMh70fo4bQou303GlUqSNrMmts9QFwfc5qEqSTyP0uGU
	 09LWUHnA82KJq0BgBfYk7w2ib/RLH3GNaUzhKWtOcN+P2V8AytVSo3L4Te7nZp02mY
	 T6dq+5IX//Ebg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78B7281F1A;
	Fri,  2 Jan 2026 22:27:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8217A249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 737DB400AA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7u0XF6lQB_IQ for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCC3D40072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCC3D40072
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCC3D40072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:27:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 18A904E41F05;
 Fri,  2 Jan 2026 22:27:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFC72606C7;
 Fri,  2 Jan 2026 22:27:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6DD4A113B023D; Fri,  2 Jan 2026 23:27:27 +0100 (CET)
Date: Fri, 2 Jan 2026 23:27:25 +0100
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>, Romain Naour
 <romain.naour@smile.fr>, Vincent Jardin <vjardin@free.fr>, Julien Olivain
 <ju.o@free.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20260102232725.178d3918@windsurf>
In-Reply-To: <20250830173313.164981-2-olteanv@gmail.com>
References: <20250830173313.164981-1-olteanv@gmail.com>
 <20250830173313.164981-2-olteanv@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767392851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UPmdcuJgi5tqhHqK1YgCdfjSVO2Vq4S3hY6YgQB43/8=;
 b=pD0g0ByRlFmBWQFxQNg+ibZmw+vLbDkeDG1qav/Fy8AqAPsiWcapj+h+jbzRRkBP9csaFj
 7cwjNjzcpUeb8emt/ZXOzdPQCjZztd2i6oFJdHb9bU0fhhvqoU0hGnG6PV5BGa/OOM0ANG
 2RgQJGbCaObldFrxV+mmM6cUHQH1E5KOvWp60CbYBV6f7oJd4ExwHmQBfCIh1RhEbmy3Wk
 pK0xecWhRbPUqDOqWLVzlBjBYll31V2L0qqpLUMDEsz5ridycW2+4sHNIfeTXLVPqCyrs7
 75NdYHTtTc55bFpRb3ZbF7TA2Cm/n4iMnVOFVpZcR+T8dzWSh8k38tD2hgyKVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=pD0g0ByR
Subject: Re: [Buildroot] [PATCH v4 1/2] package/qoriq-restool: new package
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

Hello,

On Sat, 30 Aug 2025 20:33:12 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> Introduce a package for the restool program, which permits the user to
> modify the network configuration of the DPAA2 subsystem and create one
> that is adequate to their use case.
> 
> We integrate the master branch, which is effectively the
> lf-6.12.20-2.0.0 release tag, plus some extra fixups specifically made
> for the Buildroot integration:
> - commit b44748ed0bb3 ("Avoid use of non-portable __WORDSIZE when
>   defining BITS_PER_LONG")
> - commit b4a734f3512b ("restool: fix format string for 64 bit time_t in
>   parse_obj_command()")
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Vincent Jardin <vjardin@free.fr>

Thanks, I've applied, with minor tweaks.

> +	  The restool program is able to talk to the Management
> +	  Complex at runtime and permits the dynamic reconfiguration
> +	  of networking objects, as well as saving the current
> +	  configuration into a new DPL file. Without the restool
> +	  program, the only possible networking configuration is
> +	  that specified in the boot-time DPL file.
> +
> +	  https://github.com/nxp-qoriq/restool
> +	  # sign in required
> +	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM

Dropped this last link as we want a reachable project homepage as the
last element of the help text.

> diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
> new file mode 100644
> index 000000000000..52a622f70e03
> --- /dev/null
> +++ b/package/qoriq-restool/qoriq-restool.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# qoriq-restool
> +#
> +################################################################################
> +
> +QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
> +QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
> +QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later

s/GPL-2.0-or-later/GPL-2.0+/

because yeah we don't use exactly SPDX in Buildroot (maybe we should,
but for the time being, let's be consistent).

> +QORIQ_RESTOOL_LICENSE_FILES = LICENSE
> +
> +QORIQ_RESTOOL_MAKE_OPTS = \
> +	CC="$(TARGET_CC)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)"
> +
> +define QORIQ_RESTOOL_BUILD_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(QORIQ_RESTOOL_MAKE_OPTS)

Changed to:

+define QORIQ_RESTOOL_BUILD_CMDS
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+               CC="$(TARGET_CC)" \
+               CROSS_COMPILE="$(TARGET_CROSS)"
+endef

> +endef
> +
> +define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) MANPAGE="" $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
> +		prefix=/usr install

Reformatted to:

+define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
+       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+               MANPAGE="" DESTDIR=$(TARGET_DIR) \
+               prefix=/usr install
+endef

Just for consistency between both.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
