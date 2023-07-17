Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCEDC0015E
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 04:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 413C140978;
	Mon, 17 Jul 2023 04:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 413C140978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzkDgMYGMBn9; Mon, 17 Jul 2023 04:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAA3D4099E;
	Mon, 17 Jul 2023 04:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAA3D4099E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF6C11BF955
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 04:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A55EB60E6A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 04:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A55EB60E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QGjzF5MKqXqa for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 04:10:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D6360E63
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D6360E63
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 04:10:52 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6689430d803so2665232b3a.0
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 21:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689567052; x=1692159052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RjRorvczpNLsRrk1vTVLfTPEU07N1Pn2TvsMef/rQUs=;
 b=Tw7HRv5G+luB7ZW6o+/mNM8h9nBwD7hBcCEAzxpf19oSWmX4iGzjLkbN/1jMBXfsG8
 ext7fdBOybGIs3x3U6rjGBUkIoGRy9wzxNAZFdsHybqALH9vYV42iPikZqYBRyTVr3EB
 +Ky09bI8SVqhUnbyN6pD2P3WstcJaqx9RfmFmlgU5wqwVoRiIeoJMO6eNW7MIJPk0Dyh
 umRgYLN2lTyMv5cz6ZOOu4EiX+uUGAYoZrS8dVWMUXu6RbTOzPw8KzlysbfZmGB/ZC9L
 Q+0COhhCS3KgVyCNTyTcHD99PbIbiRzqQvxqPT6MGU/AiL2gGwxY4cVvkYRrFSPXP/6v
 ZBdg==
X-Gm-Message-State: ABy/qLa6vL/2CvHKktZ+3vWUp9vIOoUoZo8RZfpuLh7wIVchufDAhxqO
 GkKiv4+49cYahm6GeCHLRU++/Vf7USi7Tr4KzKx6qQ==
X-Google-Smtp-Source: APBJJlHrrO9vHj+cQP1t6KGsnNhuyfpXlB/MmUO1Z5/aU4nmQJd2IdIMI8t4Cm5TqrmL87fhRL9Bmg==
X-Received: by 2002:a05:6a20:394d:b0:134:7708:49c5 with SMTP id
 r13-20020a056a20394d00b00134770849c5mr4489377pzg.36.1689567051957; 
 Sun, 16 Jul 2023 21:10:51 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 t18-20020a170902d21200b001b1c4d875f5sm11628976ply.44.2023.07.16.21.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 21:10:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 21:10:47 -0700
Message-ID: <20230717041047.1510851-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717041047.1510851-1-christian@aperture.us>
References: <20230717041047.1510851-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689567052; x=1692159052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjRorvczpNLsRrk1vTVLfTPEU07N1Pn2TvsMef/rQUs=;
 b=Sbd9Keb5Ap4g91o9k8sJclYysCWUnJPemYnQ6qFEWZsNkZDe1M2TAWqPdw8hVu5c9a
 ImWD7BfvS1OwzruMHrTsKNjoAENdKHVv+LvSYb95CkK+PpxmtIb5BQxrG3Her5SCV12r
 9wHym21h3IgYhpUbJotTCC6Y47sXFT/Bl6uLoZK2lrl76/JJ/2tJ/PXngiLUay3UBsFo
 atC8jDxUODb1uusW2AnnSzqoWfOMe+eyrkqtYsm+eq18hVhGUWoWT3eio7/61MEWj99S
 dtRgAMXEX8/wxPQ5noChq4pwEyhLBBY815htEEPDwCdeclfIu/RAQ6tWvxCOUm0rbdUO
 zlxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=Sbd9Keb5
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: backport fix for
 host header check
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Go 1.20.6 and 1.19.11 include a security check of the http Host header:

  https://github.com/golang/go/issues/60374

docker-cli does not satisfy this check:

  $ docker exec -it ctr bash
  http: invalid Host header

This is a backported patch to fix this issue:

Issue: https://github.com/moby/moby/issues/45935
Upstream PR: https://github.com/moby/moby/pull/45942

The upstream PR has been merged and will be included in v24.0.5.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 ...ackport-fix-for-go-Host-header-check.patch | 270 ++++++++++++++++++
 1 file changed, 270 insertions(+)
 create mode 100644 package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch

