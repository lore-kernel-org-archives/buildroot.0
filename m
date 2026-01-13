Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96050D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643B28415C;
	Tue, 13 Jan 2026 19:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uqO5XcX7pQ7; Tue, 13 Jan 2026 19:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D4984145
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333540;
	bh=wAXPhPODHdCE6s9yTKlCgsyOJpE7+16+VMAfY8ghhX4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n0tj3ouQG6MPDXxQuYA8T41TR9CTL8sN6BEB1dMmjx2+OxT1jANKTlckep4OiBZQf
	 z+T5tvOXboDnzVOLlutaT+qRuu2+fpFu+LhOeuWicAj++Lh3njS57WRUe+w5S4FYZl
	 XyozVMClIidGa1R2X59SG5S0rrFK6KtbKWSZec8ELZ1PN2F9qz75ihaYtT+P5ZVson
	 psyGKKv+z+OawsI/Ddg4M5idCJhBs+qZ/pLUlHzDPoamnd0TN08vJTYIi4twuG07Qo
	 eJ1R3+dPPaTH/PZLd0a1YAAyFpY/sFqab/FMDpyR4hYAGwpbm9I1GZjRnrkM5iG4g6
	 bZKfUgioyAATQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D4984145;
	Tue, 13 Jan 2026 19:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 803491C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 670858413B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKMuELw8Q7Nc for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 65F0784135
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65F0784135
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65F0784135
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:45:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FA5BB97A885; Tue, 13 Jan 2026 20:45:34 +0100 (CET)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:45:32 +0100
Message-ID: <20260113194532.97813-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aMKU_BEQ4TKSd6qq@waldemar-brodkorb.de>
References: <aMKU_BEQ4TKSd6qq@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333534; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=lUetrKfPYVu88CmudyiNnhZwkdFDdcoyNMdDGg0SsmA=;
 b=PT5/wbsihVWz4XZSPNia3gDhYX7SqHSkO+R8FiNxU3lbuMWmBvgev+g5pX+ZWyIZli4CVy
 Oc8MaZjDzBsXJzKmalbp5TdaO5chyspXf+ACPBrm1Eg3fA+1JoiMDOBByFxNBMRbt0Bh90
 APpGxIG465AmaucP4Iu2AflodjzeiiR4GD0MXRpTOWzmpmJBVEF0vixozsGV1aSHJbH5YK
 t3G69Fm7BoAi2wBHeTUF0TijA+YK57kErLdfaOWOWypMxn359kowQzujyFav9J65A7Zipx
 wOhVEoUGiq8On1Ru/67pyX908W1mRFW0ER48aNc62R0CHb8uu1Zj2c5D4FLqRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=PT5/wbsi
Subject: Re: [Buildroot] [PATCH v2] package/evilwm: fix compilation with
 external toolchains
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Switch to generic-package, as the configure script isn't really a
> autotool generated script. This fixes building evilwm with an
> external toolchain.
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/250/25040ce7e94acf8f92c24db895d7dea081de1d7a
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
> v1->v2:
>   - add link to autobuilder (suggested by Arnout)
>   - use TARGET_CROSS (suggested by Arnout)
> ---
>  package/evilwm/evilwm.mk | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
> index 78b531095b..12934427b9 100644
> --- a/package/evilwm/evilwm.mk
> +++ b/package/evilwm/evilwm.mk
> @@ -18,4 +18,26 @@ endef
>  
>  EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
>  
> -$(eval $(autotools-package))
> +EVILWM_TOOLS_PREFIX += $(patsubst %-,%,$(TARGET_CROSS))
> +
> +# the configure script is not generated by autoconf
> +define EVILWM_CONFIGURE_CMDS
> +	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		./configure \
> +		--prefix=/usr \
> +		--mandir=/usr/share/man \
> +		--host=$(EVILWM_TOOLS_PREFIX) \
> +	)
> +endef
> +
> +define EVILWM_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define EVILWM_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.47.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
