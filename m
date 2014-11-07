From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Nov 2014 07:33:00 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
In-Reply-To: <bug-7568-163@https.bugs.busybox.net/>
References: <bug-7568-163@https.bugs.busybox.net/>
Message-ID: <20141107073300.0B846B1E33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-07 07:32:59 UTC ---
This looks strange because the installation of libgcc_s.so.1 is done by the
gcc-final package, and therefore should not depend on the C library being used.
Here is the relevant snippet of code from gcc-final.mk:

define HOST_GCC_FINAL_INSTALL_LIBGCC
        -cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
                $(STAGING_DIR)/lib/
        -cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libgcc_s* \
                $(TARGET_DIR)/lib/
endef

HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC

Obviously, there is a "-" before those commands, so if the command fails for
some reason, it will be ignored. Maybe that's the issue here. I'll have to
reproduce and see what happens.

Thanks for the report!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
