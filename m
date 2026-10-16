Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2A3CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E883F61063;
	Fri, 16 Oct 2026 13:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpYbHHO9moaQ; Fri, 16 Oct 2026 13:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CDB2261073
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156266;
	b=eSyL/fRFoVc/QOd6qLV1sE6bNApQCLLnxY/fm4NXSPW1mXxzm4R7uJxUlmFUOKIGETwe
	 dRK4TYtHpeVXvD1e1i7bl4sPOWzJkKb5EkUSaGM+cJ2IwrIcYEE7ZR1xwRzkhRRqn8G7G
	 fxgKNJAs4EF7vLnl8nLkUSQ0LynTjEwzIHWhA/wBe67b1g2v5+myDmkeIH4IHZVnVJiYq
	 i0CdyUwZBf3aWB3sfaGxQlOqsbQ+8hLSsOoeL+9zaHC9n3doQTQ54iRtnuAhjtAosnWN2
	 hT+NnJfzQA+lnUGmc2Y2ASqgdSeC4vsE7nRIFwQ74ZJzDuuOeRV7yqc7jFJ55NcO7oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zVpMJiNWvGBjEGrwwPKyIQTldyPn2x8c8gUpoyuVQcg=;
	b=MGrZfPq9u3BLZ8YGGlC+fGiOsMCdnKO9TQR2Kc5ImxaiMtfavPDbplWugQO21LZjRWn0
	 zIC3RMCduAOllZ9axi2CuZqhH2zP0rEqJglcpUlNCGl6/hhvHQHrCZPQVOEn4xDJd4cUA
	 xONVnQmSBCNXqyPCbYADCQE3ViXO0Zcv0LwTPsejoXWljtZeKjvSzmHOsKa1R1hP3Xves
	 SSXE5jRGHqo26fw5y37tFGUDRMwMg29XcWra7BM+Z364+BfjCadxvBqN624up1RSuqQA4
	 kOEj+Kp4hoOzQ8A5ZGUyvBgXSIJNqQIsoVIqNHd1jCY2tV6fSKItHdFGIYCuW8Fkc6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156265;
	bh=zVpMJiNWvGBjEGrwwPKyIQTldyPn2x8c8gUpoyuVQcg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O3zIxTrWCIxnzBomuqISaCHxBtcLUdrzB51Hogi2DWFfn2vYEyCWNy9oCZ7Q85zV1
	 LBTRYGL9i9MoITmUcn7/MLb16S6TaRUQcpeHn4Z6T6OpUfNFakMV4p2IW+fY0forVA
	 ZKw8WZrLr2bza5qr94fVr5z3nnj5Y5g3oVIOdABad7cU6nT9xyRo7QvdosXWR6Fnbi
	 PaX0xI48jl3yY6wXPtE5wLORZPZ5VN95P7FSn8uRUj71qOs4m05rFdxDsYMuAJyN/8
	 G6ZbLQ9NMC1IL1rZXphLmWg++wfbNnJLTCFloFH3RViL4y+SO7LxGsprq07dUggrZy
	 NE+ki/1oqid8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDB2261073;
	Fri, 16 Oct 2026 13:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 667BA151A
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44A62814BA
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AcZ4aJAMf9Ps for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDBB28150F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156108;
 b=YROcLquKShdbvA9ERoafd6WUCSAu9ElVjwbyT19ZKbcPcQoqGrcPOYZ/pZ7mzhGXkNbA
 a8sLnACwGMYhuj8VBF0npEdVmanHK8UL7fDW1ipFMXc8Fm/VMucbmj8vzqBDWDg+zm0q4
 Do8dEG4lIkYY5Ebj2zWlqIRT2bEX/Xu8+8jxRyFD9dBkn00StJ3hGkjgiT+rO58Q7r8U1
 J/38RbIp19GUZQzoYqpwdWI2HylACSdGuH2qNPJEJtdvhoieBsRKv9ZrU6AyKXeGTad/k
 Gfak1l3/YhTWJc5cKXrXbavr9HKOt79IcazpY+cOF4dKPJ+7tO5W9T6kV8HteiuFLqQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156108;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8dhvIN79i97iK3Wd98aKEvNxj8XtrHLnPMov8vnxHos=;
 b=lo22heZ8/P01b4UZO54p0O4PZRtYNWnMIaAdevnpH6hZcR637SEUBWxmEfM2KOY8umpv
 y0MuNQG7DrCd47jpLq/n0Iw3vHv/fzqn218pNjzMRGGXgfMJK3/LlbmhKN/GiXu5cOogx
 3mpZs++6mA8VHgKeF9RjuyrfRikC1PHh5g7mQHWlgSQ2SdofKNXQj8PYVcmwZXiPP8ljt
 MOC/E8hT0xXQxp2aHz9gEDtCPIxnIJVVCDOlBgP+MSfdB4skq+Vg7eX0wLMQiN5C1/iwG
 iCSecKFv5OyqNs91KWFGXaHfkstvEujxeWD4yzvof92OPkm+/+POUQKJCHpz+DgCzNw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDBB28150F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BEE13960D7; Fri, 16 Oct 2026 13:07:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2f044e5a034cea91187501d5b8361dbc5a4a09e0
