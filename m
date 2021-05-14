From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 16:59:50 +0200
Subject: [Buildroot] BR2_PACKAGE_BUSYBOX_CONFIG ignored
In-Reply-To: <1620983462705-0.post@n4.nabble.com> (David Laight's message of
 "Fri, 14 May 2021 04:11:02 -0500 (CDT)")
References: <1620983462705-0.post@n4.nabble.com>
Message-ID: <87a6oxtl7d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "David" == David Laight <david.laight@aculab.com> writes:

 > AFAICT the filename passed in BR2_PACKAGE_BUSYBOX_CONFIG is ignored and the
 > .config file in output/build/busybox-1.33.0 is always read and then
 > rewritten.

 > There is a lot of makefile 'goop' to read through, so I'm not sure how it is
 > expected to get passed through.
 > A quick look at the busybox config sources seemed to imply that NULL was
 > passed in as the old config file name - so it always looked for a default
 > (.config or /dev/null).

What makes you think it doesn't work?

make BR2_PACKAGE_BUSYBOX_CONFIG=/tmp/no-such-file busybox-configure
for f in /tmp/no-such-file ; do if [ ! -f "${f}" ]; then printf "Kconfig file or fragment '%s' for '%s' does not exist\n" "${f}" "busybox"; exit 1; fi; done
Kconfig file or fragment '/tmp/no-such-file' for 'busybox' does not exist
make[1]: *** [package/busybox/busybox.mk:409: /tmp/no-such-file] Error 1

echo -e 'CONFIG_BRCTL=y\n# CONFIG_HTTPD is not set' > /tmp/config
make BR2_PACKAGE_BUSYBOX_CONFIG=/tmp/config busybox-configure
..
make busybox-menuconfig
..
[*] brctl (4.7 kb)
[ ] httpd (32 kb)

-- 
Bye, Peter Korsgaard
