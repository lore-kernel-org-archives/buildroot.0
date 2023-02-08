Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DC6C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 14:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74906610FD;
	Wed,  8 Feb 2023 14:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74906610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXLtHRU5z7H7; Wed,  8 Feb 2023 14:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF81610F4;
	Wed,  8 Feb 2023 14:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF81610F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 212051BF395
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEBF960C14
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEBF960C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8hQ0_IH2zpp for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 14:28:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7C360C0C
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 14:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE7C360C0C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB595846BC; Wed,  8 Feb 2023 14:28:51 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 15:28:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc364c6ae65d3167409380b8883123a55270b18d
X-Git-Newrev: 7150edc790cda61270eb0ec1af7ab78255c90003
X-Patchwork-Hint: ignore
Message-Id: <20230208142851.DB595846BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/config: fix shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=7150edc790cda61270eb0ec1af7ab78255c90003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In utils/config line 54:
                ARG="`echo $ARG | tr a-z- A-Z_`"
                     ^------------------------^ SC2006: Use $(...) notation instead of legacy backticked `...`.
                           ^--^ SC2086: Double quote to prevent globbing and word splitting.

Did you mean:
                ARG="$(echo "$ARG" | tr a-z- A-Z_)"

In utils/config line 87:
        local tmpfile="$infile.swp"
              ^-----^ SC2034: tmpfile appears unused. Verify use (or export if used externally).

In utils/config line 182:
                        if [ $? != 0 ] ; then
                             ^-- SC2181: Check exit code directly with e.g. 'if mycmd;', not indirectly with $?.

For more information:
  https://www.shellcheck.net/wiki/SC2034 -- tmpfile appears unused. Verify us...
  https://www.shellcheck.net/wiki/SC2086 -- Double quote to prevent globbing ...
  https://www.shellcheck.net/wiki/SC2006 -- Use $(...) notation instead of le...

The suggestions from shellcheck can be applied.

The unused variable tmpfile in fact occurs in several functions, all of
them can be removed.

For the check exit code, the condition is swapped to avoid negative
logic.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/config | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/utils/config b/utils/config
index c5e2d723ea..5f5e4362e5 100755
--- a/utils/config
+++ b/utils/config
@@ -51,7 +51,7 @@ checkarg() {
 		usage
 	fi
 	if [ "$MUNGE_CASE" = "yes" ] ; then
-		ARG="`echo $ARG | tr a-z- A-Z_`"
+		ARG="$(echo "$ARG" | tr a-z- A-Z_)"
 	fi
 	case "$ARG" in
 	${BR2_PREFIX}*)
@@ -64,7 +64,6 @@ txt_append() {
 	local anchor="$1"
 	local insert="$2"
 	local infile="$3"
-	local tmpfile="$infile.swp"
 
 	# sed append cmd: 'a\' + newline + text + newline
 	cmd="$(printf "a\\%b$insert" "\n")"
@@ -76,7 +75,6 @@ txt_subst() {
 	local before="$1"
 	local after="$2"
 	local infile="$3"
-	local tmpfile="$infile.swp"
 
 	sed -i -e "s:$before:$after:" "$infile"
 }
@@ -84,7 +82,6 @@ txt_subst() {
 txt_delete() {
 	local text="$1"
 	local infile="$2"
-	local tmpfile="$infile.swp"
 
 	sed -i -e "/$text/d" "$infile"
 }
@@ -178,15 +175,14 @@ while [ "$1" != "" ] ; do
 		if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
 			echo n
 		else
-			V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"
-			if [ $? != 0 ] ; then
-				echo undef
-			else
+			if V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"; then
 				V="${V/#${BR2_PREFIX}$ARG=/}"
 				V="${V/#\"/}"
 				V="${V/%\"/}"
 				V="${V//\\\"/\"}"
 				echo "${V}"
+			else
+				echo undef
 			fi
 		fi
 		;;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
