From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Tue, 12 Jul 2011 14:03:01 +0700
Subject: [Buildroot] [PATCH] pcsc-lite and ccid support
In-Reply-To: <20110712084323.74ff5c0c@skate>
References: <1310452089-23322-1-git-send-email-ruckuus@gmail.com>
 <20110712084323.74ff5c0c@skate>
Message-ID: <CAG7bwA+MEJDb_1tXHQ82_R7_7eCmm1fwYnE2O0DSiMBwL0USqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello again,

Thanks for the comments. My answer interpolated below.

On Tue, Jul 12, 2011 at 1:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello !
>
> Thanks for those patches. A few comments below.
>
> Le Tue, 12 Jul 2011 13:28:09 +0700,
> ruckuus at gmail.com a ?crit :
>
>> --- /dev/null
>> +++ b/package/ccid/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_CCID
>> + ? ? depends on BR2_PACKAGE_PCSC_LITE
>
> If I understood correctly ccid is a set of programs that depends on
> pcsc-lite which is a library ? If this is the case, then you should
> turn this into :
>
> ? ? ? ?select BR2_PACKAGE_PCSC_LITE
>

Understood.

> This is because we prefer to have automatic selection of required
> dependencies.
>
>> + ? ? bool "ccid"
>> + ? ? help
>> + ? ? ? ? ? ? Card reader driver
>
> The help message should be intended with one tab + 2 spaces. The
> description could also be a little bit more elaborate (which type of
> hardware is supported, etc.). And we typically include the URL of the
> project. See other packages for examples.
>

Understood.

>> +##########################################################
>> +#
>> +# CCID
>> +#
>> +# ########################################################
>> +CCID_VERSION = 5706
>> +CCID_SITE = svn://anonscm.debian.org/pcsclite/trunk/Drivers/ccid
>
> The latest ccid release is 1.4.4, dated May 2011, which doesn't seem to
> be that old. In general, we prefer using stable releases rather than
> SVN versions when possible. Do you have a good reason for choosing a
> specific SVN version instead of the latest project release ?
>

It should have been using the latest version.

The reason is somehow fuzzy for me, and I need your advise. The idea
is to keep the changes in .mk file as less as possible when there is
new release, so in above case we only need to change the CCID_VERSION
based on SVN version.

I agree to use the stable release which is in this case will look as follow:

CCID_VERSION = 1.4.4
CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
CCID_SITE = https://alioth.debian.org/frs/download.php/3579

Comparing to the previous release: 1.4.3
CCID_VERSION = 1.4.3
CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
CCID_SITE = https://alioth.debian.org/frs/download.php/3535

There will be changes in CCID_VERSION and CCID_SITE when upgrading
from 1.4.3 to 1.4.4

Please advise, should this is not reasonable

>> +CCID_INSTALL_STAGING = YES
>> +CCID_INSTALL_TARGET = YES
>> +CCID_AUTORECONF = YES
>> +CCID_DEPENDENCIES = pcsc-lite libusb
>
> If you depend on libusb here, then the CCID package should also:
>
> ? ? ? ?select BR2_PACKAGE_LIBUSB
>

Understood

>> +$(eval $(call AUTOTARGETS, package, ccid))
>> diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
>> new file mode 100644
>> index 0000000..51e32c8
>> --- /dev/null
>> +++ b/package/pcsc-lite/Config.in
>> @@ -0,0 +1,6 @@
>> +config BR2_PACKAGE_PCSC_LITE
>> + ? ? select BR2_PACKAGE_CCID
>
> Is it pcsc that depends on ccid, or ccid that depends on pcsc ?
> According to your *_DEPENDENCIES variable, it's ccid that depends on
> pcsc-lite, so the "select BR2_PACKAGE_CCID" here should go away.
>

Mmm ... actually CCID depends on PCSC. I will fix that.

>> + ? ? bool "pcsc-lite"
>> + ? ? help
>> + ? ? ? ? ? ? Middleware to be used with PC/SC
>
> Same comment as above: indentation is tab + 2 spaces, more elaborate
> description, and project URL.
>
>> +##########################################################
>> +#
>> +# PCSC-Lite
>> +#
>> +# ########################################################
>> +PCSC_LITE_VERSION = 5853
>> +PCSC_LITE_SITE = svn://anonscm.debian.org/pcsclite/trunk/PCSC
>
> Same question, SVN version really needed ?
>

Actually no. When checking out from SVN it will always get the latest version.


>> +PCSC_LITE_INSTALL_STAGING = YES
>> +PCSC_LITE_INSTALL_TARGET = YES
>> +PCSC_LITE_AUTORECONF = YES
>> +PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb
>> --enable-embedded +PCSC_LITE_DEPENDENCIES=libusb
>> +
>> +$(eval $(call AUTOTARGETS, package, pcsc-lite))
>
> Again, thanks for proposing those two packages!
>

Many thanks for your comments. This is my first attempt on buildroot,
I will try my best to accomplish it.

Best regards,
DWI
