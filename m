From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Dec 2009 14:59:43 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Fri,
	11 Dec 2009 14:14:13 +0100")
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<874onxvjyx.fsf@macbook.be.48ers.dk>
	<5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
Message-ID: <87zl5ptxv4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

 Bj?rn> i386 build fails:
 Bj?rn> ----
 Bj?rn> $ make i386_defconfig && make
 Bj?rn> ...snip lots of warnings...
 Bj?rn> package/mtd/mtd-utils/mtd.mk:98: warning: overriding commands for
 Bj?rn> target `/home/bjornfor/dev/buildroot/output'
 Bj?rn> package/mtd/mtd-utils/mtd.mk:65: warning: ignoring old commands for
 Bj?rn> target `/home/bjornfor/dev/buildroot/output'
 Bj?rn> package/mtd/mtd-utils/mtd.mk:97: target
 Bj?rn> `/home/bjornfor/dev/buildroot/output' given more than once in the same
 Bj?rn> rule.

To me it sounds as if somehow a space has sneaked into the definition of
BUILD_DIR - E.G. that line has a long list of BUILD_DIR/mtd_orig/<blah>.

Could you add something like this to mtd.mk and run make test:

diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index a686661..3049f8e 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -20,6 +20,9 @@ MTD_NAME:=mtd-utils-$(MTD_VERSION)
 MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
 SUMTOOL := $(MTD_HOST_DIR)/sumtool
 
+test:
+       echo "MTD_DIR='$(MTD_DIR)'"
+

Here it gives:

echo "MTD_DIR='/home/peko/source/buildroot/output/build/mtd_orig'"
MTD_DIR='/home/peko/source/buildroot/output/build/mtd_orig'

-- 
Bye, Peter Korsgaard
