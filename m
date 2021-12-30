Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF0FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A391A82862;
	Thu, 30 Dec 2021 20:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sA_4-ehHUi2I; Thu, 30 Dec 2021 20:42:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDD0E8132F;
	Thu, 30 Dec 2021 20:42:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 822381BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714DC405CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_RQZD3qW-VR for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7528C405D2
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D9AE582DF6; Thu, 30 Dec 2021 20:35:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:32:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be9ffe3a4eb35b83ede83f2338ddbf81d831aa58
X-Git-Newrev: 467917e2da4d211230eb2cda2978e8eb9fe29c8c
X-Patchwork-Hint: ignore
Message-Id: <20211230203553.D9AE582DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: introduce helper to
 properly json-escape a string
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

commit: https://git.buildroot.net/buildroot/commit/?id=467917e2da4d211230eb2cda2978e8eb9fe29c8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In quite a few places, we need to generate string that are proper JSON
values or keys.

However, JSON is very strict on what constitute a string, and most JSON
parsers (like jq or python3's json module) are very picky when parsing a
string; any deviation from the spec is immediately sanctioned by a hard
error (jq aborts, python3's json module raise an exception).

Introduce a macro that properly prepares a Makefile value into a valid
JSON string:

  - backslash '\' must be escaped;

  - double-quotes need to be escaped of course, as they are the string
    delimiter in JSON;

  - anything in the range [0x00..0x1F] must be escaped; in practice, we
    only ever need to escape \n, \t, and ESC (we could add more in the
    future if need be);

  - finally, we also escape the space, \x20, so that we can call
    $(strip) on a JSON blurb (like we do for example do build a
    comma-separated list, or when we sanitise the JSON) without losing
    multiple spaces where they make sense.

It would have been nice if we had been able to split the macro on
multiple lines, but spaces creep in from everywhere in that case, and
getting rid of them is getting quite nasty... We could introduce
intermediate macros, but meh...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 94e806963b..15e3e14e1b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -176,6 +176,17 @@ clean-json = $(strip \
 	))))) \
 )
 
+# mk-json-str -- escape and double-quote a string to make it a valid json string
+#  - escape \
+#  - escape "
+#  - escape \n
+#  - escape \t
+#  - escape ESC
+#  - escape SPACE (so that we can $(strip) a JSON blurb without squashing multiple spaces)
+# This unfortunately has to be on a single line...
+mk-json-str = "$(subst $(space),\u0020,$(subst $(escape),\u001b,$(subst $(tab),\t,$(subst $(sep),\n,$(subst ",\",$(subst \,\\,$(1)))))))"
+# )))))" # Syntax colouring
+
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 # rsync the contents of per-package directories
 # $1: space-separated list of packages to rsync from
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
