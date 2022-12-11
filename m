Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB97AC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 10:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 762448140F;
	Sun, 11 Dec 2022 10:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762448140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dvT-I34ZnaY; Sun, 11 Dec 2022 10:38:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 515AC81495;
	Sun, 11 Dec 2022 10:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 515AC81495
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA01A1BF2A5
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C533060777
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 10:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C533060777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXfGwJel5jvZ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 10:38:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89EDC6060A
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 10:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89EDC6060A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74FB68601C; Sun, 11 Dec 2022 10:38:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 11:38:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 498b9c294239d4684641df5ee60e169a4ed85383
X-Git-Newrev: e744cc249030d0ded5c5bb445b9b4ac46e400957
X-Patchwork-Hint: ignore
Message-Id: <20221211103827.74FB68601C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gocryptfs: bump to version 2.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e744cc249030d0ded5c5bb445b9b4ac46e400957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase the patch for riscv compatibility as well.

"go mod tidy" insists on updating x/sys so pin it to the version from upstream
release v2.3 using a replace statement.

https://github.com/rfjakob/gocryptfs/releases/tag/v2.3

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...o.mod-fix-jacobsa-crypto-build-on-riscv64.patch | 84 +++++++++++++++-------
 package/gocryptfs/gocryptfs.hash                   |  2 +-
 package/gocryptfs/gocryptfs.mk                     |  2 +-
 3 files changed, 61 insertions(+), 27 deletions(-)

diff --git a/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
index 90e3cc262d..0074932fba 100644
--- a/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
+++ b/package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch
@@ -1,4 +1,4 @@
-From e9b64ab75e8539a52d60ecb299fc5425f0d27dc7 Mon Sep 17 00:00:00 2001
+From e72d34ef2c87e5c9ffd49c98b651641f48d89c24 Mon Sep 17 00:00:00 2001
 From: Christian Stewart <christian@paral.in>
 Date: Sat, 25 Jun 2022 14:57:38 -0700
 Subject: [PATCH] go.mod: fix jacobsa/crypto build on riscv64
@@ -11,27 +11,31 @@ Upstream PR: https://github.com/jacobsa/crypto/issues/13
 
 Signed-off-by: Christian Stewart <christian@paral.in>
 ---
- go.mod                                        |  9 ++---
- go.sum                                        |  4 +-
+ go.mod                                        | 15 ++++---
+ go.sum                                        | 16 +++-----
  .../jacobsa/crypto/cmac/hash_generic.go       | 40 +++++++++++++++++++
- vendor/modules.txt                            | 13 +-----
- 4 files changed, 48 insertions(+), 18 deletions(-)
+ vendor/modules.txt                            | 16 ++------
+ 4 files changed, 59 insertions(+), 28 deletions(-)
  create mode 100644 vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
 
 diff --git a/go.mod b/go.mod
-index 29f7c2c..533fcdd 100644
+index 754a667..5103029 100644
 --- a/go.mod
 +++ b/go.mod
-@@ -2,19 +2,18 @@ module github.com/rfjakob/gocryptfs/v2
+@@ -2,19 +2,22 @@ module github.com/rfjakob/gocryptfs/v2
  
  go 1.16
  
 +// Fixes build against risc-v
 +// See: https://github.com/jacobsa/crypto/issues/13
-+replace github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607 // xorblock-generic-1
++replace github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93 // buildroot-1
++
++// Prevent x/sys version from changing and polluting vendor/
++// Pin it to the current version in the original go.mod.
++replace golang.org/x/sys => golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
 +
  require (
- 	github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae
+ 	github.com/hanwen/go-fuse/v2 v2.1.1-0.20211219085202-934a183ed914
  	github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
 -	github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd // indirect
 -	github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff // indirect
@@ -43,25 +47,52 @@ index 29f7c2c..533fcdd 100644
  	github.com/spf13/pflag v1.0.5
  	golang.org/x/crypto v0.0.0-20210817164053-32db794688a5
 -	golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d // indirect
- 	golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
- 	golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b
+-	golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
++	golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a
+ 	golang.org/x/term v0.0.0-20220722155259-a9ba230a4035
  )
 diff --git a/go.sum b/go.sum
-index be0be5f..c26b80e 100644
+index 4167388..71826e9 100644
 --- a/go.sum
 +++ b/go.sum
 @@ -1,9 +1,9 @@
-+github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607 h1:N8UVJlxKDhrvHTKXC7oVVfhVvGbgaw2mmlnCgGkfOFc=
-+github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607/go.mod h1:Om5VFfyh5VipAEOOVoHAUa4hebUCKxQUjggFPTLeH08=
++github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93 h1:awSzmXfGWzvmRmrU1oSHqUdpxNcVPRMqv0rytbSA8kA=
++github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93/go.mod h1:SHG0nzlQikn4UxNIXqEKd2hvJM2tRIrdr1FfOrF+/wY=
  github.com/davecgh/go-spew v1.1.0 h1:ZDRjVQ15GmhC3fiQ8ni8+OwkZQO4DARzQgrnXU1Liz8=
  github.com/davecgh/go-spew v1.1.0/go.mod h1:J7Y8YcW2NihsgmVo/mv3lAwl/skON4iLHjSsI+c5H38=
