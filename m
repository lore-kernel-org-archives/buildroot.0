Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A476C3DA45
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 07:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FD3B811D8;
	Mon, 15 Jul 2024 07:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_vGhwx4ENH2; Mon, 15 Jul 2024 07:45:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5456681174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5456681174;
	Mon, 15 Jul 2024 07:45:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51E3A1BF2B9
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BDE6810B4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 07:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9YHj4VB2gPC for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 07:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1215B81098
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1215B81098
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1215B81098
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:44:52 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so26428615e9.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 00:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721029491; x=1721634291;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zqKFaJzNLW/F0TxE7icOoSP6P7/Os98GmIy9GSKW+nw=;
 b=dBZndrxTL+uqUnDhYYz5YJ808CKWNuBE1uz0RM78UQOtEMTTj83PrtfyH3xikfwet4
 jILJqRH5Fss9fO2X36Hk3OGceIZ+GmU7U83DY8EqvYAc/+c1fyu3szFxSyTWimHQXftE
 1kxCcILYpoBxfyqJ1J+DmSZlqY/5UbRP2ztE9VHDmnciNVwQF/DTjCGOtATyth3vXsN8
 mabjTP3zpujE3qgiUZCd0cFHJwrg8IjjFGcek8z0dVDrQSI3wOFtWYHpytlExTI8+1Xb
 5O4+0jdYT4mOJPoQQ4kqw7EosRhSn4QmOhi/zj7hSnijTTLCLAmMCarPKA5H8Lm3nvYP
 afRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnefgXyeZrvMl//5irKbMSnJWd3O0tFMy4C+qHFcRqarlgBKKnv4GgfynIq9zR+rfJfXyQoKuoETZv0Stkx/f/aQ0W8s8g9g==
X-Gm-Message-State: AOJu0YxJww0qXmuYLztdyDi+ApB0BGmyuDpPUn6Tqf0Ob3KpKT44vGIJ
 Pfn8A89K8PPhGIQudZoVJt0ogeW8qjuISUVUOvNnkdkd8aweBXL22NIXto7r44WvsY+QGb5VZZx
 acjM=
X-Google-Smtp-Source: AGHT+IFamxtZJb0gOEPEJQSWa1rEdo4px820pvTDmsfOWycKckF8yMsgk/xWmxTOkOZFNiHfnTiM0w==
X-Received: by 2002:a05:600c:3b17:b0:427:abed:3602 with SMTP id
 5b1f17b1804b1-427abed3735mr21169235e9.24.1721029491137; 
 Mon, 15 Jul 2024 00:44:51 -0700 (PDT)
Received: from [10.3.160.38]
 (laubervilliers-656-1-158-76.w82-127.abo.wanadoo.fr. [82.127.106.76])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7751asm75899585e9.3.2024.07.15.00.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:44:50 -0700 (PDT)
Message-ID: <2acd64c7-b021-4e3f-96da-d5ee9d396d44@mind.be>
Date: Mon, 15 Jul 2024 00:12:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240208201559.112223-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240208201559.112223-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721029491; x=1721634291; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zqKFaJzNLW/F0TxE7icOoSP6P7/Os98GmIy9GSKW+nw=;
 b=S/QXSUo8oQ6m4H0KoqMefopo6/wL5L9+VNvN6qYpmLAGRk1FsZngv9iy65mYqiRK+Q
 FTg5MI70I3vOrHIZ4l384yCLVaFIPvuKMnUR3I/kEwn7fAXMljeejZlHhlw+HxmuC+pP
 4ierDIGmb/s6RZqsT0dzK2rIkpkNVc0+S1a+HdfibXVeKdMzhtAQYrp+Cg2OG620xv55
 1cuNH+0EcnCs097rE1nik7efoT7o+U/GHK7ywJ8OBKZIHOdZk28lS32hRLFr663V+l4G
 7/KI710gGfc81FfVEefoGJLP1fEC/kx1nriD4VZDUelC65oIPHmnpOEF7EKBaZPJl4zd
 g/ZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=S/QXSUo8
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add attr runtime test
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/02/2024 21:15, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                 |  1 +
>   support/testing/tests/package/test_attr.py | 75 ++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100644 support/testing/tests/package/test_attr.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1c6c84b05b..635d7aedd1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1767,6 +1767,7 @@ F:	support/testing/tests/package/test_acl.py
>   F:	support/testing/tests/package/test_acpica.py
>   F:	support/testing/tests/package/test_acpica/
>   F:	support/testing/tests/package/test_apache.py
> +F:	support/testing/tests/package/test_attr.py
>   F:	support/testing/tests/package/test_bc.py
>   F:	support/testing/tests/package/test_brotli.py
>   F:	support/testing/tests/package/test_bzip2.py
> diff --git a/support/testing/tests/package/test_attr.py b/support/testing/tests/package/test_attr.py
> new file mode 100644
> index 0000000000..1b43f7daf6
> --- /dev/null
> +++ b/support/testing/tests/package/test_attr.py
> @@ -0,0 +1,75 @@
> +import os
> +
> +
> +import infra.basetest
> +
> +
> +class TestAttr(infra.basetest.BRTest):
> +    # Note: this test uses extended attributes (xattr). We use a ext4
> +    # rootfs (which fully supports xattrs). Note that tmpfs has
> +    # partial support of xattrs, and cpio initrd has not.
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_ATTR=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        disk_file = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           kernel_cmdline=["rootwait", "root=/dev/sda"],
> +                           options=["-drive", f"file={disk_file},if=scsi,format=raw"])
> +        self.emulator.login()
> +
> +        # Check the programs can execute.
> +        self.assertRunOk("getfattr --version")
> +        self.assertRunOk("setfattr --version")
> +
> +        test_file = "/root/file.txt"
> +        attr_name = "buildroot"
> +        attr_value = "is-great"
> +
> +        # Create a test file.
> +        self.assertRunOk(f"echo 'Hello Buildroot!' > {test_file}")
> +
> +        # Set an extended attribute.
> +        cmd = f"setfattr -n user.{attr_name} -v {attr_value} {test_file}"
> +        self.assertRunOk(cmd)
> +
> +        # Read back the attribute value. We add an extra "echo" to add
> +        # a new line. getfattr --only-values prints raw attribute
> +        # values and lack of a new line.
> +        cmd = "getfattr"
> +        cmd += f" -n user.{attr_name} --absolute-names --only-values"
> +        cmd += f" {test_file} && echo"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], attr_value)
> +
> +        # We read back the attribute value again, but with the "attr"
> +        # command this time.
> +        cmd = f"attr -q -g {attr_name} {test_file} && echo"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], attr_value)
> +
> +        # List extended attributes with "attr", and check we see our
> +        # test attribute.
> +        cmd = f"attr -l {test_file}"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertIn(attr_name, "\n".join(out))
> +
> +        # Remove the test attribute with setfattr.
> +        cmd = f"setfattr -x user.{attr_name} {test_file}"
> +        self.assertRunOk(cmd)
> +
> +        # We check the test attribute is no longer listed by the attr
> +        # command.
> +        cmd = f"attr -l {test_file}"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertNotIn(attr_name, "\n".join(out))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
