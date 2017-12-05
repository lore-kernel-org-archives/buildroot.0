From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Dec 2017 18:20:12 +0000
Subject: [Buildroot] [Bug 10551] New: PowerPC SPE and Musl
Message-ID: <bug-10551-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10551

            Bug ID: 10551
           Summary: PowerPC SPE and Musl
           Product: buildroot
           Version: 2017.08
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: sigurd.segtnan at kongsberg.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7411
  --> https://bugs.busybox.net/attachment.cgi?id=7411&action=edit
diff for package/gcc/gcc.mk (and Config.in in toolchain)

Musl is not supported for PowerPC SPE according to
toolchain/toolchain-buildroot/Config.in line 74: "depens on !BR2_powerpc_SPE #
not supported, build breaks". This breakage may be due the
"--with-long-double-128" in package/gcc/gcc.mk, since we have not experienced
any build breakage when we changed lines 241-245 to

ifeq ($(BR2_powerpc_SPE),y)
ifeq ($(BR2_TOOLCHAIN_USES_MUSL),n)
HOST_GCC_COMMON_CONF_OPTS += \
        --enable-e500_double \
        --with-long-double-128
endif
else
HOST_GCC_COMMON_CONF_OPTS += \
        --enable-e500_double \
        --with-long-double-64 \
        --enable-secureplt
endif

We have used this without problems since buildroot 2016.05 (tested with gcc 6.x
and gcc 7.x).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
