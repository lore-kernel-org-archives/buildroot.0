From: Thierry Bultel <thierry.bultel@basystemes.fr>
Date: Wed, 19 Sep 2012 17:44:06 +0200
Subject: [Buildroot] thread debugging with target gdb
Message-ID: <5059E846.8070000@basystemes.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am using buildroot 2012.08 , configured for ARM cortex A9, crosstools
and glibc-2.11.
The glibc has been built with 2.6.38.8 headers, my running kernel is
3.2.21, in qemu for versatile express.

The issue is that thread debugging does not work, first because
/lib/libthread_db.so.1 was not pushed on the 'target' directory
I 'solved' this by adding it:

CTNG_LIBS_LIB := ld*.so libc.so libcrypt.so libdl.so libgcc_s.so
libm.so    \
                 libnsl.so libpthread.so libresolv.so librt.so
libutil.so    \
                 libthread_db.so

... in crosstools-ng.mk

but is is maybe not the right way.

I have activated some debug log in gdb, and I am falling into those issues.

Reading symbols from /root/ihm...done.
(gdb) r
Starting program: /root/ihm
Trying host libthread_db library: libthread_db.so.1.
Host libthread_db.so.1 resolved to: /lib/libthread_db.so.1.
td_ta_new failed: application not linked with libthread
thread_db_load_search returning 0
Trying host libthread_db library: libthread_db.so.1.
Host libthread_db.so.1 resolved to: /lib/libthread_db.so.1.
td_ta_new failed: application not linked with libthread
Trying host libthread_db library: /lib/libthread_db.so.1.
td_ta_new failed: application not linked with libthread
thread_db_load_search returning 0
warning: Unable to find libthread_db matching inferior's thread library,
thread debugging will not be available.
Error: Can't open display:
[Inferior 1 (process 612) exited with code 01]

Thus the "td_ta_new" symbol is found but the call fails

Any clues or hints ?
Regards
Thierry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120919/517f2ca4/attachment.html>
