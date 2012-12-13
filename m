From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 02:06:14 +0100
Subject: [Buildroot] Random "Bus error" when building host-python
In-Reply-To: <20121212235406.768eb752@skate>
References: <20121212235406.768eb752@skate>
Message-ID: <50C92A06.3010103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/12/12 23:54, Thomas Petazzoni wrote:
> Hello,
>
> If you have looked at the autobuilder results recently, there are some
> host-python errors sometimes:
>
>   http://autobuild.buildroot.org/results/b01a3c7233d53578961b74fb6ffb006782a43944/build-end.log
>   Free Electrons build server, targeting mipsel
>
>   http://autobuild.buildroot.org/results/5c59266f72f234ee9863e3d54270487b05af3612/build-end.log
>   gcc14 build server, targeting powerpc
>
>   http://autobuild.buildroot.org/results/3cf01dabafd47813c6fe11d0250e57ef667e8d95/build-end.log
>   gcc14 build server, targeting powerpc
>
>   http://autobuild.buildroot.org/results/7722a16700231a49b736fae697532013dfccfd2a/build-end.log
>   Free Electrons build server, targeting arm
>
> Every time, the build fail with a "Bus error". The log is not clear
> enough to really understand what process is failing with a Bus error.

  At least, the logs from gcc14 tell us that it is './python -E setup.py build'
which is crashing. So it looks like a bug in python.

  The funny thing is that this command is called in the 'sharedmods' goal,
which is already built in the build step. So why is it built again in
the install step?


> As you can see, the problem is not specific to one build machine, or
> one target architecture (well, since it's in host package, it's kind of
> obvious, but not the build machine fact).
>
> And the thing is that those problems are not reproducible. If you take
> the exact same commit ID of Buildroot, the exact same configuration, on
> the exact same build machine, the problem may or may not produce
> itself. I tried to reproduce it using one of those build
> configurations, and he wasn't produced.
>
> On the other hand, I did try to reproduce some other build
> configuration that failed in the autobuilders, and instead of having
> the error reported by the autobuilder web interface, I felt into the
> "Bus error" problem in host-python. I just restarted the build (not
> from scratch, simply restarted the build), and it went on without
> failing into the "Bus error" problem. So it seems like the problem is
> not in the generated code (re-executing the same code sometimes work
> sometimes doesn't work).
>
> Does anyone has ideas on how to further investigate this?

  Can you catch a core dump on the build servers?

  I have a hunch that it will be related to parallel builds. Perhaps some
shared library is overwritten while python is running...


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
