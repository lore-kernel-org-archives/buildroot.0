Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E177FC88E40
	for <buildroot@archiver.kernel.org>; Fri, 11 Sep 2026 03:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55B8740B24;
	Fri, 11 Sep 2026 03:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUFOcXvIPPGf; Fri, 11 Sep 2026 03:22:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 203C040AF7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789096947;
	b=nU+PgRaVo4oh/XxtxmXzVHv/zXgiBKV4nmxNK6naeWzW2bEMciSya4Vuej7NdtzbNYi8
	 c/s9QFd/WB4nU+Ug5bjFM5FRwwOJsS6vLw/iKvN7jUiMIHFg7VBAvKt5KwUtuoDoiLTVz
	 Wb9hInsJlH9V+TZ6RdmqeNd6HRtPA1Jq7Jl/PZVRQ2SRSs1v++8b4pUlGo/tH1f5EDH9Y
	 /uo/QNJuHE0Um7lNKvqo3ZyOU/6JECLW4axLs1LwMvC8uwMTA8eiLhB76Mxo5CWRNiOXo
	 Abry4+qhm4q3wJ0cZeWEE8ji7+syKlwRlgp9+9djaeI0jSye+YTIgzV5kJp7M4t/BGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789096947;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xS6M12kCt1v37aWMs0aXP4NiHkpQ6mXSktVrPMIc3oQ=;
	b=Y9nvulDMfokRy/Jjqgv333Ht6zg3SYhxjFFzMFzvun/L2bAFScMCbclZgpncwkPY0MEZ
	 AsM2ykO+AlMvIOQs5mqrPCk5UsTtVwkTXGuN39MOLXUO+o+Za7aaZS9syYQ7v7eBoHBwC
	 r41mnmkAnMN34c85dgzARSGbSAhTEXWup7vlaVWUi/17DJJczrGIamSrMVsHXt916lMup
	 xlMVMu1un25l0iFvb1DjSba7DHeg7s6M1NlvDvr9NM22Hc5zSlHZL95nfnl7qXSmJ2hkQ
	 83eeSpzhiOLDZJuIrQuxIxIfsL4hrooYGSUYdzWAi8zaYJHcv0v6F7L7zYMMgl1ZNDA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EqPdlLGo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789096947;
	bh=xS6M12kCt1v37aWMs0aXP4NiHkpQ6mXSktVrPMIc3oQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ECbtQhvaXamWfgH8UyfU98vdMNgT9ifxyfO0UC+7iDB1Vo41nuzZgZT19nIrhupZv
	 kH/8SohsA2ZBq9bvTG3NqdZRX2+ygEPRKC6t/nX3kEqup/JA9uQ1A+IXQ9aWPk5Fp4
	 CO7sCjiwLnuPPqqyfydRs3EzZSl9EUMXqMDMruBnyF+/bqhw3auqrjylRaM7elmlxu
	 7scMMyVdveuv/3NkZH4OOgnJMXkC8JnSOMZhb8yI3bE1tkl/SmCtik+8f3UvznvyA8
	 5xjjgD/7P8/5DSUrzWbTgY8jeSpIJ8Wuq4ozs6j2YKKumnxeblgjRmAHV9m1/pu5w+
	 stLzPbb2vXApA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 203C040AF7;
	Fri, 11 Sep 2026 03:22:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A12493
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 03:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23AEC40AF7
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 03:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pR_sLHauKwcK for <buildroot@buildroot.org>;
 Fri, 11 Sep 2026 03:22:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 982D240AF6
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789096945;
 b=kcuMt4ai5rDgKkRMGRKDZ9HTNjYAD7NHzb7AbRbwlBD5IVkM9k7DeXTKYYfOiBQPafUz
 BL0vN2we476HhTDf/QV0GdWb+NNLeGs3/qbT0mUg3k7P01HtEE1wZ/8kfGUuy7D+KfHoZ
 q4j7VdcdF/K7cuo5FMrdXfWE9I8xYkteMIUIqv8wHrme9dJky44YN3QO3E2KxkDuwhuom
 5V9Wqr0RsQHoYiQN/jb+rsBCCr6VGyW6RlugeLDUu+sB+nGhRSYllkx7zyqfFlB9WB+A1
 7wVzEZIrMP5mVKg0t3NMNqvTRFX+fwvPCs/j4dpZ0oiYdaniA2K4ZjdzZpVzflt8/JA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789096945;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=5UnHQ7wZtRDDMXeKzhgV5+H+cZOcHgxcM0KY/lGe9RQ=;
 b=PXUWxtXq43ZG9lpkCNwZFya1M3XDBOCCxH9Lp8keMhPDlHmrruEX5tJUsjKhZS+3UJ80
 79pCndb7DnVE2so2dcpESSgc2m/LNgLk38OR1dX2XB/mCPnDrHt0U6eOmFSMp3pYYyMLL
 aDiFtt+n+ydjXbmXbOTmAPSX2RTuDlAVdaHvjnVuC6ySaQw6B95AouSPoaw7cs14f4g7p
 UPeoMeoHhcIT++93ctm9E1bWh8HGATXGVclqnVoUEEeIYzFiYEa2lhwdqaOFazxto1OxN
 bVsG0FfqQ7YPRvOct18E4UpGcfr8Vm448boqg0euPbnPqP+gPBymn92l9afFVoSFIsQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=EqPdlLGo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EqPdlLGo
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 982D240AF6
 for <buildroot@buildroot.org>; Fri, 11 Sep 2026 03:22:24 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-49a97714f5dso4270385e9.0
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 20:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789096942; x=1789701742; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=5UnHQ7wZtRDDMXeKzhgV5+H+cZOcHgxcM0KY/lGe9RQ=;
 b=EqPdlLGoEIUv/80cFcfhp1Bx2yPdWstfjHFF10HCXUkFs00GsQHBCfx3h/Nj6exV4A
 ZrlRLIzMz5cm62cWBFYAoJNKeux+McIM0zBxW1T6N2oHXg3kOi7K/l6mSySsM1PjApdd
 Qng3gcowM7edv2VRFtRowTC7yMVe9ML+uEue65QNgCMZzoqS/iil4Tx/JLGaog+pi8To
 ofU7PkdIKBa/E1W5fzWAeP4RruYFCTAhctwz6VTyfOXiJbbnSrllZYZDyomIZBRQFtwr
 Ge7qx0q3NZFzr4fEVlVq73aBeGlr1wDjBUC5TvZdv0a2GTeY0atddoMj2vBEhPUKRCtl
 mmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789096942; x=1789701742;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=5UnHQ7wZtRDDMXeKzhgV5+H+cZOcHgxcM0KY/lGe9RQ=;
 b=fqFI8Ggub3fUkaLiLryi0cfXKuSXfdE2jwo6G+//vAvFBJC+6nydFmnKo0B8c9uOYK
 wwOeoDMrfu7WaEVA/BbJjqXjaCNbl6ZBh4CuW//rOnLWxAYnOG/W7vr/mL8bwfxGnlwl
 9I1tEcTal/WpWx5ykFZ/3FjP0/zEy3HKZecW0VT9QEQoFxFRY3qcBtClzYS4inXllGaQ
 KdhufyJ7wlkqvBAp2uxX6sKG8tgMPmsPfMuvhtLohuQnSIeyfiLNRwHTpvBMwEc7rGao
 gmtQ9ezUzEQ2eRiBVXRPeQAhEu84vOT0WtJ0lJj5ZlKGZjinOJSbxkCcL4FtQKx84j2O
 XaTw==
