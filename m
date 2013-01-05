From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 5 Jan 2013 17:23:20 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <CAHXCMMJi+pFKA8O9MvWMu83WR0dpqRFZ2RUxx6Hjs-hxyaskdA@mail.gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
 <CAHXCMMJi+pFKA8O9MvWMu83WR0dpqRFZ2RUxx6Hjs-hxyaskdA@mail.gmail.com>
Message-ID: <CAGduivw+nTUpN3yXws30bi+qssoemF3N7mo0=PL1UBhdOFCu7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 5, 2013 at 4:18 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi Maxime,
Hi Samuel,
>
> 2013/1/5 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>:
>> Introducing a package to build the userland part of the Raspberry,
>> needed by anyone who would want to build a rootfs for a RaspberryPi.
>>
>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>> ---
>>  package/Config.in                    |    1 +
>>  package/rpi-userland/Config.in       |   12 ++++++++++++
>>  package/rpi-userland/rpi-userland.mk |   25 +++++++++++++++++++++++++
>>  3 files changed, 38 insertions(+)
>>  create mode 100644 package/rpi-userland/Config.in
>>  create mode 100644 package/rpi-userland/rpi-userland.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index a3530d7..604ed1b 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -579,6 +579,7 @@ source "package/collectd/Config.in"
>>  source "package/empty/Config.in"
>>  source "package/googlefontdirectory/Config.in"
>>  source "package/mobile-broadband-provider-info/Config.in"
>> +source "package/rpi-userland/Config.in"
>>  source "package/shared-mime-info/Config.in"
>>  source "package/snowball-init/Config.in"
>>  source "package/sound-theme-borealis/Config.in"
>> diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
>> new file mode 100644
>> index 0000000..3d4585f
>> --- /dev/null
>> +++ b/package/rpi-userland/Config.in
>> @@ -0,0 +1,12 @@
>> +config BR2_PACKAGE_RPI_USERLAND
>> +       bool "rpi-userland"
>> +       select BR2_PACKAGE_LIBCOFI
>> +       help
>> +         Raspberry Pi Userland contains the necessary library to use the
>> +         VideoCore driver.
>> +
>> +         Includes source for the ARM side code to interface to:
>> +         EGL, mmal, GLESv2, vcos, openmaxil, vchiq_arm, bcm_host, WFC, OpenVG.
>> +
>> +         https://github.com/raspberrypi/userland/
>> +
>> diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
>> new file mode 100644
>> index 0000000..5bae06d
>> --- /dev/null
>> +++ b/package/rpi-userland/rpi-userland.mk
>> @@ -0,0 +1,25 @@
>> +#############################################################
>> +#
>> +# rpi-userland
>> +#
>> +#############################################################
>> +RPI_USERLAND_VERSION = 9852ce28826889e50c4d6786b942f51bccccac54
>> +RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
>> +RPI_USERLAND_LICENSE = FOSS
>> +RPI_USERLAND_LICENSE_FILE = LICENCE
>> +RPI_USERLAND_INSTALL_STAGING = YES
>> +
>> +define RPI_USERLAND_POST_TARGET_CLEANUP
>> +    rm -Rf $(TARGET_DIR)/opt/vc/include
>> +    rm -Rf $(TARGET_DIR)/opt/vc/share
>> +    rm -Rf $(TARGET_DIR)/opt/vc/src
>> +    rm -f  $(TARGET_DIR)/etc/init.d/vcfiled
>> +    rm -f  $(TARGET_DIR)/opt/vc/lib/*.a
>> +    rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/init.d || true
> Since you use the --ignore-fail-on-non-empty option, i think "|| true"
> is useless.
You're totally right.
>
>> +    mv $(TARGET_DIR)/opt/vc/lib/* $(TARGET_DIR)/usr/lib/
>> +    rm -Rf $(TARGET_DIR)/opt/vc/
>> +endef
>
> Also, since you set RPI_USERLAND_INSTALL_STAGING = YES, don't you need
> to do some cleanup/fixup hook for the staging area as well?
Is it really useful to cleanup the staging area ?
>
>> +
>> +RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
>
> BTW, it is possible to avoid this cleanup hook  (or at least reduce it
> to the example source) with this patch:
> http://code.bulix.org/3fo6ye-82780
> and by adding "-DVMCS_INSTALL_PREFIX=/usr" to the
> RPI_USERLAND_CONF_OPT variable.
I think part of the cleanup is useful so we don't create a rootfs that
comes with example sources code and useless files for runtime.
In the other part, it's perfectly possible to add this option so it
would install itself in the right place.
>
>> +
>> +$(eval $(cmake-package))
>> --
>> 1.7.10.4
>
> Regards,
>
> --
> Samuel
