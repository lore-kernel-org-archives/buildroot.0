From: Cam Hutchison <camh@xdna.net>
Date: Sat, 13 Apr 2019 07:48:05 +1000
Subject: [Buildroot] [PATCH 1/1] pkg-golang: Allow per package/target
 CGO_ENABLED setting
In-Reply-To: <CABa6e=r98Ma20_gXduMjoZ6e49EzoqHMhZtZmR8bGtww8WSt1g@mail.gmail.com>
References: <20180727024720.13370-1-camh@xdna.net> <20190407214941.GA3117@jaya>
 <87pnpxfe8b.fsf@paral.in> <20190408090458.49e1e5cc@windsurf>
 <CABa6e=oAUccKG8mQh4NCZx6Oq6swgQZMCE7atN4Xeb0s3EcqXg@mail.gmail.com>
 <CA+h8R2rAOmstP8C1yni+MBzRhm9FbT66Vfy+SYRKG91j8JRJqg@mail.gmail.com>
 <CABa6e=r98Ma20_gXduMjoZ6e49EzoqHMhZtZmR8bGtww8WSt1g@mail.gmail.com>
Message-ID: <CABa6e=oVYjm_U=7mJOwbRqr2-j+-OkCMJO9rmz6=z6esJOKkGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 13 Apr 2019 at 07:29, Cam Hutchison <camh@xdna.net> wrote:

> On Tue, 9 Apr 2019 at 13:22, Christian Stewart <christian@paral.in> wrote:
> >
> > Fwiw, I'm also integrating kubernetes with buildroot at the moment. I
> don't see where cgo is required in this way.
> >
> > I'd be happy to compare notes if you'd like?
>
> My local BR2_EXTERNAL kubernetes config is at
> https://github.com/camh-/clusterpi/tree/master/package/kubernetes.
> Feel free to take anything from there that is useful.
>

Also, here are my notes I made at the time. Perhaps they might be useful:

* Success building kubelet from buildroot
  + I think I've done that before, but I will next try other components
using
    the same pattern
  + Kubernetes buildroot config directly uses go to build binaries, does not
    use kube Makefile or build scripts.
* Success with kube-proxy and kubeadm
* kube-proxy, kubelet and kubeadm are the node binaries, all successfully
built
  from a single buildroot invocation. All were built with CGO_ENABLED=1.
  kube-proxy and kubeadm would normally be build with CGO_ENABLED=0 using
the
  kube build scripts (KUBE_STATIC_LIBRARIES)
* The buildroot golang support does not allow mixed CGO_ENABLED builds of
  different binaries. The value for CGO_ENABLED seems to be hard-coded at
  toolchain build time. I should investigate what it would take to build
both
  CGO_ENABLED=0 and CGO_ENABLED=1 together in the toolchain.
* kube-apiserver build failed. It needs openapi generated files. I had
thought
  that the openapi generation stuff was for docs - not so. I will have to
see
  what needs to be done to hook in the generated files build too. Shouldn't
be
  too hard as the go compiler can build both host and target binaries, so we
  don't need a second host-targetting go compiler.
* Extending the KUBERNETES_BUILD_CMDS to run `make generated_files` worked
just
  fine.
* kube-apiserver is not linking, emitting the error `direct call too far`.
If I
  override the go.mk to force CGO_ENABLED=0, it works. The kube build script
  builds a bunch of components with CGO_ENABLED=0, but the buildroot golang
  infra does not support setting CGO_ENABLED - it is hard-coded based on
  whether the toolchain has threads (BR2_TOOLCHAIN_HAS_THREADS). I will need
  to somehow override that.
* Everything builds now (including hyperkube) using the right CGO settings
for
  the right targets.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190413/48fa4586/attachment.html>
