From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 23 Jan 2016 15:14:22 -0200
Subject: [Buildroot] Analysis of build failures
References: <CAAXf6LVpYZ7vkXWLPB373i0dXDSaLP3tGi+MXWaoVzbXMY_byQ@mail.gmail.com>
Message-ID: <56a3b4eeb29e1_57733f8e785e4ed04615@ultri2.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jan 23, 2016 at 02:07 PM, Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> On Jan 23, 2016 4:58 PM, "Thomas Petazzoni" <
> thomas.petazzoni at free-electrons.com> wrote:
>>
>> Hello,
>>
>> On Sat, 23 Jan 2016 13:16:00 -0200, Ricardo Martincoski wrote:
>>
>> > Just to be clear, removing the double quotes makes it work with
>> > patch 2.5.9 or later.
>> > Patch 2.5.4 can't handle spaces in filenames.
>> > (I tested using only the versions with tarballs available, that's the
> cause of
>> > the gap 2.5.9 -> 2.5.4, see http://ftp.gnu.org/gnu/patch/)
>>
>> RHEL4 uses patch 2.5.4
>> (http://ftp.redhat.com/pub/redhat/linux/enterprise/4/en/os/i386/SRPMS/).
>> RHEL4 was released January 2005
>>
>> RHEL5 also seems to be using patch 2.5.4
>> (http://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/).
>> RHEL5 was released March 2007.
>>
>> It's only starting at RHEL6 that patch 2.6 starts to be used
>> (http://ftp.redhat.com/pub/redhat/linux/enterprise/6Client/en/os/SRPMS/).
>> RHEL6 was released November 2010.
>>
>> Thomas DS, you are one of our users relying on very old enterprise
>> distros. Are you still on RHEL 4/5 ?
> 
> There are some of our users still on RHEL4 (hopefully not too much anymore)
> and RHEL5 (not negligible yet).
> 
> That said, libsoil is not something we use, so if the problem is limited to
> that we're fine.
> 
> /Thomas

Maybe there is a solution that does not limit the version of patch, following
the idea of symlinks or hardlinks.
It still needs more tests, but it seems to work with patch 2.5.4.
I created 2 hooks, one before patching to rename the file, and other after to
rename it back.

See example below. I used POST_EXTRACT instead of PRE_PATCH because some
developer could use 'make package-extract', create a copy of the extracted
directory, edit the needed files and then use diff to create the patch.
This way hand-editing the patch would not be needed.

Please let me know if you agree with this approach.

Regards,
Ricardo

diff --git package/libsoil/0001-fix-makefile.patch package/libsoil/0001-fix-makefile.patch
index 3b80048..310d264 100644
--- package/libsoil/0001-fix-makefile.patch
+++ package/libsoil/0001-fix-makefile.patch
@@ -5,9 +5,9 @@ http://anonscm.debian.org/cgit/pkg-games/libsoil.git/tree/debian/patches/linking
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
-diff -uNr "soil.org/projects/makefile/alternate Makefile.txt" "soil/projects/makefile/alternate Makefile.txt"
---- "soil.org/projects/makefile/alternate Makefile.txt"	2008-07-07 18:13:28.000000000 +0200
-+++ "soil/projects/makefile/alternate Makefile.txt"	2015-11-07 11:15:04.140106336 +0100
+diff -uNr soil.org/projects/makefile/alternate_Makefile.txt soil/projects/makefile/alternate_Makefile.txt
+--- soil.org/projects/makefile/alternate_Makefile.txt	2008-07-07 18:13:28.000000000 +0200
++++ soil/projects/makefile/alternate_Makefile.txt	2015-11-07 11:15:04.140106336 +0100
 @@ -1,8 +1,8 @@
  MAKE = make
 -CC = gcc
diff --git package/libsoil/libsoil.mk package/libsoil/libsoil.mk
index eb8c2ce..1aca345 100644
--- package/libsoil/libsoil.mk
+++ package/libsoil/libsoil.mk
@@ -18,6 +18,18 @@ define LIBSOIL_EXTRACT_CMDS
 	mv $(@D)/Simple\ OpenGL\ Image\ Library/* $(@D)
 endef
 
+define REMOVE_SPACE_FROM_FILENAME
+	cd $(@D)/projects/makefile/ && \
+		mv alternate\ Makefile.txt alternate_Makefile.txt
+endef
+LIBSOIL_POST_EXTRACT_HOOKS += REMOVE_SPACE_FROM_FILENAME
+
+define ADD_SPACE_BACK_TO_FILENAME
+	cd $(@D)/projects/makefile/ && \
+		mv alternate_Makefile.txt alternate\ Makefile.txt
+endef
+LIBSOIL_POST_PATCH_HOOKS += ADD_SPACE_BACK_TO_FILENAME
+
 define LIBSOIL_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -f $(LIBSOIL_MAKEFILE) \
 		-C $(@D)/src
