Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFC5CFB43F
	for <buildroot@archiver.kernel.org>; Sun,  6 Oct 2024 13:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 698A1810E6;
	Sun,  6 Oct 2024 13:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huC4grmxY-Ip; Sun,  6 Oct 2024 13:54:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 685FD81119
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 685FD81119;
	Sun,  6 Oct 2024 13:54:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61D8C1BF325
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 13:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 50684606E8
 for <buildroot@lists.busybox.net>; Sun,  6 Oct 2024 13:54:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaZXb3X-qIJJ for <buildroot@lists.busybox.net>;
 Sun,  6 Oct 2024 13:54:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A93560623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93560623
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A93560623
 for <buildroot@buildroot.org>; Sun,  6 Oct 2024 13:54:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-37ccebd7f0dso2356787f8f.1
 for <buildroot@buildroot.org>; Sun, 06 Oct 2024 06:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728222885; x=1728827685;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gTAlDdEFn1J6elndGKjqMjVVl7mmSY0pjYhXIJC1Emk=;
 b=lGfXbHcxzM7FetDO//i/lTLQtT8UvK6sb8vBnZ0n0R/T21yS6IASZDbFwjHy1VpIDe
 T1VsknnoRYRt0dBfmucsJB2KAMTVb10+c9auI2wvIKO1CIQePs7in6sStr84azjsSM1I
 H9qz2UmBkBN1Gks3gSqqi4Io/tvF4BhOGCatm8MiAvmWNuKPsZJWORvGrQNrMHfuQOis
 OkCRAHkF8Dw1TaHM200sfPD3pHIhZsisSzsj1dsLIPG9rBWOu0XSNF1s1kmS/dhU/rNW
 KYKBpvIzNjoAoFgeFlHb5cI3qN9P8SJx4Y3YlxfW0tcQ3lUXSNRzD9mmrqnk4eq3RnC3
 HzWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB/yS8KAG8X0Eg4YLD9twmJ8gFYJwDO6MUxSF7Q82N9EeAlJLjkf43Rm+ppJi4nU7Xr8DoCchDtw0=@buildroot.org
X-Gm-Message-State: AOJu0Yzxh/pgHL5XBwr40GujdlxU2lLNB/S1YX/6iZuRRHh9V7o4CIPB
 CtJ2ZaiW5I8Y/Ak+veKs0nH0riezfbsOxXrx8TFpmQ88HVhXfQcsfuQNr7k4TX4=
X-Google-Smtp-Source: AGHT+IGVNo94HqjUyWxNqDlpI3XSIvbzXxHEdFLjd3IBMa4s4w+acUmw3zx/td7adwNII9frl8zTuw==
X-Received: by 2002:adf:ec03:0:b0:374:c11c:c5c3 with SMTP id
 ffacd0b85a97d-37d0e7d3e2amr4980824f8f.41.1728222884974; 
 Sun, 06 Oct 2024 06:54:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f8671933fsm67536855e9.1.2024.10.06.06.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Oct 2024 06:54:44 -0700 (PDT)
Message-ID: <f5b8a448-612d-46e7-a5c4-e4b9dfb82e91@mind.be>
Date: Sun, 6 Oct 2024 15:54:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@gmail.com>, buildroot@buildroot.org
References: <20241005-dtc-1-7-1-v1-0-89550f828a4c@gmail.com>
 <20241005-dtc-1-7-1-v1-1-89550f828a4c@gmail.com>
Content-Language: en-GB
In-Reply-To: <20241005-dtc-1-7-1-v1-1-89550f828a4c@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728222885; x=1728827685; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gTAlDdEFn1J6elndGKjqMjVVl7mmSY0pjYhXIJC1Emk=;
 b=A6OuMpQk97oferLGG/JMddZVia/kDcsaDAx0KiD8RhjZc9NKBnNPZOR93QkdfXwJe9
 nxprJ6FTsrPhrO+bv+AzgWyxC8VhCjERL7HmaWpRewNTUcYToMWkX8tB300Mezbrpl71
 UqKuCsBaz9u7B2zYPBe6KNyqUD/pHTwMmJQP7e2KX6EQjNGAQ6L+hMX25Go/37RyGcty
 /1TzT8/KZiDLTJgSPAQQcA4YpNJywUXjHb87xe1qedUrDQsHQfGzjXN2apBROnnB/ebL
 e2nVkiT9tEkj+OC7otTu2wKSjZvaR8UeTviXzi4qpfH1htAZKIiwuBopdpcGFEvTYxrS
 o3Yw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=A6OuMpQk
