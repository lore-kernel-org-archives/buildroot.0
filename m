Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D10FC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 07:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C7D840334;
	Sat, 24 Aug 2024 07:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WB3SXFpgfMfO; Sat, 24 Aug 2024 07:08:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8DAE40335
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DAE40335;
	Sat, 24 Aug 2024 07:07:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 62B7C1BF2FE
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 07:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D9516060A
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 07:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4vIz0ZyW7m0 for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 07:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FEB6605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FEB6605FF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FEB6605FF
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 07:07:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3362FC0002;
 Sat, 24 Aug 2024 07:07:54 +0000 (UTC)
Date: Sat, 24 Aug 2024 09:07:53 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240824090753.551ad073@windsurf>
In-Reply-To: <20240821124414.8330-1-wdouglass@carnegierobotics.com>
References: <20240820232730.60670833@windsurf>
 <20240821124414.8330-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724483274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xT7OQnkNzR0st3eZjoPItMb+A603P0UMCkQJdg0ITc8=;
 b=Nx8xJbPCzyeF+BbaALsiRUgxW/2dDb8puYesilm1blNJ9Gy0J8f5olgi/GFGvTmBtId9Ew
 2wjgSKE6e0RhGK5ggjoh/tdfYFaeMz//ZfFop0MQv5qIIjMj029ernqVBUFfmCbYbifDNo
 vhNoJvIOJfxPKk/i81rYb6mahlNd0DpCXsKfEMJQQ3zXj56+sEwYXoUwHnLeSpnWDS4XiW
 xqnDdADK29JZatPYGdqMhWT9n59CY1qtU0F4S4bbyJd3dcqqn9uV7oGPXLCwNxS9m5CcKS
 rZYhA5MouVA6GMuGeaWJzKbM9Zv/y6eELF6MWJTDYzjVXgfpN/y68kk1xLrBdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nx8xJbPC
Subject: Re: [Buildroot] [PATCH v3] package/chicken: security bump to 5.4.0
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
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 21 Aug 2024 08:44:14 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> This release includes a fix for CVE-2022-45145
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> 
> --
> Changes v2 -> v3:
>   - Add this changelog to commit message
>   - Add Signed-off-by to commit message
> 
> Changes v1 -> v2:
>   - Update version numbers in hash file
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/chicken/chicken.hash | 4 ++--
>  package/chicken/chicken.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Sorry to be annoying, but this patch breaks the legal information for
this package:

>>> chicken 5.4.0 Patching
>>> chicken 5.4.0 Collecting legal info
ERROR: while checking hashes from package/chicken/chicken.hash
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37
ERROR: got     : c0ed699d5c4a8687f90a6488244f7f57d48a7f2d42bb7461b08a0d69a07d4f58
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make: *** [package/chicken/chicken.mk:46: chicken-legal-info] Error 1

So the hash of the license file needs to be updated *and* an
explanation about the changes in the license files must be added in the
commit log.

Also, please note that updating from 5.3.0 to 5.4.0 is OK as the
package is new in 2024.08, but as it fixes a security issue, we need to
have this fix in master, and therefore a more minimal update to 5.3.1
would have been preferable for master (and the update to 5.4.0 in our
next branch). But again, as this package is new, I think it is OK to
upgrade to 5.4.0 even in our master branch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
