From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 31 May 2019 22:36:39 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/grpc: fix build with uclibc on x86_64
In-Reply-To: <20190530212906.3797-1-fontaine.fabrice@gmail.com>
References: <20190530212906.3797-1-fontaine.fabrice@gmail.com>
Message-ID: <20190531223639.41441600@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 May 2019 23:29:06 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> On x86_64 if GPR_MUSL_LIBC_COMPAT is not set, grpc tries to link with
> memcpy at GLIBC_2.2.5, see:
> https://github.com/grpc/grpc/blob/618a3f561d4a93f263cca23abad086ed8f4d5e86/src/core/lib/gpr/wrap_memcpy.cc
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/20d6f2489a4e291a53bd514da66105eb607e1014

The downside of setting GPR_MUSL_LIBC_COMPAT is that it doesn't change
just this memcpy() wrapping horror, it also impacts another part of the
gRPC code in src/core/lib/gpr/cpu_linux.c:

static void init_num_cpus() {
#ifndef GPR_MUSL_LIBC_COMPAT
  if (sched_getcpu() < 0) {
    gpr_log(GPR_ERROR, "Error determining current CPU: %s\n", strerror(errno));
    ncpus = 1;
    return;
  }
#endif
  /* This must be signed. sysconf returns -1 when the number cannot be
     determined */
  ncpus = static_cast<int>(sysconf(_SC_NPROCESSORS_CONF));
  if (ncpus < 1) {
    gpr_log(GPR_ERROR, "Cannot determine number of CPUs: assuming 1");
    ncpus = 1;
  }
}

unsigned gpr_cpu_current_cpu(void) {
#ifdef GPR_MUSL_LIBC_COMPAT
  // sched_getcpu() is undefined on musl
  return 0;
#else
  if (gpr_cpu_num_cores() == 1) {
    return 0;
  }
  int cpu = sched_getcpu();
  if (cpu < 0) {
    gpr_log(GPR_ERROR, "Error determining current CPU: %s\n", strerror(errno));
    return 0;
  }
  if (static_cast<unsigned>(cpu) >= gpr_cpu_num_cores()) {
    gpr_log(GPR_ERROR, "Cannot handle hot-plugged CPUs");
    return 0;
  }
  return static_cast<unsigned>(cpu);
#endif
}

I don't know how much this matters, but it's worth considering.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
