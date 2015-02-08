From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Feb 2015 23:55:56 +0100
Subject: [Buildroot] [PATCH 1/3] glibc: add version 2.21
In-Reply-To: <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Sun, 8 Feb 2015 15:07:05 +0000")
References: <1423408027-49694-1-git-send-email-Vincent.Riera@imgtec.com>
 <1423408027-49694-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvag3tdv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > - Add version 2.21
 > - Add a hash value for it

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/glibc/Config.in  |    3 +++
 >  package/glibc/glibc.hash |    1 +
 >  2 files changed, 4 insertions(+), 0 deletions(-)

 > diff --git a/package/glibc/Config.in b/package/glibc/Config.in
 > index 8c033f2..37e108e 100644
 > --- a/package/glibc/Config.in
 > +++ b/package/glibc/Config.in
 > @@ -38,6 +38,9 @@ config BR2_GLIBC_VERSION_2_19
 >  config BR2_GLIBC_VERSION_2_20
 >  	bool "2.20"
 
 > +config BR2_GLIBC_VERSION_2_21
 > +	bool "2.21"
 > +

I noticed a few things in the release notes that might be of interest:

* Port to Altera Nios II has been contributed by Mentor Graphics.

So we should be able to build an internal glibc toolchain for nios2 now.

* Support for MIPS o32 FPXX, FP64A and FP64 ABI Extensions.
  The original MIPS o32 hard-float ABI requires an FPU where double-precision
  registers overlay two consecutive single-precision registers.  MIPS32R2
  introduced a new FPU mode (FR=1) where double-precision registers extend the
  corresponding single-precision registers which is incompatible with the
  o32 hard-float ABI.  The MIPS SIMD ASE and the MIPSR6 architecture both
  require the use of FR=1 making a transition necessary.  New o32 ABI
  extensions enable users to migrate over time from the original o32 ABI
  through to the updated o32 FP64 ABI.  To achieve this the dynamic linker now
  tracks the ABI of any loaded object and verifies that new objects are
  compatible.  Mode transitions will also be requested as required and
  unsupportable objects will be rejected.  The ABI checks include both soft and
  hard float ABIs for o32, n32 and n64.

I'm not sure what the impact is of this exactly?

-- 
Bye, Peter Korsgaard
