From: Joe Pruett <joey@clean.q7.com>
Date: Wed, 13 Dec 2006 16:41:02 -0800 (PST)
Subject: [Buildroot] issues with svn version
Message-ID: <Pine.LNX.4.64.0612131637012.24865@q7.q7.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

a clean svn build immediately fails because linux-libc-headers can't be 
found in the dl directory.  i did a make -k to see if it would appear 
later, but it didn't.  so i manually tracked it down and wget'ed it.

now it builds much further, but the uclibc bootstrapping is failing.  the 
section:

# Install the kernel headers to the first stage gcc include dir if necessary
if [ ! -f /home/joey/buildroot/build_i686/staging_dir/include/linux/version.h ] ; then \
        cp -pLR /home/joey/buildroot/toolchain_build_i686/linux/include/asm /home/joey/buildroot/toolchain_build_i686/uClibc_dev/usr/include/ ; \
        cp -pLR /home/joey/buildroot/toolchain_build_i686/linux/include/linux /home/joey/buildroot/toolchain_build_i686/uClibc_dev/usr/include/ ; \
        [ -d /home/joey/buildroot/toolchain_build_i686/linux/include/asm-generic ] && \
        cp -pLR /home/joey/buildroot/toolchain_build_i686/linux/include/asm-generic /home/joey/buildroot/toolchain_build_i686/uClibc_dev/usr/include/ ; \
fi;

looks wrong.  i am guessing that the destination for the copies should be 
the staging dir, but i'm not sure.  any input?
