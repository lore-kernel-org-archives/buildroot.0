From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Oct 2017 23:33:07 +0200
Subject: [Buildroot] [git commit] support/run-tests: export download dir
Message-ID: <20171010212558.3DCFF8110F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33f3cb8a878e208d46db3def78fe990075b681fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the download directory, when specified with the -d option, is
only used to store the files downloaded by the testing infra, not those
downloaded by Buildroot.

So, we end up with this situation:

    BR2_DL_DIR  | -d DIR   | test downloads   | BR downloads
    ------------+----------+------------------+--------------
    unset       | unset    | [error]          | [error]
    unset       | set      | in $(DIR)        | in $(TOP_DIR)/dl
    set         | unset    | in $(BR2_DL_DIR) | in $(BR2_DL_DIR)
    set         | set      | in $(DIR)        | in $(BR2_DL_DIR)

This is not very consistent.

We change the behaviour so that the value of -d always takes precedence,
and is used by Buildroot as well, giving this new behaviour:

    BR2_DL_DIR  | -d DIR   | test downloads   | BR downloads
    ------------+----------+------------------+--------------
    unset       | unset    | [error]          | [error]
    unset       | set      | in $(DIR)        | in $(DIR)
    set         | unset    | in $(BR2_DL_DIR) | in $(BR2_DL_DIR)
    set         | set      | in $(DIR)        | in $(DIR)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/run-tests | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 270e78c..f8cee09 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -58,6 +58,7 @@ def main():
             return 1
 
     BRTest.downloaddir = os.path.abspath(args.download)
+    os.putenv("BR2_DL_DIR", BRTest.downloaddir)
 
     if args.output is None:
         print "Missing output directory, please use -o/--output"
