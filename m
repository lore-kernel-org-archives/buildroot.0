Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D6AECAAA1
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 20:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7390843F3;
	Sat, 17 Sep 2022 20:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7390843F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOSe2F9FY02b; Sat, 17 Sep 2022 20:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDA0E84018;
	Sat, 17 Sep 2022 20:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDA0E84018
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39C5B1BF39A
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1567784018
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 20:18:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1567784018
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmQLLctpGr9G for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 20:18:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 505F683F65
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 505F683F65
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 20:18:03 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k9so41265086wri.0
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=66NUFJzMo6x5+wW84ZizQOpPH0HrKRNfk3YH9GzgFg0=;
 b=qR+8dPIrIiWFMeCFxocnmUHpfZGdI0WBiwuxvjX63m2qKgVlx6K5WhvN9tHu3UJ3x0
 0unfJ8ckXAfudr+SBY8TKf8keKtk/efAZtU+2mpEdmHvS3Nf2h4Iv+gg9ObIDEjzMq+c
 xn15M39ixGpdXotUm3t42bOMjbN0CKf4Am70QWtkgf2bF16H75DtolfT4qEASbThnkXK
 ksFQ2zuaC9LAGBp5yxxO8DZpbd4zP/Rq56amvyWJOipJyiKl/Vp/YbbJnphJQu/+SJ0b
 Bk8oxTn1CRn9LrDKTyNbDPXYhHeDL1Qi/kmHTQbtIHRBGUYUWQCV46OqPUi7bVe5iMRf
 67+g==
X-Gm-Message-State: ACrzQf0CBKCR0C2GtigEgDiOW1QnGSW3kAjsCuBYaX7Y/Y5aMB37ksS5
 ohQplhFAD/WNn5qClZvL8UuRS875A9axIr7xJb8=
X-Google-Smtp-Source: AMsMyM5TApaRJL4Oy+Xs12tDK9c/4Msl6YoT+BwCGxqxbKB7uCiu799uGX5qe26fV/S9uxj8VoDjOA==
X-Received: by 2002:adf:a31d:0:b0:22a:e41f:3ce4 with SMTP id
 c29-20020adfa31d000000b0022ae41f3ce4mr4047613wrb.240.1663445881507; 
 Sat, 17 Sep 2022 13:18:01 -0700 (PDT)
Received: from [172.23.97.104] ([79.140.217.34])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b00228de58ae2bsm8663652wrx.12.2022.09.17.13.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 13:18:01 -0700 (PDT)
Message-ID: <b35b9c7f-0586-4d77-ab8d-6d7f3db2f596@mind.be>
Date: Sat, 17 Sep 2022 22:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <5cd3be7a788ce6fc3047069feacf48658c231483.1660931225.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <5cd3be7a788ce6fc3047069feacf48658c231483.1660931225.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=66NUFJzMo6x5+wW84ZizQOpPH0HrKRNfk3YH9GzgFg0=;
 b=YqiuKSWpSfGvqhXkS1+sOvryvNp0us7szDPFMa/vf5RSk4qCAI7cI0dR205m9U4Qzp
 va6vIa63YNViMr0tC+ThHF8WTxGYNz5J2izzZHhDE2I30nlYtadr8FHFfauInGS3nQVV
 YmAEE0cyzOO0qEaNM1uKOkh1ulOyXzJtRDo2rTbR7P3LaT0xuSHRuWHpI/3bRNPyMDNi
 qAB8BU/im8KIO6yCHCORcXOGOwevkjxhxS4KvmkwDdAP15K+pM9qGrQ38M7C6nbCm/yr
 VaLw8+0+FjIAUcg8I20AgRHmb5y//J21FZcI31F5Am+Pj28M6GX5Tw7KshnqaU2tj39a
 6dMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YqiuKSWp
Subject: Re: [Buildroot] [PATCH 4/4] support/tests/cpio: extend runtime tests
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2022 19:51, Yann E. MORIN wrote:
> Check that dependencies that are DT_NEEDED by a program are
> automatically copied by dracut. We use cramfs, the package,
> as it is small and just depends on libz.
> 
> Test extra modules, and test more than one dracut config file.
> 
> Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thierry Bultel <thierry.bultel@linatsea.fr>
> Cc: Adam Duskett <aduskett@gmail.com>

  I've removed the bits related to patch 2/4 and applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/tests/fs/test_cpio.py                 | 11 ++++++++++-
>   support/testing/tests/fs/test_cpio/dracut-cramfs.conf |  7 +++++++
>   .../fs/test_cpio/modules/99cramfs/module-setup.sh     | 11 +++++++++++
>   3 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 support/testing/tests/fs/test_cpio/dracut-cramfs.conf
>   create mode 100755 support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
> 
> diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
> index 9a529f1edd..9c196c1b89 100644
> --- a/support/testing/tests/fs/test_cpio.py
> +++ b/support/testing/tests/fs/test_cpio.py
> @@ -37,11 +37,16 @@ class TestCpioDracutBase(infra.basetest.BRTest):
>           BR2_TOOLCHAIN_EXTERNAL=y
>           BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
>           BR2_INIT_BUSYBOX=y
> +        BR2_PACKAGE_CRAMFS=y
>           BR2_PACKAGE_PV=y
> +        BR2_PACKAGE_HOST_DRACUT_EXTRA_MODULES="{}"
>           BR2_TARGET_ROOTFS_CPIO=y
>           BR2_TARGET_ROOTFS_CPIO_DRACUT=y
> +        BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES="{}"
>           # BR2_TARGET_ROOTFS_TAR is not set
> -        """
> +        """.format("support/testing/tests/fs/test_cpio/modules",
> +                   " ".join(["fs/cpio/dracut.conf",
> +                             "support/testing/tests/fs/test_cpio/dracut-cramfs.conf"]))
>   
>       def check_dracut(self):
>           out = subprocess.check_output(["cpio", "--list"],
> @@ -52,6 +57,10 @@ class TestCpioDracutBase(infra.basetest.BRTest):
>                                         universal_newlines=True)
>           # pv should *not* be included in cpio image
>           self.assertEqual(out.find("bin/pv"), -1)
> +        # libz should be, because of cramfs
> +        self.assertNotEqual(out.find("usr/bin/mkcramfs"), -1)
> +        self.assertNotEqual(out.find("usr/bin/cramfsck"), -1)
> +        self.assertNotEqual(out.find("usr/lib/libz.so"), -1)
>   
>           exit_code = boot_img(self.emulator,
>                                self.builddir)
> diff --git a/support/testing/tests/fs/test_cpio/dracut-cramfs.conf b/support/testing/tests/fs/test_cpio/dracut-cramfs.conf
> new file mode 100644
> index 0000000000..69e49239fc
> --- /dev/null
> +++ b/support/testing/tests/fs/test_cpio/dracut-cramfs.conf
> @@ -0,0 +1,7 @@
> +install_items+="
> +/usr/bin/mkcramfs
> +"
> +
> +add_dracutmodules+="
> +cramfs
> +"
> diff --git a/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
> new file mode 100755
> index 0000000000..60706c8bd9
> --- /dev/null
> +++ b/support/testing/tests/fs/test_cpio/modules/99cramfs/module-setup.sh
> @@ -0,0 +1,11 @@
> +check() {
> +    return 0
> +}
> +
> +depends() {
> +    return 0
> +}
> +
> +install() {
> +    inst_multiple /usr/bin/cramfsck
> +}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
