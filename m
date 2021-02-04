From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 4 Feb 2021 09:39:29 +0100
Subject: [Buildroot] [PATCH 3/3] package/grpc: disable unnecessary build
 plugins
In-Reply-To: <20210203220926.GN2384@scaer>
References: <20210203124325.18843-1-patrickdepinguin@gmail.com>
 <20210203124325.18843-4-patrickdepinguin@gmail.com>
 <20210203220926.GN2384@scaer>
Message-ID: <CAAXf6LWB-r+OCwUU9KburcGbvepmtT0YODmJtF-=hi3mmUG0Dg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

El mi?, 3 feb 2021 a las 23:09, Yann E. MORIN
(<yann.morin.1998@free.fr>) escribi?:
>
> Thomas, All,
>
> On 2021-02-03 13:43 +0100, Thomas De Schampheleire spake thusly:
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > grpc has plugins for multiple programming languages, which are needed on
> > development machines only. Examples are grpc_cpp_plugin, grpc_ruby_plugin,
> > etc.
> >
> > Even though before commit fedf3318e3fd3c9ba57389ed2b36472f1a772b9e,
> > grpc_cpp_plugin was not installed for target, all other plugins still were.
> > This causes additional build time and rootfs space.
> >
> > As Buildroot does not support building a development environment for target,
> > these tools can be disabled.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> > ---
> >  package/grpc/grpc.mk | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> > index a8a3af89ef..27b28deff3 100644
> > --- a/package/grpc/grpc.mk
> > +++ b/package/grpc/grpc.mk
> > @@ -27,7 +27,14 @@ GRPC_CONF_OPTS = \
> >       -DgRPC_PROTOBUF_PROVIDER=package \
> >       -DgRPC_RE2_PROVIDER=package \
> >       -DgRPC_SSL_PROVIDER=package \
> > -     -DgRPC_ZLIB_PROVIDER=package
> > +     -DgRPC_ZLIB_PROVIDER=package \
> > +     -DgRPC_BUILD_GRPC_CPP_PLUGIN=OFF \
> > +     -DgRPC_BUILD_GRPC_CSHARP_PLUGIN=OFF \
> > +     -DgRPC_BUILD_GRPC_NODE_PLUGIN=OFF \
> > +     -DgRPC_BUILD_GRPC_OBJECTIVE_C_PLUGIN=OFF \
> > +     -DgRPC_BUILD_GRPC_PHP_PLUGIN=OFF \
> > +     -DgRPC_BUILD_GRPC_PYTHON_PLUGIN=OFF \
> > +     -DgRPC_BUILD_GRPC_RUBY_PLUGIN=OFF
>
> So I am OK with applying this patch in bulk, because it makes sense.
>
> IIUC, the grpc_cpp_plugin will generate C++ code, and so the
> grpc_node_plugin will generate JS code, and so on... Right?

Yes, this is my understanding.

>
> If so, would it make sense to also trim the host variant further, too?
>
> I.e. if there is no nodejs on the target, then no need for the node
> plugin. Ditto, if there is no C++, then no need to build the cpp plugin,
> right?
>
> Oh, except those may also be used to build host packages, too... And we
> do not have a good way to know what languages the host packages would
> need... So in the end, we do not want to disable any plugin for the host
> variant...

At this moment, the grpc target package in buildroot depends on the
full host-grpc, which has (IMHO) excessive dependencies: it depends on
host-libabseil-cpp, host-re2, etc.
Since libabseil-cpp requires a gcc >= 4.9, it cannot be built on
CentOS 7 which uses 4.8.5.
But, the dependency grpc <- host-grpc is actualy only there to provide
a native version of grpc_cpp_plugin. And that plugin does not need
libabseil-cpp, re2, etc. Only host-protobuf.

So locally, I have prepared a patch to grpc CMakeLists.txt to add an
option to only build grpc_cpp_plugin, and not all the rest, so that
the Buildroot host-grpc can remove its dependencies on
host-libabseil-cpp and host-re2.
I have opened an issue on the grpc project to discuss this:
https://github.com/grpc/grpc/issues/25322

In these changes, I disabled all but grpc_cpp_plugin. In Buildroot
itself, there is no other package that currently has grpc support,
except collectd, which only needs grpc_cpp_plugin.
While there could indeed be external uses for these additional
language plugins like grpc_python_plugin, I'm not sure whether there
is an immediate need to support them.
But as far as I can see, they don't include on libabseil-cpp and the
others either, so it wouldn't be a big problem to retain them in
host-grpc I think.

I am waiting a bit on feedback on the aformentioned issue before
submitting these changes to buildroot.

Best regards,
Thomas
