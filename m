From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Fri, 22 Nov 2019 09:37:12 +0000
Subject: [Buildroot] Where the cross-compiler gets shared stuff
In-Reply-To: <XnsAB0F51847D9ABfgotham@195.159.176.226>
References: <XnsAB0F51847D9ABfgotham@195.159.176.226>
Message-ID: <e077e558-7f14-5101-b566-bebf8cd6cd0c@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/2019 08:00, Frederick Gotham wrote:
> So how are cross-compilers supposed to work? If they are installed properly, 
> do you need to give them the "--sysroot" parameter?

Check out toolchain/toolchain-wrapper.c, which hardcodes a number of toolchain
arguments (including --sysroot). Cross compiler binaries are accessed via
symlinks in $(HOST_DIR)/bin, some of which go through toolchain-wrapper.

$ ls -l output/host/bin/sparc-linux-*
lrwxrwxrwx 1 tpreston tpreston 46 Nov 21 11:18 output/host/bin/sparc-linux-addr2line -> ../opt/ext-toolchain/bin/sparc-linux-addr2line
lrwxrwxrwx 1 tpreston tpreston 39 Nov 21 11:18 output/host/bin/sparc-linux-ar -> ../opt/ext-toolchain/bin/sparc-linux-ar
lrwxrwxrwx 1 tpreston tpreston 39 Nov 21 11:18 output/host/bin/sparc-linux-as -> ../opt/ext-toolchain/bin/sparc-linux-as
lrwxrwxrwx 1 tpreston tpreston 17 Nov 21 11:18 output/host/bin/sparc-linux-c++ -> toolchain-wrapper
lrwxrwxrwx 1 tpreston tpreston 48 Nov 21 11:18 output/host/bin/sparc-linux-c++.br_real -> ../opt/ext-toolchain/bin/sparc-linux-c++.br_real
lrwxrwxrwx 1 tpreston tpreston 17 Nov 21 11:18 output/host/bin/sparc-linux-cc -> toolchain-wrapper
