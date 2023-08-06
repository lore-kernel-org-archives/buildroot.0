Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B82EC8736
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E78A882FB1;
	Thu,  7 Sep 2023 15:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E78A882FB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dw-MQYJ3Pjq1; Thu,  7 Sep 2023 15:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E4CE82897;
	Thu,  7 Sep 2023 15:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E4CE82897
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1105A1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC06F41DBC
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC06F41DBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpUFYixIhysY for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0908241D83
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0908241D83
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0711686A20; Thu,  7 Sep 2023 14:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 16:35:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 206d08c04a0bb8e7d03a672a322a4c30c2b0dde8
X-Git-Newrev: 92d51faedab5f738ad3b9e7b7084c177e100cc7b
X-Patchwork-Hint: ignore
Message-Id: <20230907145126.0711686A20@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: use svn credentials to
 retrieve revision date
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

commit: https://git.buildroot.net/buildroot/commit/?id=92d51faedab5f738ad3b9e7b7084c177e100cc7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When an svn repository requires credentials, and they are passed
in _DL_OPTS, they must be used also to retrieve the revision date.

One could argue that credentials should not be handled in _DL_OPTS, but
rather that they be fed through other means (e.g. by pre-authenticating
manually once in an interactive session, or by filling them in the usual
~/svn/auth/* mechanisms for a CI).

However, some public facing repositories are using authentication, even
though the credentials are public. This is the case for example for:
    http://software.rtcm-ntrip.org/

In such a case, it does make sense to pass credentials via _DL_OPTS,
because they are not really, even really not, secret.

Another use-case (e.g. for a CI) is to pass the credentials as
environment variables, with _DL_OPTS not hard-coded in the .mk file.

However, _DL_OPTS may contain options that are not valid for 'svn info',
as they are meant to be passed to 'svn export' in the first place. Since
the only options common to 'svn info' and 'svn export' are the
credentials, we just extract those and pass them to 'svn info'.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/svn | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/support/download/svn b/support/download/svn
index d9325b7478..3e08a0ef36 100755
--- a/support/download/svn
+++ b/support/download/svn
@@ -54,12 +54,28 @@ _plain_svn() {
 
 _svn export --ignore-keywords ${quiet} "${@}" "'${uri}@${rev}'" "'${basename}'"
 
+# For 'svn info', we only need the credentials, if any; other options
+# would be invalid, as they are intended for 'svn export'.
+# We can also consume the positional parameters, as we'll no longer
+# be calling any other remote-reaching svn command.
+creds=
+while [ ${#} -gt 0 ]; do
+    case "${1}" in
+    --username=*)   creds+=" ${1}"; shift;;
+    --password=*)   creds+=" ${1}"; shift;;
+    --username)     creds+=" ${1} ${2}"; shift 2;;
+    --password)     creds+=" ${1} ${2}"; shift 2;;
+    *)              shift;;
+    esac
+done
+
 # Get the date of the revision, to generate reproducible archives.
 # The output format is YYYY-MM-DDTHH:MM:SS.mmmuuuZ (i.e. always in the
 # UTC timezone), which we can feed as-is to the --mtime option for tar.
 # In case there is a redirection (e.g. http -> https), just keep the
 # last line (svn outputs everything on stdout)
-date="$( _plain_svn info "'${uri}@${rev}'" \
+# shellcheck disable=SC2086 # creds may be empty
+date="$( _plain_svn info ${creds} "'${uri}@${rev}'" \
         |sed -r -e '/^Last Changed Date: /!d; s///'
        )"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
