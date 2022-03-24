Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47083C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 15:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D652884442;
	Thu, 24 Mar 2022 15:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhoJknfvUday; Thu, 24 Mar 2022 15:38:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082B3843E3;
	Thu, 24 Mar 2022 15:38:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8E51BF3D8
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 15:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43AE1607F2
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 15:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=outrider.ai
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWSKHTuSGxhC for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 15:38:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D353960E4F
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 15:38:16 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2e68c95e0f9so55371297b3.0
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 08:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outrider.ai; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=3pPhnU/RYO8ZdfaD9LBGkqGMEJdso8kDsl0HhYvOPJk=;
 b=ZsUBfmw3wIbWQ3eXwH1xBSVPtTkaoKEZLhuFK3viIYDGlzKFmD2CUK0TT8+WHtfHQk
 R+QZmMVBfRkzjBXqWpr0r6AHho1rWOlPZ67rEmTHlMHAbE1QfXCUkLmzS8UfcV3XKBNc
 kPK1umd3iE9YMD101sKC7WQdDkvRUWiO8QPlLRZOoTsLrK3NPF8VymKNOdQue6m7HQVg
 bUt3fwfeaMX/t2q/UGwfC9BUKE4Yk0CnmhLMg55PhZz69kgsqM5ZjD32TdvD2iysfYlr
 v39ACRApWDOM38HEl1pP+Vgc7vpXwFQlzHkU2GD4Q8QqghkAqIfcdXD8Zo7pOEoMkYtG
 yBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3pPhnU/RYO8ZdfaD9LBGkqGMEJdso8kDsl0HhYvOPJk=;
 b=aeXZdwbkLTOmY++Hc3qthC0YrRN6l5S7yOTWHn+OKyz/hDu+dgX/HWbAT6wMMBoCKz
 V3yehpdiVPykNAJXU2CJxnE0GEON0NyxQWdh8QHFBcJ7qLzuVUTJoUdd2aaSJwmTNFB7
 vRdpFr2Uw1bVLVuYP7Ikd6uUdOVlHoJMTJDEQeXEbqklKkiJ243fryBfvNYsn1fpmJE6
 nk2FYeeIn1XgjvMK1Rej8TKQaM1XBiIxylln2CEQBJx74K7GeNbK1lwM3prNh+Sw9Ovj
 gGTCXdhDtpLE0j4I6lP6fMjzzXR07t4KZIeJ2XO5paKQSDkdf44CUOKcvxt+2DBjwe6d
 0pdg==
X-Gm-Message-State: AOAM532uyWkSB7618ydseoouv+9jQmMXZfbftqq4XAGjDHUm8IfIX3Wr
 LNz7g9jqnxBtGwNpmzuRqyXofkznF6PjVpPgNK5IgFWsCDN0
X-Google-Smtp-Source: ABdhPJxtOS1G/AYwdzwBD5j4W0e68dSKL+bDpPErhwluqwftxPrD2/4LNimFW2BqHCTVHTnkOucZx/IuAMwk5zQC1/8=
X-Received: by 2002:a0d:d849:0:b0:2e5:c2d2:98ab with SMTP id
 a70-20020a0dd849000000b002e5c2d298abmr5476391ywe.371.1648136295306; Thu, 24
 Mar 2022 08:38:15 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 24 Mar 2022 09:38:04 -0600
Message-ID: <CAAKqzUSn-LBNag6UMxYbzL=1Yi0KgF+9OA0BmgMPN99VOTKJog@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] Suspected ccache Issue With wireshark
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
From: Dan Ambrosio via buildroot <buildroot@buildroot.org>
Reply-To: Dan Ambrosio <dambrosio@outrider.ai>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,
I recently upgraded my buildroot project from 2021.02.6 to the latest
LTS (2022.02) and ran into a compilation error with the wireshark
package when BR2_CCACHE is enabled.

It seems like a cmake argument is being passed through to ccache.

>>> wireshark 3.4.12 Building
PATH="/home/builder/output/oc_general/host/bin:/home/builder/output/oc_general/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 /usr/bin/make -j17  -C
/home/builder/output/oc_general/build/wireshark-3.4.12/
[  0%] Building C object tools/lemon/CMakeFiles/lemon.dir/lemon.c.o
/home/builder/output/oc_general/host/bin/ccache: invalid option -- 'D'
Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Common options:
    -c, --cleanup             delete old files and recalculate size counters
                              (normally not needed as this is done
                              automatically)
    -C, --clear               clear the cache completely (except configuration)
    -F, --max-files=N         set maximum number of files in cache to N (use 0
                              for no limit)
    -M, --max-size=SIZE       set maximum size of cache to SIZE (use 0 for no
                              limit); available suffixes: k, M, G, T (decimal)
                              and Ki, Mi, Gi, Ti (binary); default suffix: G
    -p, --show-config         show current configuration options in
                              human-readable format
    -s, --show-stats          show summary of configuration and statistics
                              counters in human-readable format
    -z, --zero-stats          zero statistics counters

    -h, --help                print this help text
    -V, --version             print version and copyright information

Options for scripting or debugging:
        --dump-manifest=PATH  dump manifest file at PATH in text format
    -k, --get-config=K        print the value of configuration key K
        --hash-file=PATH      print the hash (<MD4>-<size>) of the file at PATH
        --print-stats         print statistics counter IDs and corresponding
                              values in machine-parsable format
    -o, --set-config=K=V      set configuration item K to value V

See also <https://ccache.dev>.
[  0%] Built target cli_main
make[4]: *** [tools/lemon/CMakeFiles/lemon.dir/build.make:66:
tools/lemon/CMakeFiles/lemon.dir/lemon.c.o] Error 1
make[3]: *** [CMakeFiles/Makefile2:10914:
tools/lemon/CMakeFiles/lemon.dir/all] Error 2

FYI, 2021.02.6 did not exhibit this behavior.

Thanks,

Dan Ambrosio
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
