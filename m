From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Nov 2013 09:43:19 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131110062525.GB1030@sapphire.tkos.co.il>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
 <20131110062525.GB1030@sapphire.tkos.co.il>
Message-ID: <20131110094319.4494c56a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 10 Nov 2013 08:25:25 +0200, Baruch Siach wrote:

> > Chris, can you have a look at this one, since it's apparently a
> > Xtensa-specific problem?
> 
> uClibc valloc() depends on UCLIBC_SUSV2_LEGACY which is not enabled in the 
> default uClibc config. Should we enable it?

Yes. The UCLIBC_SUSV2_LEGACY symbol was added after 0.9.33.2, so it
explains why only Xtensa (which uses the uClibc snapshot version) is
affected. Maybe we can replace the valloc() call with posix_memalign()
and send the patch upstream to cdrkit?

Also, can you sync up with Chris to provide a patch that makes Xtensa
not use a snapshot version, but a fixed version of uClibc (based on a
git commit, for example) ? The snapshot version we currently use is
really bad, because depending on when you run the build, you will get
different build results. This is really not how Buildroot should work:
snapshot versions are only provided for expert users who want to test
the latest versions of uClibc, such versions shouldn't be used as the
default.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
