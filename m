Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0779C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30C5170672;
	Fri, 28 Feb 2025 17:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aByZCNUMdxlT; Fri, 28 Feb 2025 17:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A4670C90
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A4670C90;
	Fri, 28 Feb 2025 17:17:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEDA1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C97342545
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tROf99Qms6jr for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A02C44C23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A02C44C23
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 803A58749E; Fri, 28 Feb 2025 16:30:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Feb 2025 22:18:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3e7e28979b407b7b9a3742977fbdaa164d12fa1
X-Git-Newrev: 12e9fc1da5d4bc62a74dc24d24f3100e54f8cc61
X-Patchwork-Hint: ignore
Message-Id: <20250228163038.803A58749E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/docker: add tar 1.35
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12e9fc1da5d4bc62a74dc24d24f3100e54f8cc61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Since commit b11956fb6690 ("support/dependencies: require tar >= 1.35"),
Buildroot will build host-tar if the host does not have >= 1.35 available,
so add it to the container to save build time.

Debian 12 only provides tar 1.34.  Tar 1.35 is available in testing - But
that then depends on a newer glibc, so instead build it from source using
the --disable-year2038 flag like we do for host-tar and install it into
/usr/local/bin so it shadows the Debian one.

This step runs as root (and needs to for make install), so add
FORCE_UNSAFE_CONFIGURE=1 as otherwise the configure script errors out.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d10d0beb27..8b8a478f66 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -12,6 +12,9 @@ LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
 description="Container with everything needed to run Buildroot"
 
+# We need tar >= 1.35
+ARG TAR_VERSION="1.35"
+
 # Setup environment
 ENV DEBIAN_FRONTEND noninteractive
 
@@ -57,6 +60,16 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
     apt-get -y autoremove && \
     apt-get -y clean
 
+# Build host-tar
+RUN curl -sfL https://ftpmirror.gnu.org/tar/tar-${TAR_VERSION}.tar.xz | \
+    tar -Jx -C /tmp && \
+    cd /tmp/tar-${TAR_VERSION} && \
+    FORCE_UNSAFE_CONFIGURE=1 ./configure \
+        --disable-year2028 && \
+    make && \
+    make install && \
+    rm -rf /tmp/tar-${TAR_VERSION}
+
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