- github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae h1:4CB6T4YTUVvnro5ba8ju1QCbOuyGAeF3vvKlo50EJ4k=
- github.com/hanwen/go-fuse/v2 v2.1.1-0.20210825171523-3ab5d95a30ae/go.mod h1:B1nGE/6RBFyBRC1RRnf23UpwCdyJ31eukw34oAKukAc=
+ github.com/hanwen/go-fuse/v2 v2.1.1-0.20211219085202-934a183ed914 h1:hGXMxS1wTE4y+f7iBqFArrJ6X8QozHnEdnVzGZI9Ywc=
+ github.com/hanwen/go-fuse/v2 v2.1.1-0.20211219085202-934a183ed914/go.mod h1:B1nGE/6RBFyBRC1RRnf23UpwCdyJ31eukw34oAKukAc=
 -github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 h1:YuDUUFNM21CAbyPOpOP8BicaTD/0klJEKt5p8yuw+uY=
 -github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115/go.mod h1:LadVJg0XuawGk+8L1rYnIED8451UyNxEMdTWCEt5kmU=
  github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd h1:9GCSedGjMcLZCrusBZuo4tyKLpKUPenUUqi34AkuFmA=
  github.com/jacobsa/oglematchers v0.0.0-20150720000706-141901ea67cd/go.mod h1:TlmyIZDpGmwRoTWiakdr+HA1Tukze6C6XbRVidYq02M=
  github.com/jacobsa/oglemock v0.0.0-20150831005832-e94d794d06ff h1:2xRHTvkpJ5zJmglXLRqHiZQNjUoOkhUyhTAhEQvPAWw=
+@@ -30,21 +30,17 @@ github.com/stretchr/testify v1.6.1/go.mod h1:6Fq8oRcR53rry900zMqJjRRixrwX3KX962/
+ golang.org/x/crypto v0.0.0-20210817164053-32db794688a5 h1:HWj/xjIHfjYU5nVXpTM0s39J9CbLn7Cc5a7IC5rwsMQ=
+ golang.org/x/crypto v0.0.0-20210817164053-32db794688a5/go.mod h1:GvvjBRRGRdwPK5ydBHafDWAxML/pGHZbMvKqRZ5+Abc=
+ golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod h1:m0MpNAwzfU5UDzcl9v0D8zg8gWTRqZa9RBIspLL5mdg=
+-golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d h1:LO7XpTYMwTqxjLcGWPijK3vRXg1aWdlNOVOHRq45d7c=
+-golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d/go.mod h1:9nx3DQGgdP8bBQD5qxJ1jj9UTztislL4KSBs9R2vV5Y=
++golang.org/x/net v0.0.0-20220708220712-1185a9018129 h1:vucSRfWwTsoXro7P+3Cjlr6flUMtzCwzlvkxEQtHHB0=
++golang.org/x/net v0.0.0-20220708220712-1185a9018129/go.mod h1:XRhObCWvk6IyKnWLug+ECip1KBveYUHfp+8e9klMJ9c=
+ golang.org/x/sync v0.0.0-20201207232520-09787c993a3a/go.mod h1:RxMgew5VJxzue5/jJTE5uejpjVlOe/izrB70Jof72aM=
+-golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod h1:STP8DvDyc/dI5b8T5hshtkjS+E42TnysNCUPdjciGhY=
+-golang.org/x/sys v0.0.0-20201101102859-da207088b7d1/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
+-golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
+-golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod h1:h1NjWce9XRLGQEsW7wpKNCjG9DtNlClVuFLEZdDNbEs=
+-golang.org/x/sys v0.0.0-20210615035016-665e8c7367d1/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
+ golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2 h1:c8PlLMqBbOHoqtjteWm5/kbe6rNY2pbRfbIMVnepueo=
+ golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
+ golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod h1:bj7SfCRtBDWHUb9snDiAeCFNEtKQo2Wmx5Cou7ajbmo=
++golang.org/x/term v0.0.0-20210927222741-03fcf44c2211/go.mod h1:jbD1KX2456YbFQfuXm/mYQcufACuNUgVhRMnK/tPxf8=
+ golang.org/x/term v0.0.0-20220722155259-a9ba230a4035 h1:Q5284mrmYTpACcm+eAKjKJH48BBwSyfJqmmGDTtT8Vc=
+ golang.org/x/term v0.0.0-20220722155259-a9ba230a4035/go.mod h1:jbD1KX2456YbFQfuXm/mYQcufACuNUgVhRMnK/tPxf8=
+ golang.org/x/text v0.3.3/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
+-golang.org/x/text v0.3.6/go.mod h1:5Zoc/QRtKVWzQhOtBMvqHzDpF6irO9z98xDceosuGiQ=
++golang.org/x/text v0.3.7/go.mod h1:u+2+/6zg+i71rQMx5EYifcz6MCKuco9NR6JIITiCfzQ=
+ golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod h1:n7NCudcB/nEzxVGmLbDWY5pfWTLqBcC2KZ6jyYvM4mQ=
+ gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod h1:Co6ibVJAznAaIkqp8huTwlJQCZ016jof/cbN4VW5Yz0=
+ gopkg.in/yaml.v3 v3.0.0-20200313102051-9f266ea9e77c h1:dUUwHk2QECo/6vqA44rthZ8ie2QXMNeKRTHCNY2nXvo=
 diff --git a/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go b/vendor/github.com/jacobsa/crypto/cmac/hash_generic.go
 new file mode 100644
 index 0000000..235e3fc
