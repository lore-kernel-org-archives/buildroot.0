From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Aug 2012 09:36:40 +0200
Subject: [Buildroot] Generating external toolchains with Buildroot
In-Reply-To: <20120825113012.44b2612f@skate>
References: <20120825113012.44b2612f@skate>
Message-ID: <503C7508.8030905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Underwhelming number of replies in this thread...

On 08/25/12 11:30, Thomas Petazzoni wrote:
> Hello,
>
> In order to make the autobuilders toolchain available to everyone, I
> had to generate tarballs of Buildroot toolchains. Basically, I just did
> BR2_HOST_DIR=/opt/<some-toolchain-name>  and built just the toolchain.
> This has raised two problems.
>
> Problem 1: everything is in usr/
> ================================
>
[snip]
>
> Question: should we be changing our host directory policy and use
> --prefix=$(HOST_DIR) instead of --prefix=$(HOST_DIR)/usr ? Or should we
> keep things as it is and leave with this little drawback ?

  Yes!  I've always been annoyed with the redundant usr part, especially
since two or three packages install in $(HOST_DIR)/bin...

  It's a big change but can probably easily be automated with sed.


> Problem 2: relocalability
> =========================
>
> The main problem though is the relocalability of the toolchain. We have
> discussed in length the relocability of the Buildroot SDK (i.e, the
> host/ directory) during previous Buildroot Developer meetings. For the
> specific case of a SDK that contains only the toolchain, there is only
> one problem I had: we build gmp, mpfr and gmp as shared libraries, and
> the gcc binaries have absolute rpath in their binaries to reference the
> host/usr/lib directory in which these shared libraries are installed.
>
> We thought of solving this problem by using a relative rpath:
> -Wl,-rpath,$ORIGIN/../lib. Unfortunately, this probably works fine for
> binaries installed in host/usr/bin, but not for the cc1 and collect2
> binaries installed in host/usr/libexec/gcc/<foo>/<gcc-version>/. Those
> binaries would need a different relative rpath to work properly.
>
> For the toolchains that I've put online at
> http://autobuild.buildroot.org/toolchains/tarballs/, I've solved this
> problem by modifying Buildroot so that it builds mpfr, gmp and mpc as
> static libraries, so that the gcc binaries do not depend to any shared
> libraries besides the C library. And this seems to work fine, though it
> is not a completely satisfying solution.

  I'm not sure if linking mpfr, gmp and mpc statically is so bad...  How
much larger do the binaries become with static linking?  If it's not much
larger, the startup of cc1 may actually become faster with static linking!

  Quick comparison: buildroot-built cc1 for gcc-4.5.3 is 11M; statically-linked
cc1 from Sourcery's gcc-4.5.2 is 12M.

  I think crosstool-NG links statically as well.  Yann?


> Any ideas on this one? Should we add both -Wl,-rpath,$ORIGIN/../lib and
> -Wl,-rpath,$ORIGIN/../../../../lib when building gcc to solve this
> problem? Another solution?

  Not very nice.  Perhaps a specific rpath for linking cc1 and friends?


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
