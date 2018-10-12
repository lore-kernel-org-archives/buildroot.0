From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 12 Oct 2018 11:00:24 -0500
Subject: [Buildroot] Analysis results for 2018-10-09
In-Reply-To: <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
References: <20181010060010.4E3C920736@mail.bootlin.com>
 <20181010174814.5ac114f1@windsurf>
 <CANQCQpbtrG=C9T9FuznXONdqF9OTq3oqmDdDWKX5PHUhJV_=hg@mail.gmail.com>
Message-ID: <CANQCQpZy71sSMjB+492LZbdDGoPHqH_vg8C5dukosgy80eQr_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Wed, Oct 10, 2018 at 11:28 AM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Thomas,
>
>
> On Wed, Oct 10, 2018 at 10:48 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello,
> >
> > Here is an analysis of yesterday build results. Johan, Frank,
> > Christian, Fabrice, Peter, Matt, Bernd, Giulio, Baruch, you are in Cc
> > because there are questions/issues for you below. Thanks! :-)
> >
> > On Wed, 10 Oct 2018 08:00:10 +0200 (CEST), Thomas Petazzoni wrote:
> >
> > >       master | 187 |  68 |   0 | 255 |
> >
> > These results are not very good, let's have a look at what's going on,
> > and try to get everyone to help fixing those issues.
> >
> > >          arm |                boa-0.94.14rc21 | NOK | http://autobuild.buildroot.net/results/e5ff4589243ce1f11248b5f9fab3cca614a48b11 | ORPH
> >
> > (cd src && make - --no-print-directory - --jobserver-fds=6,7 -j)
> > make: unrecognized option '--jobserver-fds=6,7'
> >
> > This suddenly started happening on September 9, 2018. We have not
> > bumped boa. I'm not sure what caused this. It fails on different
> > autobuilder machines. Boa is calling submake with $(MFLAGS), which is
> > probably the issue, but why did this suddenly started to happen ?
> >
> > With a minimal configuration with just Boa, I cannot reproduce on my
> > machine here, neither on my autobuilder where the problem is reported
> > to occur.
> >
> > >         i686 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/1ceed7d91627711c12c4866fa6672a02fc6ddc8c |
> >
> > libboost_chrono shouldn't have been installed: missing select in boost/Config.in
> >
> > >          arm |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/41054f876975214741dccd08eda999a425281b7f |
> >
> > libboost_atomic shouldn't have been installed: missing select in boost/Config.in
> >
> > Fabrice, these two are for you :)
> >
> > >     mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/7187e560e66f2bd6073b5510e2782ebdaccfb4a9 |
> > >     mips64el |                     brltty-5.6 | NOK | http://autobuild.buildroot.net/results/5f8e8b8517fda50a2e98a456933260f08054356d |
> >
> > Those should be fixed by
> > https://git.buildroot.org/buildroot/commit/?id=9143c217213542574586c0e6a9f003e822633917.
> >
> > >      aarch64 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/24a280d6233b3284edd44c4528d8799c6894c11a | ORPH
> > >          sh4 |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/63a4f980d7cdb4b0823840f747589803fcd0d69f | ORPH
> > >          arc |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/1a6f2fcf1a88ecc5b598dd11c5914dcacf0e1e6b | ORPH
> > >          arm |                 collectd-5.7.1 | NOK | http://autobuild.buildroot.net/results/b0829bc3343d6dc3065078e94896725b1c808bc1 | ORPH
> >
> > Fixed by
> > https://git.buildroot.org/buildroot/commit/package/collectd?id=d65ea85fddaf64a7762f958d1ce9fb33997648d3
> >
> > >       x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/6c26ac3a8aa39abcb5eb390109891790610a759b |
> > >       x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/10654bccc3d20ec6d29d371c48dd90cbddb8c4da |
> > >       x86_64 |       docker-containerd-v1.1.3 | NOK | http://autobuild.buildroot.net/results/56b564a27a06792c4854fe983da92d40c0c4708c |
> >
> > /home/naourr/work/instance-3/output/host/lib/go/pkg/tool/linux_amd64/link: running /home/naourr/work/instance-3/output/host/bin/x86_64-amd-linux-gnu-gcc failed: exit status 1
> > /tmp/go-build283204336/b001/exe/a.out: final close failed: Invalid operation
> >
> > Christian, what is happening here? Could you have a look?
> >
> > >       x86_64 |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/fc633f80c7c36a90e641487f5a888fbb767c2a54 |
> >
> > In file included from zlib/adler32.c:11:0:
> > zlib/zutil.h:172:39: error: "_LFS64_LARGEFILE" is not defined [-Werror=undef]
> >      (!defined(_LARGEFILE64_SOURCE) || _LFS64_LARGEFILE-0 == 0)
> >
> > Seems like a musl/erlang issue. Johan, Frank, could you have a look ?
> >
> > >          arc |               glibc-legal-info | NOK | http://autobuild.buildroot.net/results/64c70d82c857c272df171ae6783629c1ba92d812 | ORPH
> >
> > Fixed by
> > https://git.buildroot.org/buildroot/commit/?id=b14ad0bd697038e4cf48ecf48830fb3369f1f25e.
> >
> > >     mips64el |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/c00d22a6dcadb82a19afab6eacea654d3c41b4c5 | ORPH
> > >      powerpc |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/18599ea12a35b9715a67c1f4e5c4e56906235c94 | ORPH
> > >          arm |                      gpsd-3.18 | NOK | http://autobuild.buildroot.net/results/a13a5d852c83cd1fc9f2d1fc2b7302db515278b8 | ORPH
> >
> > Fixed by https://git.buildroot.org/buildroot/commit/package/gpsd?id=ae2a91322aeaa72d6f5354312056d16dc275470d
> >
> > >     mips64el |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ab39280ceaf967e08abfd1f51efa4613495237f5 | ORPH
> >
> >
> > gstspanplc.c:223:21: error: dereferencing pointer to incomplete type 'plc_state_t {aka struct plc_state_s}'
> >    if (plc->plc_state->missing_samples != 0)
> >
> > Peter (Seiderer) ?
> >
> > >          arm |                   host-go-1.11 | NOK | http://autobuild.buildroot.net/results/8d3af6f00bf34737faabc21bdccf7d025462fec7 |
> >
> > fatal error: unexpected signal during runtime execution
> > [signal SIGBUS: bus error code=0x2 addr=0xc000800010 pc=0x42098d]
> >
> > This particular issue seems to happen only on Matt autobuilder. Matt,
> > can you check if you can reproduce it reliably ?

Looks like known issue with kernel version 3.13.  I'll see what I can
do about upgrading the kernel version or locally blacklist GO for now.

I've opened a new ticket to help them tie-off a theory they had about
the 3.13 that this confirms.
https://github.com/golang/go/issues/28180

Matt
