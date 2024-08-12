Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F6C52D7C
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 13:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA2E409CB;
	Mon, 12 Aug 2024 13:10:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG2qpC-3x9g3; Mon, 12 Aug 2024 13:10:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB60540D6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB60540D6B;
	Mon, 12 Aug 2024 13:10:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E82C51BF311
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6394380C34
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 13:09:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gTYgQ0j-y9gH for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 13:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD8A80C2F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD8A80C2F
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 13:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0FFC78523E; Mon, 12 Aug 2024 13:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 15:08:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 713db62f05094f767d83bc323f58518591745ee2
X-Git-Newrev: 6beb77d27e8c0085c16743ffb177ed3dc9b8f350
X-Patchwork-Hint: ignore
Message-Id: <20240812130957.0FFC78523E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] utils/checkpackagelib:
 extend hint about unprefixed variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=6beb77d27e8c0085c16743ffb177ed3dc9b8f350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

User may get confused when they see the current hint, and take that as
the proper replacement, while we're only reporting the stem of the
variable name:

    .../foo.mk:16: possible typo: BLA -> *FOO*

There is usually no easy way to actually suggest the proper variable
name, though, so let's make it a little bit more obvious that we meant
the variable was improperly prefixed:

    .../foo.mk:16: possible typo, variable not properly prefixed: BLA -> *FOO_XXX*

And while at it, throw in the URL to the corresponding manual entry.

Adapt the test accordingly.

Reported-by: "Frager, Neal" <neal.frager@amd.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Reviewed-by: Neal Frager <neal.frager@amd.com>
[Arnout: also update new test, scoped -> prefixed]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5836b797626db56958fec09810e16af1c75d2b4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_mk.py      |  4 ++--
 utils/checkpackagelib/test_lib_mk.py | 17 +++++++++--------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index d21e409b4c..5d48e8929c 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -317,8 +317,8 @@ class TypoInPackageVariable(_CheckFunction):
         if self.ALLOWED.match(variable):
             return
         if self.REGEX.search(variable) is None:
-            return ["{}:{}: possible typo: {} -> *{}*"
-                    .format(self.filename, lineno, variable, self.package),
+            return ["{}:{}: possible typo, variable not properly prefixed: {} -> *{}_XXXX* ({}#_tips_and_tricks)"
+                    .format(self.filename, lineno, variable, self.package, self.url_to_manual),
                     text]
 
 
diff --git a/utils/checkpackagelib/test_lib_mk.py b/utils/checkpackagelib/test_lib_mk.py
index 208b1ecdc2..c86c55b9cb 100644
--- a/utils/checkpackagelib/test_lib_mk.py
+++ b/utils/checkpackagelib/test_lib_mk.py
@@ -546,27 +546,27 @@ TypoInPackageVariable = [
     ('bad =',
      'any.mk',
      'OTHER_VAR = \n',
-     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly prefixed: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR = \n']]),
     ('bad +=',
      'any.mk',
      'OTHER_VAR += \n',
-     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly prefixed: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR += \n']]),
     ('ignore missing space',
      'any.mk',
      'OTHER_VAR= \n',
-     [['any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly prefixed: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR= \n']]),
     ('use path in the warning',
      './any.mk',
      'OTHER_VAR = \n',
-     [['./any.mk:1: possible typo: OTHER_VAR -> *ANY*',
+     [['./any.mk:1: possible typo, variable not properly prefixed: OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHER_VAR = \n']]),
     ('another name',
      'other.mk',
      'ANY_VAR = \n',
-     [['other.mk:1: possible typo: ANY_VAR -> *OTHER*',
+     [['other.mk:1: possible typo, variable not properly prefixed: ANY_VAR -> *OTHER_XXXX* (url#_tips_and_tricks)',
        'ANY_VAR = \n']]),
     ('libc exception',
      './any.mk',
@@ -583,7 +583,7 @@ TypoInPackageVariable = [
     ('host (bad)',
      'any.mk',
      'HOST_OTHER_VAR = \n',
-     [['any.mk:1: possible typo: HOST_OTHER_VAR -> *ANY*',
+     [['any.mk:1: possible typo, variable not properly prefixed: HOST_OTHER_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'HOST_OTHER_VAR = \n']]),
     ('provides',
      'any.mk',
@@ -599,13 +599,14 @@ TypoInPackageVariable = [
      'any.mk',
      'ANY_PROVIDES = other\n'
      'OTHERS_VAR = \n',
-     [['any.mk:2: possible typo: OTHERS_VAR -> *ANY*',
+     [['any.mk:2: possible typo, variable not properly prefixed: OTHERS_VAR -> *ANY_XXXX* (url#_tips_and_tricks)',
        'OTHERS_VAR = \n']]),
     ('linux tool',
      'package/linux-tools/linux-tool-cpupower.mk.in',
      'CPUPOWER_DEPENDENCIES =\n'
      'POWER_DEPENDENCIES +=\n',
-     [['package/linux-tools/linux-tool-cpupower.mk.in:2: possible typo: POWER_DEPENDENCIES -> *CPUPOWER*',
+     [['package/linux-tools/linux-tool-cpupower.mk.in:2: possible typo, variable not properly prefixed: '
+         'POWER_DEPENDENCIES -> *CPUPOWER_XXXX* (url#_tips_and_tricks)',
        'POWER_DEPENDENCIES +=\n']]),
     ]
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