@@ -109,7 +140,7 @@ index 0000000..235e3fc
 +	}
 +}
 diff --git a/vendor/modules.txt b/vendor/modules.txt
-index 662f0c3..9b47daa 100644
+index 0e97e42..634c079 100644
 --- a/vendor/modules.txt
 +++ b/vendor/modules.txt
 @@ -5,19 +5,11 @@ github.com/hanwen/go-fuse/v2/fuse
@@ -117,7 +148,7 @@ index 662f0c3..9b47daa 100644
  github.com/hanwen/go-fuse/v2/internal/utimens
  github.com/hanwen/go-fuse/v2/splice
 -# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115
-+# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607
++# github.com/jacobsa/crypto v0.0.0-20190317225127-9f44e2d11115 => github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93
  ## explicit
  github.com/jacobsa/crypto/cmac
  github.com/jacobsa/crypto/common
@@ -133,20 +164,23 @@ index 662f0c3..9b47daa 100644
  # github.com/pkg/xattr v0.4.3
  ## explicit
  github.com/pkg/xattr
-@@ -40,8 +32,6 @@ golang.org/x/crypto/pbkdf2
+@@ -39,9 +31,7 @@ golang.org/x/crypto/internal/subtle
+ golang.org/x/crypto/pbkdf2
  golang.org/x/crypto/poly1305
  golang.org/x/crypto/scrypt
- golang.org/x/crypto/ssh/terminal
 -# golang.org/x/net v0.0.0-20210813160813-60bc85c4be6d
 -## explicit
- # golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
+-# golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
++# golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a => golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
  ## explicit
  golang.org/x/sys/cpu
-@@ -52,3 +42,4 @@ golang.org/x/sys/windows
- # golang.org/x/term v0.0.0-20210615171337-6886f2dfbf5b
+ golang.org/x/sys/internal/unsafeheader
+@@ -51,3 +41,5 @@ golang.org/x/sys/windows
+ # golang.org/x/term v0.0.0-20220722155259-a9ba230a4035
  ## explicit
  golang.org/x/term
-+# github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v0.0.0-20220403053904-77863254e607
++# github.com/jacobsa/crypto => github.com/aperturerobotics/jacobsa-crypto v1.0.2-0.20221208222437-85e082e29e93
++# golang.org/x/sys => golang.org/x/sys v0.0.0-20210817190340-bfb29a6856f2
 -- 
-2.35.1
+2.38.1
 
diff --git a/package/gocryptfs/gocryptfs.hash b/package/gocryptfs/gocryptfs.hash
index ae161d1cd8..28965a0648 100644
--- a/package/gocryptfs/gocryptfs.hash
+++ b/package/gocryptfs/gocryptfs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  88f32bb8e18fa89e4ab666f7c8ad622281a11e423b4093e50ac260f960bc40b6  gocryptfs-2.2.1.tar.gz
+sha256  bfc98c18e44a2ca24a0e1472b6d9bb96e6072d7fb5651616515d2e7117b8fed9  gocryptfs-2.3.tar.gz
 sha256  322a7e3b02cf18e38b7e6b18cafefb773df8676c65634b34e8a2beb931294a4b  LICENSE
diff --git a/package/gocryptfs/gocryptfs.mk b/package/gocryptfs/gocryptfs.mk
index 8f70dba7c3..077597e7e8 100644
--- a/package/gocryptfs/gocryptfs.mk
+++ b/package/gocryptfs/gocryptfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GOCRYPTFS_VERSION = 2.2.1
+GOCRYPTFS_VERSION = 2.3
 GOCRYPTFS_SITE = $(call github,rfjakob,gocryptfs,v$(GOCRYPTFS_VERSION))
 GOCRYPTFS_LICENSE = MIT
 GOCRYPTFS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
