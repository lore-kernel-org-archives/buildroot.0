Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F144C6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FA44062A;
	Sun, 24 Mar 2024 17:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ld84HL1QrsvA; Sun, 24 Mar 2024 17:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0E064056A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0E064056A;
	Sun, 24 Mar 2024 17:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6101BF4D6
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A85640469
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFD3F_VwQTVE for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9296F4056A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9296F4056A
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9296F4056A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:01:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41477211086so28226725e9.1
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 10:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711299682; x=1711904482;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rIUuJUdxrMdeHqDVSnTr0upBbPPtQZTNf46qxyZgzPE=;
 b=j0UhytGnM+ObJcb2W+cAjKq0vq5lGmo8/dfchupa6zOSGPWJVkLLYQ9mlaLblJjus6
 0ScoLoFpHn7QNrK/MHffuqfu2C8TwEh9iik+2Xd+jd0xg0bTxgwLEh/AZ6k60E5OEAtk
 6B7P2bgbdZjlEkGetgM6ocAm4MXV24bRMt5MVuz9507dc6iX+LaVjWyLmsUgOLhOkW47
 3t6/NUGLhtYG8T2nHihL7er7W/PDlZH/QegHMzXbTC7k8afSWs6dUyqYGmsXROckKNou
 350c4+Rq0rLVUridsfbdHnitFVpIRhOqxrAfnxj7cu+hY/cUCYNpzzcV4bWtpCVZz/Ik
 MZ0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdqk+najAv5XdZ+BCtX8XBTALCd0TYy1OFnunEDWZ/pbDU4NropD2CJLZh+69Wo/lJb20pX4nOL0lQl5/nQfZZtKLJRLA6FQ==
X-Gm-Message-State: AOJu0YwwZEug8d7S1hu97GtIpN+yVZ2Bn2i3vWlG01llKgi5I3C0Jqtp
 DnqUv5luWdD6Yqb62CnjylLpxSb7590YOwlxvT8aYCYriK24538d/mMW2q+Qpus=
X-Google-Smtp-Source: AGHT+IFZ0jefY6vXcTP31Y5Y0YoVcJxcmGS/RwLNTqO4nqrn1axd/7Up+nGQcVgvQGPXeOd91RmzDA==
X-Received: by 2002:a05:600c:210a:b0:414:69be:54a7 with SMTP id
 u10-20020a05600c210a00b0041469be54a7mr5071332wml.41.1711299682141; 
 Sun, 24 Mar 2024 10:01:22 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a05600c3b9800b004147b3e3bedsm5711203wms.12.2024.03.24.10.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Mar 2024 10:01:21 -0700 (PDT)
Message-ID: <ec9de2b8-362b-4f31-a31b-51d8ca5cf274@mind.be>
Date: Sun, 24 Mar 2024 18:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240315210501.807023-1-ju.o@free.fr>
In-Reply-To: <20240315210501.807023-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1711299682; x=1711904482; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rIUuJUdxrMdeHqDVSnTr0upBbPPtQZTNf46qxyZgzPE=;
 b=cywf0UrWG6hGvpzUk6f0+9SODFEGTMymeYvyPYfh1RqTCPkbFaLbPyYw8AqwdVrtJP
 Z+qhD5DLu5sw6j/XgQaNpdg6OIc+VO4qsSyk42vzY4/5INEDda6UUO9QiooFhCHBXuwU
 A94xLiUkoiOEWjjaCjB/dXOrli20rK1MRd+vxs2J8NPotw/COkSWfoEnWhTNzdF4RY+1
 lq7UOycE6HLh4wWbgXHGm+x6tagSv5jafgzgsDitGdAe2csq3zKvQ2fMcOQq6IHBb+LX
 QC8DuMloNumAXSL2ZgvejaLZZFHnqgdn+ZhDOTcab3Zvnk3M2TKMJMioviemJAGgn/Yi
 aO5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cywf0UrW
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: add bitcoin runtime
 test
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



On 15/03/2024 22:05, Julien Olivain wrote:
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Note:
> In order to work, this patch needs the bitcoin wallet support
> proposed in:
> https://patchwork.ozlabs.org/project/buildroot/patch/20240312183836.411083-1-ju.o@free.fr/

  Good that you added this note, I wouldn't have noticed otherwise.

  Even better would be if you had marked that patch as superseded, then sent 
