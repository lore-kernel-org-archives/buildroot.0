From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 18:25:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7568] New: musl buildroot-toolchain does not put
 libgcc_s.so.1 into place
Message-ID: <bug-7568-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7568

           Summary: musl buildroot-toolchain does not put libgcc_s.so.1
                    into place
           Product: buildroot
           Version: 2014.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex+buildroot at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I use the following settings:

BR2_mipsel=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y

When trying to run non-busybox tools (such as 'nft', nftables) I get a
grumbling that libgcc_s.so.1 does not exist.

To workaround the problem, I slipped into my post-build.sh script the
following:
----
cp output/host/usr/mipsel-buildroot-linux-musl/sysroot/lib/libgcc_s.so.1
"$1/lib"
./output/host/usr/mipsel-buildroot-linux-musl/bin/strip "$1/lib/libgcc_s.so.1"
ln -f -s libgcc_s.so.1 "$1/lib/libgcc_s.so"
----

I vaguely recall there used to be a BR2_GCC_SHARED_LIBGCC that did this for
you, but it seems to have gone.  Digging around, and if I am following through
the makefiles correctly, it looks like the external toolchains do plumb this
in.  Not sure how this should actually be fixed.

Let me know if you need anything from me to help get this fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
