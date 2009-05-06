From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Wed, 6 May 2009 12:20:33 +0200
Subject: [Buildroot] 2009.05-rc1: fix rsync build with config cache
Message-ID: <20090506122033.1c849569@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

building rsync (x86 target) fails with config cache turned on
(at least with my attached .config).

With config cache during .configure:
checking for struct addrinfo... yes
checking for struct sockaddr_storage... (cached) no
checking whether defines needed by getaddrinfo exist... yes
checking for getaddrinfo... (cached) yes
checking for struct sockaddr.sa_len... no
checking for struct sockaddr_in.sin_len... no
checking for struct sockaddr_un.sun_len... no
checking for struct sockaddr_in6.sin6_scope_id... yes

/home/development/buildroot/build_i686/staging_dir/usr/bin/i686-linux-uclibc-gcc -Os -pipe -Os  -I/home/development/buildroot/build_i686/staging_dir/usr/include -I/home/development/buildroot/build_i686/staging_dir/include --sysroot=/home/development/buildroot/build_i686/staging_dir/ -isysroot /home/development/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -std=gnu99 -I. -I. -Os -pipe -Os  -I/home/development/buildroot/build_i686/staging_dir/usr/include -I/home/development/buildroot/build_i686/staging_dir/include --sysroot=/home/development/buildroot/build_i686/staging_dir/ -isysroot /home/development/buildroot/build_i686/staging_dir -mtune=i686 -march=i686 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CONFIG_H -Wall -W -I./popt -Wno-unused-parameter  -c rsync.c -o rsync.o
In file included from rsync.h:886,
                 from rsync.c:22:
lib/addrinfo.h:141: error: redefinition of 'struct sockaddr_storage'

After disabling config cache:
checking for struct addrinfo... yes
checking for struct sockaddr_storage... yes
checking whether defines needed by getaddrinfo exist... yes
checking for getaddrinfo... yes
checking for struct sockaddr.sa_len... no
checking for struct sockaddr_in.sin_len... no
checking for struct sockaddr_un.sun_len... no
checking for struct sockaddr_in6.sin6_scope_id... yes

$ grep storage project_build_i686/uclibc/tgt-config.cache
ac_cv_have_struct_sockaddr_storage=${ac_cv_have_struct_sockaddr_storage=yes}
ac_cv_member_struct_sockaddr_storage_ss_family=${ac_cv_member_struct_sockaddr_storage_ss_family=yes}
ac_cv_type_struct_sockaddr_storage=${ac_cv_type_struct_sockaddr_storage=no}

Regards
Olaf
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 20259 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090506/ff15de41/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-rsync-fix-build-with-config-cache.patch
Type: text/x-patch
Size: 770 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090506/ff15de41/attachment-0001.bin>
