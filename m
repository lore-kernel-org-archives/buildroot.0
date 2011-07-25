From: Alexjan Carraturo <axjslack@gmail.com>
Date: Mon, 25 Jul 2011 08:45:26 +0200
Subject: [Buildroot] [git commit] e2fsprogs: Add missing dependency of
 tst_uuid.o on uuid.h
In-Reply-To: <20110724222706.574988B495@busybox.osuosl.org>
References: <20110724222706.574988B495@busybox.osuosl.org>
Message-ID: <CACR8Qs_yv1OspsG_byHSTXm5pZ1UMgrMVj0GXf8Rvovk-4+Lpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/7/25 Peter Korsgaard <jacmet@sunsite.dk>:
>
> commit: http://git.buildroot.net/buildroot/commit/?id=0af4136c544aecf7950a76996fd76cc8c208d604
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> The missing dependency used to break parallel builds.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
> ?...rogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch | ? 18 ++++++++++++++++++
> ?1 files changed, 18 insertions(+), 0 deletions(-)
> ?create mode 100644 package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch
>
> diff --git a/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch b/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch
> new file mode 100644
> index 0000000..3a60e89
> --- /dev/null
> +++ b/package/e2fsprogs/e2fsprogs-1.41.9-add-missing-dep-of-tst_uuid-o.patch
> @@ -0,0 +1,18 @@
> +Add missing dependency of tst_uuid.o on uuid.h
> +
> +The missing dependency used to break parallel builds.
> +
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> +---
> +diff -Nrup e2fsprogs.orig//lib/uuid/Makefile.in e2fsprogs-1.41.14//lib/uuid/Makefile.in
> +--- e2fsprogs.orig//lib/uuid/Makefile.in ? ? ? 2010-06-14 05:07:36.000000000 +0200
> ++++ e2fsprogs-1.41.14//lib/uuid/Makefile.in ? ?2011-07-18 13:44:58.000000000 +0200
> +@@ -76,7 +76,7 @@ uuid.h: $(srcdir)/uuid.h.in
> + $(top_builddir)/lib/uuid/uuid_types.h: $(srcdir)/uuid_types.h.in $(top_builddir)/config.status
> + ? ? ? cd $(top_builddir); CONFIG_FILES=$(my_dir)/uuid_types.h ./config.status
> +
> +-tst_uuid.o: $(srcdir)/tst_uuid.c
> ++tst_uuid.o: $(srcdir)/tst_uuid.c uuid.h
> + ? ? ? $(E) " ?CC $@"
> + ? ? ? $(Q) $(CC) $(ALL_CFLAGS) -c $(srcdir)/tst_uuid.c -o tst_uuid.o
> +
> --
> 1.7.3.4




There is the possibility that, the problem about uuid.h that you have
with e2fsprogs is similar to what I'm having on my version of
buildroot (snapshot of 22 July)

/usr/bin/make BUILDDIR=/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/$d
-C $d $t
make[2]: Entering directory
`/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs'
gcc -I../include -I../ubi-utils/include   -D_FILE_OFFSET_BITS=64 -O2
-g -Wall -Wextra -Wwrite-strings -Wno-sign-compare -ffunction-sections
-fdata-sections -Wl,--gc-sections -c -o
/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/mkfs.ubifs.o
mkfs.ubifs.c -g
-Wp,-MD,/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/.mkfs.ubifs.c.dep
In file included from mkfs.ubifs.c:23:0:
mkfs.ubifs.h:48:23: fatal error: uuid/uuid.h: File o directory non esistente
compilation terminated.
make[2]: *** [/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs/mkfs.ubifs.o]
Errore 1
make[2]: Leaving directory
`/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/mkfs.ubifs'
make[1]: *** [subdirs_mkfs.ubifs_install] Errore 2
make[1]: Leaving directory
`/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5'
make: *** [/home/buildroot/buildroot-20110722/buildroot/output/build/host-mtd-1.4.5/.stamp_host_installed]
Errore 2



Seems searching a uuid/uuid.h, but doesn't seems to find it. Does it
is a problem similar to your

Thank you
Alexjan


-- 
Alexjan Carraturo
--
Free Software User Group Italia administrator (http://www.fsugitalia.org)
Fedora/OpenSUSE Ambassador
member of FSFE Italian Team

Twitter/Facebook/Identica: axjslack
Blog: http://axjslack.wordpress.com
--
