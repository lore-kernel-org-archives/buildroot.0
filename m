Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FCEC3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 07:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11EC7406C7;
	Sun, 14 Jul 2024 07:16:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yB0HygJIu_Ta; Sun, 14 Jul 2024 07:16:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6298D406D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6298D406D8;
	Sun, 14 Jul 2024 07:16:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C89511BF3E5
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5D23605DB
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 07:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whYmjKFvGMSV for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 07:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD90605B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CD90605B0
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 07:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68F29866FB; Sun, 14 Jul 2024 07:16:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 08:53:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0964df557bedd88db1a223491fba615c995484f
X-Git-Newrev: 5836b797626db56958fec09810e16af1c75d2b4c
X-Patchwork-Hint: ignore
Message-Id: <20240714071649.68F29866FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib: extend hint about
 unprefixed variables
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5836b797626db56958fec09810e16af1c75d2b4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
