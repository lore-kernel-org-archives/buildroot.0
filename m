Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05AAC5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C6E360784;
	Mon, 26 Aug 2024 16:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6C9P4ZcIhh6Q; Mon, 26 Aug 2024 16:34:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DCE460786
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DCE460786;
	Mon, 26 Aug 2024 16:34:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECD5C1BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE2480EF8
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVRvOR8r7aVU for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:34:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1E1580D31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1E1580D31
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C1E1580D31
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:34:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B0F4240003;
 Mon, 26 Aug 2024 16:33:58 +0000 (UTC)
Date: Mon, 26 Aug 2024 18:33:57 +0200
To: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Message-ID: <20240826183357.4a8c0418@windsurf>
In-Reply-To: <20240826131025.17969-1-wdouglass@carnegierobotics.com>
References: <20240824090753.551ad073@windsurf>
 <20240826131025.17969-1-wdouglass@carnegierobotics.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724690038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fsB+CV+8DYl7WoRY9lHzVGfHrx7i1NDapOcNpYXyqGk=;
 b=E5XCBh3u1CjFmlzURJG9XvjPZ4LUVhImv5CniHnlUTzJyBgmH+svw8i3a6X+Y5+mrogmbv
 NY+tw+Cyenb3O9E/aZaOEpCoFx6TKAAP+Jqp+FZ6bWFv+GomnmHG81wpRqCXlGhI9854xL
 EG6T/jNSwazeZKQmeVJVuOzT0X8L087/5td57OkB54uUYyl2IB75G+ZZPAng4iIA6cdTtn
 RtU2cKSHlfzFRCdrOWLo4qhpjr6qDk6yJ6GNlFOMdTLEcjkZrawCd0Ke5wsAqSjoPZMtSA
 eVGtMHGIQGUtBwgmTfGAuafnJuYUBiYc/C+2cvI7sxcD3gZITbdwpGv3J2u0Mw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=E5XCBh3u
Subject: Re: [Buildroot] [PATCH v4] package/chicken: security bump to 5.4.0
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

On Mon, 26 Aug 2024 09:10:25 -0400
Woodrow Douglass via buildroot <buildroot@buildroot.org> wrote:

> This release includes a fix for CVE-2022-45145. Also, a copyright date
> in the LICENSE file changed, so the hash for it has changed too.
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> 
> --
> Changes v3 -> v4:
>   - Fix incorrect license hash
> 
> Changes v2 -> v3:
>   - Add this changelog to commit message
>   - Add Signed-off-by to commit message
> 
> Changes v1 -> v2:
>   - Update version numbers in hash file
> 
> Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> ---
>  package/chicken/chicken.hash | 6 +++---
>  package/chicken/chicken.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
> index 5a553da792..bf2ea6902d 100644
> --- a/package/chicken/chicken.hash
> +++ b/package/chicken/chicken.hash
> @@ -1,4 +1,4 @@
> -# From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
> -sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
> +# From https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz.sha256
> +sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.4.0.tar.gz
>  # Locally computed
> -sha256  b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37  LICENSE
> +sha256  c0ed699d5c4a8687f90a6488244f7f57d48a7f2d42bb7461b08a0d69a07d4f58  LICENSE
> \ No newline at end of file

^^^ There was a minor issue here with the missing new line. This is
spotted by "make check-package":

WARNING: package/chicken/chicken.hash:4: missing newline at end of file

I fixed that up, and applied to master. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
