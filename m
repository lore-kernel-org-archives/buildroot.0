Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3685C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 21:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90EA381F6D;
	Thu, 18 Jul 2024 21:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EJtZ1jPu41U2; Thu, 18 Jul 2024 21:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B9681F22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B9681F22;
	Thu, 18 Jul 2024 21:38:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA8131BF3A1
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B470F40992
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 21:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8V3ERMEERNkM for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 21:38:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 182A940974
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182A940974
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 182A940974
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 21:38:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2387B240002;
 Thu, 18 Jul 2024 21:38:08 +0000 (UTC)
Date: Thu, 18 Jul 2024 23:38:07 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240718233807.1027677e@windsurf>
In-Reply-To: <20240716175037.1844929-3-james.hilliard1@gmail.com>
References: <20240716175037.1844929-1-james.hilliard1@gmail.com>
 <20240716175037.1844929-3-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721338688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+moi1YufVEjmT78jK3bglFp5j4nInVgc58JUgaZ7GY=;
 b=VkrAQwO7sAHTYtxj00Y97tKCkzfH42Wn3Q7zQe9VsNvXqHtPMIpOCYcNIr96Ble1OSom8d
 xX+Ry1oQQh3rLJKNpPjUGvJ24LK0KTI9ZMNy8DmSCskOOETkK8iL4rFS3kGkcrd27fUIGJ
 Ei7ED1g+GIYUNYwNXWfqf4IU6MR56ST4Ja1yh1drCP5kDliuRyC5vcT+Bv6y01COKnBKb7
 iZPimHp4M/QBTCqk2mIPlKjeAwIGpqsvwmo3LaUUW6c0bTqRrNNriBGUReGHNHFSdfeTQR
 udzwXs1WXubgigqC7nsBQBoXQCdqbXDs+YgkY6UGcW6FpOZB072R5PXrS5KxSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=VkrAQwO7
Subject: Re: [Buildroot] [PATCH v3 3/5] package/python-uswid: new host
 package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Tue, 16 Jul 2024 11:50:35 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-uswid/python-uswid.hash |  5 +++++
>  package/python-uswid/python-uswid.mk   | 18 ++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 package/python-uswid/python-uswid.hash
>  create mode 100644 package/python-uswid/python-uswid.mk

Thanks for this new iteration. However, fwupd-efi still fails to build,
which I believe is due to a missing feature in host-python3:

>>> fwupd-efi 1.6 Building
GIT_DIR=. PATH="/home/thomas/projets/buildroot/output/host/bin:/home/thomas/projets/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"  PYTHONNOUSERSITE=y /home/thomas/projets/buildroot/output/host/bin/ninja   -C /home/thomas/projets/buildroot/output/build/fwupd-efi-1.6//build
ninja: Entering directory `/home/thomas/projets/buildroot/output/build/fwupd-efi-1.6//build'
[4/9] Generating efi/fwup-sbom.o with a custom command
FAILED: efi/fwup-sbom.o 
/home/thomas/projets/buildroot/output/host/bin/uswid --cc /home/thomas/projets/buildroot/output/host/bin/arm-linux-gcc --objcopy /home/thomas/projets/buildroot/output/host/bin/arm-linux-objcopy --load efi/swid.xml --save efi/fwup-sbom.o
Traceback (most recent call last):
  File "/home/thomas/projets/buildroot/output/host/bin/uswid", line 5, in <module>
    from uswid.cli import main
  File "/home/thomas/projets/buildroot/output/host/lib/python3.12/site-packages/uswid/__init__.py", line 29, in <module>
    from uswid.format_uswid import uSwidFormatUswid
  File "/home/thomas/projets/buildroot/output/host/lib/python3.12/site-packages/uswid/format_uswid.py", line 14, in <module>
    import lzma
  File "/home/thomas/projets/buildroot/output/host/lib/python3.12/lzma.py", line 27, in <module>
    from _lzma import *
ModuleNotFoundError: No module named '_lzma'
[7/9] Generating efi/fwupdate.o with a custom command
ninja: build stopped: subcommand failed.

So it looks like host-python-uswid should select a (to be introduced)
BR2_PACKAGE_HOST_PYTHON3_XZ option?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
