From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 7 Nov 2012 21:47:27 -0500
Subject: [Buildroot] [PATCH] sstrip preserve permissions
In-Reply-To: <87hap1cfw8.fsf@dell.be.48ers.dk>
References: <1338083152-2359-1-git-send-email-danomimanchego123@gmail.com>
 <87hap1cfw8.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt7YdwDGWSaOaYrxw+XroAokpjy8uL8hP+0RBXAVJrkXmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>  Danomi> Unlike "strip", the "sstrip" does not preserve the file permissions
>  Danomi> of its target.  So if you have a package that sets special permissions,
>  Danomi> such as the setuid bit, sstrip will remove it.  This patch adds some
>  Danomi> minimal lines to preserve the permissions of stripped files.
>
> What is the use case for this? From a quick look it seems sstrip just

We have a proprietary CGI app that gets called by lighttpd, so the
caller isn't root.  I don't quite remember the exact operation that
caused us to do a chmod +s.  That's when we noticed that the +s perms
were disappearing when sstrip was used, but conserved when strip was
used.


> truncates the source file, so permissions shouldn't change.

Nope.  Just try it on a file that gets cut down.  For example:

	$ ll output/target/usr/bin/i2cdetect
	-rwxr-xr-x 1 dmocelo dmocelo 34726 Nov  7 21:34
output/target/usr/bin/i2cdetect*

	$ chmod a+s output/target/usr/bin/i2cdetect

	$ ll output/target/usr/bin/i2cdetect
	-rwsr-sr-x 1 dmocelo dmocelo 34726 Nov  7 21:34
output/target/usr/bin/i2cdetect*

	$ # now I'll run a make with sstrip enabled
	$ make
	...

	$ ll output/target/usr/bin/i2cdetect
	-rwxr-xr-x 1 dmocelo dmocelo 11630 Nov  7 21:36
output/target/usr/bin/i2cdetect*


> setuid (to root) doesn't make much sense as we're building as non-root
> and fixing up permissions at the end using fakeroot (E.G. see
> BUSYBOX_PERMISSIONS).

We make our packages to be friendly to multiple build systems, so the
package makefile's install operation is taking care of the special
permission, rather than using a buildroot-specific mechanism.

But regardless, I was thinking that the difference compared to normal
strip operation was reason enough to want to preserve permissions.
No?

Danomi -
