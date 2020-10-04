From: Qais Yousef <qais.yousef@arm.com>
Date: Sun, 4 Oct 2020 21:10:13 +0100
Subject: [Buildroot] [RFC PATCH 3/4] Add bpftrace package
In-Reply-To: <20201003205623.2okstxwxa6fk5eqb@e107158-lin.cambridge.arm.com>
References: <20200929102618.28571-1-qais.yousef@arm.com>
 <20200929102618.28571-4-qais.yousef@arm.com>
 <b9399296-4cf8-4fc8-81e7-a49472c3cd69@gmail.com>
 <20201003205623.2okstxwxa6fk5eqb@e107158-lin.cambridge.arm.com>
Message-ID: <20201004201013.ne5k455yagewtlxr@e107158-lin.cambridge.arm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/20 21:56, Qais Yousef wrote:

[...]

> > > diff --git a/package/bpftrace/Config.in b/package/bpftrace/Config.in
> > > new file mode 100644
> > > index 0000000000..a4bae478dc
> > > --- /dev/null
> > > +++ b/package/bpftrace/Config.in
> > > @@ -0,0 +1,27 @@
> > > +config BR2_PACKAGE_BPFTRACE
> > > +	bool "bpftrace"
> > > +	depends on BR2_aarch64 || BR2_aarch64_be || BR2_x86_64
> > > +	depends on BR2_PACKAGE_BCC
> > > +	depends on BR2_PACKAGE_LLVM_RTTI
> > 
> > Why llvm rtti is needed ?
> 
> Good question.
> 
> I think I was seeing failures similar to the one described in the link below.
> Something wasn't found in LLVM library without enabling this option. Will try
> to reproduce and document it better. Unless you know of a better way to handle
> these type of problems :-)
> 
> 	https://github.com/iovisor/bpftrace/issues/1156

This is the error that I get if I don't enable LLVM_RTTI:

buildroot-arm64/output/host/lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ast/libast.so: undefined reference to `typeinfo for llvm::SectionMemoryManager'
buildroot-arm64/output/host/lib/gcc/aarch64-buildroot-linux-gnu/9.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld: ast/libast.so: undefined reference to `typeinfo for llvm::orc::SymbolResolver'
collect2: error: ld returned 1 exit status

I understood after a bit of digging that it has hard dependency on having RTTI
enabled.

Is there a preferred way to solve these type of problems?

Thanks

--
Qais Yousef
