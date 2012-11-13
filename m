From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 21:43:50 +0100
Subject: [Buildroot] howto incorporate buildroot into an autobuild
In-Reply-To: <20121113094526.6392ab30@skate>
References: <1352767649.18724.34.camel@genx> <20121113094526.6392ab30@skate>
Message-ID: <50A2B106.8000804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 09:45, Thomas Petazzoni wrote:
> Hello John,
>
> On Mon, 12 Nov 2012 16:47:29 -0800, John Stile wrote:
>> I am using buildroot for an embedded Arm project.
>>
>> I was wondering how people using buildroot implement continuous
>> integration builds?
>>
>> Do you start from a clean checkout, build the whole tool chain (which
>> takes a long time), and then build the project specific stuff?
>>
>> I worry about not starting from a clean checkout, since some options may
>> change, and the tools won't be rebuilt.
>>
>> But I also worry people will complain how long the build takes.
>>
>> Is there a good strategy to balance these concerns?
>
> If you do continuous integration builds, do you really care that much
> about the build time? Even if the build takes an hour, it is still very
> reasonable for an continuous integration build system.

  If you take the approach of e.g. Qt and require *every* patch to pass an
individual CI run before its accepted, then an hour is not acceptable...

> Tips to reduce the build time:
>
>   * Get a fast machine. Many people complaining about build time are
>     building inside a virtual machine on a slow laptop. This simply
>     cannot work. Get a 4 or 8 cores machine, with 16+ GB of RAM, and
>     some good I/Os.

  I don't know...  Buildroot currently serializes a lot (cfr. Avery's
remark), so going beyond 2 cores will not help that much.  It's better
to have several machines (or a single big machine) that do different
CI builds in parallel.

>   * Use an external toolchain.

  I.e. build only your toolchain with BR2_HOST_DIR set to a different path,
and use that path as an external toolchain in future builds.


  * Staggered builds. Assuming most commits are in your own software, you
can usually define a base layer that usually doesn't change.  Do a build
of this base layer once and reuse it for later builds.  Of course, you still
need to do full, clean builds occasionally.



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
