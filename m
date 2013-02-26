From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Feb 2013 07:53:14 -0300
Subject: [Buildroot] Proposed util-linux split
Message-ID: <512C941A.1070207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all.
The last couple of days i've been thinking and working towards a
solution that would split out libblkid/libuuid out of the util-linux
package.
It's a remake of my previous "util-linux don't install binaries" patch.
The objectives are:

* Upgrading to newer versions of the libraries - it's not required by
any package, but it's useful for libblkid to recognize newer superblock
types.

* We can't upgrade util-linux past 2.20.1 unless we want to drop the
basic loginutils functionality since it requires PAM starting from 2.21.
By splitting the libraries out i can use just the libraries from newer
util-linux versions. Caveat is you won't get the newer libraries if
you're installing util-linux with the library options on.

* Reduce bloat! The most important point for me, one packages needs
libuuid and we get a dozen util-linux binaries around as a free gift.

I've got a working not-quite-ready (needs cleanup) patchset that adds
the libblkid and libuuid packages. These are based on a slightly patched
(configure.ac & Makefile.am) util-linux-2.22.2 that basically reduces
build time and keeps the original install target (you can't make -C
libblkid install with newer util-linux versions, see
http://karelzak.blogspot.com/2013/02/non-recursive-automake.html)

When a package needs libuuid it would now change to:
select BR2_PACKAGE_LIBUUID if !BR2_PACKAGE_UTIL_LINUX_LIBUUID
to avoid duplication.
And on libuuid Config.in:
depends on !BR2_PACKAGE_UTIL_LINUX_LIBUUID

This lets us keep util-linux around (which doesn't work with external
libblkid/libuuid because it doesn't expect them to be so) and slimmer
versions of the libraries when people don't want util-linux.

Another added bonus is libuuid doesn't require wchar this way.

What do you think?
Regards.
