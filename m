From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:50:09 +0200
Subject: [Buildroot] [PATCH] package/sentry-cli: new package
In-Reply-To: <20200915205738.2144347-1-joseph.kogut@gmail.com>
References: <20200915205738.2144347-1-joseph.kogut@gmail.com>
Message-ID: <20200919225009.321abe29@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 13:57:38 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

I did some more testing, and after building zlib for the host, the
build fails with:

*** ERROR: package host-libzlib installs executables without proper RPATH:
***   /home/thomas/projets/buildroot/output/host/bin/sentry-cli

Indeed, sentry-cli is linked with libz.so.1:

 0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [ld-linux-x86-64.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]

I've seen that sentry-cli bundles OpenSSL (it seems), which is perhaps
why it links against libz.so.1.

However, this means that sentry-cli should depend on host-zlib and
should have a RPATH to $(HOST_DIR)/lib.

Could you have a look into this ? I've added in Cc some folks working
on Cargo integration in Buildroot, to see if they can help.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
