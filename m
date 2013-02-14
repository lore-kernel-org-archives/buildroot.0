From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Feb 2013 22:49:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-11
In-Reply-To: <20130212073431.F3A9752C982@lolut.humanoidz.org>
References: <20130212073431.F3A9752C982@lolut.humanoidz.org>
Message-ID: <511D5BF2.5060906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/13 08:34, Thomas Petazzoni wrote:
> Build 4fedd1a67957f52272b63948e766d7ad10bf4f85
> ==============================================
> 
> Status         : NOK
> Failure reason : pv-1.2.0
> Architecture   : x86_64
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2013-02-11 07:01:56
> Git commit ID  :http://git.buildroot.net/buildroot/commit/?id=6056de8971bf25c9853c38583dc50b5abcb982de
> End of log     :http://autobuild.buildroot.net/results/4fedd1a67957f52272b63948e766d7ad10bf4f85/build-end.log
> Complete log   :http://autobuild.buildroot.net/results/4fedd1a67957f52272b63948e766d7ad10bf4f85/build.log.bz2
> Configuration  :http://autobuild.buildroot.net/results/4fedd1a67957f52272b63948e766d7ad10bf4f85/config
> Defconfig      :http://autobuild.buildroot.net/results/4fedd1a67957f52272b63948e766d7ad10bf4f85/defconfig


 The problem with this one is the following:

/home/test/test/output1/host/usr/bin/i686-pc-linux-gnu-ld -r -o src/library.o  src/library/getopt.o src/library/gettext.o
/home/test/test/output1/host/usr/bin/i686-pc-linux-gnu-ld: i386:x86-64 architecture of input file `src/library/gettext.o' is incompatible with i386 output


 This is because the Sourcery toolchain is a multilib toolchain that can
generate two different emulations (elf_i386 and elf_x86_64). gcc adds the
"-m elf_x86_64" option to ld, but of course there is no way for configure
or whatever to discover that this is necessary.

 There are probably other packages that suffer the same problem - in fact,
any package that uses $(TARGET_LD) will most likely suffer from it.

 I'm not sure how to solve this. We could set TARGET_LD to 
"$(TARGET_CROSS)ld -m elf_x86_64" for the specific case of x86_64 external
toolchains (it probably doesn't hurt to add the default emulation 
explicitly). But there may be other external toolchains with the same
problem - none of the current ones, at first sight, but who knows what the
future brings.

 So what do you think?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
