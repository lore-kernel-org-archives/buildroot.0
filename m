Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF030C10F1A
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 07:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FDC840BD0;
	Sun, 12 May 2024 07:14:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLwL2ZvVihKO; Sun, 12 May 2024 07:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEDF440BDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEDF440BDE;
	Sun, 12 May 2024 07:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 48E5B1BF473
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FC8D40BDE
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 07:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LM9Umcy9rVPG for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 07:14:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9D52E402DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D52E402DC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D52E402DC
 for <buildroot@buildroot.org>; Sun, 12 May 2024 07:14:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C614240005;
 Sun, 12 May 2024 07:14:21 +0000 (UTC)
Date: Sun, 12 May 2024 09:14:20 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240512091420.5f34007d@windsurf>
In-Reply-To: <20240408193139.196047-1-fontaine.fabrice@gmail.com>
References: <20240408193139.196047-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715498061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lt4u2q6VWN35rZhG8eE3iRQb9gD04OCW/MYt2w/QDFY=;
 b=DHBKpHt2z6mgmBfOOcI/cUzKUVlbME1W1GaX3np6VuzuX6/EbnTbP5a92EqNBaUphSH47B
 6KABDajHie6tOFptUVECHOdDpa4OUrr/bzssmiOZFp3bI7gTBnF0Mc19M3n+3D0cTADotL
 zpHCbqCNn1LtdZawMDwzVIzqHZixpm/cYpT8jDq6P1SCH6tWGIeR3rZtxFP7bTGj+UpNxu
 Fp1gPoYelV2cSfWd8BdHhKuClREvgIlNVHxPBVzcZz8zjUjlwpx4m/OXLqcFUe7zGjCaRg
 Br78V69ssHQdfENJSCGvlxG8QBuIMlKwrUPT3E7JrEYMn+GHex1db2N1jNUjCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DHBKpHt2
Subject: Re: [Buildroot] [PATCH 1/1] package/dmraid: set -fPIC
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

On Mon,  8 Apr 2024 21:31:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add -fPIC to CFLAGS to fix the following build failure raised since
> commit de6415ad9c35b2013af1f1821bcac12ba3959674:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/x86_64-buildroot-linux-gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: misc/misc.o: warning: relocation against `stdout@@GLIBC_2.2.5' in read-only section `.text'
> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/x86_64-buildroot-linux-gnu/12.3.0/../../../../x86_64-buildroot-linux-gnu/bin/ld: log/log.o: relocation R_X86_64_PC32 against symbol `stdout@@GLIBC_2.2.5' can not be used when making a shared object; recompile with -fPIC
> 
> Fixes: de6415ad9c35b2013af1f1821bcac12ba3959674
>  - http://autobuild.buildroot.org/results/0349c6bfd66f5e50429e4a5cc07fb7abf2b07345
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dmraid/dmraid.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
