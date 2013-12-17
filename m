From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Tue, 17 Dec 2013 15:04:02 +0100
Subject: [Buildroot] e2fsprogs build failure analysis
Message-ID: <CACjG4BKgavMZX=bZxPRU4tAX3u5KiwrdcwxFeLK7JO=bAiYL3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I had a look at e2fsprog build failure (
http://autobuild.buildroot.net/results/af4/af463591df5e7cfbf963fd489ee7561b82793c8a/
)

The problem is there is an undefined reference to fallocate64.
Looks like this problem (fallocate64 symbol not beeing exported on 32bits
systems) has been fixed in glibc 2.11 (
http://sourceware.org/ml/libc-hacker/2009-05/msg00003.html). And as the
NIOS toolchain seems to use glibc 2.17 I don't know what's wrong with it.
Tweaking the CONF_OPT with :
CFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-D_FILE_OFFSET_BITS=32" \
and
CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
-D_FILE_OFFSET_BITS=32"

seems to fix the build issue but config.log still shows an "undefined
reference to `fallocate64'", any thought about what am I doing wrong here ?

Regards,

Arnaud
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131217/eecc9ee7/attachment.html>
