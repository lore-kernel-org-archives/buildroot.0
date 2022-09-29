Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEB3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB4D34093E;
	Thu, 29 Sep 2022 13:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB4D34093E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HGbfMKv8NjM9; Thu, 29 Sep 2022 13:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E5F44018A;
	Thu, 29 Sep 2022 13:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E5F44018A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED92E1BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5FD260B77
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 13:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5FD260B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRVStyD-QzQK for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 13:55:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01DDD60B65
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 13:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01DDD60B65
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5B76864D1; Thu, 29 Sep 2022 13:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 15:53:46 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: d18c6c4a421bb265d8ae2808a62d71a1df37ef23
X-Git-Newrev: 3d60f6684c59d6fad9108f0c24b51fc67f0a8838
X-Patchwork-Hint: ignore
Message-Id: <20220929135526.E5B76864D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] utils/genrandconfig:
 disable libopenssl without atomics
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d60f6684c59d6fad9108f0c24b51fc67f0a8838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
libatomic):

${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
	 apps/libapps.a -lssl -lcrypto -ldl
/nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'

It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
"this is intended for internal development only, to check the
refcounting is properly coded.  It should never become a configuration
option, hence the name of the macro.":
https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb

Atomics are not available in Buildroot if:
 - architecture is 32 bit and something other than ARM or xtensa, and
 - GCC < 4.8 or no threads or FLAT.

The nothreads case can theoretically happen in many different
situations, but in practice nobody disables threads. So the only
interesting case is the FLAT case. Since ARM and RISC-V 64 both have
atomics intrinsics, that leaves just m68k NOMMU as FLAT. So this is
truly a corner case.

The proper solution would be to patch GCC to also provide libatomic in
those cases.
- For nothreads, atomics are in fact not needed, so libatomic can simply
  be implemented as stubs.
- For FLAT, it's probably just a matter of having a match to uclinux in
  libatomic/configure.tgt.

Again, though, this happens only in such niche cases that it's not worth
working on it.

Fixes:
 - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit af494d92d3d065a8939f0567bfbf312d177048f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 7fd17239c5..efa73e938d 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -247,6 +247,11 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
        'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
+    # libopenssl needs atomic, but propagating this dependency in
+    # Buildroot is really too much work, so we handle this here.
+    if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
+       not 'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' in configlines:
+        return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
