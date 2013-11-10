From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:27:21 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: fix the SYSROOT_DIR
	mangling logic
In-Reply-To: <1383779283-19725-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 7 Nov 2013 00:08:01 +0100")
References: <1383779283-19725-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txfjald2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> In a1d94aaa3a21911 ('toolchain-external: add support for musl C
> library'), we made the following change to the SYSROOT_DIR mangling
> logic:

> -       SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
> +       SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \

> This was needed to accomodate for musl based toolchains that don't
> have libc.a in usr/lib/..., but directory in lib/... Basically, the
> change makes the usr/ at the beginning optional.

> However, with the very permissive (.*) matching in the middle of the
> path, the change above had an unexpected consequence: any path contain
> '/lib' would be truncated before this lib. As an example, Peter
> reported that his builds, running from /var/lib/buildbot/ were no
> longer working because the SYSROOT_DIR was decided to be /var instead
> of something like
> /var/lib/buildbot/buildroot/output/host/opt/ext-toolchain/arm-linux-gnueabihf/libc/.

> So, this commit changes (again!) this regexp by changing (.*) to
> ([^/]*), the idea being that it will match only *one* path
> component. Note that this intermediate (.*) directory was added in
> e6e60becb008 ('external-toolchain: add support for Linaro 2012.01') to
> accomodate for Linaro toolchains that have a subdirectory in their
> sysroot named after the target tuple:

> $ ./output/host/opt/ext-toolchain/bin/arm-linux-gnueabihf-gcc -print-file-name=libc.a
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../arm-linux-gnueabihf/libc/usr/lib/arm-linux-gnueabihf/libc.a

> In addition to this, this commit also makes sure that the change
> making usr/ optional is properly reported on all the instances of this
> regular expression.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
