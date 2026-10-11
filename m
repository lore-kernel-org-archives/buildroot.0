Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB0DCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 06:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F33E040798;
	Sun, 11 Oct 2026 06:57:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nimfpsIyP9oP; Sun, 11 Oct 2026 06:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 05B9C40791
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791701874;
	b=IHee7ppEsjDRP8kxD9e+LWv4c+fL6njMq6Ub1juqgMTJfe0d9TEtlOTmz7kA0wgNwkXE
	 BOQu1csJ8ZJeAuRIZTMIxTgcaWqe02RPYMFtgR3KEHXRDfstXpOOi4WdHjRSzIqrYp50W
	 YKnzOy9S0SbzeqGVHbJ1LJDw1TJP6n+8o+7QK4d148+xX3oGwO/19EF00hZTU9FDxD0rG
	 Yrru0PhImNuQ8y7zeMLK6SpA6TKawJwbX/ixyksTFusoLLiKbjDVJtXtj4l+VCRAXACEn
	 XheOKAEhVUxsmx0d7yYhNF7sPWcFVPtVkqKDg/ujm57cXuWZf4vYPbTjERJLNiu2JHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791701874;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=bUBHX27VEZl29Rtn+D35cR3CdN9mUjH2Dw5nrz+ZmPw=;
	b=i6ECQ2JqJejmf0cJcoQU1IsW54vxR1Aqh9kGl0dhfUCoUtMPKzt3EhxKJpo8UkhAj3+4
	 Ubv96a67i3ivsa81isdhXd+nSYDQw0MHUQjObd50uFpSLSBfJhOJ8hEM1x6c2DQXj7bjx
	 YH4qf3fvGTxMgM6wrwoGykgasDwNsnei73qVvi5sMrySjEUa1C31tk+ujTXRpdUeV0yyq
	 zjri326h3R+w5Yarw8VRgx26tOdPqe4ce611h+K6JjcSfJYyF+ykPfCUnLsQpHs4LtgLp
	 ojhD8a5/76HwuMX0mD+3YzlpLIMyTmS3b8NDFjFo6LomZuXyDcIBv6ajDMig3M9/sRw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791701874;
	bh=bUBHX27VEZl29Rtn+D35cR3CdN9mUjH2Dw5nrz+ZmPw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X05CWiQjk2TAAp06DYxJ8APb1tNNycvzNJW7CrC/DUlXVuQmvSynHZK6bYJPbbNjL
	 wAAmIT0HQ9980sqiaWL9ysSyZpz7BRTWz/78JYv+3Adn421wQ184qydqHGUCoaEsF/
	 vRWRkeviP6RmiKVDl9R7vyrISUxtQiD6Q7kmGBF7PCm+2KIRatlKzibmH79oNbufs0
	 OR7Z5BBr1j9LRO6LaGCKRVEA2947ffHhrlTyXNTHJi3KkiCHrjF6qZKAo/UuOLoPjS
	 66zwc0d76+f4Tm01g11ybsyUNYsc2IM/jfML/zZsiF+/zepQywICXTETevWgY6IkU9
	 J1lDj0wB49DxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05B9C40791;
	Sun, 11 Oct 2026 06:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 587619DF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E40440764
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jW7ARqxGLyRB for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 06:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 809634072B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791701871;
 b=Jyq4/B/kvd0O3AtZXiw8ru3Va9PpG20966fWUScU/pGOqXyp6Hp/G2Vq756MlEYJHuwa
 7k5VwvZdaucVqPUQFF14alKi0hL4WJUPaH2EOhln1Amr5v13PLprTzGDep3hKhxS2Yyj5
 gs/uuQgGuavPEYvS/b1FupshZoldQ/LkM7Ld3qbU+itOeCbEenOAHi1ySlgWLTHUy+TdP
 p6i2KNjwPPU+XMyfBP4fRqg7LzLOGFlJ2OBJy5PAh300ASb5vs0/Y7Tm9OV7PXVongbcf
 Yc29QOD8e+ztXEw25HW+dwYBN08XqygjYlZUx+J2fgd6xaYFOSknfRxDiKqyJC0o4wQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791701871;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F+oR8WRdU09bSdVXyp1gtXTGjOH2CINHPzWayBp0WlU=;
 b=rT0l8F4OEotD5ZRvmNohetqh2+zf+R5TASpCH73s5yuGYRr3wipmaEs39Kvqte42pTnt
 /XvNM+7CamM4quSQVbftBPDSmQDNS2yGMU0Qrjgo3k2sy+YqTHuCltMh25U2ur8FokdIg
 +K32rPICNHqWdZXDFr7BnY2H+ZCGUI4GJhXYM4tuGnEJsXPG5TlgZMmK4NiaPRLJo+FXx
 vmpMu3Sx/N3PFLcvxkxlR12g1ZypqhvZS5va3Q5dWYv9MFe7jpX2DiAeplbR+uQ8+l3b5
 APB+Ffy8KZY6+rF0IgSBl5hgmeRmtygEerRt2BAiTnkX+jqJssyTB6EaFn6bRMG+E2g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809634072B
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:57:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E51C993583; Sun, 11 Oct 2026 06:56:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 08:52:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fac6d92a27925192b3cb8107449e7abfe01e2cf3
X-Git-Newrev: 2a69b8c7eda80157d7e794ba64ebfbc86b20c48b
X-Patchwork-Hint: ignore
Message-Id: <20261011065632.E51C993583@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: don't write into
 $HOME
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a69b8c7eda80157d7e794ba64ebfbc86b20c48b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/flutter-engine/flutter-engine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 1fa59a3863..e1c56ee62b 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
