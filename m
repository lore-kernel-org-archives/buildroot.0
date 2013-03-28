From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Mar 2013 09:53:08 +0100
Subject: [Buildroot] media-ctl build failure (autobuild)
In-Reply-To: <CAAXf6LUxBkO6-g-dHs8_2cagNFiBYAWCE3KAEcuT=zWEsJdZMA@mail.gmail.com>
References: <CAAXf6LUxBkO6-g-dHs8_2cagNFiBYAWCE3KAEcuT=zWEsJdZMA@mail.gmail.com>
Message-ID: <20130328095308.4fac9fcf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 28 Mar 2013 08:44:54 +0100, Thomas De Schampheleire wrote:

> What is the appropriate action here:
> 1. remove the old toolchains?
> 2. add some kind of fragile dependency between media-ctl and specific
> toolchain config variables
> 3. introduce a way to specify which kernel header versions are used for
> external toolchains, and check this for packages that need it
> 4. don't bother, let the package fail for these old toolchains

5. Do what I've done for neard, i.e
package/neard/neard-fix-missing-linux-nfc-header.patch: we add a
patch to the package that integrates directly into the package the
required kernel headers, and adjust the autoconf script to either use
the header from the toolchain if it's available, or the bundled header
if not. Over time, toolchains will be updated to more recent kernel
header versions, and we should be able to get rid of such patches.

Even though it's not really nice, I believe it's the least painful way.

Of course, it has the drawback that if the user happens to use a kernel
version that does not have the NFC functionality of the media-ctl
functionality, it will simply not work.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
