Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ECFD0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A44D440E4B;
	Wed,  7 Jan 2026 17:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izKqZwy8MScB; Wed,  7 Jan 2026 17:50:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58A140E3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808255;
	bh=cDtE9KReO3raOVzTzFfhOyZNSulbz+fmaPnXXuaRKxI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WhT/zPyCvBbJ20ht1qdSIZwixU/DYGoCXlAZFc1Gjx5wPdwyXdhNffPkfbvP3/h8T
	 svBElnEbTDiEEInNKTvIiKDuiWJu3DcDMIlvsQdzuTMYEfssAVpTPPJLrKVSKVUD87
	 8WdINsCwFLZ52+ZfPPCVgF5pqttlXjaxlMb0ZxgRrL/NY0B5EbIPw8WK+PC+o7TMtK
	 230gnLDUyi5s+bcLv+k0d2ywJ4PHJwfzTw5r1asUkiaal8A9u1bqRIBHcc1f+YELKl
	 gKJh7xFvbrTNXN9CIRIefmvRwQssYaoyWFplN/Qan0UFz8VLknKe5R7pkM2qO6/15p
	 Pt8E6Zmu48NPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E58A140E3F;
	Wed,  7 Jan 2026 17:50:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 282A125B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A2AD80885
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUyx208RUuM6 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:50:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1B301807D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B301807D6
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B301807D6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5AA52B97A192; Wed,  7 Jan 2026 18:50:50 +0100 (CET)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:50:48 +0100
Message-ID: <20260107175048.226958-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222172638.839720-2-buildroot@bubu1.eu>
References: <20251222172638.839720-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808250; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=MHJXWF7ybgiTBe7/6qD/iXAXbB95YFR19OYOI/p4cTA=;
 b=OwHONlCwvvEcemR3udSO6vq9aBOQVDVziZ3/DW1zXtgX/GmAOUSIeGsggGiV8lhaPKDQdM
 ypq79n8bgxw+OlMAGlhnV/imaB7Pcxnob0iy0RmWqQgwFGqRgXUv2UUhDQ4HirlKWsC/K8
 xO6aABZnldhDqtI+RCG295ExjgOqkCJxO4Xqz6xCXI8HcZMHpjqUTioHckHPMPSTceODMm
 +X6Y8muVoRTiaiWq9TXc//0R0ZOOjz8hERX5vzXe4MrsSIov8TTWBHp1cwwt/VLkTUk9Ho
 +gsewVaTHv+DzFIFj3oN+oWPnyaFzrb3mTOEId9qaDWs8lo+ouB0UaWt0SiSxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=OwHONlCw
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add libiio python
 bindings runtime test
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
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  .../tests/package/sample_libiio_bindings_python.py  |  3 +++
>  .../tests/package/test_libiio_bindings_python.py    | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_libiio_bindings_python.py
>  create mode 100644 support/testing/tests/package/test_libiio_bindings_python.py
> 
> diff --git a/support/testing/tests/package/sample_libiio_bindings_python.py b/support/testing/tests/package/sample_libiio_bindings_python.py
> new file mode 100644
> index 0000000000..74452192c2
> --- /dev/null
> +++ b/support/testing/tests/package/sample_libiio_bindings_python.py
> @@ -0,0 +1,3 @@
> +import iio
> +
> +assert len(iio.scan_contexts()) == 1
> diff --git a/support/testing/tests/package/test_libiio_bindings_python.py b/support/testing/tests/package/test_libiio_bindings_python.py
> new file mode 100644
> index 0000000000..e8cf5c3d13
> --- /dev/null
> +++ b/support/testing/tests/package/test_libiio_bindings_python.py
> @@ -0,0 +1,13 @@
> +from tests.package.test_python import TestPythonPackageBase
> +
> +
> +class TestLibiioBindingsPython(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_LIBIIO=y
> +        BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON=y
> +        """
> +    sample_scripts = ["tests/package/sample_libiio_bindings_python.py"]
> +    timeout = 10
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
