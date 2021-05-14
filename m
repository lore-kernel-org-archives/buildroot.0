From: David Laight <David.Laight@ACULAB.COM>
Date: Fri, 14 May 2021 15:29:15 +0000
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG ignored
In-Reply-To: <87a6oxtl7d.fsf@dell.be.48ers.dk>
References: <1620983462705-0.post@n4.nabble.com>
 <87a6oxtl7d.fsf@dell.be.48ers.dk>
Message-ID: <b68fa0a4d3734a67bef3497336d7620b@AcuMS.aculab.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Korsgaard
> Sent: 14 May 2021 16:00
> 
> >>>>> "David" == David Laight <david.laight@aculab.com> writes:
> 
>  > AFAICT the filename passed in BR2_PACKAGE_BUSYBOX_CONFIG is ignored and the
>  > .config file in output/build/busybox-1.33.0 is always read and then
>  > rewritten.
> 
>  > There is a lot of makefile 'goop' to read through, so I'm not sure how it is
>  > expected to get passed through.
>  > A quick look at the busybox config sources seemed to imply that NULL was
>  > passed in as the old config file name - so it always looked for a default
>  > (.config or /dev/null).
> 
> What makes you think it doesn't work?
> 
> make BR2_PACKAGE_BUSYBOX_CONFIG=/tmp/no-such-file busybox-configure
> for f in /tmp/no-such-file ; do if [ ! -f "${f}" ]; then printf "Kconfig file or fragment '%s' for
> '%s' does not exist\n" "${f}" "busybox"; exit 1; fi; done
> Kconfig file or fragment '/tmp/no-such-file' for 'busybox' does not exist
> make[1]: *** [package/busybox/busybox.mk:409: /tmp/no-such-file] Error 1
> 
> echo -e 'CONFIG_BRCTL=y\n# CONFIG_HTTPD is not set' > /tmp/config
> make BR2_PACKAGE_BUSYBOX_CONFIG=/tmp/config busybox-configure
> ..
> make busybox-menuconfig

I think it must go wrong after those checks.

I've a local copy of busybox.config referenced from my buildroot config file.
There is also the default busybox.config inside buildroot.
And finally a .config file inside the busybox tree.

When I run 'make busybox-menuconfig' it only reads and updates the latter.
Even if I copy the .config to my busybox.config to ensure it is valid.

I think this used to work (about three years ago) because our own scripts
recover the updated file so it can be saved under source control.
(Not that I actually remember doing that.)

I've just run: strace -oz -f make busybox-menuconfig
There is only one reference to busybox.config about 14% of the way through.
It's existence is checked for between .stamp_dotconfig and .stamp_patched.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
