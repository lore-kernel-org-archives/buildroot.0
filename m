From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 15 Feb 2013 00:01:17 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-02-12
In-Reply-To: <20130213073425.9C3C052C6D2@lolut.humanoidz.org>
References: <20130213073425.9C3C052C6D2@lolut.humanoidz.org>
Message-ID: <511D6CBD.4060209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 08:34, Thomas Petazzoni wrote:
> Build 395b4f098020a65e2c2a2492f8e1d91c6b8e77cc
> ==============================================
>
> Status         : NOK
> Failure reason : gpsd-3.7
> Architecture   : aarch64
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2013-02-12 17:08:08
> Git commit ID  :http://git.buildroot.net/buildroot/commit/?id=6056de8971bf25c9853c38583dc50b5abcb982de
> End of log     :http://autobuild.buildroot.net/results/395b4f098020a65e2c2a2492f8e1d91c6b8e77cc/build-end.log
> Complete log   :http://autobuild.buildroot.net/results/395b4f098020a65e2c2a2492f8e1d91c6b8e77cc/build.log.bz2
> Configuration  :http://autobuild.buildroot.net/results/395b4f098020a65e2c2a2492f8e1d91c6b8e77cc/config
> Defconfig      :http://autobuild.buildroot.net/results/395b4f098020a65e2c2a2492f8e1d91c6b8e77cc/defconfig

  Yet another 64-bit multilib issue that I don't know how to solve :-)

  The build fails with:

scons: *** [gpsd] Implicit dependency 
`/home/test/test/output1/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libm.so' 
not found, needed by target `gpsd'.

  In fact, /$(STAGING_DIR)/usr/lib/libm.so does exist and is a symlink to 
../../lib/libm.so.6 - which is the location of the 32-bit libm.so. 
Buildroot doesn't copy lib/libm.so.6 to the staging dir, but leaves the 
link in usr/lib/libm.so intact.

  Removing the symlink (and a similar one for librt.so) solves the build 
failure.

  Solves it, but still leaves in a bunch of warnings like:

/home/test/test/output1/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.6.1/../../../../i686-pc-linux-gnu/bin/ld: 
skipping incompatible 
/home/test/test/output1/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libc.so 
when searching for -lc


  It seems to me a more fundamental solution would be to simply chuck out 
the lib64 directory (leaving a lib64 -> lib symlink for compatibility). 
But that whole external toolchain stack is too messy for me to 
understand, so I don't dare touching it...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
