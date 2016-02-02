From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Feb 2016 10:05:20 +0100
Subject: [Buildroot] [PATCH 1/3] package/linux-headers: add option to
	use same sources as the kernel
In-Reply-To: <dde8a16a5331beb6280d7b86002aa917eae44664.1453314776.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 20 Jan 2016 19:34:28 +0100")
References: <cover.1453314776.git.yann.morin.1998@free.fr>
 <dde8a16a5331beb6280d7b86002aa917eae44664.1453314776.git.yann.morin.1998@free.fr>
Message-ID: <87vb677a9b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Some heavily (and most often improperly) modified kernel may export
 > new APIs to userland, so as to speak to custom hardware or custom kernel
 > facilities.

 > However, we currently have no easy way to use such kernels as a source
 > for the linux-headers package, which precludes having those userland
 > headers intalled for userland applications to use them.

 > We do have a way for the kernel to use the same version as for the
 > headers, but that is definitely not enough, as the linux-headers package
 > has a version choice that is far less versatile and capable than that of
 > the linux package.

 > Add a new option for the linux-headers package, for the user to specify
 > that the version (really, the sources) of the kernel be used to install
 > the headers from.

 > We do that by making linux-headers patch-depend on the linux package.

 > We can't have linux-header simply depend on linux, because the simple
 > depenency means the the dependee will be configured, built and installed
 > before the dependent is configured. And since linux is a target package,
 > it depends on the toolchain, which internally dependes on linux-headers,
 > which would depend on linux, and we'd get a circular dependency.

 > Using patch-depend will ensure that linux is extracted and patched
 > before linux-headers is extracted, which is really all we need.

 > Then, we install the headers from the linux source tree, rather than
 > from linux-headers' source tree (as there's nothing in there!).

 > Since we need to install a private set for uClibc (see cde947f, uclibc:
 > prevent rebuilding after installation to staging), we explicitly set
 > INSTALL_HDR_PATH when calling the kernel' install-headers rule in
 > LINUX_HEADERS_CONFIGURE_CMDS, so that the headers are installed in
 > linux-headers' $(@D) instead of linux' $(@D).

 > Finally, as there is no way to know the kernel version in this case, we
 > must still prompt the user for the kernel series the headers are from
 > (like we do for a custom version) and check for consistency at build
 > time.

 > Note however that this still leaves users that want to built their
 > such-kernel outside of Buildroot out in the cold.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Karoly Kasza <kaszak@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>

Committed after dropping the comment as suggested by Thomas, thanks.

-- 
Bye, Peter Korsgaard
