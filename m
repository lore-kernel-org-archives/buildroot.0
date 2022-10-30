Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9BEC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A0481275;
	Sun, 30 Oct 2022 22:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A0481275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Av90Y8YSrVJv; Sun, 30 Oct 2022 22:20:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A545B80F2C;
	Sun, 30 Oct 2022 22:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A545B80F2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8BA71BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A1060687
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1A1060687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-M5e9ZmIIO2 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:20:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B49BB605A4
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B49BB605A4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:20:07 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 16-20020a9d0490000000b0066938311495so5907745otm.4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pWr8NSvclrh0x4scPjpGZ1yoTnzJFNTmZvhUA84RDTs=;
 b=44p7geg4hjej/ZS2BsaKDiCq+t58v3aPY1PgsK+le8WyiKEw/rp/HmFRxl4jEPixd2
 vcQAyWsG/GqHooH87uvvMQDGrG7awwVBtpFtPZF0AvkL9rby9GbwWaUqxoEh1Ysforfk
 GwYaSWOd/+lDpM2Mo4dbCH59k/BsIna5SD98BHtHZ6kZr2HV8oyZlhRcZM973XygLHts
 15upsNzyp803AgwZuZGSGt5Hw2Bdup+aCZRuKZYdMzE1gLIb8E3GbQ3asu56aL9R+9U0
 WkBNv0e7AkxwmYQET+PGKvm+NrCQuiv1o+3COSXRkPUT8sGSiR9xbOCjWJqihXakB20v
 LYgA==
X-Gm-Message-State: ACrzQf3Ah4IIP7yKuEDXw59pAoL6rEpcZmAZ8b0eBtmVDn21g4kUmzKW
 f/Agvqq715Ln17L1j30usK4=
X-Google-Smtp-Source: AMsMyM5XE4H9W2fIX+ubbnGjAlQH5o2MYlE5ZFhZrs/6EjSJ5pN3iBlgk6KH6/PKjQE6ewdgC3/UCw==
X-Received: by 2002:a9d:1b48:0:b0:66b:e4e2:6c70 with SMTP id
 l66-20020a9d1b48000000b0066be4e26c70mr5038418otl.67.1667168406685; 
 Sun, 30 Oct 2022 15:20:06 -0700 (PDT)
Received: from gmail.com ([2804:14c:7980:988a:c978:dc5f:a55f:695])
 by smtp.gmail.com with ESMTPSA id
 ck13-20020a056830648d00b00661ad8741b4sm2135086otb.24.2022.10.30.15.20.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Oct 2022 15:20:05 -0700 (PDT)
Date: Sun, 30 Oct 2022 19:20:04 -0300
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: oguz.ozhan@mind.be
Message-ID: <635ef894b4558_3fcfb2ad9212def90221e8@xultri.mail>
References: <20221021091531.2989489-2-oguz.ozhan@mind.be>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="--==_mimepart_635ef89339fbe_3fcfb2ad9212def9022012";
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:subject:references
 :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pWr8NSvclrh0x4scPjpGZ1yoTnzJFNTmZvhUA84RDTs=;
 b=NMWdAQhiaDf+3p3vWEWQhtBe5ZGBaIN+fbRIPeW2kkaKBEzpOnNSRFla5aGwZac6vW
 8nRhRQWobhfS5fPamnHSMEn1taBICTAhmdv+Nk5iegKtnb8FFy+wtm4YBO1/tHzj0EEW
 uPKUQOr0k4W6OlBpaMjYkBAzBfR+n8CXpSCm/JRVcr9ou8ftWbheyyt+uxtQQ86IsNGp
 Zi+VqvVZoMgxnMqjzQ22qnUkyxuyNJFuy1XrX4VMLcVF0EXdIcVZJLg8aFj/wcCa8I1U
 /Y75+vb/dbIonH657BW0KHGiWUPkKYEpZGQNTfI5s8OeibX6KJMyQP2YJAlWntKsw2Za
 N62Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NMWdAQhi
Subject: Re: [Buildroot] [PATCH 2/3] support/testing: replace nose2 with
 pytest - run-tests
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
Cc: buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


----==_mimepart_635ef89339fbe_3fcfb2ad9212def9022012
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On Fri, Oct 21, 2022 at 06:15 AM, Oguz Ozhan wrote:

> - From web page of nose2:
> (https://docs.nose2.io/en/latest/)
> nose2 vs pytest:
>   - pytest is an excellent test framework and we encourage users to consider it for new projects.
>   - It has a bigger team of maintainers and a larger community of users.
> 
> - pytest is more robust and has more ability compared to nose2
> 
> - Changes in this patch:
>   - run-tests modified to use pytest instead of nose2 to call tests. A corresponding Collector class added for pytest to list the available tests
>   - nose2 plugins removed which are not required anymore
>   - in test_iso9660.py, local test_ routine names changed to not be accepted as test_ cases via pytest

Please split the changes to the tests in a new patch (first in the series).
While doing that, please fix flake8 warnings.

> 
> Signed-off-by: Oguz Ozhan <oguz.ozhan@mind.be>
> ---
>  support/testing/conf/unittest.cfg        |  3 --
>  support/testing/run-tests                | 28 ++++++++++-------

Please fix flake8 warnings for run-tests as well.

>  support/testing/tests/fs/test_iso9660.py | 40 ++++++++++++------------
>  3 files changed, 36 insertions(+), 35 deletions(-)

Please update the manual, section 'Using the runtime tests framework', in the
same commit that changes run-tests to use pytest.

[snip]
> @@ -106,15 +110,15 @@ def main():
>          return 1
>      BRConfigTest.timeout_multiplier = args.timeout_multiplier
>  
> -    nose2_args = ["-v",
> -                  "-N", str(args.testcases),
> -                  "-s", test_dir,
> +    pytest_args = ["--workers", str(args.testcases),
> +                  "--rootdir", test_dir,
>                    "-c", os.path.join(test_dir, "conf/unittest.cfg")]

run-tests -s is broken: it does not show the build and runtime console

>  
>      if args.testname:
> -        nose2_args += args.testname
> +        pytest_args += args.testname
> +
> +    pytest.main(pytest_args)
>  
> -    nose2.discover(argv=nose2_args)

The detection of a failed test on GitLab CI is broken, even when tests fail
run-tests returns exit code 0.

Regards,
Ricardo
----==_mimepart_635ef89339fbe_3fcfb2ad9212def9022012
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

----==_mimepart_635ef89339fbe_3fcfb2ad9212def9022012--
