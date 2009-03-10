From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Mar 2009 22:46:02 +0000 (UTC)
Subject: [Buildroot] [Bug 163] Xtensa architecture port
In-Reply-To: <bug-163-163@https.bugs.busybox.net/>
References: <bug-163-163@https.bugs.busybox.net/>
Message-ID: <20090310224602.6C68B76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=163





--- Comment #4 from Maxim Grigoriev <maxim2405@gmail.com>  2009-03-10 22:46:01 UTC ---
Created an attachment (id=131)
 --> (https://bugs.busybox.net/attachment.cgi?id=131)
Improved and extended patch for patch-kernal.sh and toolchain Makefiles

>> --- Comment #3 from Bernhard <rep.dot.nop@gmail.com>  2009-03-10 16:14:23 UTC ---

Thanks much for your comments, Bernhard.
I've attached a new extended patch. I made it more self-explanatory
and consistent by adding binutils/gcc/gdb Makefiles' updates related
to our toolchain/patch-kernel.sh changes.

>>  First, there are superfluous trailing ';' chars in your patch.

Removed.

>> Does this:
>> +       uncomp="tar cf - --exclude=.svn --no-anchored -C";
>> work with busybox's tar?

Given that busybox tar is 1.18, I say "Yes". It works.
I was not able to build my busybox TAR package because of the build errors.
But, I checked it on my x86-linux box after installing GNU/TAR 1.18.

>> What is "uparm" meant to be? Please use a more descriptive name.

It's been replaced by "uncomp_parm" in the new patch.

>> Last, can you give some examples that show why you need these changes?

Applying Xtensa source overlays could be done without changing patch-kernel.sh,
but they would result in much more extensive changes to other Makefiles.
This change to patch-kernel.sh is the simplest and most elegant way
we found of applying source overlays.  It simply expands patch-kernel.sh to
handle tar files, and thus patch not just files, but also source trees.

Isn't it nice ? Can other BUILDROOT users find it useful ?

An example might be Xtensa overlay support for GDB.  With this change
to patch-kernel.sh, all we needed to edit in toolchain/gdb/gdb.mk was
to add a conditional include:

  ifneq ($(filter xtensa%,$(ARCH)),)
  include target/xtensa/patch.in
  GDB_PATCH_EXTRA:=$(call XTENSA_PATCH,gdb,$(GDB_PATCH_DIR),. ..)
  endif

and add $(GDB_PATCH_EXTRA) to the list of what patch-kernel.sh patches:

  <      toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
  --
  >      toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
$(GDB_PATCH_EXTRA)

The alternative is to add an Xtensa-specific line(s) to the gdb-unpacked
rule, which didn't seem quite as kosher.

Thanks,
-- Maxim


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
