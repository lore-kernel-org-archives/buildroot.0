Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F87CC53210
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 01:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E6298194C;
	Thu,  5 Jan 2023 01:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E6298194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUgNsUBimSUt; Thu,  5 Jan 2023 01:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF9A581916;
	Thu,  5 Jan 2023 01:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF9A581916
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2CB1BF3FD
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 01:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 695B781871
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 01:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 695B781871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUZqoF4RHoCE for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 01:58:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 525A0817A9
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 525A0817A9
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 01:58:43 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id g10so1838869qvo.12
 for <buildroot@buildroot.org>; Wed, 04 Jan 2023 17:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cthGdInEFrU1rp8+O0eEQjdJJdtmU3hjG24GLYacTpE=;
 b=z1IlcLEuk95a8w0cZnPNUk+4egHGH6s9c+bWjI8TV2mU3a37ClEeGorPpXgI0qh2G7
 oq6zraWJKNGvGE89t75HpKOKetEdYYhH2cjGf30udvWUeiBGqsA7HS+9kcvyqE7nGzl/
 Y3h3l2b50/thXexJTSwn9I8tLh7+ir7+nLPMmaRiIi1wmwdafkJUo/qSlhJZpgG1LYy4
 XpyTmpG40f+pNqzSc95XVRfpmnQXZ8OqWLFnpx1Il5qxDvLLy2icBrxMQv/nsxbKM24n
 nAmEvGZmVkGfKoEobzO94rKYZ8FyxyCul7hEhj7uqvTq6X5utdTWVMfdiP3maZ9pDkbu
 DdKQ==
X-Gm-Message-State: AFqh2kr82DZvs/N54IUJdxf1QPE57jd3D2PZFJJGMR0hlJxiFGNXvzgI
 7zDvwO1vCmE9qPYmx+sdhbzPivlgI0gDEuzyAHQ=
X-Google-Smtp-Source: AMrXdXuwxP+NJkVHLFY0dirRYp91+ffRAcaRd8afjKx8L0adrQjHXMyuSQOyJpvQExKy5DFpdLt3/A==
X-Received: by 2002:ad4:5d6c:0:b0:4e8:c749:7f3a with SMTP id
 fn12-20020ad45d6c000000b004e8c7497f3amr102473376qvb.50.1672883921489; 
 Wed, 04 Jan 2023 17:58:41 -0800 (PST)
Received: from starry.com (205-201-16-55.starry-inc.net. [205.201.16.55])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a05620a470700b006b61b2cb1d2sm25320224qkb.46.2023.01.04.17.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 17:58:40 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Jan 2023 20:57:58 -0500
Message-Id: <20230105015759.63582-1-nhed+buildroot@starry.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cthGdInEFrU1rp8+O0eEQjdJJdtmU3hjG24GLYacTpE=;
 b=VFlWi5DZF8KSGSx3DFKZatnBsvawUQsd9aEGx1ios2FXm/MX12tbzJWDIE87x6+J3Q
 gs9WJvqJKR3rMqIDqTI88d2UDbjE70WhQSpQvqip7UqsTWnoIU3AEKSDPKcBvTx/K36W
 sEuDRBpCnQI/YEAH6VVfXXDtBPPJOTlBQFS0o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=starry.com header.i=@starry.com
 header.a=rsa-sha256 header.s=google header.b=VFlWi5DZ
Subject: [Buildroot] [PATCH v2 0/1] core: Use of percent_defconfig seems to
 impact performance
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Cc: Nevo Hed <nhed+buildroot@starry.com>, yann.morin.1998@free.fr,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Noticing serious performance issues on `make X_defconfig` with growth of

number of external trees.  At 7 trees it is somewhat tolerable but at 8
trees we have seen it take 80-110 seconds.

Numbers for before and after the change in commit itself.

I do not know for sure what the underlying issue is but looking at some
`strace` and `make -d` output it feels like implosion of implicit rules
being evaluated.

Note that after I submitted v1 of this patch it was pointed out to me that
a different patch is already in the works.  But since that neither that
patch nor mine had any seen any movement in months I decided to take a
stab at addressing the feedback I received from Yann on my patch:

> ... it defers the test that the defconfig exists into the shell
> rather than the Makefile

Adding the resets as suggested here
https://lists.gnu.org/archive/html/help-make/2002-11/msg00062.html seem to
help a lot but not as much as the attached patch.

--8<------------
%: %,v
%: RCS/%,v
%: RCS/%
%: s.%
%: SCCS/s.%
--8<------------

Inlined below a script to repro this issue, not sure if this functionality
should be integrated anywhere or just left in the mailing list.  By
default the script runs the scenario from 1 tree to 8 trees.  Running with
param (1-10) will allow a single run with that many trees.


--8<------------
#!/usr/bin/env bash

declare treedirs=()

declare -r cfg="pc_x86_64_bios_defconfig"

function setup_dir {
    for tree in tree{1..10}; do
        local treedir="defconf_test/${tree}"

        mkdir -p "${treedir}/configs"
        touch "${treedir}/Config.in"
        touch "${treedir}/external.mk"
        echo -e "name: ${tree^^}\ndesc: ${tree^}" > "${treedir}/external.desc"

        cp "./configs/${cfg}" "${treedir}/configs/${tree}_${cfg}"

        treedirs+=( "${treedir}" )
    done
}

function run_one {
    local count="${1}"
    local br2_external=$(IFS=':'; echo "${treedirs[*]:0:count}")
    echo "Defconfig with ${count} trees (BR2_EXTERNAL=\"${br2_external}\")"
    /usr/bin/time -f "${count},%e" /bin/make BR2_EXTERNAL="${br2_external}" "${cfg}"
}

# Main
setup_dir
if [ -n "${1}" ]; then
    run_one "${1}"
else
    for i in {1..8}; do
        run_one $i
    done
fi
--8<------------

Changes v1 -> v2:
  - Testing for defconfig existence and error when failing to find it is
    now done at the Makefile level rather than the shell (utilizing `$(or
    ...` and `$(error ...`).

Nevo Hed (1):
  core: Use of percent_defconfig seems to impact performance

 Makefile | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
