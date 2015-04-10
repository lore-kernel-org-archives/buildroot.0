From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 11:21:56 +0200
Subject: [Buildroot] Disabling Synopsys ARC pre-built toolchains in Buildroot
Message-ID: <20150410112156.6b0e42f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexey,

In commit 2b93fe5374ae4f8337e1f7ae32be4d72dd94cb3c, you added the
support for pre-built ARC toolchains from Synopsys, which was a very
useful change.

However, right now, I wonder if we should not get rid of those
toolchains: they use a uClibc configuration that is too different from
the default one of Buildroot, causing numerous build failures in the
autobuilders. Those failures are due to:

 * Missing libutil stub (UCLIBC_HAS_LIBUTIL option)

   http://autobuild.buildroot.org/results/ce3/ce39eb9b9ece0968563641fb2207099d1a37b191/

 * Missing program_invocation_name (UCLIBC_HAS_PROGRAM_INVOCATION_NAME
   option)

   http://autobuild.buildroot.org/results/154/1546d909e606daefd41b87dece94d642c0fdeba4/
   http://autobuild.buildroot.org/results/bd5/bd54581d7b0cc73bc501072d27e870a443dfce79/

 * Missing ifaddrd support (UCLIBC_SUPPORT_AI_ADDRCONFIG option)

   http://autobuild.buildroot.org/results/134/134e78ef1fa87f7fbf26c23ec5dfc68785d79613/

There are too many of those issues affecting too many packages for us
to reasonably patch all of them.

Could you work internally to prepare a new version of those toolchains,
that has at least these three additional options enabled?

In the mean time, unless you have an objection, I will mark those
toolchains as disabled in Buildroot.

Thanks in advance for your feedback,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
