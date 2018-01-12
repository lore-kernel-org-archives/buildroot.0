From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 23:17:11 +0100
Subject: [Buildroot] [PATCH v2] kvm-unit-tests: test for rdseed/rdrand
In-Reply-To: <1515499487-29937-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1515499487-29937-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180112231711.16d6b77d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your work on this!

On Tue,  9 Jan 2018 06:04:47 -0600, Matt Weber wrote:
> The build fails when the host binutils isn't at least 2.23
> (2.22.x introduced RDSEED).
> 
> The host toolchain is used for x86_64 target builds where
> we need to do a 32bit build. Most other buildroot builds
> are using a much newer binutils unless it's a external
> older toolchain.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/
> 
> Upstream:
> https://www.spinics.net/lists/kvm/msg161542.html
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> 
> Thomas/Peter could you test this on one of your builders?
> I've requested a gcc farm account but still waiting at this
> point.  Here's the builders which can reproduce the failure
> (ie have old enough host binutils).
> http://autobuild.buildroot.net/?reason=kvm-unit-tests-kvm-unit-tests-20171020

Sadly, it doesn't work. It correctly detects that rdseed isn't
available:

>>> kvm-unit-tests kvm-unit-tests-20171020 Configuring
cd /home/test/buildroot/output/build/kvm-unit-tests-kvm-unit-tests-20171020 && ./configure --arch="x86_64" --processor="" --endian="little"
Checking for rdseed/rdrand... No.

but the CFLAGS you assign have no effect. And indeed you assign CFLAGS,
but there's nothing that actually uses the CFLAGS set by the configure
script.

In fact, you can perfectly test this on your side: just introduce a
stupid typo in the rdseed test program that makes it fail to build
unconditionally, and verify that the NO_RDSEEDRAND define really exists
when the C file is built.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
