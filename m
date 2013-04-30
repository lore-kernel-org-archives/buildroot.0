From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Apr 2013 18:06:27 +0200
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <20130429224541.6f46b3b4@skate>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <20130425050221.4846d873@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
 <20130429224541.6f46b3b4@skate>
Message-ID: <517FEC03.1010709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/13 22:45, Thomas Petazzoni wrote:
>   * I am not entirely happy with 'toolchain/gcc: Introduce
>     BR2_ARCH_HAS_NO_GCC_x_y' using a reverted logic. I haven't thought
>     too much about it, but wouldn't it be possible to instead do
>     something like BR2_ARCH_NEEDS_GCC_4_6_PLUS, and then do something
>     like depends !BR2_ARCH_NEEDS_GCC_4_6_PLUS on all gcc versions <
>     4.6 ? Hum, the problem is that it works with architecture that are
>     supported starting from a given upstream gcc version, but not
>     architecture that are supported only in 4.2-avr, or in 4.4-arc, etc.
>
>     Maybe others will have a suggestion on this point?

  Not entirely clean either, but what about the following:

[toolchain/gcc/Config.in]
config BR2_ARCH_HAS_ALL_GCC
	bool

config BR2_ARCH_HAS_GCC_4_4
	bool
	default y if BR2_ARCH_HAS_ALL_GCC

[arch/Config.in]
config BR2_mips
	select BR2_ARCH_HAS_ALL_GCC
...

[arch/Config.in.arm]
config BR2_arm1176jzf_s
	select BR2_ARCH_HAS_ALL_GCC
...
config BR2_cortex_a8
	select BR2_ARCH_HAS_GCC_4_4
...



  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