X-Gm-Message-State: AFuF++nX0HtbpCnaq5J1DEE5bdyMUhMCqxFAVzr/eQQhya6g90vEtmJo
 HP3iYxhvOU8xGkwPIuQRnEm0zd8mzIjXaF1oaG295GaV+fmkMoU8o29sro9+fsn0
X-Gm-Gg: AYBFou2B0yfS8Ncivfp/H09coYxg9jgo5DsaJw2qoT6E5CFLo8imDA/qTIINU0qgCqR
 RotA+oM72aFOZ0842eAX+JGRW9crAfrXyLcIdW9FwxpeSgmVKxf/BSwYpdenKUcx8w0I/ZB8xQn
 b7+jq3t0PYZyZIjYequQvBi70q9vSIeGpDMk1TLhEfc0OHG4eR6DxdCRJiYzczuFp9SO5Dqr4EN
 FCXICpKXmzFCMB4wVrwCRi1GA2ByJhH1aolMnQmfg1f4B20XEgEO3MubuHl6Sd3VT7rZHaAIiCO
 DSvEfCCq2W4ap+QhdnVatjhRGfpsXSRNXhwxJX2cshjS91FY7+OpVsUzPvCLFU6/STHm7Zk3R4i
 K0E4Dr1Y9yB96R3CVrY/Fbr/Fu/x7g8Nv8ZvU7NVT5Z9mtSCMCX9egT3l8fiUiFfg8Tye7S385w
 RBqwTJ5+rTlGUTaQuCgMCXcOhSiNPpOZz+wOKML4PZ/dRE2s20EQbua14AHKWIispG6RYQLsOBM
 kLIK91ObUBp
