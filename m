From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 21:41:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libldns: Fix build error with
 target install-manpages
In-Reply-To: <1452458817-2184-1-git-send-email-bernd.kuhls@t-online.de>
References: <1452458817-2184-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160322214110.6283dad9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jan 2016 21:46:57 +0100, Bernd Kuhls wrote:
> Using this minimal defconfig
> 
> BR2_PACKAGE_LIBLDNS=y
> 
> the build fails due to the non-existing directory share/man/man3/

This is not correct. The target directory share/man/man3 is created by
the install process. Here is what you can see in the build log:

./install-sh  -d /home/thomas/projets/buildroot/output/target/usr/share/man/man3
for f in doc/man/man3/*; do \
	./install-sh  -c -m 444 $f /home/thomas/projets/buildroot/output/target/usr/share/man/man3/; \
done

> ./install-sh: doc/man/man3/* does not exist.
> Makefile:297: recipe for target 'install-manpages' failed
> make[1]: *** [install-manpages] Error 1

It is actually the source directory, doc/man/man3/ that doesn't seem to
exist, or at least that is empty. Its contents are apparently generated
by a Perl script, and Perl is a mandatory dependency of Buildroot.

I've tested a minimal configuration like yours, both on my machine, and
in a limited chroot used in the autobuilders, and I was not able to
reproduce.

So, I'd like to have a better patch that clearly identifies the reason
of the failure.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
