From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 27 Aug 2013 10:19:02 +0200
Subject: [Buildroot] make clean behavior
Message-ID: <CAAXf6LVsXF29Z9cZCSmZqMX8zVms0ANfgo33tHf8NiU57LY8QQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Is it intentional that 'make clean' is different depending on having a
.config file?

With .config there is a full clean:

rm -rf buildroot/output/host/usr/powerpc-buildroot-linux-gnu/sysroot
buildroot/output/target buildroot/output/images buildroot/output/host
buildroot/output/stamps buildroot/output/build
buildroot/output/toolchain buildroot/output/staging
buildroot/output/legal-info


but if you remove .config (and thus symbol BR2_HAVE_DOT_CONFIG) you
only have a partial clean:

rm -rf /repo/tdescham/reborn/buildroot-ppc/output/build
/repo/tdescham/reborn/buildroot-ppc/output/staging


Suppose you accidentally removed your .config, then you cannot easily
get a clean buildroot env anymore. The behavior is caused due to the
definition of variables like TARGET_DIR being inside a 'ifeq
($(BR2_HAVE_DOT_CONFIG),y)' statement.

I would propose to make sure that 'clean' works in all cases, by
moving the relevant variable definitions outside this if statement.

Best regards,
Thomas
