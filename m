From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 27 Jan 2010 20:23:05 +0100
Subject: [Buildroot] uClibc copying kernel headers
In-Reply-To: <4B608C1A.70901@carallon.com>
References: <4B608C1A.70901@carallon.com>
Message-ID: <20100127192305.GA32049@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 27, 2010 at 06:55:22PM +0000, Will Wagner wrote:
>I have been trying to work out who copied the kernel headers from
>toolchain into staging. It appears this is done in uclibc.mk
>
>Looking at the makefile this seems to happen three times, first
>copying into $(TOOLCHAIN_DIR)/uClibc_dev/usr/include, then into
>$(STAGING_DIR)/usr/include and finally into $(TARGET_DIR)/usr/include
>(only if libc.a is on target)

Some time ago we had the kernel sources unpacked into one place and
acted on this one copy. This was later on changed to have (at least) two
places where unpacked kernel tree lives. Just wastes space for no good
reason (and complicates stuff along the way). Just related but i guess
your users would welcome the time and space savings by just having one.
>
>All of these cases have different behaviour depending on whether ifeq
>($(LINUX_HEADERS_IS_KERNEL),y) is true. if it is it just copies all

As you may remember older (as in pre 2.6.13 or so) kernels had to use
manually sanitized headers. LINUX_HEADERS_IS_KERNEL previously ment that
you could make headers_install (or however it's called) and get useable
headers out of the kernel release tarball -- as opposed to headers for
approx. <=2.6.12. ISTR that there was also the scenario where the
kernel-headers wouldn't come from the kernel-tarball some were about to
build (and run) but distributed by a third-party, and in these cases the
above was also false (and potentially asking for trouble due to
mismatches).

HTH,

>th files, otherwise it picks out a specific subset. However search
>all the buildroot files LINUX_HEADERS_IS_KERNEL is never mentioned
>except in uclibc.mk
>
>Looking back through earlier buildroot versions, Peter removed the
>last mention to LINUX_HEADERS_IS_KERNEL with this commit to remove
>2.4.x kernel header support http://lists.busybox.net/pipermail/buildroot/2009-February/026144.html
>
>It appears that before this LINUX_HEADERS_IS_KERNEL was set true for
>2.6.x and false for 2.4.x. It looks to me like that change broke the
>copying of kernel headers for 2.6.x and left code in uclibc.mk that
>was meant for 2.4.x headers.
>
>I think I can just change uclibc.mk so that it acts as if
>LINUX_HEADERS_IS_KERNEL is set.
>
>Does this look right?
>
>As an aside there looks to be an error in uclibc.mk at the moment on
>line 429, although that is code that i think should be removed.
>
>I will attempt to make the changes and if it all works I will submit a patch
>
>Will
>
>
>
>
>
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
