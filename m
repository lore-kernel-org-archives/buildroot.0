From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Dec 2018 17:00:20 +0100
Subject: [Buildroot] [PATCH v4 2/2] grpc: new package
In-Reply-To: <20181129221226.2beef795@windsurf>
References: <20181129062140.10474-1-robertroyrose@gmail.com>
 <20181129062140.10474-2-robertroyrose@gmail.com>
 <20181129221226.2beef795@windsurf>
Message-ID: <20181203160020.GB2548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, Thomas, All,

On 2018-11-29 22:12 +0100, Thomas Petazzoni spake thusly:
> On Wed, 28 Nov 2018 22:21:40 -0800, Robert Rose wrote:
> > Signed-off-by: Robert Rose <robertroyrose@gmail.com>
> > ---
> >  DEVELOPERS                                    |  3 ++
> >  package/Config.in                             |  1 +
> >  .../0001-target-build-using-host-plugin.patch | 44 +++++++++++++++++++
> >  package/grpc/Config.in                        | 11 +++++
> >  package/grpc/grpc.hash                        |  5 +++
> >  package/grpc/grpc.mk                          | 36 +++++++++++++++
> >  6 files changed, 100 insertions(+)
> >  create mode 100644 package/grpc/0001-target-build-using-host-plugin.patch
> >  create mode 100644 package/grpc/Config.in
> >  create mode 100644 package/grpc/grpc.hash
> >  create mode 100644 package/grpc/grpc.mk
> 
> Thanks for this new iteration. However, it's a pity that you didn't
> reuse any of the improvements I had, and which I suggested you to
> re-use for your next iteration.
> 
> So, I redid the same changes, and also improved the description of
> 0001-target-build-using-host-plugin.patch which was really not
> sufficient.
> 
> Here is the list of changes I did:
> 
>     [Thomas:
>      - add missing Config.in dependencies inherited from
>        BR2_PACKAGE_PROTOBUF, as well as the corresponding Config.in
>        comment
>      - replace spaces by tabs in grpc.mk indentation
>      - remove superfluous GRPC_SOURCE variable
>      - improved patch description.]

Itr also seems that grpc would somehow need gflags:

    CMake Warning at cmake/gflags.cmake:26 (message):
      gRPC_GFLAGS_PROVIDER is "module" but GFLAGS_ROOT_DIR is wrong

That's because the built-in copy of gflags is missing (good!) as it is
managed by a git submodule, and those are not retrieved when using the
github macro (good!). So, maybe extend HOST_GRPC_CONF_OPTS with:

    gRPC_GFLAGS_PROVIDER=none

Alternatively, you could make the existing gflags package a host
package, and use that?

Additionally, there is a similar issue with the 'benchmark' package:

    CMake Warning at cmake/benchmark.cmake:26 (message):
      gRPC_BENCHMARK_PROVIDER is "module" but BENCHMARK_ROOT_DIR is wrong

We don't have a benchmark package in Buildroot, so maybe extend
HOST_GRPC_CONF_OPTS with:

    gRPC_BENCHMARK_PROVIDER=none

Note that thes two issues should probably be also checked for, and fixed
for the target variant of grpc too.

Finally, we do have a bunch of autobuild failures:

    http://autobuild.buildroot.org/?reason=host-grpc-v1.16.1

Care to have a look, please?

Regards,
Yann E. MORIN.

> After those changes, I applied this patch to next. Thanks for your
> contribution!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
