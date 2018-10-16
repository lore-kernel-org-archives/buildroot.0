From: Carlos Santos <casantos@datacom.com.br>
Date: Tue, 16 Oct 2018 14:00:44 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] eudev: generate hwdb.bin at system
 startup
In-Reply-To: <CANQCQpZGC=DCY4v=aTko1BCV2tNVr1+tPUby6copf9DJjXAf=A@mail.gmail.com>
References: <20181016114948.26921-1-casantos@datacom.com.br>
 <CANQCQpZGC=DCY4v=aTko1BCV2tNVr1+tPUby6copf9DJjXAf=A@mail.gmail.com>
Message-ID: <269139837.3330135.1539709244132.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Matthew Weber" <matthew.weber@rockwellcollins.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "Bernd Kuhls" <bernd.kuhls@t-online.de>, "Eric Le Bihan"
> <eric.le.bihan.dev@free.fr>, "Yann Morin" <yann.morin.1998@free.fr>, "Carlos Santos" <casantos@datacom.ind.br>
> Sent: Tuesday, October 16, 2018 12:21:41 PM
> Subject: Re: [PATCH v2] eudev: generate hwdb.bin at system startup

> Carlos,
> 
> On Tue, Oct 16, 2018 at 6:50 AM Carlos Santos <casantos@datacom.com.br> wrote:
>>
>> From: Carlos Santos <casantos@datacom.ind.br>
>>
>> Programs that use libudev (e.g. lsusb, from usbutils) need the hwdb.bin
>> file to work properly.
> 
> Sounds like a great runtime test?  I had wondered other then testing
> that the .bin generates, what's the example with those tools to show
> the bin is working?

# lsusb -V
lsusb (usbutils) 010
# lsusb 
Bus 002 Device 002: ID 0951:16a3 Kingston Technology 
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
dm8620# mv /etc/udev/hwdb.bin /etc/udev/hwdb.bin~
# lsusb 
Bus 002 Device 002: ID 0951:16a3  
Bus 002 Device 001: ID 1d6b:0003  
Bus 001 Device 001: ID 1d6b:0002  

>> If BR2_PACKAGE_EUDEV_ENABLE_HWDB is selected then the eudev installation
>> populates /etc/udev/hwdb.d/ but does not genarete /etc/udev/hwdb.bin. It
>> must be created running "udevadm hwdb --update" on the target device but
>> this does not work with a read-only /etc, so we need these changes:
>>
>> - Add the BR2_PACKAGE_EUDEV_HWDB_BIN_PATH config, allowing the user to
>>   set the location of hwdb.bin.
>> - Patch the configuration script, allowing to set the hwdb.bin path by
>>   means of an environment variable (udevhwdbbinpath).
>> - Pass the value set in BR2_PACKAGE_EUDEV_HWDB_BIN_PATH to the configure
>>   script by means of the udevhwdbbinpath variable.
>> - Make the S10udev init script run "udevadm hwdb --update" to recreate
>>   hwdb.bin or print an error message if the operation fails (e.g. no
>>   write permission on the filesystem).
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
>> Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
>> ---
>> Changes v1->v2
>> - Incorporate fixes and improvements provided by Matt Weber
>>
>> Note: there was a discussion via email and on IRC, with suggetsions to
>> prebuild hwdb.bin at build time and to add a /etc/defaults/udev cfg file
>> instead patching S10udev (like in the recent S01logging suggested
>> updates). I like both suggestions but I'd prefer to implement them in
>> subsequent patches rather, since they woud require additional changes
>> (e.g. adding eudev as a host tool).
> 
> Guessing the use of SED setting that value maybe a sticking point
> where there would be a push to use the default cfg approach.  Wouldn't
> need to be an offline build in this patchset.

The problem here is that we must set a default path at build time,
since the /etc/default/<foo> files are optional. Moreover, S10udev
requires an extreme overhauling due to several bugs:

  - the inclusion of /etc/udev/udev.conf does not make sense;
  - poor error handling and report;
  - there is no "restart" nor "reload";
  - it should use start-stop-daemon to start/stop udevd.

>> ---
>>  package/eudev/Config.in |  9 +++++++++
>>  package/eudev/S10udev   |  8 +++++++-
>>  package/eudev/eudev.mk  | 13 ++++++++++++-
>>  3 files changed, 28 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/eudev/Config.in b/package/eudev/Config.in
>> index 2220265a55..a589a14af3 100644
>> --- a/package/eudev/Config.in
>> +++ b/package/eudev/Config.in
>> @@ -32,6 +32,15 @@ config BR2_PACKAGE_EUDEV_ENABLE_HWDB
>>         help
>>           Enables hardware database installation to /etc/udev/hwdb.d
>>
>> +config BR2_PACKAGE_EUDEV_HWDB_BIN_PATH
> 
> I believe the dependency needs reflected here on
> BR2_PACKAGE_EUDEV_ENABLE_HWDB?  Wouldn't that be the case?

Yes, I forgot this one. Sorry.

[...]

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
