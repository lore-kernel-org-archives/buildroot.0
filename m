From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 22 Sep 2019 12:48:08 +0200
Subject: [Buildroot] [PATCH v6 09/25] package/kodi: bump to version
 18.4-Leia
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-10-bernd.kuhls@t-online.de>
 <c40f0485-9441-c34f-ea65-c7f256f3f8ef@mind.be>
Message-ID: <840k5gx5v3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am 21.09.19 um 23:03 schrieb Arnout Vandecappelle:> 
> 
> On 21/09/2019 21:28, Bernd Kuhls wrote:
>>
>> Rebased patches
>> - 0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
>> - 0002-CMake-Remove-dependency-on-gmp-and-libintl-from-Find.patch
> 
>  Is there no chance of upstreaming these?

Regarding patch 0001:

Originally I wanted to use sed to fix kodi-config.cmake:
http://lists.busybox.net/pipermail/buildroot/2015-July/133811.html

+# needed to fix binary addons compile
+# https://github.com/OpenELEC/OpenELEC.tv/commit/
ecb91611931a4f89bd6551b4a2eaaf0b7cbf19fc
+define KODI_FIX_CONFIG_CMAKE
+	$(SED) "s:INCLUDE_DIR /usr/include/kodi:INCLUDE_DIR $
(STAGING_DIR)/usr/include/kodi:g" $(STAGING_DIR)/usr/lib/kodi/kodi-
config.cmake
+endef
+KODI_POST_INSTALL_STAGING_HOOKS += KODI_FIX_CONFIG_CMAKE

Thomas chose to create this patch instead while committing the rest of my 
patch:
http://lists.busybox.net/pipermail/buildroot/2015-July/134983.html

[Thomas:
 - don't do a manual fixup of kodi-config.cmake, and instead patch it
   to use CMAKE_FIND_ROOT_PATH. This will also avoid having to pass
   -DCMAKE_MODULE_PATH to all Kodi add-ons .mk files.]

LibreELEC up until today carries the original sed fix
https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/
mediacenter/kodi/package.mk#L344

Based on the close interaction between both, Kodi and LibreELEC, projects 
I do not think our patch will be accepted upstream.

Regarding patch 0002:

Upstream is aware of the problem this patch tries to fix but did not 
respond yet, sent a ping.

>  Kodi and texturepacker are bumped in a single patch, but all the rest 
is bumped
> separately. What is the reasoning behind that? I mean, do the old 
plugins still
> work with the new kodi?
No, addons depend on the kodi version. I split the patches for easier 
review but they need to be committed together.

>> --- /dev/null
>> +++ b/package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-
dir.patch
>> @@ -0,0 +1,14 @@
>> +Downloaded from
>> +https://github.com/LibreELEC/LibreELEC.tv/blob/master/packages/
mediacenter/kodi/patches/kodi-100.25-hack-fix-texture-packer-cmake-source-
dir.patch
> 
>  A slightly better commit message would help. Like, why is this needed?

My knowledge about the cmake internals is limited, sorry, therefore I am 
unable to describe my the patch is needed, the upstream PR also does not 
give any information: https://github.com/LibreELEC/LibreELEC.tv/pull/1186

>> -KODI_LIBDVDCSS_VERSION = 2f12236
>> -KODI_LIBDVDNAV_VERSION = 981488f
>> -KODI_LIBDVDREAD_VERSION = 17d99db
>> +# 1.4.2-Leia-Beta-5
>> +KODI_LIBDVDCSS_VERSION = e646b950095589e74a2c08cf0c34b758c669aa75
> 
>  So, why not use the tag? Seems much more descriptive than a random 
commit...

Will try.

>> +define KODI_CPLUFF_AUTOCONF
>> +	cd $(KODI_SRCDIR)/lib/cpluff && ./autogen.sh
> 
>  Assuming this indeed does an autconf/automake, you should add the 
corresponding
> dependencies. They are of course implied by a number of existing 
dependencies
> that do an AUTORECONF, but it's better to be explicit here :-) Maybe 
even put
> those dependencies here, rather than together with the rest of the 
dependencies,
> to make it clear that it goes together with the autogen.

Will try, additional note: cpluff will be removed in kodi 19.x:
https://github.com/xbmc/xbmc/pull/14908

>>  ifeq ($(BR2_PACKAGE_KODI_LIRC),y)
>> -KODI_CONF_OPTS += -DENABLE_LIRC=ON
>> -else
>> -KODI_CONF_OPTS += -DENABLE_LIRC=OFF
>> +KODI_DEPENDENCIES += lirc-tools
> 
>  Is there no longer an enable/disable for this? In that case, the 
condition
> should change to BR2_PACKAGE_LIRC_TOOLS instead of 
BR2_PACKAGE_KODI_LIRC,
> otherwise it still depends on random build order whether it's built 
with lirc
> support or not if the option is not given.

Will be part of the next iteration.

Thanks for your review.

Kind regards, Bernd
