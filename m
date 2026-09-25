Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C385EC98324
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E90760DEA;
	Fri, 25 Sep 2026 14:44:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wMPtyHEzQnm; Fri, 25 Sep 2026 14:44:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B58360DA8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347446;
	b=Z/jz7FtiwAayo7hBP3sKaF8YK47QXyBkBQq/JGtuO9lB71bXVm6f7KTvKsai1gL8fZl/
	 m1Rb0guFd1RxMUxOBETD1b6gUCxb1yj6up7cL7EHMTKMA8qO7KYndnZm0uL5izKX7WS2C
	 ffWvmLZOtIfXTZOsdNiF8WPLPLGGOLrNc4JVFE15AN30p/bgNa2lA2axoLXNOAdrpwPah
	 p3AmvkIAZ3O8GAHLnJVXVOtxLVY+RmttBPbehFWpwRt29nGHlVIFdRaVJBGyLvXy9Tkgy
	 lUTxWzhb1JKyO/Ikxd/BFZ6azUgHBhmfls3Z/d6il1z6UtD1PYZaw2UgThFxgBjjcRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kk/mdDNr2XtOmEnTYhVxSpQ1MW9mPGRcOGWnlTot/hs=;
	b=s0F6Xm+xPehNxVuPybA0YfK2uyMERitZ1EiJHaKstqrWOOuWHpP5kGq3FyUHg0KRjIoW
	 2HR1X1Q4VQuF+cTGllYq4LmTLLKATlbxFKZdZYSMDLF8ui+70HVyAVw3WqkWlaBGwNy0g
	 TnLw0/giyuEfsMC/h2/BwQ+bl4EXH3jClpnthPzwgCvBi07p5Mx8QBnrSAoTrp1herigb
	 LzBa50qwaEe7zvjPY7RooRyCLJZmwOiC9b7eRs72/VWLbrog60QjbEloNhOuqsaefLQud
	 u2HiVt/JTbWRIsUP849QXxEZVWu37bHzfavMEra8Ph08MqbDkwzBtWZma1w8fjWyaIw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347446;
	bh=kk/mdDNr2XtOmEnTYhVxSpQ1MW9mPGRcOGWnlTot/hs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OoQdtwE481/a7ojc0IZ3xp/GZ3thCRCUKGtiiptTnaCSqiG6wggRz4+Re4MMOWnBc
	 cEhpIT36T1lY2tLRlTwGqyNUxw2qljM/Pyvs3jwcCiy/1+SNGFU+S+BsIEE7UlMCxs
	 nR50lOphbLFRh+Td6Ga4cMm1KxrGcdc4uZki7iuefKv91eOpdu8FRDVF73AcbvTEwp
	 q/Hr/g7zKCJzmrBZWCcv8yq1gGjctg0cmaXcvbPz7yvdeYb8E/hTcYgQoTtaSV8WRd
	 tedSXmD1rbXQnnEpsUZrGYktCNuYcwEu3q5jRi1AbqcMfrkFGCdzEPhFRsC2oG2MxI
	 HVKBVCsvRCQdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B58360DA8;
	Fri, 25 Sep 2026 14:44:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFD0A332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD5AA4047A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiPBAmHl-dNE for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 971D84016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347442;
 b=hnL5S+2XWEczQntM09X5xP75bEGNCkJxi04J41O5dbNRDeHrcMTNfzI3VgtuPY9YmOrA
 AzEQoJvWxsFr3bCZnlI+vsOFFGyQr5tmUUbPHenc7PV71W7TOShGn5Qt10WDhsLQ2xmhk
 ZTLQ+D4t9DonUtHfUGsYKs5rdDegdVl47i0Eu2C26RXlD4N5X0zHrA3uV8zH64wahPWit
 9yZeFFc5ftB3sDnFTyFs8fffw+n5Ks41dJZ/ajCfMQOQUDlW8TrvW7bCdobBOUfncDqEM
 5E6QFe2W9lnL9mFXF3tgAiBjPd2M772Lf37g4biHQAfFw0qMjp2VbkFk8oBVv1XOhJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347442;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=UDnnPuOan1xunvnOI9ignI7NXjBrcyYfp/EBFCjKwEU=;
 b=JYBFdyx5RLwq9jPJisWHiSkHaJfaRGmATsT1JfrStyPRQQ8fe77UpANXeAtrnID11Suv
 rMWFVEdTe7pE5GBxXn+tawnzq6ot6stKPn7IYuJgouAScFX+RTsa2M2cVdlqxyC0o4ses
 bFYk3rkEyk2+vWA8kt0cK6AtDFDKSLOt3erDUPbhmH0s5mY2cikCtbViMOH+9xSufSDXV
 PbOEY+UL3kX/cDOJCvGnDshpNcvq57wUBh2J+HGI+d6fm4F4YTtqzot4whfu6nTDXE8oM
 9l5H7S6XnUnwxJVg1Wt6oJDyjfUik4HQUHbPy7Q7FxCN/SQOhPkqvmCYnjlxpNqEySg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=J3h01n6D; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 971D84016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:01 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49ccead2aecso4820425e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347439; x=1790952239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UDnnPuOan1xunvnOI9ignI7NXjBrcyYfp/EBFCjKwEU=;
 b=uvBxMs98lAZU0HJt2BZoVJUC7TBET3B23Y54BE3mo+O4aPftLcpsRytT+CQGbKzXCf
 2pZp77Ue2lLkDMR/GPQfCtWSMbwF+dskCI8MLBnHDygmMry9fWUGCR8TWCh2PNbp1+a4
 73TtL24EXbyTeE4QvU0GFdJpYWfZ+KC/9q2m1o8O4cryWDaHPRz9s88DPTYG7rZ7eQsE
 k+wDJ5nuqAZ/vb/IpLeE1s8okRNBvOjg3GnmqWjd38qs3Md5HReOohAX8lEhpUBHhdh8
 5EYDWMP70hGjm05PmQlTbonUy0obsOKkbUKrj17mfiuF4MSSXUXrcJnViSY/V4P68tqm
 l0Ag==
