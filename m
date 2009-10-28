From: Andrew Dyer <amdyer@gmail.com>
Date: Wed, 28 Oct 2009 12:00:29 -0500
Subject: [Buildroot] problems building vlc against git buildroot
Message-ID: <c166aa9f0910281000m66ea3ce8x379d9c5afe9003c1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I am trying to get VLC to build against the current git buildroot.
 It complains about not finding libiconv (see build log attached).

I notice that the vlc Configure.in doesn't specify that the libiconv
package is required for vlc.  I patched this like so

diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
index c8faaa7..4c7c77c 100644
--- a/package/multimedia/vlc/Config.in
+++ b/package/multimedia/vlc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_VLC
        bool "vlc"
+       select BR2_PACKAGE_LIBICONV
        help
          a free cross-platform media player

and rebuilt, and now I get a libiconv in output/target/usr/lib

$ ls target/usr/lib/libiconv*
target/usr/lib/libiconv.la  target/usr/lib/libiconv.so.2
target/usr/lib/libiconv.so  target/usr/lib/libiconv.so.2.4.0

but the VLC configure is not picking up that libiconv is available.

the attached build log was captured after I did the following:
Patched the vlc config.in as above, rm'd the entire output directory,
did a make and vlc build errored, verified that libiconv was in the
target filesystem, and then did 'make 2>&1 | tee make.log'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: make.log
Type: application/octet-stream
Size: 20528 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091028/bcea76d6/attachment-0001.obj>
