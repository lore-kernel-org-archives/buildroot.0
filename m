Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F52FCCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CE040ABF;
	Wed, 22 Oct 2025 16:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIvuvthIu6qp; Wed, 22 Oct 2025 16:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39D6F40B25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39D6F40B25;
	Wed, 22 Oct 2025 16:43:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE96B70A
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0C14613CB
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H3naHRw1ljBs for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3EDC61233
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EDC61233
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3EDC61233
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:43:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EF3E4B97918D; Wed, 22 Oct 2025 18:42:59 +0200 (CEST)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:42:59 +0200
Message-ID: <20251022164259.285938-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008101535.51154-2-fiona.klute@gmx.de>
References: <20251008101535.51154-2-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1761151380; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=hpYv1smhoUdw8LqHLd8DfY5bFFbV8HD4itdgN1+Erbk=;
 b=bd6sPdWWOxVV/eM2CmVzmBNbgOyOj1UOHZluVlXMgCXmRsn8I6wbezpQWl/kmqlZkAkzzx
 IbwIXoA5NlJz31pwwAwgkFeVa+fecMi18K3lHOqNX/KpOFC03ohbh3Ae8MVoVHp1StAEtV
 6PRC1nAI7NiyM4mnKVZValaJlCHZeextX0f5XtXZ3gYleyTxgU0oN3bImndvAVcgHM3eDc
 xTVHgQg/AMopy0xj0GZHPXM3BEsYAzXPcm5JdnUdkPtiKq/021/CmERpKfRfy4Yvb5L7Yo
 d7txEbIPkgDlhKL7ynxose2cImQYT/R+14ersOWG7is2bJCSHsEs3wOpvfMkXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bd6sPdWW
Subject: Re: [Buildroot] [PATCH 2/3] package/audit/S02auditd: fix path for
 default rules
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
> /etc/audit/audit.rules is the path used by augenrules,
> /etc/audit/rules.d/ should be used for snippets to be combined into
> that file using augenrules.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x and 2025.08.x. Thanks

> ---
>  package/audit/S02auditd | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/audit/S02auditd b/package/audit/S02auditd
> index 97c43bc66f..a660ca921a 100644
> --- a/package/audit/S02auditd
> +++ b/package/audit/S02auditd
> @@ -28,7 +28,7 @@ start(){
>  	status=$?
>  	if [ "${status}" -eq 0 ]; then
>  		# Load the default rules
> -		test -f /etc/audit/rules.d/audit.rules && /usr/sbin/auditctl -R /etc/audit/rules.d/audit.rules >/dev/null
> +		test -f /etc/audit/audit.rules && /usr/sbin/auditctl -R /etc/audit/audit.rules >/dev/null
>  		echo "OK"
>  	else
>  		echo "FAIL"
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
