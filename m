Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D79C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 06:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B632161074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 06:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B632161074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC6140504;
	Sun, 19 Sep 2021 06:42:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JAc_iNtmKrZ; Sun, 19 Sep 2021 06:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE0D404FB;
	Sun, 19 Sep 2021 06:42:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 062C41BF341
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 06:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA0D7404FB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 06:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZE-4JBat2CW for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 06:42:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B872404CD
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 06:42:44 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 67-20020a9d0449000000b00546e5a8062aso6956107otc.9
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paral.in; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zUj37KonngCgR8V022HmdgQlcQ/hDR5GDQqo94aijRo=;
 b=FVRazMIjOiy1lpIRD29dGYd9zo1AJYwsd+JV9+pGktTrUqxKXQSDXbXPrQTEZ1QexE
 6kVgrRfKI1C+cCS6zLqv1y+QcuAVid4rArF/ISDUE+K2Nlc5iqyLUVlf+f2WKxFcu/82
 dJmlKgQXUROCZ2uHQsesdiRhjZOODfk0/uMxBomRyVPHDKQyV096vk7HIWBk61krrRVj
 ry1d6BITjM9KobGmQ/jTNEEfO2Jg5UDbl/4Fco6dx6n+iyNlIxxCTq+4+ohOgf7yqirc
 SRyH4idZxPBaB9VqZkUZsnw/GJAKNxfJdGzGaFGsUyUnzoyEXw5sFkCjCGjZk9+PyHF2
 yrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zUj37KonngCgR8V022HmdgQlcQ/hDR5GDQqo94aijRo=;
 b=WNBG92FmklABY4gQ0xcjL+/PRDPsaIyPMEjBrbkO9OkIjbiD9YjET2kd03RwmjvKjf
 vXdDqeJs7GwaAFYquuRb1RF0LZSqyQr0w/CJVdD4wCH4xBkDQhC1K07qooxYXvUnpE89
 hIqs4cPdWo6jXXBYMmJ0IG3CVKJM8M5X3a+KI5Y6JNCnFObX3Xiz8Tsw3wJ/Enz/x/JQ
 IAMjBEKhWZvhqvh/wXFeDXmaAF5kdbr/QyrU1UmhY36as7opadu+Dfkm6Vu9W0UZBhBe
 trDIKcFou+M6j/WHlUxuCZhuvWKwOtNFv2Hb7RoBsK62h5DC7o22ue+HRXQD/CkKUEnA
 ejRg==
X-Gm-Message-State: AOAM530mOR/sXxdXMZIcQ3KJWqeehE9BAROulfNBXjZ3JKV8UrKfaBAz
 pDNDgBf9EQii7J+uRA7dyz1aJwcYIdeqSA==
X-Google-Smtp-Source: ABdhPJz2+APrccFjKU8lXYYMvURkA3+c+4eoBksE2qaB4os08sE04rA8W89o4ed/u6tobsixGRRYAw==
X-Received: by 2002:a9d:6945:: with SMTP id p5mr16346068oto.301.1632033763136; 
 Sat, 18 Sep 2021 23:42:43 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com.
 [209.85.210.47])
 by smtp.gmail.com with ESMTPSA id c24sm1977457ook.37.2021.09.18.23.42.42
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Sep 2021 23:42:42 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id
 c8-20020a9d6c88000000b00517cd06302dso18983290otr.13
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 23:42:42 -0700 (PDT)
X-Received: by 2002:a9d:4694:: with SMTP id z20mr16468343ote.379.1632033762006; 
 Sat, 18 Sep 2021 23:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201219153525.1361175-1-thomas.petazzoni@bootlin.com>
 <20201219153525.1361175-6-thomas.petazzoni@bootlin.com>
 <CA+h8R2r_kBmCAF_ZAvF4EWivhXxaU1OBh6N=eAZSB=ZMqtrdow@mail.gmail.com>
 <20210729225000.750b323e@windsurf>
 <CA+h8R2onPMjOuvC0U6iM8QbhuAQQ9=aQ-yB-rWQkCbhpxcdiHw@mail.gmail.com>
 <20210801070830.GP3189549@scaer>
 <CA+h8R2pLN_aYiQ1vp+rTMUsQAcGT88fsAiCC-i9uJpK1y0r4rw@mail.gmail.com>
 <20210801091416.GQ3189549@scaer>
 <CA+h8R2oK8w3ub2MRaQ8AsXpREWh6UZSMnF080d4hnd=4bE5TJw@mail.gmail.com>
