From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 23:50:15 +0200
Subject: [Buildroot] [PATCH v2] package/exiv2: cleanup options and
 licenses
In-Reply-To: <20190526223638.43122149@windsurf>
References: <20190508103129.100751-1-nicolas.serafini@sensefly.com>
 <20190526223638.43122149@windsurf>
Message-ID: <2ae7ca95-3cca-4be4-3aee-96eb194124d8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/05/2019 22:36, Thomas Petazzoni wrote:
> Hello Nicolas,
> 
> Thanks for the patch!
> 
> On Wed, 8 May 2019 10:32:21 +0000
> Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:
> 
>> exiv2 no longer requires a commercial option for lens database
>> integration since version 0.27.
>>
>> Legacy handling for the removed options _COMMERCIAL and _LENSDATA is
>> not needed, since now they are always enabled.
> 
> While I understand the reasoning for the removal of the _COMMERCIAL
> option, I don't understand the relationship with the removal of the
> _LENSDATA option. Why is this option removed and the installation of
> lens data made mandatory ?
> 
> And if there's a reason for it, why is it done as part of the patch
> dropping the _COMMERCIAL option ?

 This was discussed in v1 of the patch (and indeed should have been part of the
commit log).

The BR2_PACKAGE_EXIV2_LENSDATA option only existed as a separate option because
of hte license concerns (incompatibility with the commercial license). Since
these concerns have gone away, and the license database is only 80KB, remove
this option as well.

 It could have been done in a separate patch, but since anyway the help text
would have to change in this patch, I think it's not worth splitting off.

 Regards,
 Arnout

> 
>> diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
>> index f99cb8cb87..b753c03854 100644
>> --- a/package/exiv2/exiv2.hash
>> +++ b/package/exiv2/exiv2.hash
>> @@ -1,3 +1,4 @@
>>  # Locally calculated
>>  sha256 1b3766b2c203ce213a4195de14d61694017ec1a69d15d4575bccecef130990fe exiv2-0.27.1.tar.gz
>>  sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
>> +sha256 46cde7dc11e64c78d650b4851b88f6704b4665ff60f22a1caf68ceb15e217e5b COPYING-CMAKE-SCRIPTS
>> diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
>> index ba9d9b7303..c557c08fb8 100644
>> --- a/package/exiv2/exiv2.mk
>> +++ b/package/exiv2/exiv2.mk
>> @@ -7,27 +7,16 @@
>>  EXIV2_VERSION = 0.27.1
>>  EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
>>  EXIV2_INSTALL_STAGING = YES
>> +EXIV2_LICENSE = GPL-2.0+ BSD-3-Clause
> 
> The proper separator for the _LICENSE variable is a comma, i.e:
> 
> EXIV2_LICENSE = GPL-2.0+, BSD-3-Clause
> 
> I can fix that when applying, but I'd like to understand the rationale
> for the removal of the _LENSDATA option.
> 
> Thanks!
> 
> Thomas
> 
