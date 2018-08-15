From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Aug 2018 21:09:19 +0200
Subject: [Buildroot] Analysis of defconfig build failures
In-Reply-To: <20180812170138.0b51be07@windsurf> (Thomas Petazzoni's message of
 "Sun, 12 Aug 2018 17:01:38 +0200")
References: <20180812170138.0b51be07@windsurf>
Message-ID: <87600bbg68.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > Today, I analyzed the defconfig build failures of
 > https://gitlab.com/buildroot.org/buildroot/pipelines/27617503. I fixed
 > a number of them, except two:

Thanks for doing that!

 >  - Problem of U-Boot failing to build due to a clash between the libfdt
 >    headers part of U-Boot, and the libfdt headers installed by our
 >    host-dtc package. We already made several changes in uboot.mk to try
 >    to fix this, but it still doesn't work properly.

 >    Does anybody has an idea ? Thomas DS, you already worked on this
 >    issue (you're the author of commit
 >    baae5156ce37e8b2775f04710f7d1c8e97e4114c). Any clue ?

 >    The problem is fixed in U-Boot 2018.01 but present in 2017.11.
 >    However, we have a number of vendor-provided U-Boot, and it's not
 >    necessarily easy to upgrade all defconfigs to use at least 2018.01.

Perhaps we could backport the changes and add as patches for the
affected defconfigs?

What is needed? Just the libfdt.h -> linux/libfdt.h you reported?

commit b08c8c4870831c9315dcae237772238e80035bd5
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon Mar 5 01:20:11 2018 +0900

    libfdt: move headers to <linux/libfdt.h> and <linux/libfdt_env.h>

    Thomas reported U-Boot failed to build host tools if libfdt-devel
    package is installed because tools include libfdt headers from
    /usr/include/ instead of using internal ones.


 >  - Problem of recent U-Boot that needs host-bison to build kconfig.
 >    Yann posted a patch series to make bison and flex hard requirements
 >    of Buildroot. Do we want to go this way ?

Sorry, I haven't looked at that series yet. If various packages start
needing this, and there aren't any version dependencies, then requiring
bison and flex is imho not a big problem (E.G. they are generally
available on all distributions).



 >    sheevaplug_defconfig
 >    https://gitlab.com/buildroot.org/buildroot/-/jobs/88314946

I still have this board somewhere. I'll take a look at bumping u-boot.

-- 
Bye, Peter Korsgaard
