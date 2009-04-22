From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Apr 2009 10:52:56 +0200
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <E8FBAEC0D1A8452EA1A58E35916B04E6@apexjs> (Sagaert Johan's
	message of "Sat\, 18 Apr 2009 12\:10\:53 +0200")
References: <E8FBAEC0D1A8452EA1A58E35916B04E6@apexjs>
Message-ID: <87hc0hoys7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Hi,

 Sagaert> 1) libssp issue

 Sagaert> I started of with a clean build again to do the check:

 Sagaert> I enabled the packages openssh ,openssl

 Sagaert> After building the libssp.so.0,libssp.so.0.0.0 and libssp.so are under
 Sagaert> build_arm/stagingdir/usr/arm-linux-uclibc/lib
 Sagaert> But they are NOT insite the project_build_arm/.../root

 Sagaert> Generating RSA Key...
 Sagaert> /usr/bin/ssh-keygen: can't load library 'libssp.so.0'
 Sagaert> Generating DSA Key...
 Sagaert> THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!

 Sagaert> /usr/bin/ssh-keygen: can't load library 'libssp.so.0'

That's not really an issue with openssh as such, but the fact that we
used to compile gcc with --enable-libssp and NOT install the libs in
the target. It should be fixed in r26182 - r26183.

 Sagaert> 2) dbus

 Sagaert> After distclean the build_arm directoory gets cleaned,but
 Sagaert> the autotools-stamps not, As a result dbus get build again
 Sagaert> but never installed again.(this may apply to others too)

Hmm.. distclean removes toolchain_build_arch, build_arch,
project_build_arch and binaries, so this I don't get. Are you talking
about the dbus-clean / dbus-dirclean make targets instead?

 Sagaert> 3) .. /root/var

 Sagaert> I always remove the var directory and replace it with a
 Sagaert> symlink to /tmp/ I then create the required directory
 Sagaert> structure (var lock, etc) in init.d/ S00mktmp Doing so
 Sagaert> results in var been actually on tmpfs, this avoids that my
 Sagaert> flash gets written.

Yes, that's pretty similar to what the generic target does (/var is on
rootfs, but the subdirs cache, lock, log, pcmcia, run, spool, tmp are
all symlinks to /tmp.

 Sagaert> Maybe this is something to consider making this configurable.

 Sagaert> (for the same reason i have put a symplink /etc/resolv.conf
 Sagaert> pointing to /tmp/ resolv.conf )

Same for the generic target.

-- 
Bye, Peter Korsgaard
