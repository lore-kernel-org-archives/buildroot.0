From: Qais Yousef <qais.yousef@arm.com>
Date: Mon, 21 Dec 2020 11:44:04 +0000
Subject: [Buildroot] [PATCHv5 4/5] package/bpftrace: new package
In-Reply-To: <96e61ace-fde1-3887-2ffa-e70696ce4458@gmail.com>
References: <20201206173537.1397691-1-romain.naour@gmail.com>
 <20201206173537.1397691-4-romain.naour@gmail.com>
 <20201220014716.qmk3sdnugkemgeqy@e107158-lin.cambridge.arm.com>
 <96e61ace-fde1-3887-2ffa-e70696ce4458@gmail.com>
Message-ID: <20201221114404.53vb56dx3gluc34y@e107158-lin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/20 11:01, Romain Naour wrote:
> Le 20/12/2020 ? 02:47, Qais Yousef a ?crit?:
> > On 12/06/20 18:35, Romain Naour wrote:
> >> From: Qais Yousef <qais.yousef@arm.com>
> >>
> >> bpftrace is a high-level tracing language for Linux enhanced Berkeley
> >> Packet Filter (eBPF) available in recent Linux kernels (4.x).
> >>
> >> Only tested on x86_64 and aarch64. The package doesn't support i386 and
> >> aarch32.
> >>
> >> Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> >> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
> >> ---
> >> v2: patch to build bundled libraries statically
> >>     Add glibc dependency
> >>     Rework to select bcc, libbpf and llvm RTII dependencies.
> >>     Add reverse dependencies
> >>     Add BR2_PACKAGE_BPFTRACE_ARCH_SUPPORTS
> >>     Bump the version to the latest (upcoming 0.12)
> >>       due to many build issues (and patch to backport) with
> >>       the latest release.
> >>     Add binutils optional dependency to provide libbfd and libopcodes.
> >>     Disable manpages.
> >> ---
> > 
> > I don't think we need the dependency on libbpf? BCC provides it and we depend
> > on it.
> 
> The libbpf provided by BCC is named libbcc_bpf.so but bpftrace really expect
> libbpf.so
> 
> I added libbpf package since distribution packages use it.
> https://archlinux.org/packages/community/x86_64/bpftrace/
> https://src.fedoraproject.org/rpms/bpftrace/blob/master/f/bpftrace.spec#_27
> 
> But bpftrace try to find bcc_bpf only for static linking.
> It's not clear what's the libbpf implementation the buildsystem is trying to
> use. Why it is not using the same bpf library for both static ans shared linking ?

I don't know to be honest. I saw that bpftrace uses bcc/libbpf.h in all places,
except for btf handling which is guarded by HAVE_LIBBPF_BTF_DUMP.

The INSTALL.md doesn't mention libbpf as dependency too..

https://github.com/iovisor/bpftrace/blob/master/INSTALL.md#building-bpftrace
https://github.com/iovisor/bpftrace/blob/master/INSTALL.md#generic-build-process

I think you have better experience than myself in this packaging related
problems. We could ask the bpftrace developers directly too to clarify the
dependencies.

> I think it's better use use the library from upstream (libbpf) rather than a
> library bundled in another software (bcc_libbpf).

I don't see this dependency will break anything. So I will trust your judgement
here.

Thanks

--
Qais Yousef
