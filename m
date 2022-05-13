Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE702C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 13:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD6A40912;
	Fri, 13 May 2022 13:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8pyXNOAmKnmr; Fri, 13 May 2022 13:17:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25881408E6;
	Fri, 13 May 2022 13:17:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB961BF2AB
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 13:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4C3B408E9
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 13:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4QCn8EuER9FG for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 13:17:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98910408E0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:17:50 +0000 (UTC)
Received: from opfednr05.francetelecom.fr (unknown [xx.xx.xx.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr27.francetelecom.fr (ESMTP service) with ESMTPS id 4L08Mb6jWvz4x64; 
 Fri, 13 May 2022 15:17:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1652447867;
 bh=5s6KRwWxWTLAnw6hRtpm0En4fn7uIudKtEpZ3i4IlNA=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=UUyy9SDu92XSwreLhDqx2hxN1WNAnGw9ote45tyvaZbyPTyMNEtP8SOQSDh01/IYd
 FomfTJlvcSRLZ6JROQRa3k0fO9WNInALvIMn5LPwjM4Q0uRVkOySmymv5Si6KWM+rH
 mPrGyNdIEeXLoWFeqzquxWjLoi09bdkoAB3g70O4asI0tkw+F0B8Xds9GYfYNXOsrD
 Ed/LIOo9uCFPTf1cFR7+dgGQp1+9O8obcr7tmKKTtZwPqSVdZC9ByBl2NrJ4yr7+qk
 +FtQ1DqFRQNYvB/9+V5cSEapuzr+kDguivvCg9r00ENf8NTxl7sf2BeCJ7cqO1fUN9
 jIsE1eAMfiF5g==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 13 May 2022 15:17:45 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 13 May 2022 15:17:45 +0200
Message-ID: <28412_1652447867_627E5A7B_28412_29_1_cc0e3c8f4215e41cd4cd0742a94f777783beabfc.1652447836.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH v2] fs/oci: entrypoint and command are
 space-separated lists
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Matthew Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The prompt and variable name for the OCI "entrypoint arguments" are
somewhat incorrect. Indeed, they are in fact use to set the image
"command". Yet, using "command" would be confusing too, because the
interplay between entrypoint and command is tricky [0].

TL-DR; when both entrrypoint and command are set, command acts as
arguments passed to the entrypoint.

Additionally, we currently can only pass a single item as either
entrypoint or command. This precludes passing actual arguments to the
entrypoint, or passing multiple arguments as command.

For example:
    BR2_TARGET_ROOTFS_OCI_ENTRYPOINT="/bin/tini -g -p SIGTERM --"
    BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS="/usr/bin/env sh"

generates an images with (only relevant fileds are included below):

    {
        "config": {
            "Entrypoint": [ "/bin/tini -g -p SIGTERM --" ],
            "Cmd": [ "/usr/bin/env sh" ]
        }
    }

This is obviously incorrect, and not what one would expect:

    {
        "config": {
            "Entrypoint": [ "/bin/tini", "-g", "-p", "SIGTERM", "--" ],
            "Cmd": [ "/usr/bin/env", "sh" ]
        }
    }

However, some people do want to be able to pass an actual shell
scriptlet as a command, such as:

    {
        "config": {
            "Entrypoint": [ "/bin/sh", "-c" ],
            "Cmd": [ "my shell logic goes here" ]
        }
    }

Handling both is obviously conflicting: we can't both split-on-spaces
and not-split-on-spaces at the same time...

So, we fix that in tow ways:

  - make the current _OCI_ENTRYPOINT_ARGS a legacy option, and introduce
    the new _OCI_CMD option with different semantics (see below) and an
    appropriate prompt;

  - we interpret both _OCI_ENTRYPOINT and _OCI_CMD as shell strings,
    which we subject to the usual shell quoting [1] and token
    recognition [2];

Since _OCI_ENTRYPOINT_ARGS used to be interpreted as a single string, we
can't easily change its meaning to be a space-separated list, as that
would break existing setups, which is the reason we make it legacy and
introduce a new option.

Ideally, we would like to default the new option _OCI_CMD to be the
quoted value of the previous _OCI_ENTRYPOINT_ARGS, but this is not
possible in Kconfig. Still, users that had a _OCI_ENTRYPOINT_ARGS set
will now get an early build error, and can still detect they need to do
something about it.

As for _OCI_ENTRYPOINT, it does not make much sense to support both
cases. Indeed, withoput splitting on spaces, we'd end up with an
entrypoint that would hava single item:

    {
        "config": {
            "entrypoint: [ "some string with some spaces" ]
        }
    }

which in this case would try to execute the program which name is
actually "some string with some spaces", so we do not expect that
existing entrypoints are set with any space in them, and so the new
behaviour, unlike for _OCI_ENTRYPOINT_ARGS vs. _OCI_CMD, is compatible
with existing configurations, and so we do not need to make it a legacy
option and introduce a new one.

[0] https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
[1] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_02
[2] https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_03

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Sergio Prado <sergio.prado@e-labworks.com>
Cc: Matthew Weber <matthew.weber@collins.com>

---
Changes v1 -> v2:
  - drop _OCI_ENTRYPOINT_ARGS and replace with _OCI_CMD
  - accept values that have shell escapes and quotes, and spaces
---
 Config.in.legacy | 19 +++++++++++++++++++
 fs/oci/Config.in | 22 +++++++++++++++++++---
 fs/oci/oci.mk    | 28 +++++++++++++++++-----------
 3 files changed, 55 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 48c5ebb81e..8bbefc5ecd 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,25 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS
+	string "entrypoint argumetns has been changed as command"
+	help
+	  The OCI image BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS option has
+	  been renamed to BR2_TARGET_ROOTFS_OCI_CMD to better reflect its
+	  relation to the actual 'command' of the OCI image.
+
+	  The new semantic for BR2_TARGET_ROOTFS_OCI_CMD is slightly
+	  differnt in relation to how it is interpreted, so be sure to
+	  review the help entry for it.
+
+	  Due to this breaking change, the old value here could not be
+	  set to the new variable.
+
+config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS_WRAP
+	bool
+	default y if BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS != ""
+	select BR2_LEGACY
+
 config BR2_PACKAGE_LIBCURL_LIBNSS
 	bool "libcurl NSS removed"
 	select BR2_LEGACY
diff --git a/fs/oci/Config.in b/fs/oci/Config.in
index 8f36c91c8f..5e7aff282f 100644
--- a/fs/oci/Config.in
+++ b/fs/oci/Config.in
@@ -42,10 +42,26 @@ config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT
 	help
 	  Command to execute when the container starts.
 
-config BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS
-	string "entrypoint arguments"
+	  Spaces must be quoted or escaped, like for a shell string:
+	    /usr/bin/env sh -c
+	    /bin/my-init --some-option "1 2 3 4" some\ arg --
+
+	  See the Docker documentation on how entrypoint and command
+	  interact together:
+	    https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
+
+config BR2_TARGET_ROOTFS_OCI_CMD
+	string "command (or entrypoint arguments)"
 	help
-	  Default arguments to the entrypoint of the container.
+	  Default command, or entrypoint arguments, of the container.
+
+	  Spaces must be quoted or escaped, like for a shell string:
+	    "your shell scriptlet"
+	    /usr/bin/env sh
+
+	  See the Docker documentation on how entrypoint and command
+	  interact together:
+	    https://docs.docker.com/engine/reference/builder/#understand-how-cmd-and-entrypoint-interact
 
 config BR2_TARGET_ROOTFS_OCI_WORKDIR
 	string "working directory"
diff --git a/fs/oci/oci.mk b/fs/oci/oci.mk
index aa81920d36..4458cf8ef9 100644
--- a/fs/oci/oci.mk
+++ b/fs/oci/oci.mk
@@ -12,17 +12,23 @@ OCI_SLOCI_IMAGE_OPTS = --arch $(GO_GOARCH)
 # architecture variant (typically used only for arm)
 OCI_SLOCI_IMAGE_OPTS += $(and $(GO_GOARM),--arch-variant v$(GO_GOARM))
 
-# entrypoint
-OCI_ENTRYPOINT = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT))
-ifneq ($(OCI_ENTRYPOINT),)
-OCI_SLOCI_IMAGE_OPTS += --entrypoint "$(OCI_ENTRYPOINT)"
-endif
-
-# entrypoint arguments
-OCI_ENTRYPOINT_ARGS = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT_ARGS))
-ifneq ($(OCI_ENTRYPOINT_ARGS),)
-OCI_SLOCI_IMAGE_OPTS += --cmd "$(OCI_ENTRYPOINT_ARGS)"
-endif
+# entrypoint and command
+# Special treatment: both the entrypoint and arguments (aka command) are
+# a double-quoted, space-separated, escaped-double-quoted string, like:
+#     "foo \"1 2   3 4\" '  a b c d  ' bar\ buz"
+# which should be interpreted as a 4-item list (using single quotes to
+# delimit them and see leading/trailing spaces):
+#     'foo'
+#     '1 2   3 4'
+#     '  a b c d  '
+#     'bar buz'
+#
+# We use some trickery to have the shell properly expand this into a list
+# where each item is single-quoted and prefixed with the appropriate
+# option string:
+OCI_SLOCI_IMAGE_OPTS += \
+	$(shell eval printf -- "--entrypoint\ \'%s\'\ " $(BR2_TARGET_ROOTFS_OCI_ENTRYPOINT)) \
+	$(shell eval printf -- "--cmd\ \'%s\'\ " $(BR2_TARGET_ROOTFS_OCI_CMD))
 
 # author
 OCI_AUTHOR = $(call qstrip,$(BR2_TARGET_ROOTFS_OCI_AUTHOR))
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
