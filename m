From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Sun, 3 May 2020 10:36:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
In-Reply-To: <20200502143243.4e2b3ef3@windsurf.home>
References: <20200502060435.23004-1-james.hilliard1@gmail.com>
 <20200502143243.4e2b3ef3@windsurf.home>
Message-ID: <a3d55b63-c34b-0dd7-f8da-f863617ffd7c@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/2020 14:32, Thomas Petazzoni wrote:
> On Sat,  2 May 2020 00:04:35 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
>> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
>> index eefb2c83f7..d98eaf945a 100644
>> --- a/package/gobject-introspection/gobject-introspection.mk
>> +++ b/package/gobject-introspection/gobject-introspection.mk
>> @@ -136,6 +136,36 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>>  endef
>>  GOBJECT_INTROSPECTION_POST_INSTALL_STAGING_HOOKS += GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>>  
>> +define HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>> +	# Set prefix to /usr because pkg-config appends the sysroot directory
>> +	$(SED) "s%^prefix=.*%prefix=\/usr%g" \
>> +		$(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
> 
> No, the host variant of pkg-config should not append the sysroot
> directory. If it does, then it is wrong.

That's because meson currently uses the target pkg-config with
PKG_CONFIG_PATH=$(HOST_DIR)/lib/pkgconfig to find host packages.

from build/meson-logs/meson-log.txt:

Pkg-config binary for MachineChoice.BUILD is not cached.
None of 'PKG_CONFIG_FOR_BUILD' are defined in the environment, not
changing global flags.
Pkg-config binary missing from cross or native file, or env var undefined.
Trying a default Pkg-config fallback at pkg-config
Trying pkg-config binary pkg-config for machine MachineChoice.BUILD at
['/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkg-config']
Found pkg-config:
/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkg-config (1.6.1)
Determining dependency 'glib-2.0' with pkg-config executable
'/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkg-config'
PKG_CONFIG_PATH: /home/cavallar/br-test-pkg/br-arm-full/host/lib/pkgconfig
Called `/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkg-config
--modversion glib-2.0` -> 0
2.64.2
PKG_CONFIG_PATH: /home/cavallar/br-test-pkg/br-arm-full/host/lib/pkgconfig
Called `/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkg-config
--cflags glib-2.0` -> 0
-I/home/cavallar/br-test-pkg/br-arm-full/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/home/cavallar/br-test-pkg/br-arm-full/host/include/glib-2.0
-I/home/cavallar/br-test-pkg/br-arm-full/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/home/cavallar/br-test-pkg/br-arm-full/host/lib/glib-2.0/include
-I/home/cavallar/br-test-pkg/br-arm-full/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/home/cavallar/br-test-pkg/br-arm-full/host/include


Compared to the target pkg-config, which is found correctly:


Pkg-config binary for MachineChoice.HOST is not cached.
Pkg-config binary for MachineChoice.HOST specified from cross file,
native file, or env var as
['/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkgconf']
Trying pkg-config binary pkgconfig for machine MachineChoice.HOST at
['/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkgconf']
Found pkg-config:
/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkgconf (1.6.1)
Determining dependency 'glib-2.0' with pkg-config executable
'/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkgconf'
PKG_CONFIG_PATH:
PKG_CONFIG_LIBDIR:
/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig:/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/pkgconfig
Called `/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkgconf
--modversion glib-2.0` -> 0
2.64.2
PKG_CONFIG_PATH:
PKG_CONFIG_LIBDIR:
/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/pkgconfig:/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/pkgconfig
Called `/home/cavallar/br-test-pkg/br-arm-full/host/bin/pkgconf --cflags
glib-2.0` -> 0
-I/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0
-I/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/glib-2.0/include
-I/home/cavallar/br-test-pkg/br-arm-full/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
