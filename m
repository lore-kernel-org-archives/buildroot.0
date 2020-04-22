From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 22 Apr 2020 22:38:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/fio: bump to 3.19
Message-ID: <20200422203829.31227-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add upstream patch to fix build on musl
- update indentation of hash file (two spaces)

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...io_uring-don-t-use-rand48_r-variants.patch | 49 +++++++++++++++++++
 package/fio/fio.hash                          |  6 +--
 package/fio/fio.mk                            |  2 +-
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch

diff --git a/package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch b/package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch
new file mode 100644
index 0000000000..8d6830ac81
--- /dev/null
+++ b/package/fio/0001-t-io_uring-don-t-use-rand48_r-variants.patch
@@ -0,0 +1,49 @@
+From 5e8865c0e08861558c1253c521dc9098d0c773ee Mon Sep 17 00:00:00 2001
+From: Jens Axboe <axboe@kernel.dk>
+Date: Mon, 16 Mar 2020 08:30:36 -0600
+Subject: [PATCH] t/io_uring: don't use *rand48_r() variants
+
+Not available on all platforms.
+
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+
+[Patch from upstream
+https://github.com/axboe/fio/commit/5e8865c0e08861558c1253c521dc9098d0c773ee]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ t/io_uring.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/t/io_uring.c b/t/io_uring.c
+index e84a2b6b..d48db1e9 100644
+--- a/t/io_uring.c
++++ b/t/io_uring.c
+@@ -63,7 +63,6 @@ struct file {
+ struct submitter {
+ 	pthread_t thread;
+ 	int ring_fd;
+-	struct drand48_data rand;
+ 	struct io_sq_ring sq_ring;
+ 	struct io_uring_sqe *sqes;
+ 	struct io_cq_ring cq_ring;
+@@ -170,7 +169,7 @@ static void init_io(struct submitter *s, unsigned index)
+ 	}
+ 	f->pending_ios++;
+ 
+-	lrand48_r(&s->rand, &r);
++	r = lrand48();
+ 	offset = (r % (f->max_blocks - 1)) * BS;
+ 
+ 	if (register_files) {
+@@ -286,7 +285,7 @@ static void *submitter_fn(void *data)
+ 
+ 	printf("submitter=%d\n", gettid());
+ 
+-	srand48_r(pthread_self(), &s->rand);
++	srand48(pthread_self());
+ 
+ 	prepped = 0;
+ 	do {
+-- 
+2.20.1
+
diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 4b6c9b8c1d..d95deb20b0 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 2aa68326266ef074ecc0892ebfe165e28c981282f345ee05f9d06f11ada3f052  fio-3.17.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256 8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
+sha256  a2f885834900f554127718716338914791f5d72800b6f9e3edf173b94b5a2e4e  fio-3.19.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 5761d1c282..3ddd74eda4 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.17
+FIO_VERSION = 3.19
 FIO_SITE = http://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
-- 
2.20.1
