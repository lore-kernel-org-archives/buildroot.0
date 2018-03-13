From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Tue, 13 Mar 2018 19:27:30 +0000
Subject: [Buildroot] [RFC] how to deal with a dependency on configure in a
 "Makefile"
Message-ID: <5376F4DC-C206-4034-B246-3D77B47B5B81@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To anyone really,

So, we hit this problem that took me a while to figure out - but, it seems to be that
xfsprogs has this bit in the Makefile when it extracts:

configure: configure.ac
        $(LIBTOOLIZE_BIN) -c $(LIBTOOLIZE_INSTALL) -f
        cp include/install-sh .
        aclocal -I m4
        autoconf

include/builddefs: configure
        ./configure $$LOCAL_CONFIGURE_OPTIONS


And the timestamps on the tar extraction end up in a race so that this gets invoked
during the ?build? - so, I tried looking at other packages to deal with this and I can
just touch configure on a PRE_CONFIGURE hook to get it to bounce forward or
I could set AUTORECONF on xfsprogs. But, is there a preferred method to deal
with this?

Thanks in advance,
Charles
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180313/d75a5446/attachment.html>
