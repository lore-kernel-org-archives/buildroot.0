Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363DDC52D7C
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 07:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6A3D40201;
	Sun, 18 Aug 2024 07:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xEPP-RiBZiD0; Sun, 18 Aug 2024 07:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6414440277
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6414440277;
	Sun, 18 Aug 2024 07:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4F7F1BF41A
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:31:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C30C760625
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 07:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVmiV8GfD3J3 for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 07:31:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A2B1460608
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2B1460608
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2B1460608
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 07:31:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9832B13F880;
 Sun, 18 Aug 2024 09:30:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Aug 2024 09:30:56 +0200
Date: Sun, 18 Aug 2024 09:30:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZsGjMBcBZGX4l-lm@landeda>
References: <20240817103345.769361-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240817103345.769361-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1723966260;
 bh=2uNSS7SUYrOJyjlIPtGknO5m1mNjGvrAHJ1Zf5br1OA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VrwYJ0aNelKg8XHg6JYrq8DNV8ZLVtBxj3PgaGi7i1Cc+h9bjptZNmZ8etMsS3hr5
 rA9DBtDJ11E3itOhH2UtXsuazUU3BOcF8fR7MBsTQMHrx6usJUE93NvSfdHX5rdMDZ
 jcJtnlBy1k9JVDCx58hPIIds8J9RAPNKz0JazVyXKTT3uqnfxq/ccMsc77fG2d45Ls
 1+O3VtpyspZab5CCvNQZRf4Zh5Kq9459yD6A12GDdBPWdabD1wywfzA0PssnN+AaPW
 hcUiRsDPdI9HUWqwBx5jgfQuQWq4FcYo1C/ulJDuLKNju1wKZwa7EbTBRrl+BiA3L5
 Sa10hBrgQBfrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VrwYJ0aN
Subject: Re: [Buildroot] [PATCH] package/python-unittest-xml-reporting: add
 patch to fix LICENSE file installation
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-17 12:33 +0200, Thomas Petazzoni via buildroot spake thusly:
> The LICENSE file gets installed directly to the root of $(TARGET_DIR),
> which clashes with other packages:
> 
> FileExistsError: File already exists: /home/autobuild/autobuild/instance-3/output-1/target/LICENSE
> 
> This commit fixes this issue for the python-unittest-xml-reporting
> package. Other fixes will be needed for the other patches.
> 
> The issue in python-unittest-xml-reporting was introduced in upstream
> commit c43427611390fba83ca13fbb5311bd8fece5048f, which first appeared
> in v3.1.0. We switched from a pre-3.1.0 version to 3.2.0 in Buildroot
> in commit 69ba1562d5bef8d58b430fd7d67d0f3e77acfefc, which was merged
> in 2023.02.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/2c91243b440087bbc7d051d65f553f59d05dd207/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ta_files-installs-LICENSE-to-incorre.patch | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
> 
> diff --git a/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
> new file mode 100644
> index 0000000000..4bc005f448
> --- /dev/null
> +++ b/package/python-unittest-xml-reporting/0001-setup.py-drop-data_files-installs-LICENSE-to-incorre.patch
> @@ -0,0 +1,40 @@
> +From 662cd67695c31126d72035a818b0f5f1da5a31ca Mon Sep 17 00:00:00 2001
> +From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Date: Sat, 17 Aug 2024 12:24:28 +0200
> +Subject: [PATCH] setup.py: drop data_files, installs LICENSE to incorrect
> + place
> +
> +As reported in issue
> +https://github.com/xmlrunner/unittest-xml-reporting/issues/284, the
> +data_files statement in the setup() calls installs the LICENSE file in
> +the wrong place: in /usr/LICENSE, or even /LICENSE depending on the
> +configuration.
> +
> +So let's drop this, and let setuptools install the LICENSE file
> +automatically: since setuptools v56, the license_files attribute is
> +automatically assigned to a default value, which includes "LICENSE",
> +so there is in fact nothing to do to the get the LICENSE file
> +installed at the correct location. See
> +https://setuptools.pypa.io/en/latest/history.html#v56-0-0.
> +
> +Upstream: https://github.com/xmlrunner/unittest-xml-reporting/pull/287
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + setup.py | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index c524ed4..afa5925 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -27,7 +27,6 @@ setup(
> +     description = 'unittest-based test runner with Ant/JUnit like XML reporting.',
> +     long_description = long_description,
> +     long_description_content_type = 'text/markdown',
> +-    data_files = [('', ['LICENSE'])],
> +     install_requires = ['lxml'],
> +     license = 'BSD',
> +     platforms = ['Any'],
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
