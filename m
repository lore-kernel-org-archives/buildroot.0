From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 2 Feb 2021 17:35:56 +0100
Subject: [Buildroot] [git commit] package/grpc: remove obsolete patch to
 support cross-compiling
In-Reply-To: <20210202152308.CC93C865BA@busybox.osuosl.org>
References: <20210202152308.CC93C865BA@busybox.osuosl.org>
Message-ID: <CAAXf6LWkA7q_iZOL5P2GVTsi3FsRYxTD7jNLyMznRLdFKifD7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Feb 2, 2021, 16:43 Peter Korsgaard <peter@korsgaard.com> wrote:

> commit:
> https://git.buildroot.net/buildroot/commit/?id=fedf3318e3fd3c9ba57389ed2b36472f1a772b9e
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> When cross-compiling grpc, a native tool 'grpc_cpp_plugin' is needed.
> Patch '0001-target-build-using-host-plugin.patch' in Buildroot provides a
> way to pass the path to this tool via a configure option
> 'gRPC_NATIVE_CPP_PLUGIN'.
>
> In version 1.20.0, the upstream grpc project added better support for
> cross-compiling via commit 0d7a0ded [1], searching for the native
> grpc_cpp_plugin via PATH (rather than specifying it as configure option as
> our patch was doing).
>
> This change renders the mentioned Buildroot patch obsolete, so remove it.
>
> [1]
> https://github.com/grpc/grpc/commit/0d7a0ded1cc93bb7f4d69a156b0a69829557cbf2
>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
> Tested-by: Michael Nosthoff <buildroot@heine.tech>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  .../grpc/0001-target-build-using-host-plugin.patch | 52
> ----------------------
>  package/grpc/grpc.mk                               |  3 +-
>  2 files changed, 1 insertion(+), 54 deletions(-)
>


I have now noticed that this patch breaks the case of a config where
collectd and grpc are enabled, but the grpc collectd plugin is not, if grpc
is built before collectd.
Collectd is autodetecting grpc and executes commands using the
grpc-cpp-plugin even when grpc support was disabled.
In the bad case, the target version of grpc-cpp-plugin is attempted to be
used.

I'm investigating the issue.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210202/8953600e/attachment-0001.html>