X-Git-Newrev: 2193520d9bd1e7595a5407aebbcdf37d626d622b
X-Patchwork-Hint: ignore
Message-Id: <20261016130707.BEE13960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/flutter-engine:
 don't write into $HOME
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7025303811766775715=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7025303811766775715==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2193520d9bd1e7595a5407aebbcdf37d626d622b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

gclient.py tries to not only read from $HOME/.config, but actually
create some directories/files in there. As $HOME can be inaccessible,
let's override XDG_CONFIG_HOME to tell the depot-tools code to write
its stuff into $(@D)/dl-tmp instead (which we already use as a scratch
directory in this package).

Fixes:

>>> flutter-engine 3.29.2 Downloading
/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py:3367: SyntaxWarning: invalid escape sequence '\s'
  dot_git_pattern = re.compile('^(\s*)url(\s*)=.*\.git$')
/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py:436: SyntaxWarning: invalid escape sequence '\.'
  tokens = re.search('//(.+).googlesource.com/(.+?)(?:\.git)?$',
Traceback (most recent call last):
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
    os.mkdir(self, mode)
    ~~~~~~~~^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/br-user/.config/depot_tools'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py", line 108, in <module>
    import gclient_scm
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py", line 23, in <module>
    import gerrit_util
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gerrit_util.py", line 42, in <module>
    import metrics
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/metrics.py", line 23, in <module>
    CONFIG_FILE = utils.depot_tools_config_path('metrics.cfg')
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/utils.py", line 48, in depot_tools_config_path
    pathlib.Path(config_dir).mkdir(parents=True, exist_ok=True)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 726, in mkdir
    self.parent.mkdir(parents=True, exist_ok=True)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
    os.mkdir(self, mode)
    ~~~~~~~~^^^^^^^^^^^^
PermissionError: [Errno 13] Permission denied: '/home/br-user/.config'
make[1]: *** [package/pkg-generic.mk:181: /home/thomas/buildroot/br/output-all/build/flutter-engine-3.29.2/.stamp_downloaded] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2a69b8c7eda80157d7e794ba64ebfbc86b20c48b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/flutter-engine/flutter-engine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index a399296247..50c90b915f 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -181,6 +181,7 @@ define FLUTTER_ENGINE_GENERATE_TARBALL
 	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
 	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+	XDG_CONFIG_HOME=$(@D)/dl-tmp \
 	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
 		--dot-gclient $(TOPDIR)/$(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
 		--jobs $(PARALLEL_JOBS) \

--===============7025303811766775715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7025303811766775715==--
