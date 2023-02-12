Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218BEC05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8AD6817BA;
	Sun, 12 Feb 2023 08:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8AD6817BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Uwc_fHBwqVw; Sun, 12 Feb 2023 08:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E308A81383;
	Sun, 12 Feb 2023 08:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E308A81383
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE91E1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7196817ED
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 08:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7196817ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42WdCNMyCrew for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 08:45:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D199B817A9
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 08:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D199B817A9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFC3D8567E; Sun, 12 Feb 2023 08:45:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 09:39:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a39116b5dba6cf0695620e2ba5302f21fa80a4a5
X-Git-Newrev: 59b2e826f2a6c1874c5d032d3a5852326028bc0e
X-Patchwork-Hint: ignore
Message-Id: <20230212084528.BFC3D8567E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: fix the cargo
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=59b2e826f2a6c1874c5d032d3a5852326028bc0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
it was causing spurious breakage when extracting the archive before
vendoring, so it is only reasonable that we also remove it from the
cargo-post-process.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Simon Richter <simon.richter@ptwdosimetry.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
