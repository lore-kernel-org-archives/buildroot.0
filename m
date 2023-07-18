Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4B3EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE3761025;
	Tue, 18 Jul 2023 20:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE3761025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dgnpp7p4JdEg; Tue, 18 Jul 2023 20:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3738360BFB;
	Tue, 18 Jul 2023 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3738360BFB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 060A11BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2441415FD
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2441415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kRGnlEWLHVtX for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:42:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5AB6415F6
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5AB6415F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0ADD873DE; Tue, 18 Jul 2023 20:42:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:41:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0c6f049740b6b130301e356aab81c12de683645
X-Git-Newrev: 08171f1fd0c31165a39d79389300ddf9adb5bbb6
X-Patchwork-Hint: ignore
Message-Id: <20230718204240.A0ADD873DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 require IPC::Cmd perl package for libopenssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=08171f1fd0c31165a39d79389300ddf9adb5bbb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b85/b85b64162b3889d96c713030b46401e3e0a9a4e2/
http://autobuild.buildroot.net/results/fea/fea92e9c2a87a317675a7d0610c2ee467a373b69/

Since the bump to 3.0.9 with buildroot commit
3c66f65a6a549930870f2c0d98abb5ca9321d2a5 the configure script of
(host-)libopenssl needs the FindBin perl module on the host:

Can't locate IPC/Cmd.pm in @INC (you may need to install the IPC::Cmd
module) (@INC contains: /home/buildroot/autobuild/instance-1/output-1/
build/host-libopenssl-3.0.9/util/perl /home/buildroot/autobuild/instance
-1/output-1/host/lib/perl /usr/local/lib64/perl5/5.36 /usr/local/share/
perl5/5.36 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl
/usr/lib64/perl5 /usr/share/perl5 /home/buildroot/autobuild/instance-1/
output-1/build/host-libopenssl-3.0.9/external/perl/Text-Template-1.56/
lib) at /home/buildroot/autobuild/instance-1/output-1/build/host-lib
openssl-3.0.9/util/perl/OpenSSL/config.pm line 19.
BEGIN failed--compilation aborted at /home/buildroot/autobuild/instance
-1/output-1/build/host-libopenssl-3.0.9/util/perl/OpenSSL/config.pm line
19.

As this is needed for both libopenssl and host-libopenssl (which does not
have a corresponding config symbol in the .config), we have to require it
unconditionally.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 58f44c8723..6e7d067ccd 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -280,6 +280,7 @@ required_perl_modules="$required_perl_modules English" # Used by host-libxml-par
 required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 required_perl_modules="$required_perl_modules FindBin" # Used by (host-)libopenssl
+required_perl_modules="$required_perl_modules IPC::Cmd" # Used by (host-)libopenssl
 
 if grep -q ^BR2_PACKAGE_MOSH=y $BR2_CONFIG ; then
     required_perl_modules="$required_perl_modules diagnostics"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
