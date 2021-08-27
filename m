Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB09C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F30560EE4
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F30560EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B86E40867;
	Fri, 27 Aug 2021 21:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvOHLfYjVOkq; Fri, 27 Aug 2021 21:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DF4A4086B;
	Fri, 27 Aug 2021 21:02:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 585EF1BF4D6
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 724BB83E9E
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6djTr3eREIcW for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from da1vs03.rockwellcollins.com (da1vs03.rockwellcollins.com
 [205.175.227.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F08B7837C0
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:01:39 +0000 (UTC)
IronPort-SDR: fJ6ydYByizzjOSsC2pLMRSGVS4BXiBXWAV+ACT8CJ2i1wUBYW3JEzTeyxA5VYx9lwDfPNyeuMh
 nbYvFNmj20pUv+uAlF3RbAxdNBysKkYcTvrkyhmVkB+H2o6kUuBPupT0re/0JApNOmJeNWugIb
 FQqRLWzr2gx0XLIOx7PPSC825psLHlYKrlkKVfPfhNxvojifPCB6oo/pYi3zvSOvJ0ZeXBaql1
 AcWOewwq98VQCS6kLabp1ApLDIKWsD74QW/D00NtQSonmloDE8lnWJVbrIwNA/BKnjav2yIY3r
 3DU=
Received: from ofwda1n02.rockwellcollins.com (HELO
 ciulimr02.rockwellcollins.com) ([205.175.227.14])
 by da1vs03.rockwellcollins.com with ESMTP; 27 Aug 2021 15:54:31 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id C7BB320180;
 Fri, 27 Aug 2021 15:54:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 15:54:27 -0500
Message-Id: <20210827205430.39745-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH v3 0/3] Add support for OCI rootfs images
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Matthew Weber via buildroot <buildroot@busybox.net>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This patch set adds support for OCI images.

The OCI image format is a specification for container images defined and
maintained as an open standard by the Open Container Initiative [1].

To generate the image according to the specification [2], a tool called
sloci-image is used.

The OCI image is generated (by default) in a directory called rootfs-oci:

$ ls output/images/rootfs-oci/
blobs  index.json  oci-layout

It can be pushed to a container registry using tools like skopeo:

$ skopeo copy --dest-creds <user>:<pass> oci:rootfs-oci:<tag> \
         docker://<user>/<image>[:tag]

And then we can pull/run the container image with tools like docker:

$ docker run --rm -it <user>/<image>[:tag]

In v3 of this series, a runtime test has been added where the OCI archive
is imported into a containerd instance and executed. This verifies the
full workflow and use at runtime. `./support/testing/tests/fs/test_oci.py`

[1] https://opencontainers.org/
[2] https://github.com/opencontainers/image-spec/blob/master/spec.md

---
Changes 
v2 -> v3
[Matt]
  - Patched sloci tar archive creation to remove nested folder
    (merged upstream but not yet in release)
  - Added runtime testing of OCI tar archive using containerd direct import

v1 -> v2:
[Sergio]
  - bump sloci-image version to 0.1.1 abd drop patch applied upstream
  - improve usage comments
  - fix check-package warnings

Matthew Weber (1):
  support/testing/tests/fs: test OCI format

Sergio Prado (2):
  package/sloci-image: new host package
  fs: new OCI filesystem type

 DEVELOPERS                                    |  1 +
 board/qemu/aarch64-virt/linux.config          |  6 ++
 fs/Config.in                                  |  1 +
 fs/oci/Config.in                              | 88 +++++++++++++++++
 fs/oci/oci.mk                                 | 99 +++++++++++++++++++
 package/Config.in.host                        |  2 +
 ...-from-the-contents-of-working-folder.patch | 37 +++++++
 package/sloci-image/Config.in.host            |  7 ++
 package/sloci-image/sloci-image.hash          |  5 +
 package/sloci-image/sloci-image.mk            | 19 ++++
 support/testing/tests/fs/test_oci.py          | 56 +++++++++++
 11 files changed, 321 insertions(+)
 create mode 100644 fs/oci/Config.in
 create mode 100644 fs/oci/oci.mk
 create mode 100644 package/sloci-image/0001-create-OCI-tar-from-the-contents-of-working-folder.patch
 create mode 100644 package/sloci-image/Config.in.host
 create mode 100644 package/sloci-image/sloci-image.hash
 create mode 100644 package/sloci-image/sloci-image.mk
 create mode 100644 support/testing/tests/fs/test_oci.py

-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
