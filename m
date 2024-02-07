Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA32C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 18:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5208681F54;
	Wed,  7 Feb 2024 18:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EHMc-ffZvMxi; Wed,  7 Feb 2024 18:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C94382075
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C94382075;
	Wed,  7 Feb 2024 18:06:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A49C1BF20D
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C4560D78
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 18:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JafgklFA9eu for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 18:06:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A535A610F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A535A610F2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A535A610F2
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 18:06:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A622C1C0003;
 Wed,  7 Feb 2024 18:06:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rXmJT-001Fd2-0Q;
 Wed, 07 Feb 2024 19:06:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  7 Feb 2024 19:06:19 +0100
Message-Id: <20240207180620.298393-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/ruby: build host-ruby with yaml support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

webkitgtk/wpewebkit needs a host-ruby with yaml support, otherwise the build
fails with errors like:

cd /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore && \
  /home/peko/source/buildroot/output/host/bin/ruby \
    /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/GenerateSettings.rb \
    --outputDir /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/WebCore/DerivedSources \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.cpp.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.idl.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/InternalSettingsGenerated.h.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/Settings.cpp.erb \
    --template /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/Scripts/SettingsTemplates/Settings.h.erb \
    /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/WTF/Scripts/Preferences/UnifiedWebPreferences.yaml \
    /home/peko/source/buildroot/output/build/webkitgtk-2.42.2/Source/WebCore/page/Settings.yaml
/home/peko/source/buildroot/output/host/lib/ruby/3.3.0/yaml.rb:3: warning: It seems your ruby installation is missing psych (for YAML output).
To eliminate this warning, please install libyaml and reinstall your ruby.

We do not currently have any Config.in.host options for ruby or libyaml, but
given how small/fast libyaml is to build just do it unconditionally.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4b9ce80e67..00fa0e0f65 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -20,7 +20,7 @@ RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 RUBY_CPE_ID_VENDOR = ruby-lang
 
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
-HOST_RUBY_DEPENDENCIES = host-pkgconf host-openssl
+HOST_RUBY_DEPENDENCIES = host-libyaml host-pkgconf host-openssl
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPTS = \
 	--disable-install-doc \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
