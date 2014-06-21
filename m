From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jun 2014 19:14:59 +0200
Subject: [Buildroot] [PATCH 1/2] icu: Delete inapropriate flag at link
In-Reply-To: <53A4A737.9070304@mind.be>
References: <1403194417-19986-1-git-send-email-maxime.hadjinlian@gmail.com>
 <53A4A737.9070304@mind.be>
Message-ID: <20140621191459.7a124206@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 20 Jun 2014 23:27:19 +0200, Arnout Vandecappelle wrote:

>  I don't see how -nostdlib -nodefaultlibs could have that effect - especially in
> buildroot, where we always force the abi. Do you have an example configuration
> where this happens?

Yes:

BR2_arm=y
BR2_cortex_a8=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_ICU=y

With this configuration, all libraries are properly built EABIhf. For
example, libicutu.so:

$ LANG=C arm-linux-gnueabihf-readelf -A output/target/usr/lib/libicutu.so.51.2 
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "7-A"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3-D16
  Tag_ABI_PCS_wchar_t: 4
  Tag_ABI_FP_rounding: Needed
  Tag_ABI_FP_denormal: Needed
  Tag_ABI_FP_exceptions: Needed
  Tag_ABI_FP_number_model: IEEE 754
  Tag_ABI_align_needed: 8-byte
  Tag_ABI_align_preserved: 8-byte, except leaf SP
  Tag_ABI_enum_size: int
  Tag_ABI_HardFP_use: SP and DP
  Tag_ABI_VFP_args: VFP registers
  Tag_CPU_unaligned_access: v6
  Tag_Virtualization_use: TrustZone

However, libicudata.so is not built properly:

$ LANG=C arm-linux-gnueabihf-readelf -A output/target/usr/lib/libicudata.so.51.2 
Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "Cortex-A8"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_FP_arch: VFPv3-D16
  Tag_Virtualization_use: TrustZone

I was actually with Maxime in Paris a couple of weeks ago to debug this
issue. He had a Qt application that was not starting properly due to
this problem, because the dynamic library loader was refusing to load
the libicudata library. After applying the patch for Debian to remove
the problematic flags and rebuilding icu, we were able to start his Qt
application with no problem.

Also, the Debian changelog is pretty clear about what they've done, and
explicitly mentions the armhf problem. From
http://metadata.ftp-master.debian.org/changelogs//main/i/icu/icu_52.1-3_changelog:

icu (4.8.1.1-2) unstable; urgency=low

  * debian/patches/icudata-stdlibs.patch: Link stdlibs to libicudata so we
    get reasonably sane ELF headers on armhf.  Thanks Adam Conrad
    <adconrad@ubuntu.com>.  (Closes: #653457)

 -- Jay Berkenbilt <qjb@debian.org>  Wed, 04 Jan 2012 09:52:11 -0500

See also https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=653457 for
more details.

Hopefully, these details will be enough to justify the patch. Though I
agree with you that Maxime's description of the patch should have been
more detailed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
