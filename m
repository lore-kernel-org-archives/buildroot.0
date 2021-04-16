From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 17 Apr 2021 00:14:48 +0200
Subject: [Buildroot] Unable to apply a patch for the buildroot makedevs
 tool
In-Reply-To: <AM6PR05MB5928D4AD5D2311ACA772CCA5A34C9@AM6PR05MB5928.eurprd05.prod.outlook.com>
References: <AM6PR05MB5928D4AD5D2311ACA772CCA5A34C9@AM6PR05MB5928.eurprd05.prod.outlook.com>
Message-ID: <20210417001448.56ebff49@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ivan,

On Fri, 16 Apr 2021 06:58:05 +0000, Ivan Castell <icastell@circontrol.com> wrote:

> Hello! I did a patch for the makedevs tool that provides a new 'x' option that allows setting permissions for directories recursively without modifiying permissions for regular files. The patch is named 'makedevs-0001-custom-opts-exclude-regular-files.patch' (see below), and is located inside package/makedevs/ directory. When I try to re-build the framework, I get this error:
>
> # make all
> >>> host-makedevs  Patching
>
> Applying makedevs-0001-custom-opts-exclude-regular-files.patch using patch:
> can't find file to patch at input line 4
> Perhaps you used the wrong -p or --strip option?
> The text leading up to this was:
> --------------------------
> |diff -purN makedevs.orig/makedevs.c makedevs/makedevs.c
> |--- makedevs.orig/makedevs.c 2021-04-15 14:40:03.439990661 +0000
> |+++ makedevs/makedevs.c 2021-04-15 14:40:46.128006533 +0000
> --------------------------
> No file to patch.  Skipping patch.
> 3 out of 3 hunks ignored
> package/pkg-generic.mk:187: recipe for target '/usr/local/share/buildroot/output/build/host-makedevs/.stamp_patched' failed
> make: *** [/usr/local/share/buildroot/output/build/host-makedevs/.stamp_patched] Error 1

The makedevs package is a little bit special, as there is no download source package,
and the build receipt package/makedevs/makedevs.mk is just compiling the
(buildroot internal) file package/makedevs/makedevs.c, so no chance to apply a
patch, you need to patch the file package/makedevs/makedevs.c itself...

Regards,
Peter

>
> I was able to apply other patches properly that run on the target, but this tool is compiled to run on the host, and makedevs.mk rules compiles the makedevs.c source file without deploying it on output/build, and I think that's the main issue, but I am not completely sure.
>
> Can you explain why is this patch not aplying properly and what should be the proper way to apply a patch for this makedevs tool, located inside the buildroot framework?
>
> Thanks!
>
>
>
>
