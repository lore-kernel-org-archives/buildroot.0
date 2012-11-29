From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 19:22:14 +0100
Subject: [Buildroot] Problem building libglib2
In-Reply-To: <20121129190813.5dc97298@skate>
References: <CAE21AQquyvDfegH5f8FebeE8LFTnOY3r75Yuy6ZpWs72uD80MQ@mail.gmail.com>
 <201211291121.46456.manningc2@actrix.gen.nz> <50B72AAB.2020402@mind.be>
 <201211300652.45293.manningc2@actrix.gen.nz> <20121129190813.5dc97298@skate>
Message-ID: <50B7A7D6.5090607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/12 19:08, Thomas Petazzoni wrote:
> Dear Charles Manning,
>
> On Fri, 30 Nov 2012 06:52:44 +1300, Charles Manning wrote:
>>>    Maybe there's something fishy in your environment.  Can you run
>>> env | grep /lib
>>
>> Aaaarrrrggghhhh!!!!
>>
>> I have this system set up to automatically set up for openembedded.
>>   That defines PKG_CONFIG_PATH and adds some stuff to PATH which is probably
>> messing things up.
>>
>> I turned off the openembedded auto configuration, nuked output/ and make ran
>> to completion.
>>
>> I have now also learned a lot more about digging around in buildroot.
>
> Wait, wait, could you please reproduce the problem, and reply to
> Arnout's questions (sending us the output of env | grep /lib, or even
> the entire output of env if it doesn't contain any sensitive
> information).
>
> I would like to this which environment variable was causing the
> problem, and if we can add a check in Buildroot for this environment
> variable, in order to avoid similar issues in the future.

  After a second look in config.log:

pkg_cv_DBUS1_CFLAGS='-I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include/dbus-1.0 
-I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include  '
pkg_cv_DBUS1_LIBS='-L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib -ldbus-1 -lpthread -lrt  '
pkg_cv_LIBFFI_CFLAGS=' '
pkg_cv_LIBFFI_LIBS='-L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib -lffi  '
pkg_cv_ZLIB_CFLAGS='-I/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/include  '
pkg_cv_ZLIB_LIBS='-L/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib -lz  '


  I really don't see how this can happen: we unexport PKG_CONFIG_PATH and set
PKG_CONFIG explicitly in the Makefile...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
