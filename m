From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 16 Jun 2016 15:12:06 +0200 (CEST)
Subject: [Buildroot] Allowing user to run ldconfig in post-build script
In-Reply-To: <1722059483.342813959.1466082436418.JavaMail.root@zimbra32-e6.priv.proxad.net>
Message-ID: <1720572432.342833812.1466082726731.JavaMail.root@zimbra32-e6.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Since commit 9c40723, handling of ldconfig in the main Makefile as been dropped,
and if /etc/ld.so.conf is found in the target root filesystem, the build fails.

Not being able to run ldconfig and generate the ld.so cache has two drawbacks:

 - it prevents the user from installing some libraries in other locations than
   /lib and /usr/lib (e.g. /opt/foo/lib). This can be solved with symlinks,
   though.
 - when running a program, ld.so has to explore all the library paths to find
   the correct location of the required libraries. This results in zillions of
   failed calls to open(), i.e. wasted time.

So, it would be better to add an entry in the system configuration menu so that
the user can explicitly disable the sanity check introduced by 9c40723. Hence
he/she will be able to run the cross-compiled version of ldconfig (found in
${STAGING_DIR}/sbin/ldconfig) via the version of QEMU matching the target.

Attached are:

 - a patch to add the aforementioned configuration entry, named
   BR2_TARGET_LDCONFIG.
 - an example of post-build script to run ldconfig via QEMU.

However, instead of using a post-build script, the operations could be performed
in a Buildroot Makefile. Which one should be updated? The main Makefile or the
Makefile of the skeleton package? In any cases, a dependency to host-qemu will
be introduced.

Regards,

--
ELB
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-system-allow-running-ldconfig.patch
Type: text/x-patch
Size: 1665 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160616/ccf701b6/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: post-build.sh
Type: application/x-shellscript
Size: 1185 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160616/ccf701b6/attachment-0001.bin>