X-Received: by 2002:a05:600c:b96:b0:49c:fa20:cc06 with SMTP id
 5b1f17b1804b1-49e619dbd4dmr21015595e9.29.1789096941970; 
 Thu, 10 Sep 2026 20:22:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e636f7fa2sm17287525e9.15.2026.09.10.20.22.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2026 20:22:21 -0700 (PDT)
Message-ID: <6aa373ed.426fc1f0.f92fa.11f1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 11 Sep 2026 03:22:21 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 15  |  0  | 23  |
  2026.05.x  |  0  |  7  |  0  |  7  |
  2026.08.x  |  4  |  4  |  0  |  8  |
    master   | 26  | 47  |  0  | 73  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 4 
        edk2-edk2-stable202602 | 2 
  gobject-introspection-1.86.0 | 2 
                   perl-5.42.3 | 2 
                 skopeo-1.23.0 | 2 
             alsa-lib-1.2.16.1 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
                  ffmpeg-6.1.5 | 1 
               gocryptfs-2.3.2 | 1 
           gumbo-parser-0.13.2 | 1 
                   gvfs-1.57.2 | 1 
    host-mender-artifact-4.4.1 | 1 
              host-rust-1.98.1 | 1 
            host-skopeo-1.23.0 | 1 
                 ifenslave-2.9 | 1 
           igh-ethercat-1.6.12 | 1 
                 imlib2-1.12.5 | 1 
                jemalloc-5.3.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                libgsasl-2.2.4 | 1 
                libkcapi-1.5.0 | 1 
                  libnss-3.127 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                   linux-7.2.4 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
           lttng-libust-2.14.0 | 1 
          lua-lunix-20220331-1 | 1 
                opencv4-4.13.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                rdma-core-62.0 | 1 
        riemann-c-client-2.2.2 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
        s6-linux-utils-2.6.2.1 | 1 
              skalibs-2.14.3.0 | 1 
                  swipl-10.0.2 | 1 
                    szip-2.1.1 | 1 
   webrtc-audio-processing-1.3 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/5ed8cbf6ea960201fb5a39724a77ef09367b1534 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/acf787b10ca47f2ccf05d5f857fd8f9ce42d0cbc | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/8c1f7113e4d22f74f74abaaa9da5f31cc533edb1 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/7c3cc54b5a076a323ba0a6775c841e425a05fc8f |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/2c25bf5ad0619b620c541073b900acff7878d511 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/afd91685a74d6b98a96af067365002e6fb842f0d |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/e336c88529524eaeb0707a3b2bc0470d5a6f06fc | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/4d473a9d5f111310665c62519f179199d3e95ae7 | ORPH
    i586     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/1693b3e113abe17c380eb3cba19a106e325610ca |     
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/f809733b6852f9e26c7fa7c94e1ccf88600b8366 |     
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/b7c56cc659280eb6527eac1fe529ed34bc75caa5 | ORPH
  aarch64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/7a750ade0f15918dc0c0cd124760e634c14407f8 |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/cf026fc8c0dad88e539e4be97ee825861b22b2bf |     
    i686     |       host-skopeo-1.23.0       | NOK | https://autobuild.buildroot.org/results/23ecdcac45e029904a9e65dc51fb22bcb6f31090 |     
    i686     |         ifenslave-2.9          | NOK | https://autobuild.buildroot.org/results/f07437528664041972f6117f1415330563359fd1 | ORPH
    i686     |      igh-ethercat-1.6.12       | NOK | https://autobuild.buildroot.org/results/451eb90bb210daef5b701ef7084444f77f138a33 |     
  sparc64    |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/0fb90550c644449eaa48fb49ad869b1d794f3322 |     
   x86_64    |         jemalloc-5.3.1         | NOK | https://autobuild.buildroot.org/results/6fbebb76cb0e6cafabad0890b8df226e9358a6c3 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/111bba9f619f4a4b1c7e1fe830f1496ebab33781 |     
    i686     |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/b2868831072db16a069cdd661970fdfad8faa114 | ORPH
    i686     |         libkcapi-1.5.0         | NOK | https://autobuild.buildroot.org/results/0fa5077f500844f716bc4f0bf73dfef8b660c387 |     
 aarch64_be  |          libnss-3.127          | NOK | https://autobuild.buildroot.org/results/3b6e5c0fd2aa21a16621c1d4c096b14a548d7a3b |     
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/cd07503eaee322c31dcba687e4e32d875926584c | ORPH
    i686     |          linux-7.2.4           | NOK | https://autobuild.buildroot.org/results/3bef791a88ccc56704302156381795cd5689e6b3 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/73eeeee340e26d5e82b9e6943f77c720ee1ec953 | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b1fa71698338f18d352614e521f72e2542dbc31a | ORPH
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/659d69407ecb1aa146a7307725c9c42081f6d68d |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/629eeca2c7b7f48ee6edd0775786aa0ea5dfd2d3 |     
    arm      |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/3c0ad1ee0af7bac21fa4cfa8b276d4d9d0b9fc0c |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/b8c9d360fa2ca4fefaabd6db2aa3e1e148d4e176 |     
  aarch64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f3d4982fec252c87b0ea79d9761207bf2ea4722c |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/5a980620614790a499bb1039e660c4c3314fdc26 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/94f1149bc74a5a2f629da8dcbdbc29799f1cd268 |     
    i686     |     riemann-c-client-2.2.2     | NOK | https://autobuild.buildroot.org/results/abed838b3cb4b7d352388aecf41752bb366367d7 | ORPH
   mips64    | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/8bc398dafeaf343a97eda95b4396f40bd41786cb |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/b4ee405a5c041d9a3420b4885d366b39cbdbf3c9 |     
  mips64el   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/4cbd90da48f4ab9f562da0285b2180b1996aec50 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/d6e957f3f98b7b6511ef3a49a068e94f62e267b5 |     
    i686     |         skopeo-1.23.0          | NOK | https://autobuild.buildroot.org/results/9b26cfcdac00efecf70afe2e28abfc7f1c6f44c1 |     
    i686     |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/b0cd20925a7f837a3e9dbb4bc149da8f238caa0b |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/022e1d3c0817aa259fc6d2a478d3e0fbac47bf79 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1d5e09c2c2cfdd67c62a104c32bcc0526d0a6db7 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0a403d3ed43644c302508e8ccb0b2d239c8de9bd |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4af6eba0f0d143b920a4af2d10137acc2c0fd087 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/f68cdbc4fc25ed39e68820d1439bd47e567522b2 |     
    i686     |  webrtc-audio-processing-1.3   | NOK | https://autobuild.buildroot.org/results/bdd2a582d7202e8164dcee24fe310d196bb846eb | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/7cfb786b6f266def204817e2c6375e152a0ec180 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                   dante-1.4.4 | 1 
          linux-5.10.254-cip72 | 1 
             openjdk-21.0.10+7 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/e05bf2773485ab09c181f00690753018481db8ef | ORPH
   x86_64    |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/8fe8bd86f57a8b35fa57f480e2370c53ae63fd92 | ORPH
    i686     |       openjdk-21.0.10+7        | NOK | https://autobuild.buildroot.org/results/ae797ff4d10acb9baff4d47a10ee8b7007195ec8 |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/827345b1ee7d2b5a46d767092f709a4198ac01a5 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 2 
            jpeg-turbo-3.1.4.1 | 2 
           gumbo-parser-0.13.2 | 1 
            nodejs-src-22.23.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/39f306c701807ed917ca03ec93f30bf436dd5b9c | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/46cbf74638950b9d6bc07c49086a51b9acf5d416 | ORPH
    i686     |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/54314100f186347009bb38bb026b65a4d950265b |     
   s390x     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/c2a908e9d147b9d5693272188621743fb7a87c2d |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/b0053e7a066b9bb78a3f83a524b90085d54ef4a8 |     
    i686     |       nodejs-src-22.23.2       | NOK | https://autobuild.buildroot.org/results/2c68642ce603ddfe1effe3bed5ed602cf08b1101 |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/f7ebfdfbb0798f7c19692902024bc4c1a64e4040 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

              host-perl-5.40.5 | 2 
        host-python-lxml-5.3.0 | 2 
        ltp-testsuite-20250130 | 2 
              asterisk-22.10.1 | 1 
    host-mender-artifact-4.0.0 | 1 
                 inadyn-2.12.0 | 1 
              libgcrypt-1.11.1 | 1 
             libtorrent-0.13.8 | 1 
                   linux-tools | 1 
                     nvme-1.12 | 1 
                   p7zip-17.06 | 1 
                rocksdb-6.20.3 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-22.10.1        | NOK | https://autobuild.buildroot.org/results/f1868106f17bccc2436a179cca5ae114a095c9c8 |     
  mips64el   |   host-mender-artifact-4.0.0   | NOK | https://autobuild.buildroot.org/results/8b773b71204f1241d65b48535311f4662696bcc8 |     
  sparc64    |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/c53f6704aa22842883b8ba76b1ef6aa16daf4a07 |     
  aarch64    |        host-perl-5.40.5        | NOK | https://autobuild.buildroot.org/results/24aaf7e5a6f48aa37e4ee9c736e4e218c3d9e571 |     
   x86_64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/b5e7c28738c340bbfc561e9695635143623186a5 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/9234e60f0b8e630f181185919be92721210092e0 |     
    i586     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/5e5059ecc9b507a5778659935da212e305ca00da |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/4695fdaea670a710db92832fb1fa86cfc818ee32 | ORPH
powerpc64le  |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/b36a8514edf67099fcea989b0f0b1ab8d693b54a | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/11c988793853058620879770e75a8662a4166df8 | ORPH
powerpc64le  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/526aa29aae749d6013b4f03f26ee73748f5b0b71 |     
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/b55079ec936a8e7a82c4cc534496e70d6da7725e |     
powerpc64le  |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/bf6a9a9ec5f0eef97837a2d9f827b894c01dbc08 | ORPH
    i686     |          p7zip-17.06           | NOK | https://autobuild.buildroot.org/results/3d42a6c0f7382d19178f7408bd8416af3df6fe6f |     
    i686     |         rocksdb-6.20.3         | NOK | https://autobuild.buildroot.org/results/b381dfac289702165764369c52d7ccd9ff4cfa9b |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
