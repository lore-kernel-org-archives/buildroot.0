From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Mar 2017 09:36:23 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cwiid: add optional
 dependency to bluez5_utils
In-Reply-To: <20170321073124.5qynrhrg4cp5gndm@tarshish>
References: <20170321072207.5396-1-bernd.kuhls@t-online.de>
 <20170321073124.5qynrhrg4cp5gndm@tarshish>
Message-ID: <16e63a8d-e200-457d-bd74-01176c67d4fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-03-17 08:31, Baruch Siach wrote:
> Hi Bernd,
> 
> On Tue, Mar 21, 2017 at 08:22:07AM +0100, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>> v2: fix circular dependency (Arnout)
>>
>>  package/cwiid/Config.in | 2 +-
>>  package/cwiid/cwiid.mk  | 8 +++++++-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
>> index 03b7dbbcd..ed56e1084 100644
>> --- a/package/cwiid/Config.in
>> +++ b/package/cwiid/Config.in
>> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
>>  	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
>>  	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
>> -	select BR2_PACKAGE_BLUEZ_UTILS
>> +	select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS
> 
> You need to add missing bluez5_utils dependencies 
> (BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4, BR2_TOOLCHAIN_HAS_SYNC_4). Changing 
> bluez_utils to bluez5_utils in the comments above would also be nice.

 Darn, this is getting complicated... We would want to keep the dependencies as
they are, and use bluez_utils in case bluez5_utils are not available. But that
would mean something like:

	select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS \
		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
		&& BR2_TOOLCHAIN_HAS_SYNC_4
	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 \
		|| !BR2_TOOLCHAIN_HAS_SYNC_4

 Yuk...

 Perhaps a BR2_PACKAGE_BLUEZ5_UTILS_ARCH_SUPPORTS would help?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
