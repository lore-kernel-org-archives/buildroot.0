From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 31 Oct 2018 08:09:48 -0300
Subject: [Buildroot] [PATCH v2] uclibc: fix mkostemp
In-Reply-To: <20181031051918.6obvzpncii5dl3lx@sapphire.tkos.co.il>
References: <20181031051918.6obvzpncii5dl3lx@sapphire.tkos.co.il>
Message-ID: <20181031110948.6791-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pull a patch already submitted upstream[1] that fixes mkostemp when
_LARGEFILE64_SOURCE is defined. This is required to prevent failures
on eudev[2]:

    # udevadm hwdb --update
    Failure writing database //etc/udev/hwdb.bin: Invalid argument

1. https://patchwork.ozlabs.org/patch/990045/
2. https://patchwork.ozlabs.org/patch/984848/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2:
- Fix commit message error reported by Baruch Siach.
- Improve example.
---
Test:

    $ cat test.c
    #include <errno.h>
    #include <fcntl.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <sys/types.h>
    #include <sys/stat.h>

    void fatal(int n)
    {
        fprintf(stderr, "fatal[%d]: %s\n", n, strerror(errno));
        exit(1);
    }

    int main(int argc, char *argv[])
    {
        FILE *f;
        int cur_mode;
        char template[64];
        strncpy(template, argc > 1 ? argv[1] : "testXXXXXX", 63);

        umask(077);
        printf("main[1]: %s, %07o\n", template, O_WRONLY|O_CLOEXEC);
        int fd = mkostemp(template, O_WRONLY|O_CLOEXEC);
        if (fd < 0) {
            fatal(1);
        }
        cur_mode = fcntl(fd, F_GETFL);
        printf("main[2]: %s, %07o\n", template, cur_mode);

        printf("main[3]: %d, %s\n", fd, "we");
        f = fdopen(fd, "we");
        if (!f) {
            fatal(2);
        }

        if (fclose(f) == EOF) {
            fatal(3);
        }

        return 0;
    }

$ x86_64-buildroot-linux-uclibc-cc -Wall -Werror -D_GNU_SOURCE \
    -o mkostemp-test test.c
$ x86_64-buildroot-linux-uclibc-cc -Wall -Werror -D_GNU_SOURCE \
    -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
    -o mkostemp-test-large test.c

[ copy executables to target device (qemu, in this case) ]

Without patch:
    # mkostemp-test
    main[1]: testXXXXXX, 2000001
    random: fast init done
    main[2]: testIPn9UR, 0100002
    main[3]: 3, we
    # mkostemp-test-large
    main[1]: testXXXXXX, 2000001
    main[2]: testiXRydb, 0100003
    main[3]: 3, we
    fatal[2]: Invalid argument

With patch:
    # mkostemp-test
    main[1]: testXXXXXX, 2000001
    main[2]: testcVhbXs, 0100002
    main[3]: 3, we
    # mkostemp-test-large
    main[1]: testXXXXXX, 2000001
    main[2]: testDAulBF, 0100002
    main[3]: 3, we

---
Change-Id: Iaf8c39a6e3e28bd6ee881ed692e297bfc9d7cfdb
---
 ...4-mkostemp64-clear-flags-as-mkostemp-does.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch

diff --git a/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
new file mode 100644
index 0000000000..f87abd8849
--- /dev/null
+++ b/package/uclibc/0004-mkostemp64-clear-flags-as-mkostemp-does.patch
@@ -0,0 +1,38 @@
+From 09a776103e4aa75f95c9ad44554a9c2b56de3535 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.com.br>
+Date: Mon, 29 Oct 2018 01:17:38 -0300
+Subject: [PATCH] mkostemp64: clear flags, as mkostemp does
+
+This should have been made in commit 9649721950 but was forgotten.
+
+Signed-off-by: Carlos Santos <casantos@datacom.com.br>
+---
+ libc/stdlib/mkostemp64.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libc/stdlib/mkostemp64.c b/libc/stdlib/mkostemp64.c
+index aa9736cd6..f4674bb0c 100644
+--- a/libc/stdlib/mkostemp64.c
++++ b/libc/stdlib/mkostemp64.c
+@@ -15,9 +15,9 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
+-#include <fcntl.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <fcntl.h>
+ #include "../misc/internals/tempname.h"
+ 
+ /* Generate a unique temporary file name from TEMPLATE.
+@@ -27,6 +27,7 @@
+ int
+ mkostemp64 (char *template, int flags)
+ {
++  flags -= flags & O_ACCMODE; /* Remove O_RDONLY, O_WRONLY, and O_RDWR. */
+   return __gen_tempname (template, __GT_BIGFILE, flags | O_LARGEFILE, 0,
+                          S_IRUSR | S_IWUSR);
+ }
+-- 
+2.14.5
+
-- 
2.14.5
