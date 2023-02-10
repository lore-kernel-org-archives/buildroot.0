Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57DCC636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5547A60FFE;
	Fri, 10 Feb 2023 22:32:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5547A60FFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQiBcXO2ZPuj; Fri, 10 Feb 2023 22:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7146D61170;
	Fri, 10 Feb 2023 22:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7146D61170
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DA1391BF36F
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B45A182239
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B45A182239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RinJCbGrEf70 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBFC8820A8
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBFC8820A8
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:31:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id ba1so6489691wrb.5
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:31:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C8gStTovxPYGUy1Eq5OFu7cj5nE0zOAJrzv9L+5y/AY=;
 b=If7GHKUzT4FF6kfu74zNGt7TRoRzt9iGVwqspZNMeI4VJjU3tFr9hfKgBVu3ZmYBKd
 d/xgWFH+Zn6tYqpbhicW9jhgl2Kqp9FJadHtRR3HfE0kIPiWzYv4jTZlbulvONzm+6iZ
 m4YDxUNVkwh6dsdx552DV1ZY7zvW1Wsg5j07vq4zDb12uVZgJPrFe7tibt9J/DsqvVEH
 L29KOOhP+pDg+mD3H58NfiQsIcUJmr44blxAE9imxHtWyXy2rVZHYPJMn3Z1o+f0iyOe
 QoDY6Ewj1ZrZ2LcykjFY4J3toN1fowvP8DbtJUOBWtHajq54wfGdH+5YBsRzsfHdCK6a
 ujSA==
X-Gm-Message-State: AO0yUKW6VRgXhqd4BB6CbFOaJCNqqMuE8s4qZdjAdbxlNvBREaJS2+K+
 gtkd9Gslpq9Xt5j44MxUb5m0kFFMoHw=
X-Google-Smtp-Source: AK7set84fmXyVw4/3Y1NhUnFx6rk/JYoWpTWSPihjKqZgrEbBGcwZu5xR9DAnKD5AF9hylf9jhK8Ww==
X-Received: by 2002:a5d:5604:0:b0:2c3:b47c:a0d9 with SMTP id
 l4-20020a5d5604000000b002c3b47ca0d9mr14897757wrv.50.1676068305178; 
 Fri, 10 Feb 2023 14:31:45 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 n15-20020a5d4c4f000000b002c54538c9bdsm3130221wrt.10.2023.02.10.14.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:31:44 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:31:43 +0100
Message-Id: <20230210223143.1060114-2-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210223143.1060114-1-yann.morin.1998@free.fr>
References: <20230210223143.1060114-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8gStTovxPYGUy1Eq5OFu7cj5nE0zOAJrzv9L+5y/AY=;
 b=Y9mpzBneTpfb6yxwV8mA4n1Xa6PR8B5BSEUIbSvwMq5jm4ODUqFJYRd05S4UdBapYJ
 V7spvRrOBRDpXmw4Op6UODC+QB39e5egRHmZCvzAo/9e49CT6odo4xXwOAkYUW7iSnUE
 Tj695HbRLTOBx3GvDAcKiznXnIhtKk13RVNrzDkRPRxt9RtSBMfM1IoOIkxKAT0RO1Tk
 J4g0XjNOEMygYIx+NCxn2HGDy9+rktfFyIYoMz4UICMOuxrNxLR/vppyjIcnQr3RRVzM
 q+NkRlkVtdHo94CBV8ke0K7xYFE0EBd/eZQj/9U/WpaQY9+REdLrSPKG3tcfG4/q7tw0
 hqBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Y9mpzBne
Subject: [Buildroot] [PATCH 2/2] support/download: fix the cargo
 post-process in face of failed vendoring
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
Cc: Simon Richter <simon.richter@ptwdosimetry.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit 04154a651729 (support/download/cargo-post-process: cargo
output for vendor config), we switched away from our hand-crafted
cargo.toml mangling, to use cargo itself to update that file.

In doing so, we enabled the shell pipefail option, so that we could
catch cargo failures, while redirecting its output through tee to the
cargo.toml.

However, pipefail is overzealous, and will hit us even for pipes we do
not want to globally fail, like the one that actually checks whether an
archive is already vendored or not:

    if tar tf "${output}" | grep -q "^[^/]*/VENDOR" ; then
        ...

with pipefail, the above may always fail:
  - if the tarball is already vendored, grep will exit on the first
    match because of -q (it only needs a single match to decide that its
    return code will be zero), so the | will get closed, and tar may
    get -EPIPE before it had a chance to finish listing the archive, and
    thus would terminate in error;
  - if the tarball is not vendored, grep will exit in error.

It turns out that the tee was only added so that we could see the
messages emitted by cargo, and still fill the cargo.tom with the output
of cargo.

But that's a bit overkill: the cargo messages are going to stderr, and
the blurb to add to cargo.toml to stdout, so we just need to redirect
stdout.

Yes, we do not see what cargo added to cargo.toml, but that is not so
interesting.

Still, cargo ends its messages with a suggestion for the user to modify
cargo.toml, with:

    To use vendored sources, add this to your .cargo/config.toml for this project:

But since we've already redirected that to cargo.toml, there is nothing
for the user to edit, so the above can get confusing. Emit a little
blurb that states that everything is under control.

And then we can drop pipefail.

Note: the go-post-process initially had pipefail too, but it was dropped
in bfd1a31d0e59 (support/download/go-post-process: drop -o pipefail) as
it was causing spurrious breakage when extracting the archive before
vendoring, so it is only reasonable that we also remove it from the
cargo-post-process.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Simon Richter <simon.richter@ptwdosimetry.com>
---
 support/download/cargo-post-process | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
index aea2d8da7a..3f4666c006 100755
--- a/support/download/cargo-post-process
+++ b/support/download/cargo-post-process
@@ -1,7 +1,6 @@
 #!/usr/bin/env bash
 
 set -e
-set -o pipefail
 
 . "${0%/*}/helpers"
 
@@ -31,7 +30,13 @@ flock "${CARGO_HOME}"/.br-lock \
 cargo vendor \
     --manifest-path ${BR_CARGO_MANIFEST_PATH-Cargo.toml} \
     --locked VENDOR \
-    | tee .cargo/config
+    > .cargo/config
+
+# "cargo vendor' outputs on stderr a message directing to add some data
+# to the project's .cargo/config.toml, data that it outputs on stdout.
+# Since we redirect stdout to .cargo/config.toml, the message on stderr
+# gets confusing, so instruct the user that it's been handled.
+printf '(note: .cargo/config.toml automatically updated by Buildroot)\n\n'
 
 popd > /dev/null
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
