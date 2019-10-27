From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2019 16:32:34 +0100
Subject: [Buildroot] [PATCH v4] package/eudev: generate hwdb.bin at
 system startup
In-Reply-To: <20190501231013.5957-1-unixmania@gmail.com> (unixmania's message
 of "Wed, 1 May 2019 20:10:13 -0300")
References: <20190501231013.5957-1-unixmania@gmail.com>
Message-ID: <87blu2jjal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

Hi,

 > From: Carlos Santos <unixmania@gmail.com>
 > Programs that use libudev (e.g. lsusb, from usbutils) need the hwdb.bin
 > file to work properly.

 > If BR2_PACKAGE_EUDEV_ENABLE_HWDB is selected then the eudev installation
 > populates /etc/udev/hwdb.d/ but does not genarete /etc/udev/hwdb.bin. It
 > must be created running "udevadm hwdb --update" on the target device but
 > this does not work with a read-only /etc, so we need these changes:

 > - Add the BR2_PACKAGE_EUDEV_HWDB_BIN_PATH config, allowing the user to
 >   set the location of hwdb.bin.
 > - Patch the configuration script, allowing to set the hwdb.bin path by
 >   means of an environment variable (udevhwdbbinpath).
 > - Pass the value set in BR2_PACKAGE_EUDEV_HWDB_BIN_PATH to the configure
 >   script by means of the udevhwdbbinpath variable.
 > - Make the S10udev init script run "udevadm hwdb --update" to recreate
 >   hwdb.bin or print an error message if the operation fails (e.g. no
 >   write permission on the filesystem).

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>
 > Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > ---
 > Changes v1->v2
 > - Incorporate fixes and improvements provided by Matt Weber
 > Changes v2->v3
 > - Make HWDB_BIN_PATH depend on ENABLE_HWDB, as pointed by Matt Weber.
 > Changes v3->v4
 > - Changed SOB, since I don't work for DATACOM anymore.

 > Note: there was a discussion via email and on IRC, with suggestions to
 > prebuild hwdb.bin at build time and to add a /etc/defaults/udev cfg file
 > instead of patching S10udev. I like both suggestions but I'd prefer to
 > implement them in subsequent patches lather, since they would require
 > additional changes (e.g. adding eudev as a host tool).

This is still what needs to be done to really solve the issue.


 > +UDEV_HWDB_BIN=%%UDEV_HWDB_BIN%%
 > +
 >  case "$1" in
 >      start)
 >          printf "Populating %s using udev: " "${udev_root:-/dev}"
 >          [ -e /proc/sys/kernel/hotplug ] && printf '\000\000\000\000' > /proc/sys/kernel/hotplug
 >          /sbin/udevd -d || { echo "FAIL"; exit 1; }
 > +        echo "done"
 >          udevadm trigger --type=subsystems --action=add
 >          udevadm trigger --type=devices --action=add
 > -        udevadm settle --timeout=30 || echo "udevadm settle failed"
 > +        udevadm settle --timeout=30 || { echo "udevadm settle failed" && exit 1; }
 > +        echo "done"

These extra "done" calls looks a bit odd as there isn't a matching
printf.

 > +        printf "Compiling hardware database information $UDEV_HWDB_BIN: "
 > +        udevadm hwdb --update || { echo "FAIL" && exit 1; }

This will regenerate hwdb.bin at each startup, which is clearly not what
we want to do.


 > +++ b/package/eudev/eudev.mk
 > @@ -33,6 +33,12 @@ endif
 
 >  ifeq ($(BR2_PACKAGE_EUDEV_ENABLE_HWDB),y)
 >  EUDEV_CONF_OPTS += --enable-hwdb
 > +define EUDEV_POST_PATCH
 > +	$(SED) 's,$${udevconfdir}/hwdb.bin,$${udevhwdbbinpath:-$${udevconfdir}/hwdb.bin},' \
 > +		$(@D)/configure
 > +endef

This is horrible, and should be done as a real patch to configure.ac,
but just building host-eudev and generating hwdb.bin at build time seems
simpler and fixes the problem for everyone.

We're looking into building host-eudev here.

-- 
Bye, Peter Korsgaard