X-Gm-Message-State: AFuF++mTRu/5C5ayDCwPJW5mMOmHI83FlkxmwRTHyoyMMMzn5Yb54Gbm
 zwaRJWPqQ5yHDKJ2Kubje6+Y2FkUiTsotNvKA55G8UYEA97CbdtnctrWpsYVUIqx8sRpdD0MABQ
 BfKuWg/qIsA==
X-Gm-Gg: AYBFou2gnBLsuanWMfnr2FOqjT+cmdhCMSlagfWbrycqMzoGpW5spGqeYmW0rrcFq+e
 mDLc+yGgDVsFIatoM+7lLV/DiP16m+t/+h/rZUpWVoRCeX4vDhR1WQ3rOK1Q8dW5p7MWOoMNMIf
 s9AYn2SzSh6GqkfmG7r13Hs01oL7qXdJxqCK3bWaIiaRQffXQ5J/0uOAPELu9450LHPPxGWDL1P
 y/S7c76J59WrONVoK+PzO/h75bWJiE4lfNhw6Bou2oEHhqTS2CN7MdhQEUZtw05mxxxxCbankgv
 MXuOHurELlxBicEDue8ipA7WV1wWQO5mwVcKK9p7MX3bFwUDBGko0xJ5tE94OD7zvzH/UTBSI3e
 cnwwT37zfBAlHQstjTRpfvYCZx5JfFcyep/x30Rlgn4EB/aquFqVRa4xvgzZCqvC5gObgYJRbPC
 /rVD4r79T7OVLfRLNzT0PR7ZrCwueVIEB0Tfq6dqFzK9cQYl5XmlhXAOxAdISE/WffTBJhYZ9da
 +NCZRWHfDWvnaCe1ggQ5w92BXAhjKsM5bmb9QpaGg==
X-Received: by 2002:a05:600d:486:20b0:49f:e941:e26 with SMTP id
 5b1f17b1804b1-49ff06b2f01mr34054185e9.4.1790347439507; 
 Fri, 25 Sep 2026 07:43:59 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff43ad975sm60732785e9.13.2026.09.25.07.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:59 -0700 (PDT)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:56 +0200
Message-ID: <20260925144358.4095468-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906215252.499931-1-ju.o@free.fr>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_squid: new
 runtime test
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/16334532501
> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_squid.py | 66 +++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 support/testing/tests/package/test_squid.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 1fd93b1de5..5b88bb445a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2042,6 +2042,7 @@ F:	support/testing/tests/package/test_sed.py
>  F:	support/testing/tests/package/test_socat.py
>  F:	support/testing/tests/package/test_sox.py
>  F:	support/testing/tests/package/test_sqlite.py
> +F:	support/testing/tests/package/test_squid.py
>  F:	support/testing/tests/package/test_strace.py
>  F:	support/testing/tests/package/test_stress_ng.py
>  F:	support/testing/tests/package/test_swipl.py
> diff --git a/support/testing/tests/package/test_squid.py b/support/testing/tests/package/test_squid.py
> new file mode 100644
> index 0000000000..02593b13e9
> --- /dev/null
> +++ b/support/testing/tests/package/test_squid.py
> @@ -0,0 +1,66 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestSquid(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +        BR2_PACKAGE_LIGHTTPD=y
> +        BR2_PACKAGE_SQUID=y
> +        BR2_PACKAGE_WGET=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        msg = "Hello Buildroot!"
> +        fname = "file.txt"
> +
> +        # We check the program can run.
> +        self.assertRunOk("squid --version")
> +
> +        # We create a file to serve over http.
> +        self.assertRunOk(f"echo '{msg}' > /var/www/{fname}")
> +
> +        # We download the test file through the proxy.
> +        proxy = "http://127.0.0.1:3128"
> +        url = f"http://localhost/{fname}"
> +        cmd = f"wget --progress=dot -e http_proxy={proxy} {url}"
> +        # The squid server can take some time to start. Depending the
> +        # load of the test controller, this can take a variable amount
> +        # of time. We attempt several time before failing.
> +        for attempt in range(15):
> +            time.sleep(5)
> +
> +            _, ret = self.emulator.run(cmd)
> +            if ret == 0:
> +                break
> +            # wget exit with status code 4 in case of a network error.
> +            # Since we are waiting for the proxy server to be ready,
> +            # we only expect this kind of error. We fail for other
> +            # types of error.
> +            self.assertEqual(ret, 4)
> +        else:
> +            self.fail("Timeout while waiting for squid to be ready.")
> +
> +        # We check the downloaded file has the expected content.
> +        cmd = f"cat {fname}"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        self.assertEqual(out[0], msg)
> +
> +        # We also check the squid proxy logged the access.
> +        cmd = "cat /var/log/squid/access.log"
> +        out, ret = self.emulator.run(cmd)
> +        self.assertEqual(ret, 0)
> +        log_str = f"GET {url}"
> +        self.assertIn(log_str, "\n".join(out))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
