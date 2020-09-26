From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 26 Sep 2020 23:06:55 +0200
Subject: [Buildroot] [RFC PATCH 0/4] add BCC and bpftrace packages
In-Reply-To: <20200926193133.31390-1-qais.yousef@arm.com>
References: <20200926193133.31390-1-qais.yousef@arm.com>
Message-ID: <89cf8133-e2d3-0a83-e526-8605eca10d56@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Qais,

Le 26/09/2020 ? 21:31, Qais Yousef a ?crit?:
> The following series adds 2 new packages:
> 
> 	* BPF Compiler Collection (BCC)
> 	* bpftrace
> 
> It is based on 2020.08 tag. Can rebase on tip of master after this initial RFC
> review.
> 
> The support was validated on x86_64 and aarch64 (little endian). Hence
> restricted to these 2 archs only. aarch64 big endian is set as valid, but when
> I tried to compile that I think LLVM or clang support for aarch64_be + BPF was
> generating some errors; or something else was missing. So it might be a better
> idea to remove BR2_aarch64_be from Config.in dependency.
> 
> I tried to enable i386 and arm (aarch32); but I encountered some issues and
> decided to narrow the initial support to what I got working in hope that other
> archs support can follow through later if people are interested.
> 
> IIRC the issues were:
> 
> 	* bpftrace doesn't support these 2 archs.
> 	* BCC had some build failures on arm.
> 	* BCC had runtime issues on i386.
> 
> Marking this as RFC as it is something that was done over several weekends and
> my last contribution to buildroot was many many years ago. So I am sure there
> are many rough edges to tackle. Beside from my vague description above, you
> might have gotten the hint it's been a while since I last touched it. But I'd
> like to get the support merged, so hopefully starting a discussion with what
> I have now is a better start.

Thanks for this contribution, first make sure to subscribe to the Buildroot
mailing list. Otherwise your patch are not automatically recorded in patchwork.

There is an existing patch series proposed by Jugurtha Belkalem earlier this year:

http://patchwork.ozlabs.org/project/buildroot/list/?series=197400

Can you review it and check if it fix errors you noticed on aarch64.
Jugurtha did a test on a Raspberry-pi 64 bits.

Jugurtha, can you review the bpfrace package ?

Best regards,
Romain

> 
> Qais Yousef (4):
>   llvm: Add BPF backend
>   Add BPF Compiler Collection (BCC) Package
>   Add bpftrace package
>   clang: Fix undefined reference to dladdr error
> 
>  package/Config.in                             |  2 ++
>  package/bcc/0001-fix-dlinfo.patch             | 17 ++++++++++
>  .../0002-fix-undefined-gzgets-runtime.patch   | 15 ++++++++
>  .../0003-fix-loading-libc-python-perf.patch   | 17 ++++++++++
>  .../0004-fix-loading-librt-python-init.patch  | 17 ++++++++++
>  .../0005-fix-python-installation-path.patch   | 15 ++++++++
>  package/bcc/Config.in                         | 34 +++++++++++++++++++
>  package/bcc/bcc.mk                            | 25 ++++++++++++++
>  .../0001-fix-no-sys-auxv-header.patch         | 22 ++++++++++++
>  ...02-fix-missing-def-ADDR_NO_RANDOMIZE.patch | 13 +++++++
>  package/bpftrace/0003-install-libparser.patch | 12 +++++++
>  .../bpftrace/0004-install-libresources.patch  | 12 +++++++
>  package/bpftrace/0005-install-libarch.patch   | 10 ++++++
>  package/bpftrace/0006-install-libast.patch    | 11 ++++++
>  package/bpftrace/Config.in                    | 27 +++++++++++++++
>  package/bpftrace/bpftrace.mk                  | 17 ++++++++++
>  ...01-fix-undefined-reference-to-dladdr.patch | 13 +++++++
>  package/llvm/Config.in                        |  6 ++++
>  package/llvm/llvm.mk                          |  5 +++
>  19 files changed, 290 insertions(+)
>  create mode 100644 package/bcc/0001-fix-dlinfo.patch
>  create mode 100644 package/bcc/0002-fix-undefined-gzgets-runtime.patch
>  create mode 100644 package/bcc/0003-fix-loading-libc-python-perf.patch
>  create mode 100644 package/bcc/0004-fix-loading-librt-python-init.patch
>  create mode 100644 package/bcc/0005-fix-python-installation-path.patch
>  create mode 100644 package/bcc/Config.in
>  create mode 100644 package/bcc/bcc.mk
>  create mode 100644 package/bpftrace/0001-fix-no-sys-auxv-header.patch
>  create mode 100644 package/bpftrace/0002-fix-missing-def-ADDR_NO_RANDOMIZE.patch
>  create mode 100644 package/bpftrace/0003-install-libparser.patch
>  create mode 100644 package/bpftrace/0004-install-libresources.patch
>  create mode 100644 package/bpftrace/0005-install-libarch.patch
>  create mode 100644 package/bpftrace/0006-install-libast.patch
>  create mode 100644 package/bpftrace/Config.in
>  create mode 100644 package/bpftrace/bpftrace.mk
>  create mode 100644 package/clang/0001-fix-undefined-reference-to-dladdr.patch
> 
