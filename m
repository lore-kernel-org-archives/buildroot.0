From: Dwayne Fontenot <dwayne.fontenot@att.net> <dwayne.fontenot@att.net>
Date: Fri, 29 Apr 2011 15:16:52 -0700 (PDT)
Subject: [Buildroot] e500v2 SPE toolchain tuple confuses BR
Message-ID: <824040.8961.qm@web180204.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm having an issue with buildroot (git HEAD as of 20110428) and a powerpc e500v2 toolchain
built using the BR crosstool-ng integration.

The built toolchain has a prefix of powerpc-unknown-linux-gnuspe- yet BR assumes it is powerpc-unknown-linux-gnu-

So busybox (for example) will not build because it cannot find powerpc-unknown-linux-gnu-gcc

BR says GNU_TARGET_NAME='powerpc-linux' and REAL_GNU_TARGET_NAME='powerpc-unknown-linux-gnu'

But REAL_GNU_TARGET_NAME *should* be powerpc-unknown-linux-gnuspe

----------------------------------------
y_morin says:

OK, I've seen the issue with busybox! :-)
It uses TARGET_CROSS as the cros compiler.
And TARGET_CROSS is set as: TARGET_CROSS=$(HOST_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
When it should be set as:  TARGET_CROSS=$(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)
----------------------------------------

Also, in output/host/usr there are two dirs: powerpc-unknown-linux-gnu and powerpc-unknown-linux-gnuspe.
BR assumes it's looking for powerpc-unknown-linux-gnu and cannot find (for example) limits.h as it's really under
powerpc-unknown-linux-gnuspe.

powerpc-unknown-linux-gnu/ is just an empty dir tree, while powerpc-unknown-linux--gnuspe/ has everything it needs
*except* the sysroot/usr/share/aclocal dir.

----------------------------------------
y_morin says:

OK, I get it. The staging dir is created as: STAGING_DIR=$(HOST_DIR)/usr/$(REAL_GNU_TARGET_NAME)/sysroot
which is wrong in this case, as the REAL_GNU_TARGET_NAME is missing the 'spe' part.
----------------------------------------

Much thanks to y_morin and gustavoz on IRC for helping me.

linuxjacques