both together as a series.

  Anyway, applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS                                    |   1 +
>   support/testing/tests/package/test_bitcoin.py | 184 ++++++++++++++++++
>   2 files changed, 185 insertions(+)
>   create mode 100644 support/testing/tests/package/test_bitcoin.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a6364cdd441..3f6a3ccf4f2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1770,6 +1770,7 @@ F:	support/testing/tests/package/test_acpica.py
>   F:	support/testing/tests/package/test_acpica/
>   F:	support/testing/tests/package/test_apache.py
>   F:	support/testing/tests/package/test_bc.py
> +F:	support/testing/tests/package/test_bitcoin.py
>   F:	support/testing/tests/package/test_brotli.py
>   F:	support/testing/tests/package/test_bzip2.py
>   F:	support/testing/tests/package/test_compressor_base.py
> diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
> new file mode 100644
> index 00000000000..93aa9383ab6
> --- /dev/null
> +++ b/support/testing/tests/package/test_bitcoin.py
> @@ -0,0 +1,184 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestBitcoin(infra.basetest.BRTest):
> +    # infra.basetest.BASIC_TOOLCHAIN_CONFIG cannot be used as it does
> +    # not include BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
> +    # needed by bitcoin. This config also uses an ext4 rootfs as
> +    # bitcoind needs some free disk space to start (so we avoid having
> +    # a larger initrd in RAM).
> +    config = \
> +        """
> +        BR2_aarch64=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.81"
> +        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
> +        BR2_PACKAGE_BITCOIN=y
> +        BR2_PACKAGE_BITCOIN_WALLET=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +    # Command prefix for the bitcoin command line interface.
> +    cli_cmd = "bitcoin-cli -regtest"
> +
> +    def create_btc_wallet(self, wallet_name):
> +        """Create an empty wallet."""
> +        cmd = f"{self.cli_cmd} -named createwallet wallet_name={wallet_name}"
> +        self.assertRunOk(cmd)
> +
> +    def gen_btc_address(self, wallet_name):
> +        """Generate an address in a wallet."""
> +        cmd = f"{self.cli_cmd} -rpcwallet={wallet_name} getnewaddress"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        return out[0]
> +
> +    def init_wallet(self, wallet_name):
> +        """Create a wallet and generate an address in it."""
> +        self.create_btc_wallet(wallet_name)
> +        return self.gen_btc_address(wallet_name)
> +
> +    def get_wallet_balance(self, wallet):
> +        """Return the (confirmed) balance of a wallet."""
> +        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getbalance"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        return float(out[0])
> +
> +    def get_wallet_unconfirmed_balance(self, wallet):
> +        """Return the unconfirmed balance of a wallet."""
> +        cmd = f"{self.cli_cmd} -rpcwallet={wallet} getunconfirmedbalance"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        return float(out[0])
> +
> +    def get_block_count(self):
> +        """Returns the height of the most-work fully-validated chain."""
> +        cmd = f"{self.cli_cmd} getblockcount"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        return int(out[0])
> +
> +    def test_run(self):
> +        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
> +        kern = os.path.join(self.builddir, "images", "Image")
> +        self.emulator.boot(arch="aarch64",
> +                           kernel=kern,
> +                           kernel_cmdline=["root=/dev/vda console=ttyAMA0"],
> +                           options=["-M", "virt",
> +                                    "-cpu", "cortex-a53",
> +                                    "-m", "256M",
> +                                    "-drive", f"file={drive},if=virtio,format=raw"])
> +        self.emulator.login()
> +
> +        # Values for the test.
> +        wallet1 = "AliceWallet"
> +        wallet2 = "BobWallet"
> +        btc_test_amount = 10
> +        btc_fee = 0.00001
> +        req_blk_count = 101
> +
> +        # Check the binary can execute.
> +        self.assertRunOk("bitcoind --version")
> +
> +        # This cleanup is useful when run-test -k is used. It makes
> +        # this test idempotent. Since the drive storage is preserved
> +        # between reboots, this cleanup will make sure the test always
> +        # starts from a clean state.
> +        cmd = "rm -rf ~/.bitcoin"
> +        self.assertRunOk(cmd)
> +
> +        # The bitcoin daemon is not started. A client ping is expected
> +        # to fail.
> +        ping_cmd = f"{self.cli_cmd} ping"
> +        _, ret = self.emulator.run(ping_cmd)
> +        self.assertNotEqual(ret, 0)
> +
> +        # Start the daemon.
> +        cmd = f"bitcoind -regtest -daemonwait -fallbackfee={btc_fee:f}"
> +        self.assertRunOk(cmd)
> +
> +        time.sleep(2 * self.timeout_multiplier)
> +
> +        # Now the daemon is started, the ping is expected to succeed.
> +        self.assertRunOk(ping_cmd)
> +
> +        # We create two wallets and addresses.
> +        btc_addr1 = self.init_wallet(wallet1)
> +        btc_addr2 = self.init_wallet(wallet2)
> +
> +        # Since the regression test block chain is at its genesis
> +        # block, we expect a height of zero.
> +        cur_blk_cnt = self.get_block_count()
> +        self.assertEqual(cur_blk_cnt, 0)
> +
> +        # We also expect our wallets to be empty.
> +        for wallet in [wallet1, wallet2]:
> +            balance = self.get_wallet_balance(wallet)
> +            self.assertAlmostEqual(balance, 0.0)
> +
> +        # We request the generation of several blocks for address
> +        # #1. We should receive the 50 BTC reward at this address.
> +        cmd = self.cli_cmd
> +        cmd += f" generatetoaddress {req_blk_count} {btc_addr1}"
> +        self.assertRunOk(cmd)
> +
> +        # We should now see the previously created blocks.
> +        cur_blk_cnt = self.get_block_count()
> +        self.assertEqual(cur_blk_cnt, req_blk_count)
> +
> +        # We should also see the 50 BTC reward in the wallet #1.
> +        balance = self.get_wallet_balance(wallet1)
> +        self.assertAlmostEqual(balance, 50.0)
> +
> +        # The wallet #2 should still be empty.
> +        balance = self.get_wallet_balance(wallet2)
> +        self.assertAlmostEqual(balance, 0.0)
> +
> +        # We send an amount from wallet #1 to #2.
> +        cmd = f"{self.cli_cmd} -rpcwallet={wallet1}"
> +        cmd += f" sendtoaddress {btc_addr2} {btc_test_amount}"
> +        self.assertRunOk(cmd)
> +
> +        # The wallet #1 balance is expected to be subtracted by the
> +        # spent amount and the transaction fees.
> +        expected_balance = 50 - btc_test_amount - btc_fee
> +        balance = self.get_wallet_balance(wallet1)
> +        self.assertAlmostEqual(balance, expected_balance, places=4)
> +
> +        # The transaction is sent, but not confirmed yet. So we should
> +        # still see a (confirmed) balance of zero.
> +        balance = self.get_wallet_balance(wallet2)
> +        self.assertAlmostEqual(balance, 0.0)
> +
> +        # We should see the transferred amount in the unconfirmed
> +        # balance.
> +        balance = self.get_wallet_unconfirmed_balance(wallet2)
> +        self.assertAlmostEqual(balance, btc_test_amount)
> +
> +        # We generate 1 block to address #2. This action will confirm
> +        # the previous transaction (but this will not give the 50 BTC
> +        # reward).
> +        cmd = f"{self.cli_cmd} generatetoaddress 1 {btc_addr2}"
> +        self.assertRunOk(cmd)
> +
> +        # We should see one more block.
> +        cur_blk_cnt = self.get_block_count()
> +        self.assertEqual(cur_blk_cnt, req_blk_count + 1)
> +
> +        # We should now see the amount in the confirmed balance.
> +        balance = self.get_wallet_balance(wallet2)
> +        self.assertAlmostEqual(balance, btc_test_amount)
> +
> +        # The unconfirmed balance should now be zero.
> +        balance = self.get_wallet_unconfirmed_balance(wallet2)
> +        self.assertAlmostEqual(balance, 0.0)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
