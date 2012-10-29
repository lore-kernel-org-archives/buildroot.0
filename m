From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Oct 2012 23:38:15 +0100
Subject: [Buildroot] Topics for the Buildroot Developers meeting
In-Reply-To: <CABYt4-a-3ozfyg-6dRg35vSAv-u8czNyi4cZ=QngtAND0jhcyA@mail.gmail.com>
References: <20121029194314.7545a446@skate>
 <CABYt4-a-3ozfyg-6dRg35vSAv-u8czNyi4cZ=QngtAND0jhcyA@mail.gmail.com>
Message-ID: <20121029233815.62dad9b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 29 Oct 2012 18:30:01 -0400, Shawn Goff wrote:
> From the discussion page:
> > Make it possible to do a 'target-clean', as a replacement of uninstall. Will this even work at all? Proposed by Arnout Vandecappelle
> 
> This would be amazing.
> 
> I had a quick chat in #ptxdist today, and it seems that's what they do
> - they have separate stages, including a compile, install, and
> targetinstall. The install installs the package into a
> project-specific directory, and targetinstall creates an ipkg and
> installs the package's relevant files to the root filesystem. When you
> need to remove a package, you unselect it from the config and rebuild
> the rootfs.

Except that it doesn't work properly, even in PTXdist (as far as I
know, of course). We had a discussion about this last year at ELCE with
PTXdist developers. Basically, do the following:

 * Build program foo with OpenSSL support (the OpenSSL support in foo
   is optional, foo can work without OpenSSL). Both foo and openssl are
   installed in the target.

 * Enjoy foo with OpenSSL on your target, you're happy.

 * Now, remove OpenSSL from your target.

Beng, "foo" no longer works, because a library it is linked against no
longer exists, and "foo" has not been rebuilt without OpenSSL support.
As far as I know, PTXdist doesn't keep track of reverse dependencies
when removing a package, and that can lead to invalid root filesystems.

That's the precise reason why we decided /not/ to support packages in
Buildroot: solving this problem completely is very complicated, and we
thought it is better to not solve the problem than to solve it in half.

We detailed all this in our ELCE 2011 meeting report, but I guess we
should make it part of our FAQ because it is actually a FAQ :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
