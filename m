From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 4 Nov 2016 16:44:59 +0100
Subject: [Buildroot] [PATCH] authsae: new package
In-Reply-To: <c1172072-d80b-3fdc-7bf8-e19342bd1f7a@mind.be>
References: <1478178544-27509-1-git-send-email-yegorslists@googlemail.com>
 <c1172072-d80b-3fdc-7bf8-e19342bd1f7a@mind.be>
Message-ID: <CAGm1_kv-F9XVYCzX4XgfgQ60VRbq-UfFxciUM6HFGm3smDBwwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, Nov 3, 2016 at 6:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 03-11-16 14:09, yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>>  package/Config.in                                  |  1 +
>>  .../0001-CMake-install-libsae.so-as-well.patch     | 25 ++++++++++++++++++++++
>>  package/authsae/Config.in                          | 11 ++++++++++
>>  package/authsae/authsae.hash                       |  2 ++
>>  package/authsae/authsae.mk                         | 17 +++++++++++++++
>>  5 files changed, 56 insertions(+)
>>  create mode 100644 package/authsae/0001-CMake-install-libsae.so-as-well.patch
>>  create mode 100644 package/authsae/Config.in
>>  create mode 100644 package/authsae/authsae.hash
>>  create mode 100644 package/authsae/authsae.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 0f6260b..d51d01b 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1430,6 +1430,7 @@ menu "Networking applications"
>>       source "package/argus/Config.in"
>>       source "package/arptables/Config.in"
>>       source "package/atftp/Config.in"
>> +     source "package/authsae/Config.in"
>>       source "package/autossh/Config.in"
>>       source "package/avahi/Config.in"
>>       source "package/axel/Config.in"
>> diff --git a/package/authsae/0001-CMake-install-libsae.so-as-well.patch b/package/authsae/0001-CMake-install-libsae.so-as-well.patch
>> new file mode 100644
>> index 0000000..02794d0
>> --- /dev/null
>> +++ b/package/authsae/0001-CMake-install-libsae.so-as-well.patch
>> @@ -0,0 +1,25 @@
>> +From 173cf3896dd9c2e423863814b1c7f129a0af8d02 Mon Sep 17 00:00:00 2001
>> +From: Yegor Yefremov <yegorslists@googlemail.com>
>> +Date: Thu, 3 Nov 2016 10:08:38 +0100
>> +Subject: [PATCH] CMake: install libsae.so as well
>> +
>> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>
>  Please refer to your https://github.com/cozybit/authsae/pull/51

ACK

>> +---
>> + CMakeLists.txt | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/CMakeLists.txt b/CMakeLists.txt
>> +index 08599a0..4bb0381 100644
>> +--- a/CMakeLists.txt
>> ++++ b/CMakeLists.txt
>> +@@ -71,6 +71,7 @@ LIST(APPEND libsae_sources
>> +
>> + ADD_LIBRARY(sae ${libsae_sources})
>> + TARGET_LINK_LIBRARIES(sae ${libsae_libs})
>> ++INSTALL(TARGETS sae DESTINATION lib)
>> +
>> + #####################################################################
>> + IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
>> +--
>> +2.1.4
>> +
>> diff --git a/package/authsae/Config.in b/package/authsae/Config.in
>> new file mode 100644
>> index 0000000..0753da1
>> --- /dev/null
>> +++ b/package/authsae/Config.in
>> @@ -0,0 +1,11 @@
>> +config BR2_PACKAGE_AUTHSAE
>> +     bool "authsae"
>> +     select BR2_PACKAGE_OPENSSL
>> +     select BR2_PACKAGE_LIBCONFIG
>> +     help
>> +       Simultaneous Authentication of Equals (SAE) provides a secure
>> +       password-based authentication mechanism for 802.11. It is
>> +       resistant to passive attack, active attack, and dictionary
>> +       attack.
>
>  I was a bit worried about the statement
>
>   Currently, the only OS with wireless support is freebsd. The
> linux module only supports communication over loopback. Extending
> the linux OS-specific module-- linux/meshd.c-- to support wireless
> interfaces is the subject of on-going work.
>
> but it seems the README is severely out of date.

Yes, it is really old.

>> +
>> +       https://github.com/cozybit/authsae
>> diff --git a/package/authsae/authsae.hash b/package/authsae/authsae.hash
>> new file mode 100644
>> index 0000000..fee1c9c
>> --- /dev/null
>> +++ b/package/authsae/authsae.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed
>> +sha256 ee8021c0052600a3d7fe5d2886887116993ed684d6857db6fb5fe2af2a865fe4  authsae-06d383ec944120c9dbbb3e0b95b3d1420a80f074.tar.gz
>> diff --git a/package/authsae/authsae.mk b/package/authsae/authsae.mk
>> new file mode 100644
>> index 0000000..8ac28b4
>> --- /dev/null
>> +++ b/package/authsae/authsae.mk
>> @@ -0,0 +1,17 @@
>> +################################################################################
>> +#
>> +# authsae
>> +#
>> +################################################################################
>> +
>> +AUTHSAE_VERSION = 06d383ec944120c9dbbb3e0b95b3d1420a80f074
>> +AUTHSAE_SITE = $(call github,cozybit,authsae,$(AUTHSAE_VERSION))
>> +AUTHSAE_DEPENDENCIES = openssl libconfig host-pkgconf
>> +AUTHSAE_LICENSE = BSD-3c
>
>  Hm, is it really? It's BSD-3c with this additional clause:
>
> This license and distribution terms cannot be changed. In other words,
> this code cannot simply be copied and put under a different distribution
> license (including the GNU public license).
>
>  I am not sure how relevant that is, but I do think it's something that should
> be flagged in the legal info. So let's make it "BSD-3c with no change clause"
>
>> +AUTHSAE_LICENSE_FILES = sae.c
>
>  sae.h has the same text and is smaller.

I've filed an issue about licence file. So I'll wait what happens
before sending v2.

>> +
>> +ifeq ($(BR2_PACKAGE_LIBNL),y)
>> +AUTHSAE_DEPENDENCIES += libnl
>
>  Is it really optional? I see
>
> ELSE(LIBNL3_FOUND)
> MESSAGE(FATAL_ERROR "Error: libnl and libnl-genl not found")
>
> which seems pretty fatal to me...

ACK

Thanks for review.

Yegor
