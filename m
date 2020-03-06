From: Eugen.Hristev at microchip.com <Eugen.Hristev@microchip.com>
Date: Fri, 6 Mar 2020 13:51:30 +0000
Subject: [Buildroot] [PATCH] package/ninja: add dependency to host-cmake
 for host-ninja
In-Reply-To: <20200306143819.244d8bac@windsurf>
References: <20200306130649.18989-1-eugen.hristev@microchip.com>
 <20200306143819.244d8bac@windsurf>
Message-ID: <e1071549-ffa6-4944-f4a4-a154de625b9b@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06.03.2020 15:38, Thomas Petazzoni wrote:

> On Fri, 6 Mar 2020 15:06:49 +0200
> Eugen Hristev <eugen.hristev@microchip.com> wrote:
> 
>> If we change the minimum CMAKE version in external,
>> buildroot will try to build host-cmake , but, host-cmake
>> is not built yet at the time of ninja build.
>> So, we need to add a dependency to host-cmake in host-ninja.
>> Otherwise, host-ninja will try to use the host-cmake but
>> 'file not found' error.
>>
>> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> 
> I don't understand what problem you are facing.
> 
> ninja.mk calls host-cmake-package, which already has:
> 
> $(2)_DEPENDENCIES += $(BR2_CMAKE_HOST_DEPENDENCY)
> 
> So it already adds a dependency on host-cmake if there is no available
> CMake on the system, or its version is not appropriate.
> 
>> I am unsure about this patch, but this fixes the issue for me.
>> If we change the minimum CMAKE version in our external tree, we hit this
>> issue: the fact that the host-cmake is not yet built when it's needed.
>> How can we fix that ?
>> This patch makes host-cmake being built at the moment when ninja needs it.
> 
> See above: this is already taken care of by the host-cmake-package
> infrastructure.
> 
>> It can happen that some other package may need it before, but I cannot know,
>> if it's not enabled in our config.
>>
>> Actually, this all started from the fact that BR2_CMAKE_VERSION_MIN is hardcoded
>> in mk file in the support/dependencies.
>> How can this be hardcoded, when we can build buildroot with an external that
>> needs a newer CMAKE ?
> 
> Buildroot indeed only takes care of setting BR2_CMAKE_VERSION_MIN
> according to the minimum version needed by all Buildroot packages. We
> cannot know which version is used in a BR2_EXTERNAL.
> 
>> So, to fix this I added in the external.mk:
>>
>>
>> BR2_CMAKE_VERSION_MIN = 3.13
>>
>> BR2_CMAKE_CANDIDATES ?= cmake cmake3
>> BR2_CMAKE ?= $(call suitable-host-package,cmake,\
>>         $(BR2_CMAKE_VERSION_MIN) $(BR2_CMAKE_CANDIDATES))
>> ifeq ($(BR2_CMAKE),)
>> BR2_CMAKE = $(HOST_DIR)/bin/cmake
>> BR2_CMAKE_HOST_DEPENDENCY = host-cmake
>> endif
>>
>>
>> But now ninja fails because host-cmake does not exist yet. Not built yet.
>> So with this patch , all is fixed, but is this the right way, and can we
>> do it better from just the external ? To force the host-cmake to build
>> and ALL packets needing cmake to start using it.
> 
> Your patch is indeed not the right way. I guess the issue is that the
> BR2_CMAKE_HOST_DEPENDENCY gets set too late, after ninja.mk has been
> expanded or something like that.
> 
> Perhaps we should have a way for each package to declare its minimum
> CMake version, and use that instead of a global value ?
> 
> Or tweak what we have today, by making it possible to override this
> minimum version from an external tree.

It's obvious that if buildroot allows new packages in external, they may 
require a newer version of HOST_CMAKE. The fact that the minimum version 
is hardcoded somewhere in buildroot, looks like a bug to me. How can we 
fix this, in the external ?


Probably what I am facing is related to the fact that I am overriding 
this minimum version in the external and some packets(ninja) get 
confused, try to look for host-cmake which is not build, because maybe 
at some point the wrong cmake is checked

> 
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
