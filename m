Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53A0CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABD4A42EB2;
	Sat, 30 May 2026 14:20:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sxm8Ok2NWUev; Sat, 30 May 2026 14:20:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A2A42EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780150800;
	bh=vy68YE5pA0q4+YujgBX8W3qdRxjLZR1c/v8fWX8yIbc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hpgl++GliEAyRHT5SqB6J5JkEIHG8wEdirFuz5/354ynCkJBsqFdgAHLRlONta1Sr
	 If76eDzi8j3PsOLWmKd4JhRg4pqzFJR83eOEa6yBvI0fAk5S8G+GTA7F1e9/lJvehl
	 YBgaw5PyKzaBCJH+emY4dS1I1XpJZpdQPG1BiRIHReGhDDOeDVZByy7+IKVlup45yk
	 IgpAVynhvNLcozKvCVOHTmEQI9rrv9OWKRaTXVLxr/Xsn/meYnWep4qS2m72U4HMoM
	 WEvpicDSZBzZrhdoMf1poYBGFEkDy+2FtwOKV0VjxraoD1htwF4agB02udATxXF0QJ
	 ZmTlClkMGPgSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A2A42EB3;
	Sat, 30 May 2026 14:20:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E346012F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8F4F40346
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uLQw4RWjL7yB for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:19:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CFEC04025D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFEC04025D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CFEC04025D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:19:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5E9CF4E42DA4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:19:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1DB496073B;
 Sat, 30 May 2026 14:19:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E48B10888CD4; 
 Sat, 30 May 2026 16:19:53 +0200 (CEST)
Date: Sat, 30 May 2026 16:19:53 +0200
To: Vincent Cruz <mooz@blockos.org>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>, 
 James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ahrxiPDzbmY2LC9V@windsurf>
References: <20260416102643.1347452-1-mooz@blockos.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260416102643.1347452-1-mooz@blockos.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780150794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=HYz3FnEhYBioBcEvp61it3AmPeUwi+Hv9qVbjltVKog=;
 b=wAPWkMWaU70I3Ah5XLYPjObJUe0MbhsrUIXWQEb5JwFossCkopGd/GmosR8O+Nvt2fj+Y1
 dWctzP/AD8r4j/naMox8QwcHEQnkCYU9F2V6ItLFbbCKedBS9lNmv5lg+mc71z9bLKYDcm
 BipHgVRnaBtqvP8h/rZonapb+uIhYmKWv5xIVFEWXCt37P0fm8LwToV+oERJJQprVJ6b2W
 NCwdJ08MDcBx9+NdauoiwxkYlv0nlfdpiRi+lYz8ERDu1yYd1fLMhdUpRr3cQa7phVynBl
 VumojIAVpSRdktW7TszwC9oteVVVchv/0g0niM2r4Bnlwsv5vbJjNWCOXwv0rQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=wAPWkMWa
Subject: Re: [Buildroot] [PATCH v2 1/1] package/python-libyang: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

Thanks for submitting this patch, which I have applied to next after
doing some changes. See below.

On Thu, Apr 16, 2026 at 12:24:21PM +0200, Vincent Cruz wrote:

> diff --git a/package/python-libyang/Config.in b/package/python-libyang/Config.in
> new file mode 100644
> index 0000000000..c314beb0ea
> --- /dev/null
> +++ b/package/python-libyang/Config.in
> @@ -0,0 +1,19 @@
> +config BR2_PACKAGE_PYTHON_LIBYANG
> +	bool "python-libyang"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libyang
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libyang
> +	depends on !BR2_STATIC_LIBS # libyang
> +	select BR2_PACKAGE_LIBYANG
> +	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	help
> +	  Python CFFI bindings for the libyang YANG library.
> +
> +	  This package provides the 'libyang' Python module, used by
> +	  higher-level tooling such as python-sysrepo.
> +
> +	  https://github.com/CESNET/libyang-python
> +
> +comment "python-libyang needs libyang"
> +	depends on !BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_STATIC_LIBS

This is not the correct way of providing dependency comments. We don't
care about the libyang dependency being commented on because you're
selecting libyang. We need comments about toolchain dependencies.

Changed to:

+comment "python-libyang needs a toolchain w/ threads, dynamic library"
+       depends on !BR2_TOOLCHAIN_HAS_SYNC_4
+       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS

> diff --git a/support/testing/tests/package/test_python_libyang.py b/support/testing/tests/package/test_python_libyang.py
> new file mode 100644
> index 0000000000..c485de2a67
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_libyang.py
> @@ -0,0 +1,26 @@
> +import os
> +from xml.etree import ElementTree
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestPythonLibyang(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_LIBYANG=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_libyang.py"]
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +
> +        cmd = self.interpreter + " " + os.path.basename(self.sample_scripts[0])
> +        output, exit_code = self.emulator.run(cmd, timeout=15)
> +        self.assertEqual(exit_code, 0)
> +
> +        tree = ElementTree.fromstringlist(output)
> +        self.assertEqual(tree.tag, '{urn:example}data')
> +        self.assertEqual(tree.find('.//{*}hostname').text, 'foobar')
> +        self.assertEqual(len(tree.find('.//{*}interface')), 2)

Rather than overriding test_run() to be able to run your custom logic
after running the same Python script, I've moved the XML validation
logic inside the sample Python script itself:

+xml = node.print_mem('xml', pretty=True)
+tree = ElementTree.fromstringlist(xml)
+assert tree.tag == '{urn:example}data'
+assert tree.find('.//{*}hostname').text == 'foobar'
+assert len(tree.find('.//{*}interface')) == 2

Committed to next with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
