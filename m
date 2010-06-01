From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jun 2010 19:52:04 +0200
Subject: [Buildroot] [git commit master] Revert "Add -rpath option for
 host package compilation"
In-Reply-To: <20100530084318.C8A0EC03A6@busybox.osuosl.org>
References: <20100530084318.C8A0EC03A6@busybox.osuosl.org>
Message-ID: <20100601195204.6353fe94@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 30 May 2010 10:42:17 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> This reverts commit 6b939d40f6a29a43277566adc9d4312d49cb3abf.
> 
> The problem this commit tries to fix is valid, but the fix
> unfortunately seems to cause worse problems on certain
> distributions/setups, so revert for now.

As it seems that all HOST_CFLAGS/HOST_LDFLAGS combination have tried do
not work, I've tried another solution: setting the rpath in host
binaries outside of the build process of those binaries.

For this, I've added a new package, patchelf, which is compiled for the
host. And then, everytime a package installs something for the host
(in the $(BUILD_DIR)/%/.stamp_host_installed target in
package/Makefile.package.in), I do:

find $(HOST_DIR)/bin $(HOST_DIR)/usr/bin $(HOST_DIR)/usr/sbin $(HOST_DIR)/sbin -type f -perm +111 -exec $(HOST_DIR)/usr/bin/patchelf --set-rpath $(HOST_DIR)/usr/lib {} \; >/dev/null 2>&1 || true

Would this sort of solution be acceptable ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
