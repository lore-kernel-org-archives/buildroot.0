From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 11 Dec 2009 15:53:22 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <87zl5ptxv4.fsf@macbook.be.48ers.dk>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<874onxvjyx.fsf@macbook.be.48ers.dk>
	<5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
	<87zl5ptxv4.fsf@macbook.be.48ers.dk>
Message-ID: <5f2b60912110653q3ad5824fpa86b07e38dab5a2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/11 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> ?Bj?rn> i386 build fails:
> ?Bj?rn> ----
> ?Bj?rn> $ make i386_defconfig && make
> ?Bj?rn> ...snip lots of warnings...
> ?Bj?rn> package/mtd/mtd-utils/mtd.mk:98: warning: overriding commands for
> ?Bj?rn> target `/home/bjornfor/dev/buildroot/output'
> ?Bj?rn> package/mtd/mtd-utils/mtd.mk:65: warning: ignoring old commands for
> ?Bj?rn> target `/home/bjornfor/dev/buildroot/output'
> ?Bj?rn> package/mtd/mtd-utils/mtd.mk:97: target
> ?Bj?rn> `/home/bjornfor/dev/buildroot/output' given more than once in the same
> ?Bj?rn> rule.
>
> To me it sounds as if somehow a space has sneaked into the definition of
> BUILD_DIR - E.G. that line has a long list of BUILD_DIR/mtd_orig/<blah>.
>
> Could you add something like this to mtd.mk and run make test:
>
> diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
> index a686661..3049f8e 100644
> --- a/package/mtd/mtd-utils/mtd.mk
> +++ b/package/mtd/mtd-utils/mtd.mk
> @@ -20,6 +20,9 @@ MTD_NAME:=mtd-utils-$(MTD_VERSION)
> ?MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
> ?SUMTOOL := $(MTD_HOST_DIR)/sumtool
>
> +test:
> + ? ? ? echo "MTD_DIR='$(MTD_DIR)'"
> +
>
> Here it gives:
>
> echo "MTD_DIR='/home/peko/source/buildroot/output/build/mtd_orig'"
> MTD_DIR='/home/peko/source/buildroot/output/build/mtd_orig'

I manually applied your patch (is there a better way of doing it?) and when
building a non-working configuration, there is no other output than the
warnings and then full stop. Make quits before running the 'test'
target! See the log:

----
$ make i386_defconfig
$ make test
...snip lots of warnings...
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:100: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:109: *** multiple target patterns. Stop.
----

If using a "working" config like 'make defconfig && make' I get this:
----
target/makedevs/makedevs.mk:16: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'
target/makedevs/makedevs.mk:11: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
target/makedevs/makedevs.mk:19: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'
target/makedevs/makedevs.mk:16: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
target/romfs/romfs.mk:15: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
target/makedevs/makedevs.mk:19: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
target/romfs/romfs.mk:18: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
target/romfs/romfs.mk:15: warning: ignoring old commands for target
`/home/bjornfor/dev/buildroot/output'
target/squashfs/squashfsroot.mk:16: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'
target/romfs/romfs.mk:18: warning: ignoring old commands for target
`/home/bjornfor/dev/buildroot/output'
target/squashfs/squashfsroot.mk:21: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'
target/squashfs/squashfsroot.mk:16: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
target/ubifs/ubifsroot.mk:19: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
target/squashfs/squashfsroot.mk:21: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
target/ubifs/ubifsroot.mk:25: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
target/ubifs/ubifsroot.mk:19: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
Makefile:330: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
target/ubifs/ubifsroot.mk:25: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
Makefile:355: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
Makefile:330: warning: ignoring old commands for target
`/home/bjornfor/dev/buildroot/output'
Makefile:354: target `/home/bjornfor/dev/buildroot/output' given more
than once in the same rule.
Makefile:354: target `/home/bjornfor/dev/buildroot/output' given more
than once in the same rule.
Makefile:354: target `/home/bjornfor/dev/buildroot/output' given more
than once in the same rule.
Makefile:354: target `/home/bjornfor/dev/buildroot/output' given more
than once in the same rule.
Makefile:358: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
Makefile:355: warning: ignoring old commands for target
`/home/bjornfor/dev/buildroot/output'
Makefile:373: warning: overriding commands for target
`/home/bjornfor/dev/buildroot/output'
Makefile:358: warning: ignoring old commands for target
`/home/bjornfor/dev/buildroot/output'
make: *** No rule to make target `test'. Stop.
----

Weird. If you're wondering if I applied the patch correctly, here's my
git diff output:

diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index a686661..cddaed4 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -20,6 +20,9 @@ MTD_NAME:=mtd-utils-$(MTD_VERSION)
 MKFS_JFFS2 := $(MTD_HOST_DIR)/mkfs.jffs2
 SUMTOOL := $(MTD_HOST_DIR)/sumtool

+test:
+       echo "MTD_DIR='$(MTD_DIR)"'
+
 $(DL_DIR)/$(MTD_SOURCE):
        $(call DOWNLOAD,$(MTD_SITE),$(MTD_SOURCE))


As I've noted earlier in this thread, git bisect told me the first bad commit
was a07d6b9d56955bfe0165b5f4ea6d3ed7a92ecff6 "By default, put the
output in an output/ directory".
And I think the BR output shows that there is something wrong with what Make
thinks of my "output" directory:

  target/ubifs/ubifsroot.mk:25: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'

and

  Makefile:354: target `/home/bjornfor/dev/buildroot/output' given
more than once in the same rule.

BTW, I'm going away (without computer access) for two days, so I won't be able
to debug/respond until Sunday.

Best regards,
Bj?rn Forsman
