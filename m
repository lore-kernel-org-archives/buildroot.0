Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E639CCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 12:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A96688231E;
	Fri, 29 Aug 2025 12:09:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPE80b1ZCWlH; Fri, 29 Aug 2025 12:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 923998223A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 923998223A;
	Fri, 29 Aug 2025 12:09:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81154D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 12:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E573416E2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 12:09:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78RlyvMSRRVR for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 12:09:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9EC04188A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9EC04188A
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9EC04188A
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 12:09:28 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 825D1C0828
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 14:09:25 +0200 (CEST)
Message-ID: <224e655f-93b1-44b2-bee9-76f498ea69dd@grenoble.cnrs.fr>
Date: Fri, 29 Aug 2025 14:08:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250829103340.158873-1-thomas.perale@mind.be>
 <20250829103340.158873-15-thomas.perale@mind.be>
Content-Language: en-US, fr
In-Reply-To: <20250829103340.158873-15-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1756469365;
 bh=oVHfWWviJ+D3wqyyM4I2NFYqd5N2csUCVHKrCsAAhwM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Q99iuoMZzyu6+JWE9P0SILZwCNd4SXi7PBBZvIaI7slLcRZNkPOj3IYbcgpvTNKml
 ZxfOVtYjQL0K4U6lA/2b22qQea/LsLE3CWggPadnZAQhXUNVOj4hE2Pwfdi9ou6ynn
 8rXmWAWSnF7V0z3DHdCfixreBluT8BZYKg1w98SR4pNsg8JouWts4Gr5cqNKPL1iGW
 LlL/yQM3CbgOAO9YXU69usl+AYYXx+jKpU6I4pqRDAkEtJVWCzx36UfDeudZtaR+tI
 g4AVPNFknn1knQc4N3aw3lrkuTluz6+GpgW3cRB8+XeuJ8zgbkustl4HYIOCLViIwm
 UoMB24v9l3UJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Q99iuoMZ
Subject: Re: [Buildroot] [PATCH 15/15] package/duktape: move submenu
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi!

On 2025-08-29, Thomas Perale wrote:
> Since the introduction of duktape in [1]. This package has been present
> under the "JavaScript" sub-menu.
> 
> This sub-menu was mostly used for JS libraries and programs so duktape
> should have been under the "Interpreter languages and scripting"
> submenu.
> 
> Since duktape is not the only entry in the JavaScript submenu, move this

s/not/now/

Best regards,

Edgar Bonet.

> package to a better suited place and remove the JavaScript submenu.
> 
> [1] 387ff26b6d duktape: new package
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> ---
>  package/Config.in | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 45434f411a..ac4a96788b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -673,6 +673,7 @@ endmenu
>  menu "Interpreter languages and scripting"
>  	source "package/4th/Config.in"
>  	source "package/chicken/Config.in"
> +	source "package/duktape/Config.in"
>  	source "package/enscript/Config.in"
>  	source "package/erlang/Config.in"
>  if BR2_PACKAGE_ERLANG
> @@ -1890,10 +1891,6 @@ menu "Hardware handling"
>  	source "package/urg/Config.in"
>  endmenu
>  
> -menu "Javascript"
> -	source "package/duktape/Config.in"
> -endmenu
> -
>  menu "JSON/XML"
>  	source "package/benejson/Config.in"
>  	source "package/cjson/Config.in"

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
