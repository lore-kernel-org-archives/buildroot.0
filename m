From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 6 Mar 2017 00:37:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/cwiid: add optional dependency
 to bluez5_utils
In-Reply-To: <20170301222352.1f97ef44@free-electrons.com>
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
 <20170219131834.27844-2-bernd.kuhls@t-online.de>
 <20170301222352.1f97ef44@free-electrons.com>
Message-ID: <c592221b-1de8-f298-2628-c346f443c9a2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-17 22:23, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 19 Feb 2017 14:18:34 +0100, Bernd Kuhls wrote:
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> ---
>>  package/cwiid/Config.in | 2 +-
>>  package/cwiid/cwiid.mk  | 8 +++++++-
>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
>> index 03b7dbbcd..69e54f5b7 100644
>> --- a/package/cwiid/Config.in
>> +++ b/package/cwiid/Config.in
>> @@ -4,7 +4,7 @@ config BR2_PACKAGE_CWIID
>>  	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus, alsa-lib, libglib2
>>  	depends on BR2_USE_MMU # bluez_utils -> dbus, libglib2
>> -	select BR2_PACKAGE_BLUEZ_UTILS
>> +	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS
> 
> This causes a circular dependency:
> 
> package/bluez_utils/Config.in:1:error: recursive dependency detected!
> package/bluez_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ_UTILS is selected by BR2_PACKAGE_BLUEZ5_UTILS
> package/bluez5_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ5_UTILS depends on BR2_PACKAGE_BLUEZ_UTILS

 I think it's just a matter of swapping them:

select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