In-Reply-To: <CA+h8R2oK8w3ub2MRaQ8AsXpREWh6UZSMnF080d4hnd=4bE5TJw@mail.gmail.com>
Date: Sat, 18 Sep 2021 23:42:31 -0700
X-Gmail-Original-Message-ID: <CA+h8R2q4PF+JFzTmkSmnNBRo2tr3TiNrnk1wBYyf-BHr9XjvvA@mail.gmail.com>
Message-ID: <CA+h8R2q4PF+JFzTmkSmnNBRo2tr3TiNrnk1wBYyf-BHr9XjvvA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
Subject: Re: [Buildroot] [PATCH v2 05/12] support/download/go-post-process:
 implement Go vendoring support
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@lists.buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hi all,


On Sat, Sep 18, 2021 at 11:20 PM Christian Stewart <christian@paral.in> wrote:
> Some users are still running into the issue that on their system the
> "go mod vendor" process is producing different .tar.gz hashes than on
> most other systems. Yann previously checked on this and found that the
> access modes are wrong in the "bad" archive:

> > So, the first obvious delta: the access mode. In the 'good' archive, it
> > is 0644 (rw-r--r--), while in the 'bad' archive, it is 0664 (rw-rw-r--).
> >
> > But Buildroot is supposed to enforce the mode, see Makefile:
> >
> >     70: REQ_UMASK = 0022
> >     ...
> >     77: ifneq ($(shell umask):$(CURDIR):$(O),$(REQ_UMASK):$(CANONICAL_CURDIR):$(CANONICAL_O))
> >     ...
> >     83: _all:
> >     84:     @umask $(REQ_UMASK) && \
> >     85:         $(MAKE) -C $(CANONICAL_CURDIR) --no-print-directory \
> >     86:             $(MAKECMDGOALS) $(EXTRAMAKEARGS)
>
> [snip]
>
> > If we can find why the modes are different in your two cases, we can
> > probably solve the issue.
>

I have adjusted the code from the "support for Go vendoring" patch,
which I now see was never merged into mainline (yet),

The following now uses the "mk_tar_gz" helper, as Yann suggests to do:

diff --git a/support/download/post-process-helpers
b/support/download/post-process-helpers
old mode 100644
new mode 100755
index bed8df2577..0517abcc24
--- a/support/download/post-process-helpers
+++ b/support/download/post-process-helpers
@@ -1,3 +1,5 @@
+# Source the mk_tar_gz helper.
+. "${0%/*}/helpers"

 unpack() {
         dest="$1"
@@ -8,23 +10,23 @@ unpack() {
 }

 repack() {
-        src="$1"
+        base_name="$1"
         tarball="$2"
-
-        # Generate the archive, sort with the C locale so that it is
reproducible.
-        find "$(basename ${src})" -not -type d -print0 >files.list
-        LC_ALL=C sort -z <files.list >files.list.sorted
+        wdir="$(pwd)"

         # let's use a fixed hardcoded date to be reproducible
         date="2020-02-06 01:02:03 +0000"

-        # Create GNU-format tarballs, since that's the format of the
tarballs on
-        # sources.buildroot.org and used in the *.hash files
-        tar cf new.tar --null --verbatim-files-from --numeric-owner
--format=gnu \
-            --owner=0 --group=0 --mtime="${date}" -T files.list.sorted
-        gzip -6 -n <new.tar >new.tar.gz
+        # use the helper to create a reproducible archive
+        # note: the current working dir contains base_name.
+        mk_tar_gz "${base_name}" "${base_name}" "${date}" "${wdir}/new.tar.gz"
+
+        # replace the old tarball
         mv "${tarball}" "${tarball}".old
         mv new.tar.gz "${tarball}"
         rm "${tarball}".old
         rm -rf ${src}
 }
+
+# Keep this line and the following as last lines in this file.
+# vim: ft=bash

I think this might fix the issue, if so, shall I re-submit the go
vendoring series with the adjustments?

Thanks,
Christian Stewart
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
