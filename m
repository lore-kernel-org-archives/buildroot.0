From: Matthew Weber <Matthew.Weber@collins.com>
Date: Mon, 3 Dec 2018 13:34:08 -0600
Subject: [Buildroot] [PATCH v4 2/2] grpc: new package
In-Reply-To: <20181203160020.GB2548@scaer>
References: <20181129062140.10474-1-robertroyrose@gmail.com>
 <20181129062140.10474-2-robertroyrose@gmail.com>
 <20181129221226.2beef795@windsurf> <20181203160020.GB2548@scaer>
Message-ID: <CANQCQpbbcyyi7sfXuzT3w3SznKjo3n_7Os2X3=MhEV45KuzGyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert,


On Mon, Dec 3, 2018 at 10:00 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Robert, Thomas, All,
>
> On 2018-11-29 22:12 +0100, Thomas Petazzoni spake thusly:
> > On Wed, 28 Nov 2018 22:21:40 -0800, Robert Rose wrote:
> > > Signed-off-by: Robert Rose <robertroyrose@gmail.com>
> > > ---
> > >  DEVELOPERS                                    |  3 ++
> > >  package/Config.in                             |  1 +
> > >  .../0001-target-build-using-host-plugin.patch | 44 +++++++++++++++++++
> > >  package/grpc/Config.in                        | 11 +++++
> > >  package/grpc/grpc.hash                        |  5 +++
> > >  package/grpc/grpc.mk                          | 36 +++++++++++++++
> > >  6 files changed, 100 insertions(+)
> > >  create mode 100644 package/grpc/0001-target-build-using-host-plugin.patch
> > >  create mode 100644 package/grpc/Config.in
> > >  create mode 100644 package/grpc/grpc.hash
> > >  create mode 100644 package/grpc/grpc.mk
> >
> > Thanks for this new iteration. However, it's a pity that you didn't
> > reuse any of the improvements I had, and which I suggested you to
> > re-use for your next iteration.
> >
> > So, I redid the same changes, and also improved the description of
> > 0001-target-build-using-host-plugin.patch which was really not
> > sufficient.
> >
> > Here is the list of changes I did:
> >
> >     [Thomas:
> >      - add missing Config.in dependencies inherited from
> >        BR2_PACKAGE_PROTOBUF, as well as the corresponding Config.in
> >        comment
> >      - replace spaces by tabs in grpc.mk indentation
> >      - remove superfluous GRPC_SOURCE variable
> >      - improved patch description.]
>
> Itr also seems that grpc would somehow need gflags:
>
>     CMake Warning at cmake/gflags.cmake:26 (message):
>       gRPC_GFLAGS_PROVIDER is "module" but GFLAGS_ROOT_DIR is wrong
>
> That's because the built-in copy of gflags is missing (good!) as it is
> managed by a git submodule, and those are not retrieved when using the
> github macro (good!). So, maybe extend HOST_GRPC_CONF_OPTS with:
>
>     gRPC_GFLAGS_PROVIDER=none
>
> Alternatively, you could make the existing gflags package a host
> package, and use that?
>
> Additionally, there is a similar issue with the 'benchmark' package:
>
>     CMake Warning at cmake/benchmark.cmake:26 (message):
>       gRPC_BENCHMARK_PROVIDER is "module" but BENCHMARK_ROOT_DIR is wrong
>
> We don't have a benchmark package in Buildroot, so maybe extend
> HOST_GRPC_CONF_OPTS with:
>
>     gRPC_BENCHMARK_PROVIDER=none
>
> Note that thes two issues should probably be also checked for, and fixed
> for the target variant of grpc too.
>
> Finally, we do have a bunch of autobuild failures:
>
>     http://autobuild.buildroot.org/?reason=host-grpc-v1.16.1
>

I was able to reproduce this in a non-sandboxed environment and it
looks like the "grpc_cpp_plugin" app is outputting that error, not the
'protoc' part of the command.

Output
----------------------
terminate called after throwing an instance of 'std::system_error'
  what():  Unknown error -1
Aborted (core dumped)

A quick strace and gdb run didn't get me much further.  It looks like
the libstdc++ is maybe having a memory allocation issue but I'll have
to work on getting more debug symbols (sort of a messy point to debug
when between host machine and buildroot host package builds).

Matt
