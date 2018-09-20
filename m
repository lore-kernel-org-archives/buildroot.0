From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 20 Sep 2018 18:43:45 +0200
Subject: [Buildroot] [PATCH v2 1/2] at: change upstream site,
 bump version
In-Reply-To: <20180920043857.pzeewbdia3tado2y@sapphire.tkos.co.il>
References: <20180918095726.50623f29@windsurf>
 <20180918213949.36376-1-giulio.benetti@micronovasrl.com>
 <20180918213949.36376-2-giulio.benetti@micronovasrl.com>
 <20180920043857.pzeewbdia3tado2y@sapphire.tkos.co.il>
Message-ID: <fea9f937-828e-618b-5719-0c1f2804e4d5@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Il 20/09/2018 06:38, Baruch Siach ha scritto:
> Hi Giulio,
> 
> On Tue, Sep 18, 2018 at 11:39:48PM +0200, Giulio Benetti wrote:
>> At is now available on a git repository at:
>> https://salsa.debian.org/debian/at
>> Main changes 3.1.16 -> 3.1.23:
>> - add support for SELinux, multiple files
>> - improve atd.service, see bug report 892819
>> - fix various bugs and warnings
>> - finalized script to release software
>>
>> So:
>> - change AT_SITE_METHOD to git pointing to release/3.1.23
>> - update tarball sha256 in hash file
>> - improved S99at script:
>>    if /var/spool is linked to /tmp, .SEQ file will be lost and atd won't
>>    work neither for a live session. Create .SEQ file if not found, warning
>>    during start that after reboot atjobs could be lost.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   package/at/S99at   |  9 +++++++++
>>   package/at/at.hash |  4 ++--
>>   package/at/at.mk   | 10 ++++++----
>>   3 files changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/package/at/S99at b/package/at/S99at
>> index 666d39b546..fb81736ae2 100755
>> --- a/package/at/S99at
>> +++ b/package/at/S99at
>> @@ -6,6 +6,15 @@
>>   umask 077
>>   
>>   start() {
>> +	# Since /va/spool can be linked to /tmp (tmpfs)
> 
> va -> var

Oops, yes.

> 
>> +	# /var/spool/cron/atjobs/.SEQ created could be not available
>> +	# Check if not exists otherwise create it
>> +	if [ ! -f /var/spool/cron/atjobs/.SEQ ]; then
>> +	    mkdir -p /var/spool/cron/atjobs/
>> +	    touch /var/spool/cron/atjobs/.SEQ
>> +	    printf "atd: Created missing .SEQ file. Probably it's in tmpfs and on reboot atjobs will be lost!\n"
>> +	fi
>> +
>>   	printf "Starting atd: "
>>   	start-stop-daemon --start --quiet --make-pidfile --pidfile /var/run/atd.pid --background --exec /usr/sbin/atd -- -f
>>   	echo "OK"
>> diff --git a/package/at/at.hash b/package/at/at.hash
>> index 22c732cc7e..e6eb26d818 100644
>> --- a/package/at/at.hash
>> +++ b/package/at/at.hash
>> @@ -1,2 +1,2 @@
>> -# From: http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at/at_3.1.16-1.dsc
>> -sha256 cb9af59c6a54edce9536ba629841055409d1f89d8ae26494727a97141fb4d5c1  at_3.1.16.orig.tar.gz
>> +# Locally calculated
>> +sha256 f5c7c8226fab0bc4e2d16a55e04d4026f3452db51fc5cbcc4bb5a3c79a79f7ef  at-release_3.1.23.tar.gz
>> diff --git a/package/at/at.mk b/package/at/at.mk
>> index 058ebac5c8..083fbbc74b 100644
>> --- a/package/at/at.mk
>> +++ b/package/at/at.mk
>> @@ -4,10 +4,11 @@
>>   #
>>   ################################################################################
>>   
>> -AT_VERSION = 3.1.16
>> -AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
>> -AT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/at
>> -# missing deps for parsetime.l
>> +AT_VERSION = release/3.1.23
>> +AT_SITE = https://salsa.debian.org/debian/at.git
>> +AT_SITE_METHOD = git
>> +# Tried to add missing deps for parsetime.l but still parallel build fails
>> +# in some case, so at the moment let's keep MAKE1
>>   AT_MAKE = $(MAKE1)
>>   AT_AUTORECONF = YES
>>   AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
>> @@ -23,6 +24,7 @@ AT_CONF_OPTS = \
>>   
>>   define AT_INSTALL_INIT_SYSV
>>   	$(INSTALL) -m 0755 -D package/at/S99at $(TARGET_DIR)/etc/init.d/S99at
>> +	
> 
> Redundant newline.

Yep

Thank you!
Best regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
