From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 12 Jan 2017 16:26:46 +0000
Subject: [Buildroot] [Bug 9576] New: External tree with BR 2016.11 does not
	work anymore
Message-ID: <bug-9576-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9576

            Bug ID: 9576
           Summary: External tree with BR 2016.11 does not work anymore
           Product: buildroot
           Version: 2016.11
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: outtierbert at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi all,

I am using an external tree with buildroot. My external tree is in a seperate
git repository and the buildroot source is fetched as a git submodule:

./
??? board
??? ??? board definitions...
??? buildroot
??? ??? arch
??? ??? board
??? ??? boot
??? ??? CHANGES
??? ??? Config.in
??? ??? Config.in.legacy
??? ??? configs
??? ??? COPYING
??? ??? DEVELOPERS
??? ??? dl
??? ??? docs
??? ??? fs
??? ??? linux
??? ??? Makefile
??? ??? Makefile.legacy
??? ??? output
??? ??? package
??? ??? README
??? ??? support
??? ??? system
??? ??? toolchain
??? Config.in
??? configs
??? ??? my_defconfig
??? ??? several_defconfig
??? external.desc
??? external.mk
??? package
??? ??? custom package 1
??? ??? custom package 2
??? README.md

This tree was working fine with buildroot 2016.08. To compile, I go into the
/buildroot directory and run: make BR2_EXTERNAL=../ my_defconfig
O=output/my_output and then make O=output/my_output

I followed the buildroot user manual on how to adapt an external tree for
buildroot 2016.11. I created the external.desc file and changed every reference
to $(BR2_EXTERNAL) to $(BR2_EXTERNAL_MY_EXTERNAL_TREE_PATH). Howver, now
building does not work anymore. I get an infinite loop when making like in the
snippet below. Can you help me diagnose the problem?

Updating goal targets....
Considering target file 'my_defconfig'.
 File 'my_defconfig' does not exist.
 Looking for an implicit rule for 'my_defconfig'.
 Trying pattern rule with stem 'my'.
 Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
 Trying implicit prerequisite '..//configs/my_defconfig'.
 Trying rule prerequisite 'prepare-kconfig'.
 Found an implicit rule for 'my_defconfig'.
  Considering target file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
   Looking for an implicit rule for
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
   Trying pattern rule with stem 'c'.
   Found an implicit rule for
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
   Finished prerequisites of target file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
  No need to remake target
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
  Considering target file '..//configs/my_defconfig'.
   Looking for an implicit rule for '..//configs/my_defconfig'.
   Trying pattern rule with stem 'my'.
   Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
   Trying implicit prerequisite '..//configs/..//configs/my_defconfig'.
   Trying rule prerequisite 'prepare-kconfig'.
   Found an implicit rule for '..//configs/my_defconfig'.
    Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
    Considering target file '..//configs/..//configs/my_defconfig'.
     Looking for an implicit rule for '..//configs/..//configs/my_defconfig'.
     Trying pattern rule with stem 'my'.
     Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
     Trying implicit prerequisite
'..//configs/..//configs/..//configs/my_defconfig'.
     Trying rule prerequisite 'prepare-kconfig'.
     Found an implicit rule for '..//configs/..//configs/my_defconfig'.
      Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
      Considering target file
'..//configs/..//configs/..//configs/my_defconfig'.
       Looking for an implicit rule for
'..//configs/..//configs/..//configs/my_defconfig'.
       Trying pattern rule with stem 'my'.
       Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
       Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/my_defconfig'.
       Trying rule prerequisite 'prepare-kconfig'.
       Found an implicit rule for
'..//configs/..//configs/..//configs/my_defconfig'.
        Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
        Considering target file
'..//configs/..//configs/..//configs/..//configs/my_defconfig'.
         Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/my_defconfig'.
         Trying pattern rule with stem 'my'.
         Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
         Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
         Trying rule prerequisite 'prepare-kconfig'.
         Found an implicit rule for
'..//configs/..//configs/..//configs/..//configs/my_defconfig'.
          Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
          Considering target file
'..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
           Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
           Trying pattern rule with stem 'my'.
           Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
           Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
           Trying rule prerequisite 'prepare-kconfig'.
           Found an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
            Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
            Considering target file
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
             Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
             Trying pattern rule with stem 'my'.
             Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
             Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
             Trying rule prerequisite 'prepare-kconfig'.
             Found an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
              Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
              Considering target file
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
               Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
               Trying pattern rule with stem 'my'.
               Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
               Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
               Trying rule prerequisite 'prepare-kconfig'.
               Found an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
                Considering target file
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                 Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                 Trying pattern rule with stem 'my'.
                 Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
                 Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                 Trying rule prerequisite 'prepare-kconfig'.
                 Found an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                  Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
                  Considering target file
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                   Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                   Trying pattern rule with stem 'my'.
                   Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
                   Trying implicit prerequisite
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                   Trying rule prerequisite 'prepare-kconfig'.
                   Found an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                    Pruning file
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
                    Considering target file
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                     Looking for an implicit rule for
'..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/..//configs/my_defconfig'.
                     Trying pattern rule with stem 'my'.
                     Trying rule prerequisite
'/home/user/development/external-buildroot-tree/buildroot/output/my_output_folder/build/buildroot-config/conf'.
                     Trying implicit prerequisite '..//configs/..//

-- 
You are receiving this mail because:
You are on the CC list for the bug.
