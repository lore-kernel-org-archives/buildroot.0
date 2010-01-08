From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Jan 2010 18:43:37 +0000 (UTC)
Subject: [Buildroot] [Bug 849] New: "customize" package copys files to wrong
 place in target tree
Message-ID: <bug-849-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=849

              Host: Gentoo Linux
            Target: Atmel at91sam9g20
           Summary: "customize" package copys files to wrong place in target
                    tree
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=885)
 --> (https://bugs.busybox.net/attachment.cgi?id=885)
Patch to fix bug that copies files to wrong place in target tree

I'm attempting to use the "customize" package to get
libgcc_s.so files into my target filesystem, and it doesn't
seem to work.  I put files into the package like so:

   $ tree customize
   customize
   |-- Config.in
   |-- customize.mk
   `-- source
       |-- asdf
       `-- lib
           |-- foobar
           |-- libgcc.a
           |-- libgcc_eh.a
           |-- libgcc_s.so
           `-- libgcc_s.so.1

But what ends up on my target filesystem is

  /asdf
  /lib/lib/libgcc_s.so
  /lib/lib/libgcc_s.so.1
  /lib/lib/foobar

The two .a files end up being removed later in the build
process, but the other files that I expect to find in /lib end
up in /lib/lib.  The mislocation appears to be due to a bug in
customize.mk:

     1  #############################################################
     2  #
     3  # Any custom stuff you feel like doing....
     4  #
     5  #############################################################
     6  CUST_DIR:=package/customize/source
     7
     8  $(BUILD_DIR)/.customize:
     9          rm -f $(BUILD_DIR)/series
    10          (cd $(CUST_DIR); \
    11           /bin/ls -d * > $(BUILD_DIR)/series || \
    12           touch $(BUILD_DIR)/series )
    13          for f in `cat $(BUILD_DIR)/series`; do \
    14                  cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/$$f; \
    15          done
    16          rm -f $(BUILD_DIR)/series
    17          touch $@

Line 14 doesn't work right if there are any pre-existing
directories in the target directory.  In my case it ends up
doing:

   cp -af package/custom/source/lib output/target/lib

That results in files ending up in /lib/lib instead of /lib

Shouldn't line 14 specify the bare target_dir (and not
specify a target filename)?  Copy a file will still work the
same (since the destination is known to be a directory), and
now copying a directory will work when it didn't used to:

    14                  cp -af $(CUST_DIR)/$$f $(TARGET_DIR)/; \


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
