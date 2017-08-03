From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 17:29:55 +0000
Subject: [Buildroot] [Bug 10161] New: unable to build u-boot.imx reliably
Message-ID: <bug-10161-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10161

            Bug ID: 10161
           Summary: unable to build u-boot.imx reliably
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: yurovsky at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7156
  --> https://bugs.busybox.net/attachment.cgi?id=7156&action=edit
hacky workaround

I'm unable to build the u-boot.imx image (for Freescale i.MX SoCs) reliably
(that is, it generally works but if I "slow down" my system by making the CPUs
busy, or use a slower machine, I can break the build very often).

The issue seems to be in u-boot's build system but I'm not certain so I wanted
to check if there's anything that we might be doing in buildroot that should be
done differently before taking this up with them.

To build the i.MX image the config should have:

BR2_TARGET_UBOOT_FORMAT_IMX=y

(and be one of the i.MX targets anyway since we need a board target in u-boot).
What happens is u-boot will process a template config file and eventually
mkimage is run to generate the .imx image using the .cfg files in the board
directory. The build will fail because the processed .cfg isn't found and it
seems that the .cfg was in fact built, it just raced with the image step.

I have a workaround that, while hacky, shows that we can prevent the problem by
making those steps less parallel (attached).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
