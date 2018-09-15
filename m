From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Sat, 15 Sep 2018 13:23:42 +0000
Subject: [Buildroot] [arc-buildroot] blktrace fails to build on ARC
In-Reply-To: <20180913095013.5f9ae2da@windsurf>
References: <20180913095013.5f9ae2da@windsurf>
Message-ID: <28CDE50B11B27541A655A517CC37BFF38DDDAA@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Recently due to a patch https://git.busybox.net/buildroot/commit/?id=5a3f78c9191595f7ea9fab49360dfc18a743d28b some packages were enabled for ARC. Four of them (blktrace, lvm2, gadgetfs-test and libioo) are building with error, which points to some issues with "millicode" optimizations in toolchain, which had not occurred before. Currently we are studying this problem.
 As a temporal solution until the issue is not resolved these packages can be disabled for ARC or millicode optimizations can be disabled for ARC by adding such lines in package/Makefile.in:
--------------------------8<-------------------------------
ifeq ($(BR2_arc),y)
TARGET_ABI += -mno-millicode
endif
-------------------------->8----------------------------
What  will be the best solution?

Best regards,
Evgeniy Didin


-----Original Message-----
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com> 
Sent: Thursday, September 13, 2018 10:50 AM
To: ARC Maintainers <arc-buildroot@synopsys.com>
Cc: buildroot at uclibc.org
Subject: [arc-buildroot] blktrace fails to build on ARC

Hello ARC maintainers,

I don't know if you have noticed, but the blktrace package fails to build on ARC, since quite some time:

  https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_-3Freason-3Dblktrace-2D1.-25&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=QoMrXipN4E4JiIRskedh0eBRDMLw3VGNAzwubPXFQkI&s=-Yyh3kuQOOLeUIZA9XJClvgv6cP0toOcYwlWmrAb7Y0&e=

There is a toolchain issue:

/home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/7.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: btreplay: hidden symbol `__st_r13_to_r17' in /home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/7.3.1/libgcc.a(_millicodethunk_st.o) is referenced by DSO
/home/test/autobuild/run/instance-2/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/7.3.1/../../../../arc-buildroot-linux-uclibc/bin/ld: final link failed: Bad value

Could you have a look ?

Thanks,

Thomas
--
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://urldefense.proofpoint.com/v2/url?u=https-3A__bootlin.com&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=QoMrXipN4E4JiIRskedh0eBRDMLw3VGNAzwubPXFQkI&s=7PBj283fg5GRuQvaF7uozmGFB0Ec3aup005s545sEow&e=
