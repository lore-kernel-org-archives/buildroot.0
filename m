Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C668CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E506149D;
	Fri, 16 Oct 2026 13:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id X99avxxUhOI3; Fri, 16 Oct 2026 13:14:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A68EF61486
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156461;
	b=Vqf6GyqlSmhoDxB4II5/hX/ss/lS7QEapOYH+Ba556K4YsoRnGFYmcX82kziM6QjjdiY
	 9m7jelJlFEdhIj2xFa/Dr5P2AEP0jODC1t7iaV4aPDKocpl81Com2qwjgNJ1Y4NeSrBVm
	 YfHk61MIPlMcETvBxhYFl4jy+aWPxN3n9S2fV9LiAd2jue+f3ZW7ADi3NbxJKW89V492E
	 BU/ddO+slG1Yk+jQxNJFknv8IhB2kFkjKHhtPV/+pjDxtQs2cV1ihOiklkdjXPMX+zWiE
	 hgoG9HXzb9dwtKBQml62sVLY9uOeiL3cAtOq7pMeLVzBoReWhiqbSP/RmwgSD0A7R/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156461;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=4O/BZ0Mdpgbe1KJTgvXVFldMwsGISJ0SCTFIjPfbmJ8=;
	b=g0ZtRYnYt/muH0Vt8GPCL8Ox55PB/xmYEX/JpFxuxTQUj8GEcH6MKtT/4PmUCjpFZnQt
	 /Ermn+NugAKayyM9z15u796JM/9tRDj8uhCLXsumwgyB9gCKIUfHpz4AgiI+69wd/MoaY
	 p9FdGEPZjPk5CmhL/ayZ7iTJA8UipcNST3+51Nlg53wax4tSeNHpQli30/1s1Lnf4Es2/
	 Hd56j3OQnxJzxu5gs95f5cYx9mHozPHhFO5W8uqWzr3ulVl8dm0PlbaLXLhjpyKNHSNY4
	 VCdavAotAMM0SAtIF3fuKvhlvtkg8yVw7G/DvjdOFVxV2rhRGFkF0C1NqndQUsVDa1A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156461;
	bh=4O/BZ0Mdpgbe1KJTgvXVFldMwsGISJ0SCTFIjPfbmJ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EnOffROU4eaNPvcYu5D5b95ipzGuivVpmM9PEAq2xHypF39OOSoTi1lQ/wjOIMHtT
	 6LZ9SnQ80rE+Ma3pwTUicv/pR+NHR5fvIJ9/i7gwNiyBPNn6t1CCGMC6EPuN+khRfX
	 lUTdjlf79c83TMaGjlu0nIRzTw01tW/Vl273OxmuwJ+McKpWowIBJO9O+nGPmSqt9z
	 DvZyTS9AR0lQJgEs5FS8+zElHz4FFTt/3jbYN7M8Q8fYh+InSmLGk7lSRPubG7jYR2
	 /ed4LJMYSdXi85sNDb+Dexnc3RVz9LEVE5nHl+Tieqe9dgUMuu8LSg5eQcNDbbVZOk
	 I9Fniyr6UaFlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A68EF61486;
	Fri, 16 Oct 2026 13:14:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 97DD9769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DF1E60F28
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukUf52RnJIKt for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ECDA860F6B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156195;
 b=C8tTBWcAhkREMEm9Z5hJLFod2lIE9elV1yeCf5kAHt4lqjP7Ba/62LRuymEdx3KblaIS
 ahkEaw/48wAWbuCz7/awhjHn49V4FjR0tvxM1jcRfHyvcPW4OM3fu9wQLvh48D4wJ4RWM
 lshinq8wcLNmGBCUVY2IfhCqgAfKJGL7HOJh5DeYb6VWtY1TczssdCOFgntvhSuC0Q9HY
 TKspT/5EBYSRUkSPMM6enb7jx9I9+tY/LThK3Gs0wSl60138a+XaEPwRvfOH7cEvqZzfi
 8NbA+5yJNXXmX/N20/OUMNAFFz1SceS22B3g7cUZxgyQB+imsrmcQuzZ4H5ox1SHrtw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156195;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zJtNqfh++s164gzoA1uuEc6pXI7sGXFl92CSIDJG5uw=;
 b=Ud3m4G+tZSihXbWKzx5DXUHjZf/kVvsgIfOWIG8sV3eucOSorsbTuH/cLpaokzLubL2+
 ii5lOzwfULHXOAwN51u+IbePQsd8SNAdqpqDthdmUoZD/8raBoWLhIWiyilavMqIA2AI4
 8PB0/jMqf1CuaeDS/5jnULerSTD9ZC/bupgPN4ul5h3MLMdbSePlVQz5cpZNFVUoVbpv3
 iw+J8gd4jOff26iQjiuGpPnKhMDGx++h6kAClR50Ar2OM8+i33nWuZh1om+cC0a8pUWWs
 lrlYolQYBET2vy57yKE1Thl5GxWzu3Ccnti4NI2rxFtCwPepmpnibliVtu5+rikZ+FQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECDA860F6B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC02C960CF; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ba4416157a63db5d85479d363741e975265cca61
X-Git-Newrev: 934d1d72593a9bc8e3ebc485e38c978270a5997e
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.DC02C960CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/wpewebkit: also
 disable internal ccache in the build step
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1536848219868644892=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1536848219868644892==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/934d1d72593a9bc8e3ebc485e38c978270a5997e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

WK_USE_CCACHE=NO is only passed to the configure step
(WPEWEBKIT_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 4422d99a4e1c7676def18ec700f3beebea26b1bf)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/wpewebkit/wpewebkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 1f5f4aa5e6..c424a3c4b9 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -24,6 +24,7 @@ WPEWEBKIT_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell wpewebkit not to mess with it.
 WPEWEBKIT_CONF_ENV = WK_USE_CCACHE=NO
+WPEWEBKIT_BUILD_ENV = WK_USE_CCACHE=NO
 
 WPEWEBKIT_CONF_OPTS = \
 	-DPORT=WPE \

--===============1536848219868644892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1536848219868644892==--
