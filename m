Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A09C54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 10:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10D3A40235;
	Thu, 12 Jan 2023 10:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10D3A40235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whfS0OuKmuhp; Thu, 12 Jan 2023 10:25:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E74F400D6;
	Thu, 12 Jan 2023 10:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E74F400D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED3ED1BF476
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 10:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C91A260B24
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 10:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C91A260B24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Soy2rl-88X-I for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 10:25:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7986606E7
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 10:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7986606E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6BF587973; Thu, 12 Jan 2023 10:25:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 11:20:09 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4418e34d72d09d16ad2076f723ac83694263ebe0
X-Git-Newrev: ba59c92c9dfc18b6c2b36761ce5925d0ff329db9
X-Patchwork-Hint: ignore
Message-Id: <20230112102537.B6BF587973@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Makefile: fix use of many
 br2-external trees
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

commit: https://git.buildroot.net/buildroot/commit/?id=ba59c92c9dfc18b6c2b36761ce5925d0ff329db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The top level Makefile in buildroot has a recursive rule which causes
the appearance of a hang as the number of directories in BR2_EXTERNAL
increases. When the number of directories in BR2_EXTERNAL is small, the
recursion occurs, but make detects the recursion and determines the
target does not have to be remade. This allows make to progress.

This is the failing rule:

    define percent_defconfig
    # Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
    %_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
        @$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
                $$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
    endef
    $(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))

The rule for %defconfig is created for each directory in BR2_EXTERNAL.
When the rule is matched, the stem is 'defconfig_name'. The second
prerequisite is expanded to $(1)/configs/defconfig_name_defconfig. The
rule, and all of the other rules defined by this macro, are invoked
again, but the stem is now $(1)/configs/defconfig_name_defconfig. The
second prerequisite is now expanded to
$(1)/configs/($1)/configs/defconfig_name_defconfig. This expansion
continues until make detects the infinite recursion.

With up to 5 br2-external trees, the time is very small, so that it is
not noticeable. But starting with 6 br2-external trees, the time is
insanely big (so much so that we did not even let it finish after it ran
for hours); see timings toward the end of the commit log.

We fix that by adding a single %_defconfig rule, which is now rsponsible
to find the actual defconfig file that triggered the rule, by iterating
on the reverse list of br2-external trees and then in main tree.

Of course, now, there is no way for make to warn that there is no such
defconfig, as it is no longer part of the prerequisites of the rule. So,
we delegate to the recipe the responsibility to check for that.

Timing (seconds) of `make pc_x86_64_bios_defconfig` with 1..1000
external trees, with make 4.2.1 (* with make 4.3), on a Core i7-7700HQ:

    #trees    Before    After
         1     0.312    0.319
         2     0.319    0.323
         3     0.325    0.327
         4     0.353    0.339
         5     0.993    0.349
         6     1.26*    0.347
         7     9.10*    0.362
         8    85.93*    0.360
         9     n/a      0.373
        10     n/a      0.374
        50     n/a      0.738
       100     n/a      1.228
       500     n/a      7.483
      1000     n/a     16.076

How to reproduce:

    #!/usr/bin/env bash

    N="${1:-1000}"

    for i in $(seq 1 1000); do
        [ -d "br2-external/${i}/configs" ] && break
        mkdir -p br2-external/${i}/configs
        touch br2-external/${i}/{Config.in,external.mk}
        echo "name: BR_TEST_${i}" >br2-external/${i}/external.desc
        touch br2-external/${i}/configs/foo{,_${i}}_defconfig
    done

    time make \
        BR2_EXTERNAL="$(
            for i in $(seq 1 ${N}); do
                printf '%s\n' "$(pwd)/br2-external/${i}"
            done
        )" \
        foo_1_defconfig

Notes: the timings are very dependent on how much the CPU is otherwise
loaded, but having a multi-core CPU slightly loaded helps maintain a
high frequency on the siblings, and that can reduce the above timings
in half! Best to try on an otherwise-idle system.

Fixes: #14996

Reported-by: David Lawson <david.lawson1@tx.rr.com>
Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
[yann.morin.1998@free.fr:
  - split long foreach
  - drastically extend the commit log
  - provide reproducer script and redo timings
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e6195c53041f5a8aa375b9715f90beb5188d33e5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 06020ca18a..404dcaa270 100644
--- a/Makefile
+++ b/Makefile
@@ -1013,13 +1013,18 @@ oldconfig syncconfig olddefconfig: $(BUILD_DIR)/buildroot-config/conf outputmake
 defconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< --defconfig$(if $(DEFCONFIG),=$(DEFCONFIG)) $(CONFIG_CONFIG_IN)
 
-define percent_defconfig
-# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
-%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
-	@$$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$(1)/configs/$$@ \
-		$$< --defconfig=$(1)/configs/$$@ $$(CONFIG_CONFIG_IN)
-endef
-$(eval $(foreach d,$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)),$(call percent_defconfig,$(d))$(sep)))
+%_defconfig: $(BUILD_DIR)/buildroot-config/conf  outputmakefile
+	@defconfig=$(or \
+		$(firstword \
+			$(foreach d, \
+				$(call reverse,$(TOPDIR) $(BR2_EXTERNAL_DIRS)), \
+				$(wildcard $(d)/configs/$@) \
+			) \
+		), \
+		$(error "Can't find $@") \
+	); \
+	$(COMMON_CONFIG_ENV) BR2_DEFCONFIG=$${defconfig} \
+		$< --defconfig=$${defconfig} $(CONFIG_CONFIG_IN)
 
 update-defconfig: savedefconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