diff --git a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
new file mode 100644
index 0000000000..2d16fd6df2
--- /dev/null
+++ b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
@@ -0,0 +1,270 @@
+From 4dc783e2bdf414761ef7c209b435d0a30f17c858 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Sat, 15 Jul 2023 02:22:10 +0200
+Subject: [PATCH] backport fix for go Host header check
+
+Go 1.20.6 and 1.19.11 include a security check of the http Host header:
+    
+  https://github.com/golang/go/issues/60374
+
+docker-cli fails this check:
+
+  $ docker exec -it ctr bash
+  http: invalid Host header
+
+This is a backported patch to fix this issue.
+
+Issue: https://github.com/moby/moby/issues/45935
+Upstream PR: https://github.com/moby/moby/pull/45942
+
+The upstream PR has been merged and will be included in v24.0.5.
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+
+---
+
+For local communications (npipe://, unix://), the hostname is not used,
+but we need valid and meaningful hostname.
+
+The current code used the socket path as hostname, which gets rejected by
+go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
+which was implemented in  https://go.dev/issue/60374.
+
+Prior versions go Go would clean the host header, and strip slashes in the
+process, but go1.20.6 and go1.19.11 no longer do, and reject the host
+header.
+---
+ vendor.mod                                    | 16 +++++-----
+ vendor.sum                                    | 32 +++++++++----------
+ .../github.com/docker/docker/client/client.go | 30 +++++++++++++++++
+ .../github.com/docker/docker/client/hijack.go |  6 +++-
+ .../docker/docker/client/request.go           | 10 +++---
+ 6 files changed, 72 insertions(+), 40 deletions(-)
+
+diff --git a/vendor.mod b/vendor.mod
+index 93b252033b..ed4f4e8050 100644
+--- a/vendor.mod
++++ b/vendor.mod
+@@ -10,7 +10,7 @@ require (
+ 	github.com/containerd/containerd v1.6.21
+ 	github.com/creack/pty v1.1.18
+ 	github.com/docker/distribution v2.8.2+incompatible
+-	github.com/docker/docker v24.0.2+incompatible
++	github.com/docker/docker v24.0.5-0.20230714235725-36e9e796c6fc+incompatible // 24.0 branch
+ 	github.com/docker/docker-credential-helpers v0.7.0
+ 	github.com/docker/go-connections v0.4.0
+ 	github.com/docker/go-units v0.5.0
+@@ -23,24 +23,24 @@ require (
+ 	github.com/mitchellh/mapstructure v1.3.2
+ 	github.com/moby/buildkit v0.11.6
+ 	github.com/moby/patternmatcher v0.5.0
+-	github.com/moby/swarmkit/v2 v2.0.0-20230406225228-75e92ce14ff7
++	github.com/moby/swarmkit/v2 v2.0.0-20230531205928-01bb7a41396b
+ 	github.com/moby/sys/sequential v0.5.0
+ 	github.com/moby/sys/signal v0.7.0
+ 	github.com/moby/term v0.5.0
+ 	github.com/morikuni/aec v1.0.0
+ 	github.com/opencontainers/go-digest v1.0.0
+-	github.com/opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b
++	github.com/opencontainers/image-spec v1.1.0-rc3
+ 	github.com/pkg/errors v0.9.1
+-	github.com/sirupsen/logrus v1.9.0
++	github.com/sirupsen/logrus v1.9.3
+ 	github.com/spf13/cobra v1.7.0
+ 	github.com/spf13/pflag v1.0.5
+ 	github.com/theupdateframework/notary v0.7.1-0.20210315103452-bf96a202a09a
+ 	github.com/tonistiigi/go-rosetta v0.0.0-20200727161949-f79598599c5d
+ 	github.com/xeipuuv/gojsonschema v1.2.0
+ 	golang.org/x/sync v0.1.0
+-	golang.org/x/sys v0.6.0
+-	golang.org/x/term v0.6.0
+-	golang.org/x/text v0.8.0
++	golang.org/x/sys v0.8.0
++	golang.org/x/term v0.8.0
++	golang.org/x/text v0.9.0
+ 	gopkg.in/yaml.v2 v2.4.0
+ 	gotest.tools/v3 v3.4.0
+ )
+@@ -71,7 +71,7 @@ require (
+ 	github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415 // indirect
+ 	go.etcd.io/etcd/raft/v3 v3.5.6 // indirect
+ 	golang.org/x/crypto v0.2.0 // indirect
+-	golang.org/x/net v0.8.0 // indirect
++	golang.org/x/net v0.10.0 // indirect
+ 	golang.org/x/time v0.3.0 // indirect
+ 	google.golang.org/genproto v0.0.0-20220706185917-7780775163c4 // indirect
+ 	google.golang.org/grpc v1.50.1 // indirect
+diff --git a/vendor.sum b/vendor.sum
+index 15bc7cd703..3f8fbc6294 100644
+--- a/vendor.sum
++++ b/vendor.sum
+@@ -96,8 +96,8 @@ github.com/denisenkom/go-mssqldb v0.0.0-20191128021309-1d7a30a10f73/go.mod h1:xb
+ github.com/docker/distribution v2.7.1+incompatible/go.mod h1:J2gT2udsDAN96Uj4KfcMRqY0/ypR+oyYUYmja8H+y+w=
+ github.com/docker/distribution v2.8.2+incompatible h1:T3de5rq0dB1j30rp0sA2rER+m322EBzniBPB6ZIzuh8=
+ github.com/docker/distribution v2.8.2+incompatible/go.mod h1:J2gT2udsDAN96Uj4KfcMRqY0/ypR+oyYUYmja8H+y+w=
+-github.com/docker/docker v24.0.2+incompatible h1:eATx+oLz9WdNVkQrr0qjQ8HvRJ4bOOxfzEo8R+dA3cg=
+-github.com/docker/docker v24.0.2+incompatible/go.mod h1:eEKB0N0r5NX/I1kEveEz05bcu8tLC/8azJZsviup8Sk=
++github.com/docker/docker v24.0.5-0.20230714235725-36e9e796c6fc+incompatible h1:sdGvA1bxu/1J51gAs1XU0bZC+2WxncYnI210as3c6g8=
++github.com/docker/docker v24.0.5-0.20230714235725-36e9e796c6fc+incompatible/go.mod h1:eEKB0N0r5NX/I1kEveEz05bcu8tLC/8azJZsviup8Sk=
+ github.com/docker/docker-credential-helpers v0.7.0 h1:xtCHsjxogADNZcdv1pKUHXryefjlVRqWqIhk/uXJp0A=
+ github.com/docker/docker-credential-helpers v0.7.0/go.mod h1:rETQfLdHNT3foU5kuNkFR1R1V12OJRRO5lzt2D1b5X0=
+ github.com/docker/go v1.5.1-1.0.20160303222718-d30aec9fd63c h1:lzqkGL9b3znc+ZUgi7FlLnqjQhcXxkNM/quxIjBVMD0=
+@@ -273,8 +273,8 @@ github.com/moby/buildkit v0.11.6 h1:VYNdoKk5TVxN7k4RvZgdeM4GOyRvIi4Z8MXOY7xvyUs=
+ github.com/moby/buildkit v0.11.6/go.mod h1:GCqKfHhz+pddzfgaR7WmHVEE3nKKZMMDPpK8mh3ZLv4=
+ github.com/moby/patternmatcher v0.5.0 h1:YCZgJOeULcxLw1Q+sVR636pmS7sPEn1Qo2iAN6M7DBo=
+ github.com/moby/patternmatcher v0.5.0/go.mod h1:hDPoyOpDY7OrrMDLaYoY3hf52gNCR/YOUYxkhApJIxc=
+-github.com/moby/swarmkit/v2 v2.0.0-20230406225228-75e92ce14ff7 h1:h6NclNly6/B9N4IdM5pcBaq/LkNLuaCmE7B44Vj+pb0=
+-github.com/moby/swarmkit/v2 v2.0.0-20230406225228-75e92ce14ff7/go.mod h1:P/ha3F7UZMmuUvqrHw9cZK/BjktSngQIgRPiairNHTc=
++github.com/moby/swarmkit/v2 v2.0.0-20230531205928-01bb7a41396b h1:w07xyBXYTrihwBqCkuXPLqcQ1a2guqXlRIocU+e9K7A=
++github.com/moby/swarmkit/v2 v2.0.0-20230531205928-01bb7a41396b/go.mod h1:Z5i5At5g0zU+ZBWb/95yVwDeNQX8BZmei9ZoYvoVD7g=
+ github.com/moby/sys/sequential v0.5.0 h1:OPvI35Lzn9K04PBbCLW0g4LcFAJgHsvXsRyewg5lXtc=
+ github.com/moby/sys/sequential v0.5.0/go.mod h1:tH2cOOs5V9MlPiXcQzRC+eEyab644PWKGRYaaV5ZZlo=
+ github.com/moby/sys/signal v0.7.0 h1:25RW3d5TnQEoKvRbEKUGay6DCQ46IxAVTT9CUMgmsSI=
+@@ -301,8 +301,8 @@ github.com/onsi/gomega v1.9.0/go.mod h1:Ho0h+IUsWyvy1OpqCwxlQ/21gkhVunqlU8fDGcoT
+ github.com/opencontainers/go-digest v1.0.0 h1:apOUWs51W5PlhuyGyz9FCeeBIOUDA/6nW8Oi/yOhh5U=
+ github.com/opencontainers/go-digest v1.0.0/go.mod h1:0JzlMkj0TRzQZfJkVvzbP0HBR3IKzErnv2BNG4W4MAM=
+ github.com/opencontainers/image-spec v1.0.1/go.mod h1:BtxoFyWECRxE4U/7sNtV5W15zMzWCbyJoFRP3s7yZA0=
+-github.com/opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b h1:YWuSjZCQAPM8UUBLkYUk1e+rZcvWHJmFb6i6rM44Xs8=
+-github.com/opencontainers/image-spec v1.1.0-rc2.0.20221005185240-3a7f492d3f1b/go.mod h1:3OVijpioIKYWTqjiG0zfF6wvoJ4fAXGbjdZuI2NgsRQ=
++github.com/opencontainers/image-spec v1.1.0-rc3 h1:fzg1mXZFj8YdPeNkRXMg+zb88BFV0Ys52cJydRwBkb8=
++github.com/opencontainers/image-spec v1.1.0-rc3/go.mod h1:X4pATf0uXsnn3g5aiGIsVnJBR4mxhKzfwmvK/B2NTm8=
+ github.com/opencontainers/runc v1.1.7 h1:y2EZDS8sNng4Ksf0GUYNhKbTShZJPJg1FiXJNH/uoCk=
+ github.com/opencontainers/runc v1.1.7/go.mod h1:CbUumNnWCuTGFukNXahoo/RFBZvDAgRh/smNYNOhA50=
+ github.com/opentracing/opentracing-go v1.1.0 h1:pWlfV3Bxv7k65HYwkikxat0+s3pV4bsqf19k25Ur8rU=
+@@ -357,8 +357,8 @@ github.com/sirupsen/logrus v1.4.2/go.mod h1:tLMulIdttU9McNUspp0xgXVQah82FyeX6Mwd
+ github.com/sirupsen/logrus v1.6.0/go.mod h1:7uNnSEd1DgxDLC74fIahvMZmmYsHGZGEOFrfsX/uA88=
+ github.com/sirupsen/logrus v1.7.0/go.mod h1:yWOB1SBYBC5VeMP7gHvWumXLIWorT60ONWic61uBYv0=
+ github.com/sirupsen/logrus v1.8.1/go.mod h1:yWOB1SBYBC5VeMP7gHvWumXLIWorT60ONWic61uBYv0=
+-github.com/sirupsen/logrus v1.9.0 h1:trlNQbNUG3OdDrDil03MCb1H2o9nJ1x4/5LYw7byDE0=
+-github.com/sirupsen/logrus v1.9.0/go.mod h1:naHLuLoDiP4jHNo9R0sCBMtWGeIprob74mVsIT4qYEQ=
++github.com/sirupsen/logrus v1.9.3 h1:dueUQJ1C2q9oE3F7wvmSGAaVtTmUizReu6fjN8uqzbQ=
++github.com/sirupsen/logrus v1.9.3/go.mod h1:naHLuLoDiP4jHNo9R0sCBMtWGeIprob74mVsIT4qYEQ=
+ github.com/spf13/cast v0.0.0-20150508191742-4d07383ffe94 h1:JmfC365KywYwHB946TTiQWEb8kqPY+pybPLoGE9GgVk=
+ github.com/spf13/cast v0.0.0-20150508191742-4d07383ffe94/go.mod h1:r2rcYCSwa1IExKTDiTfzaxqT2FNHs8hODu4LnUfgKEg=
+ github.com/spf13/cobra v0.0.1/go.mod h1:1l0Ry5zgKvJasoi3XT1TypsSe7PqH0Sj9dhYf7v3XqQ=
+@@ -482,8 +482,8 @@ golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4/go.mod h1:p54w0d4576C0XHj96b
+ golang.org/x/net v0.0.0-20210525063256-abc453219eb5/go.mod h1:9nx3DQGgdP8bBQD5qxJ1jj9UTztislL4KSBs9R2vV5Y=
+ golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd/go.mod h1:CfG3xpIq0wQ8r1q4Su4UZFWDARRcnwPjda9FqA0JpMk=
+ golang.org/x/net v0.0.0-20220225172249-27dd8689420f/go.mod h1:CfG3xpIq0wQ8r1q4Su4UZFWDARRcnwPjda9FqA0JpMk=
+-golang.org/x/net v0.8.0 h1:Zrh2ngAOFYneWTAIAPethzeaQLuHwhuBkuV6ZiRnUaQ=
+-golang.org/x/net v0.8.0/go.mod h1:QVkue5JL9kW//ek3r6jTKnTFis1tRmNAW2P1shuFdJc=
++golang.org/x/net v0.10.0 h1:X2//UzNDwYmtCLn7To6G58Wr6f5ahEAQgKNzv9Y951M=
++golang.org/x/net v0.10.0/go.mod h1:0qNGK6F8kojg2nk9dLZ2mShWaEBan6FAoqfSigmmuDg=
+ golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod h1:N/0e6XlmueqKjAGxoOufVs8QHGRruUQn6yWY3a++T0U=
+ golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod h1:gOpvHmFTYa4IltrdGE7lF6nIHvwfUNPOp7c8zoXwtLw=
+ golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod h1:gOpvHmFTYa4IltrdGE7lF6nIHvwfUNPOp7c8zoXwtLw=
+@@ -553,13 +553,13 @@ golang.org/x/sys v0.0.0-20211025201205-69cdffdb9359/go.mod h1:oPkhp1MJrh7nUepCBc
+ golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
+ golang.org/x/sys v0.0.0-20220114195835-da31bd327af9/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
+ golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
+-golang.org/x/sys v0.6.0 h1:MVltZSvRTcU2ljQOhs94SXPftV6DCNnZViHeQps87pQ=
+-golang.org/x/sys v0.6.0/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
++golang.org/x/sys v0.8.0 h1:EBmGv8NaZBZTWvrbjNoL6HVt+IVy3QDQpJs7VRIw3tU=
++golang.org/x/sys v0.8.0/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
+ golang.org/x/term v0.0.0-20201117132131-f5c789dd3221/go.mod h1:Nr5EML6q2oocZ2LXRh80K7BxOlk5/8JxuGnuhpl+muw=
+ golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod h1:bj7SfCRtBDWHUb9snDiAeCFNEtKQo2Wmx5Cou7ajbmo=
+ golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod h1:jbD1KX2456YbFQfuXm/mYQcufACuNUgVhRMnK/tPxf8=
+-golang.org/x/term v0.6.0 h1:clScbb1cHjoCkyRbWwBEUZ5H/tIFu5TAXIqaZD0Gcjw=
+-golang.org/x/term v0.6.0/go.mod h1:m6U89DPEgQRMq3DNkDClhWw02AUbt2daBVO4cn4Hv9U=
++golang.org/x/term v0.8.0 h1:n5xxQn2i3PC0yLAbjTpNT85q/Kgzcr2gIoX9OrJUols=
++golang.org/x/term v0.8.0/go.mod h1:xPskH00ivmX89bAKVGSKKtLOWNx2+17Eiy94tnKShWo=
+ golang.org/x/text v0.0.0-20170915032832-14c0d48ead0c/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
+ golang.org/x/text v0.3.0/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
+ golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod h1:NqM8EUOU14njkJ3fqMW+pc6Ldnwhi/IjpwHt7yyuwOQ=
+@@ -568,8 +568,8 @@ golang.org/x/text v0.3.3/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
+ golang.org/x/text v0.3.5/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
+ golang.org/x/text v0.3.6/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
+ golang.org/x/text v0.3.7/go.mod h1:u+2+/6zg+i71rQMx5EYifcz6MCKuco9NR6JIITiCfzQ=
+-golang.org/x/text v0.8.0 h1:57P1ETyNKtuIjB4SRd15iJxuhj8Gc416Y78H3qgMh68=
+-golang.org/x/text v0.8.0/go.mod h1:e1OnstbJyHTd6l/uOt8jFFHp6TRDWZR/bV3emEE/zU8=
++golang.org/x/text v0.9.0 h1:2sjJmO8cDvYveuX97RDLsxlyUxLl+GHoLxBiRdHllBE=
++golang.org/x/text v0.9.0/go.mod h1:e1OnstbJyHTd6l/uOt8jFFHp6TRDWZR/bV3emEE/zU8=
+ golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
+ golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
+ golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
+diff --git a/vendor/github.com/docker/docker/client/client.go b/vendor/github.com/docker/docker/client/client.go
+index 1c081a51ae..54fa36cca8 100644
+--- a/vendor/github.com/docker/docker/client/client.go
++++ b/vendor/github.com/docker/docker/client/client.go
+@@ -56,6 +56,36 @@ import (
+ 	"github.com/pkg/errors"
+ )
+ 
++// DummyHost is a hostname used for local communication.
++//
++// It acts as a valid formatted hostname for local connections (such as "unix://"
++// or "npipe://") which do not require a hostname. It should never be resolved,
++// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
++// and [RFC 6761, Section 6.3]).
++//
++// [RFC 7230, Section 5.4] defines that an empty header must be used for such
++// cases:
++//
++//	If the authority component is missing or undefined for the target URI,
++//	then a client MUST send a Host header field with an empty field-value.
++//
++// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
++// allow an empty header to be used, and requires req.URL.Scheme to be either
++// "http" or "https".
++//
++// For further details, refer to:
++//
++//   - https://github.com/docker/engine-api/issues/189
++//   - https://github.com/golang/go/issues/13624
++//   - https://github.com/golang/go/issues/61076
++//   - https://github.com/moby/moby/issues/45935
++//
++// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
++// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
++// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
++// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
++const DummyHost = "api.moby.localhost"
++
+ // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
+ var ErrRedirect = errors.New("unexpected redirect in response")
+ 
+diff --git a/vendor/github.com/docker/docker/client/hijack.go b/vendor/github.com/docker/docker/client/hijack.go
+index 6bdacab10a..4dcaaca4c5 100644
+--- a/vendor/github.com/docker/docker/client/hijack.go
++++ b/vendor/github.com/docker/docker/client/hijack.go
+@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
+ }
+ 
+ func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
+-	req.Host = cli.addr
++	req.URL.Host = cli.addr
++	if cli.proto == "unix" || cli.proto == "npipe" {
++		// Override host header for non-tcp connections.
++		req.Host = DummyHost
++	}
+ 	req.Header.Set("Connection", "Upgrade")
+ 	req.Header.Set("Upgrade", proto)
+ 
+diff --git a/vendor/github.com/docker/docker/client/request.go b/vendor/github.com/docker/docker/client/request.go
+index c799095c12..bcedcf3bd9 100644
+--- a/vendor/github.com/docker/docker/client/request.go
++++ b/vendor/github.com/docker/docker/client/request.go
+@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
+ 		return nil, err
+ 	}
+ 	req = cli.addHeaders(req, headers)
++	req.URL.Scheme = cli.scheme
++	req.URL.Host = cli.addr
+ 
+ 	if cli.proto == "unix" || cli.proto == "npipe" {
+-		// For local communications, it doesn't matter what the host is. We just
+-		// need a valid and meaningful host name. (See #189)
+-		req.Host = "docker"
++		// Override host header for non-tcp connections.
++		req.Host = DummyHost
+ 	}
+ 
+-	req.URL.Host = cli.addr
+-	req.URL.Scheme = cli.scheme
+-
+ 	if expectedPayload && req.Header.Get("Content-Type") == "" {
+ 		req.Header.Set("Content-Type", "text/plain")
+ 	}
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
