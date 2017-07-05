From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 22:23:26 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-cmake.mk: Set
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT for ARMv8
In-Reply-To: <20170705190840.22469-2-aperez@igalia.com>
References: <20170705190840.22469-1-aperez@igalia.com>
 <20170705190840.22469-2-aperez@igalia.com>
Message-ID: <407724d9-6ae3-b166-63df-7d1559d2160c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 21:08, Adrian Perez de Castro wrote:
> This is needed for correctly building some CMake-based packages which
> use this variable. For example, this is needed for WebKitGTK+ 2.16.x
> to build correctly when an ARMv8 target is configured.

 Well, it's needed for any cmake package on ARMv8...


> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  package/pkg-cmake.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> index 401084fb12..914bda7482 100644
> --- a/package/pkg-cmake.mk
> +++ b/package/pkg-cmake.mk
> @@ -219,6 +219,8 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
>  CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv6
>  else ifeq ($(BR2_ARM_CPU_ARMV7A),y)

 I noticed that armv7m is also missing. Could you try to find the corresponding
CMake architecture and add it?

 Also, it could be useful to add

else
$(error ARM CPU variant not set for CMake)
endif

 Not *that* helpful for users, but better than the error you got :-)

 Regards,
 Arnout

>  CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv7
> +else ifeq ($(BR2_ARM_CPU_ARMV8),y)
> +CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv8
>  endif
>  
>  ifeq ($(BR2_arm),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
