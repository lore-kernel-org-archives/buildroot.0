Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A92DEA8543
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965F940D28;
	Sun,  8 Mar 2026 21:16:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8SCS4HQKVMg; Sun,  8 Mar 2026 21:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7978B40D1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773004599;
	bh=Xm3Reow6/r5cDLgYXmykCPvM9zFaOK2ESPuKwglqbGg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nze4izUpB7ayzs2OsB3jIokUm8cEjTv5V10BWPght9hUBn/4UtUfN/i/s3ztWCZ2q
	 4QiThYDEhR3N7RKohtcgawHx7tLi207PnEHj74BtOVr9HPhbzdIB/u2nTlmu5KWk6z
	 4yZitfKRoL/Jig2IYaCR9aKEqM5MnnQ3z4kXiSxVgf7srgETHsJ75tnz+afYo2CWn5
	 iO3vPwhoqMdPpWhIH8zm4hn/WCfhh/aF+OjwsyEMM0AYPk7wpvjVutFi6vDNJqvcvE
	 Mp64AaBxAZ9D/6x3TwlKc+11Bi0MLZezF8BkT5vxywe5AXKtkyef6tIyBh9fVZNBUm
	 paoMSy/UxK8yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7978B40D1C;
	Sun,  8 Mar 2026 21:16:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8761D158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 791D18218C
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kdW6E12RUowK for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 21:16:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71A2E82170
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71A2E82170
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71A2E82170
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 21:16:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CA1285FF95;
 Sun,  8 Mar 2026 22:16:30 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 22:16:30 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 22:16:30 +0100
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260308005717.49411-1-christian@aperture.us>
References: <20260308005717.49411-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.13
Message-ID: <3c861042c8270fe75eaf6a41bebfc56f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773004595;
 bh=iq8WnAf72J3AqyyUU2qHZanU51ysUDv3o+Q3D1qoOkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ivQEe7rdkG/U0WxXyqjy86yQQ8bYUkyHxQwKcy9xLqbwiruwcPOhpXkTRJGF8TlK7
 50LCUYyolA7X5RnBEJACyDmZ36eScm45l43mJRFDDIbcHf2d5JL+XDlIpRlA8SkfM/
 o+lW9mWz91xPpqKTtgLAusNBMGoMdz65+as0Pgxm+hnaWOJOu+URe0oyIq+J9z7H6U
 Od/UbyJv0HGEIMFvRnqOVfrl2KnR9TCNg27swYe13tDA4dXnXufi42akMhXXj8z3/C
 mV2EKo9kSHBnryyU357oL+tBV6Fi1KSu35L9mMAHrYVAY02x3UgrfGQh3FJhzvhVr5
 5BFZ1sBnChrqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ivQEe7rd
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.26.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Christian,

Thanks for the patch. I have few comments, see below.

On 08/03/2026 01:57, Christian Stewart via buildroot wrote:
> For release notes, see:
> https://go.dev/doc/devel/release#go1.26.0

Buildroot has currently go 1.25.7.

The release note mention that it includes security fixes:
https://github.com/golang/go/issues?q=milestone%3AGo1.26.1%20label%3ASecurity

https://www.cve.org/CVERecord?id=CVE-2026-25679
affected from 0 before 1.25.8

https://www.cve.org/CVERecord?id=CVE-2026-27142
affected from 0 before 1.25.8

It also fixes those two issues introduced in go 1.26.0.
https://www.cve.org/CVERecord?id=CVE-2026-27137
https://www.cve.org/CVERecord?id=CVE-2026-27138

So I believe this bump should be marked as a security bump.

Could you confirm it is the case?
If yes, could you send an updated version of the patch
adding those details in the commit log, please?

[...]
> diff --git a/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash 
> b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> new file mode 100644
> index 0000000000..edd2e0a8c2
> --- /dev/null
> +++ b/package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
> @@ -0,0 +1,3 @@
> +# From https://go.dev/dl
> +sha256  
> e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e  
> go1.25.8.src.tar.gz
> +sha256  
> 2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  
> LICENSE

Also, host-go-bootstrap-stage5 are failing with the error:

>>> host-go-bootstrap-stage5 1.25.8 Collecting legal info
ERROR: while checking hashes from 
package/go/go-bootstrap-stage5/go-bootstrap-stage5.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 
2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067
ERROR: got     : 
911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Could you fix the license hash, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
