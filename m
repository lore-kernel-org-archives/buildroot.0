Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588FEC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 10:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DEE416B5;
	Thu, 17 Jul 2025 10:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGtRsK6quDEN; Thu, 17 Jul 2025 10:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C172416EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C172416EC;
	Thu, 17 Jul 2025 10:54:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 124EEA59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 10:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC7F940066
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 10:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrkVK3uuxDFI for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 10:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65D3D4005E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65D3D4005E
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65D3D4005E
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 10:53:58 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 5E901C0EEB;
 Thu, 17 Jul 2025 12:53:54 +0200 (CEST)
Message-ID: <bbc5ff6c-20fd-485c-bb8b-b64908de7544@grenoble.cnrs.fr>
Date: Thu, 17 Jul 2025 12:53:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Buildroot development <buildroot@buildroot.org>,
 Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <af8e78be-f4ad-4543-a166-b2527c0e9c3a@grenoble.cnrs.fr>
 <8c5d92c3-172b-405e-8711-1b561c7ae7b1@grenoble.cnrs.fr>
 <20250716203906.GA9246@pevik>
 <25430fea-b185-436e-8f88-b53f4fe04673@grenoble.cnrs.fr>
 <20250716220152.GA125918@pevik>
Content-Language: en-US, fr
In-Reply-To: <20250716220152.GA125918@pevik>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1752749634;
 bh=hsVHoa79TvLCzfnursY/qwEU6e+y8z6lOXR0yYFzWP0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HuY/ioN5OLMm35Rpkgpi0F9LLn38w1chQrIsUosLmacU4QwCtQQBxCLIVil34eUuD
 wTbYt/1Gy7lKK96hGYrVqtX/DP6sOthzxaQmpdnRtUJAeZc7WQRBlmpPTwg3QUVqzv
 yG8MwXQpyFP3magjsTGOg5XY9mw41umlJxGYvTtjMBIBv95qgCeQIR13zHHQFmDpTt
 8ziYQD4Bxv1gK3tD37jzjWBEIqELjTFabhJ34Ao+gkiKCv6MyXWJ+3nsEb/X3ort98
 he9DjyZM4GQG3D5RB9AKo6G/rEhRGwI0MrmUANKG5SNddS1iRYlEc6iZOwbzurv3sj
 0oolsGrJXfW6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=HuY/ioN5
Subject: Re: [Buildroot] [PATCH v2 1/4] support/kconfig/patches: make all
 patches quilt-friendly
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

Petr Vorel wrote:
> OK, although I regret loosing metadata, I'm not against using quilt
> format.

Loosing metadata? What metadata? AFAIU, quilt ignores everything in the
patch file that comes before the actual patch data. You can add whatever
information you want as a patch header. If you look at my patch 1/4, all
it does is:

1. Replace groups of lines like this:

    diff --git a/kconfig/lxdialog/check-lxdialog.sh b/kconfig/lxdialog/check-lxdialog.sh
    index 16cd9a3186..27d6c30a57 100755
    --- a/kconfig/lxdialog/check-lxdialog.sh
    +++ b/kconfig/lxdialog/check-lxdialog.sh

   with:

    Index: kconfig.new/lxdialog/check-lxdialog.sh
    ===================================================================
    --- kconfig.orig/lxdialog/check-lxdialog.sh
    +++ kconfig/lxdialog/check-lxdialog.sh

2. Remove git version signatures like

    -- 
    2.44.0

Is it the blob ids (16cd9a3186, 27d6c30a57) that you regret loosing?

> I have never used quilt to update,

I am not a quilt user either, and just discovered the tool while
authoring this patch series.

> therefore I haven't experienced problems with a patch format.
> If support/kconfig/README.buildroot is still up to date and this patch
> is updated it'd be good to update support/kconfig/README.buildroot to
> mention how to create quilt compatible patches.

That would have helped me for sure...

> I suppose it's something like:
>
> git format-patch --no-signature --no-stat --subject-prefix="" ...

No. This command still uses the format

    diff --git a/$file b/$file
    index $blob1_sha1..$blob2_sha1 $perms
    --- a/$file
    +++ b/$file

which quilt chokes on. I would rather do something like this:

    # Hack something inside support/kconfig, commit, then:
    changed_files="foo.h"               # the files that we changed
    patch_file=25-hack-something.patch  # pick the next available number
    linux_repo=$HOME/src/linux          # local linux git clone
    linux_rev=v4.17-rc2                 # current base for support/kconfig

    # Prepare a quilt-aware copy of support/kconfig.
    git -C $linux_repo archive --prefix=support/kconfig.quilt/ \
        $linux_rev:scripts/kconfig | tar -xf -
    cd support/kconfig
    cp -a *_shipped patches ../kconfig.quilt
    cd ../kconfig.quilt
    sed -i 's/Buildroot/Linux Kernel/' zconf.tab.c_shipped
    quilt push -a

    # Prepare the new patch.
    quilt new patches/$patch_file
    quilt add $changed_files
    (cd ../kconfig && cp -a $changed_files ../kconfig.quilt)
    quilt refresh
    sed -i 's/\.quilt//' patches/$patch_file
    $EDITOR patches/$patch_file  # add a comment as the patch header

    # Add the patch to the commit.
    rsync -a patches ../kconfig/
    git add ../kconfig/patches
    git commit --amend ../kconfig/patches

It is a bit contrived. A seasoned quilt user would probably come up with
something much simpler.

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