Subject: Re: [Buildroot] [PATCH RESEND 1/2] support/testing: add new test
 for dtc
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/10/2024 18:58, Brandon Maier wrote:
> Add a test that runs the dtc commandline tools. To test devicetree
> compilation, we use an example devicetree from the dtc project. The
> example source is GPL-2.0+ licensed.
> 
> Signed-off-by: Brandon Maier <brandon.maier@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/package/test_dtc.py          | 40 ++++++++++++++++++
>   .../package/test_dtc/rootfs-overlay/test_tree1.dts | 48 ++++++++++++++++++++++
>   2 files changed, 88 insertions(+)
> 
> diff --git a/support/testing/tests/package/test_dtc.py b/support/testing/tests/package/test_dtc.py
> new file mode 100644
> index 0000000000000000000000000000000000000000..75dbd4a779f5baab9ef40d6ad100ca693f97c0b9
> --- /dev/null
> +++ b/support/testing/tests/package/test_dtc.py
> @@ -0,0 +1,40 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestDtc(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_DTC=y
> +        BR2_PACKAGE_DTC_PROGRAMS=y
> +        BR2_ROOTFS_OVERLAY="{}"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        """.format(
> +           # overlay to add a bats test suite
> +           infra.filepath("tests/package/test_dtc/rootfs-overlay"))
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv7",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +
> +        self.emulator.login()
> +
> +        # Test 'dtc'
> +        self.assertRunOk("dtc -I dts -O dtb -o /tmp/test_tree1.dtb /test_tree1.dts")
> +
> +        # Test 'fdtdump'
> +        self.assertRunOk("fdtdump /tmp/test_tree1.dtb")
> +
> +        # Test 'fdtget'
> +        out, exit_code = self.emulator.run("fdtget -t s /tmp/test_tree1.dtb / compatible")
> +        self.assertEqual(out[0].strip(), "test_tree1")
> +
> +        # Test 'fdtput'
> +        self.assertRunOk("fdtput -t s /tmp/test_tree1.dtb / compatible 'test set compatible'")
> +        out, exit_code = self.emulator.run("fdtget -t s /tmp/test_tree1.dtb / compatible")
> +        self.assertEqual(out[0].strip(), "test set compatible")
> +
> diff --git a/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts b/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..6649e7cc0fedc52e15dc7de7dd726272d3349c48
> --- /dev/null
> +++ b/support/testing/tests/package/test_dtc/rootfs-overlay/test_tree1.dts
> @@ -0,0 +1,48 @@
> +/* From https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/tests/test_tree1.dts?id=99031e3a4a6e479466ae795790b44727434ca27d */
> +
> +/dts-v1/;
> +
> +/memreserve/ 0xdeadbeef00000000 0x100000;
> +/memreserve/ 123456789 010000;
> +
> +/ {
> +	compatible = "test_tree1";
> +	prop-int = <0xdeadbeef>;
> +	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
> +	prop-str = "hello world";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	subnode@1 {
> +		compatible = "subnode1";
> +		reg = <1>;
> +		prop-int = [deadbeef];
> +
> +		subsubnode {
> +			compatible = "subsubnode1", "subsubnode";
> +			placeholder = "this is a placeholder string", "string2";
> +			prop-int = <0xdeadbeef>;
> +		};
> +
> +		ss1 {
> +		};
> +	};
> +
> +	subnode@2 {
> +		reg = <2>;
> +		linux,phandle = <0x2000>;
> +		prop-int = <123456789>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ssn0: subsubnode@0 {
> +			reg = <0>;
> +			phandle = <0x2001>;
> +			compatible = "subsubnode2", "subsubnode";
> +			prop-int = <0726746425>;
> +		};
> +
> +		ss2 {
> +		};
> +	};
> +};
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
