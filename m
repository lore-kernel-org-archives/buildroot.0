Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AA5C433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 13:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F13C541129;
	Fri,  8 Apr 2022 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id veqRBc3azh50; Fri,  8 Apr 2022 13:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF0384048A;
	Fri,  8 Apr 2022 13:23:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A8E661BF314
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 13:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9769560AB0
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 13:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPIHh3BIC3bc for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 13:23:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 316A560AA7
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 13:23:01 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 991FDC9A47FB;
 Fri,  8 Apr 2022 15:22:59 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 08 Apr 2022 13:22:59 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <eb0cfc91-7c2b-875f-9e2d-a8e8a0a8291f@mind.be>
References: <20220331132230.227424-1-br015@umbiko.net>
 <eb0cfc91-7c2b-875f-9e2d-a8e8a0a8291f@mind.be>
Message-ID: <9d97e0d4e0d90badb3339638aa7e453d@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.5 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: explicitly disable
 features to avoid collision with host packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?Q?J=C3=B6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout,

Thank you for taking a look.

On 2022-04-04 17:38, Arnout Vandecappelle wrote:
> On 31/03/2022 15:22, Andreas Ziegler wrote:
>> Background
>> During configuration, the meson build system tries to determine the
>> availability of optional dependencies using (host) pkgconfig and cmake 
>> in that
>> order. If a library does not exist on the target, pkg-config will 
>> fail, but
>> cmake sometimes finds and reports libraries that exist as host 
>> packages. This
>> has been observed for host-expat (cmake dependency) and host-zlib. The 
>> link
>> step subsequently fails, because necessary files are not present in 
>> the target
>> architecture.
>> 
>> Unconditionally disable optional features often found in host binaries 
>> and
>> modify the menu selection processing in mpd.mk to re-enable them where
>> necessary. Currently this concerns expat and zlib only.
>> 
>> This fixes the following build errors:
>> 
>> [expat]
>> /home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: 
>> warning: libc.so.6, needed by 
>> /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7, not found (try 
>> using -rpath or -rpath-link)
>> /home/data/buildroot.x86_64/host/lib/gcc/x86_64-buildroot-linux-uclibc/11.2.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld: 
>> /home/data/buildroot.x86_64/host/lib/libexpat.so.1.8.7: undefined 
>> reference to `__errno_location@GLIBC_2.2.5'
>> 
>> [zlib]
>> http://autobuild.buildroot.net/results/f0a/f0a9e719114f19dc9d20622ed85dd4f8e968c20f/
>> 
>> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
>> ---
>>   package/mpd/mpd.mk | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>> 
>> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
>> index 12da36098f..4e67c9428c 100644
>> --- a/package/mpd/mpd.mk
>> +++ b/package/mpd/mpd.mk
>> @@ -14,6 +14,7 @@ MPD_LICENSE_FILES = COPYING
>>   # these refer to the FreeBSD PPP daemon
>>   MPD_IGNORE_CVES = CVE-2020-7465 CVE-2020-7466
>>   MPD_SELINUX_MODULES = mpd
>> +# These features are either unwanted or not selectable via the 
>> Buildroot menu
>>   MPD_CONF_OPTS = \
>>   	-Daudiofile=disabled \
>>   	-Ddocumentation=disabled \
>> @@ -21,6 +22,12 @@ MPD_CONF_OPTS = \
>>   	-Dpipewire=disabled \
>>   	-Dsnapcast=false
>>   +# Explicitly disable features where meson's dependency detection 
>> picks up host
>> +# libraries. These settings can be overridden through menu options 
>> later
>> +MPD_CONF_OPTS += \
>> +	-Dexpat=disabled \
>> +	-Dzlib=disabled
> 
>  It would be better to make these automatic conditional dependencies,
> like it's done for ICU.

Good idea, but inclusion of ICU should be initiated by Config.in, like 
every other feature.

>> +
>>   # Zeroconf support depends on libdns_sd from avahi.
>>   ifeq ($(BR2_PACKAGE_MPD_AVAHI_SUPPORT),y)
>>   MPD_DEPENDENCIES += avahi
>> @@ -300,11 +307,11 @@ ifeq ($(BR2_PACKAGE_MPD_UPNP_PUPNP),y)
>>   MPD_DEPENDENCIES += \
>>   	expat \
> 
>  That would also allow to remove this (it will be done implicitly
> since expat is selected in Config.in and the automatic dependency will
> add it).
> 
>>   	libupnp
>> -MPD_CONF_OPTS += -Dupnp=pupnp
>> +MPD_CONF_OPTS += -Dupnp=pupnp -Dexpat=enabled
>>   else ifeq ($(BR2_PACKAGE_MPD_UPNP_NPUPNP),y)
>>   MPD_DEPENDENCIES += \
>>   	libnpupnp
>> -MPD_CONF_OPTS += -Dupnp=npupnp
>> +MPD_CONF_OPTS += -Dupnp=npupnp -Dexpat=enabled
> 
>  This is wrong: no dependency on expat is added so expat may not even
> be selected or built at this point.

Actually, the dependency is inherited from libnpupnp, but you are right, 
this handling is not intuitive.

>  Marked as Changes Requested.

Outline of the proposed next version of this change:

[I did not want to make so many changes, but you are right, it makes 
sense.]

Separate logic from implementation: Remove feature dependencies from 
mpd.mk and put selection logic into Config.in exclusively.

In the makefile, a feature is responsible only to select or deselect its 
configure option and, if this feature relies on a library, add a 
dependency on this.

Duplicated selection logic in mpd.mk will be eliminated. A build 
dependency will only be added if it is present in the mpd configuration, 
and not be inherited accidentally from concurrent packages.

This impacts the following features: expat, id3tag, yajl. id3tag already 
is half implemented, but not used consistently (has an option entry in 
Config.in, but does not select this, but handles dependencies 
individually). expat and yajl would be created as hidden options without 
visibility (no user interaction necessary).

Separate vorbis decoder and encoder options; currently the decoder 
feature BR2_PACKAGE_MPD_VORBIS enables both ogg/vorbis decoding and 
ogg/vorbis encoding, which is probably not intended.

Create entry 'unicode' for ICU in Config.in.

Set zlib to disabled (not used currently).

Thoughts?

Kind regards,
Andreas

>  Regards,
>  Arnout
> 
>>   else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
>>   MPD_CONF_OPTS += -Dupnp=disabled
>>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
