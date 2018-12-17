From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 10:11:09 +0100
Subject: [Buildroot] [PATCH] toolchain-external: download: add
 <CROSS>-cc symlink if not present
In-Reply-To: <20181217081934.24807-1-peter@korsgaard.com>
References: <20181217081934.24807-1-peter@korsgaard.com>
Message-ID: <20181217101109.6071e1f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Dec 2018 09:19:34 +0100, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/dbb/dbb3c4634d5fc726ca0b27c2dac0befbbab70912
> http://autobuild.buildroot.net/results/dbb/dbb69acadc20b4bb559311348eca276c1e6343f7
> 
> Some external toolchains do not have a <CROSS>-cc binary/symlink, which is
> used by some packages.  As a workaround, add a symlink to <CROSS>-gcc.
> 
> Notice that we can only do this for external toolchains we download
> ourselves, and not pre-installed ones as we might not have write access to
> them.

This is not great, as it doesn't fix the problem in all cases.

What about doing this *after* the toolchain has been installed in
$(HOST_DIR), where we have write access ?

I.E:

output/host/bin (master)$ ls -l
total 108
lrwxrwxrwx 1 thomas thomas   104 Dec 17 10:09 arm-linux-gnueabihf-addr2line -> /home/thomas/Downloads/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf//bin/arm-linux-gnueabihf-addr2line
lrwxrwxrwx 1 thomas thomas    97 Dec 17 10:09 arm-linux-gnueabihf-ar -> /home/thomas/Downloads/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf//bin/arm-linux-gnueabihf-ar
lrwxrwxrwx 1 thomas thomas    97 Dec 17 10:09 arm-linux-gnueabihf-as -> /home/thomas/Downloads/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf//bin/arm-linux-gnueabihf-as
lrwxrwxrwx 1 thomas thomas    17 Dec 17 10:09 arm-linux-gnueabihf-c++ -> toolchain-wrapper
lrwxrwxrwx 1 thomas thomas   102 Dec 17 10:09 arm-linux-gnueabihf-c++filt -> /home/thomas/Downloads/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf//bin/arm-linux-gnueabihf-c++filt
lrwxrwxrwx 1 thomas thomas    17 Dec 17 10:09 arm-linux-gnueabihf-cpp -> toolchain-wrapper
lrwxrwxrwx 1 thomas thomas   102 Dec 17 10:09 arm-linux-gnueabihf-elfedit -> /home/thomas/Downloads/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf//bin/arm-linux-gnueabihf-elfedit
lrwxrwxrwx 1 thomas thomas    17 Dec 17 10:09 arm-linux-gnueabihf-g++ -> toolchain-wrapper
lrwxrwxrwx 1 thomas thomas    17 Dec 17 10:09 arm-linux-gnueabihf-gcc -> toolchain-wrapper
lrwxrwxrwx 1 thomas thomas    17 Dec 17 10:09 arm-linux-gnueabihf-gcc-8.2.1 -> toolchain-wrapper
lrwxrwxrwx 1 thomas thomas   101 Dec 17 10:09 arm-linux-gnueabihf-gcc-ar -> /home/thomas/Downloads/gcc-arm-8.2-2018.08-x86_64-arm-linux-gnueabihf//bin/arm-linux-gnueabihf-gcc-ar

Add a -cc -> toolchain-wrapper symlink ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
