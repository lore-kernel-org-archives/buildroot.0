From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 18 Sep 2010 22:13:11 +0200
Subject: [Buildroot] [PATCH 2/3] zlib: Fix build
In-Reply-To: <1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Sat, 18 Sep 2010 14:16:46 +0200")
References: <1284812207-31798-1-git-send-email-llandwerlin@gmail.com>
	<1284812207-31798-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <8739t66ca0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Using "make -j $(N)" with N > 1 break zlib build.

In what way exactly? Zlib is a pretty common package and I've never
seen if breaking because of parallel builds.

In fact, testing on a big (24 core) machine I don't see it either:

tar jxf ~/zlib-1.2.5.tar.bz2
mv zlib-1.2.5{,-parallel}
tar jxf ~/zlib-1.2.5.tar.bz2
cd zlib-1.2.5-parallel ; ./configure --prefix=/usr --shared; \
   make -j 100 all libz.a; cd ..
cd zlib-1.2.5 ; ./configure --prefix=/usr --shared; \
   make all libz.a; cd ..

Gives the same result:

ls -la zlib-1.2.5*/libz.{a,so.1.2.5}
-rw-r--r-- 1 peko peko 133746 2010-09-18 22:00 zlib-1.2.5/libz.a
-rwxr-xr-x 1 peko peko 109995 2010-09-18 22:00 zlib-1.2.5/libz.so.1.2.5
-rw-r--r-- 1 peko peko 133746 2010-09-18 22:00 zlib-1.2.5-parallel/libz.a
-rwxr-xr-x 1 peko peko 109995 2010-09-18 22:00 zlib-1.2.5-parallel/libz.so.1.2.5

-- 
Bye, Peter Korsgaard
