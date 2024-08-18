Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F210AC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:30:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B610C40277;
	Sun, 18 Aug 2024 07:30:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hDCCukfDndX; Sun, 18 Aug 2024 07:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54C6A40217
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54C6A40217;
	Sun, 18 Aug 2024 07:30:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22A041BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10FD460625
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oCEnu03d7TC for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:30:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ADC5360608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC5360608
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADC5360608
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:30:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8E00A13F86E;
 Sun, 18 Aug 2024 09:30:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 09:30:05 +0200
Date: Sun, 18 Aug 2024 09:30:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsGi_Y7X5FPPTLXU@landeda>
References: <20240817193733.858704-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817193733.858704-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723966210;
 bh=ja9NAEyQL+XTFx/zs8hpn5Qx4mdCesceO4EUz6DxnH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lQ5tEBnbAPOGqxGP7gVFHNp+ivhSF8tZExk6AHYKEDY0Mcz9a1D5dzU/TaxNImWO4
 T0tRjBFKzeslnWg09DO+Kp6GRaoX/coudzemmwa0VVGRz1E9j+lNbsbp8vb6XTOwON
 x4bHj7t4mN/QUUBdWAH1kxndGNNH83OjKKveVVwfJKcGvYzo96WPVizegd4gOTuJxK
 iuU2+JNhdPiCU3wdg4XjGtN6Ip6mNJECPp2XRxzPe5+QlRZYBimdL645gTnc7xhrjL
 2ukG5Na9eDyhKXiS2Cu/T5D0NH/VeY+c7HFEj7dDcjrBauHvkx5aTu7EZB6UNS+aTA
 FxcPfgNaY7ZXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lQ5tEBnb
Subject: Re: [Buildroot] [PATCH] package/python-huepy: add patch to fix
 LICENSE file installation
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-17 21:37 +0200, Thomas Petazzoni via buildroot spake thusly:
> The python-huepy has an incorrect data_files statement in its
> setup.py, causing the LICENSE file to be installed directly as
> $(TARGET_DIR)/LICENSE. This was detected because several packages were
> doing this, and the second package doing
> it (python-unittest-xml-reporting, fixed separately) was erroring out
> when trying to overwrite this already existing file.
> 
> This commit fixes the case of python-huepy by adding a patch that has
> been submitted upstream.
> 
> There are no autobuilder failures related to python-huepy, but this
> was detected while fixing
> http://autobuild.buildroot.net/results/2c91243b440087bbc7d051d65f553f59d05dd207/
> for python-unittest-xml-reporting.
> 
> This bug has been in huepy since at least 2018, so this patch can be
> backported to previous Buildroot versions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ta_files-installs-LICENSE-to-incorre.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
> 
> diff --git a/package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
> new file mode 100644
> index 0000000000..3c50a44377
> --- /dev/null
> +++ b/package/python-huepy/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
> @@ -0,0 +1,38 @@
> +From ee3010004a005bc852e6b9318807f373bd89e901 Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sat, 17 Aug 2024 14:10:16 +0200
> +Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
> + place
> +
> +The data_files statement in the setup() calls installs the LICENSE
> +file in the wrong place: in /usr/LICENSE, or even /LICENSE depending
> +on the configuration.
> +
> +So let's drop this, and let setuptools install the LICENSE file
> +automatically: since setuptools v56, the license_files attribute is
> +automatically assigned to a default value, which includes "LICENSE",
> +so there is in fact nothing to do to the get the LICENSE file
> +installed at the correct location. See
> +https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
> +
> +Upstream: https://github.com/s0md3v/huepy/pull/42
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 8b5a726..bd41f1c 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -30,7 +30,6 @@ setup(
> +     keywords='hue, color, terminal color, colorama',
> +     packages=find_packages(),
> +     py_modules=['huepy'],
> +-    data_files=[('', ['LICENSE'])],
> +     include_package_data=True,
> +     classifiers=[
> +         'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
> +-- 
> +2.46.0
> +
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
