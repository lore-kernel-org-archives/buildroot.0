From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Feb 2013 15:38:19 +0100
Subject: [Buildroot] [PATCH] opkg: Add option to enable package
 verification support with GnuPG
In-Reply-To: <64891469.UzFDExKfyb@arawn>
References: <64891469.UzFDExKfyb@arawn>
Message-ID: <20130228153819.57a2c5ae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Philipp Claves,

On Thu, 28 Feb 2013 15:04:42 +0100, Philipp Claves wrote:

> This set of patches enables the opkg support for verifying package signatures 
> with gnupg.
> 
> The first two patches add the required libraries (libassuan and libgpgme).
> The third adds new option: opkg-gnupg-support. It selects the needed packages 
> and sets the --enable-gpg configure option for opkg.
> 
> The patch dependency chain is:
>   (0003) opkg -> (0002) libgpgme -> (0001) libassuan
> 
> Comments are welcome.

Thanks, they look (almost) good! Could you submit them, one mail per
patch, preferably using git send-email?

On libassuan, please wrap the help text, and add a final newline at the
end of the .mk file.

On libgpgme, please wrap the help text, add the final newline at the
end of the .mk file. The --with-gpg=/usr/bin/gpg doesn't look very
good. gpg is not a mandatory dependency of Buildroot, so if libgpgme
really needs gpg, then we should build host-gnupg I guess. But does it
really need it? Can you detail this --with-gpg option? Or maybe it's
just the path where gpg will be installed on the target? If it's the
case, then maybe a comment would be appropriate to clarify this.

In the opkg patch, in the .mk file, you should use
BR2_PACKAGE_OPKG_GPG_SIGN in your condition rather than
BR2_PACKAGE_LIBGPGME. Also, in your Config.in, you add GNUPG as a
dependency, but it is not listed in the .mk file. This is sometimes
correct if it is only a runtime dependency, in which case we usually
put a comment in the Config.in just above the corresponding select line.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
