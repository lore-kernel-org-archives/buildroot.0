From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 3 Mar 2017 23:47:24 +0100
Subject: [Buildroot] [PATCH 1/1] dc3dd: new package
In-Reply-To: <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
References: <1488607456-30096-1-git-send-email-benoit.allard@greenbone.net>
 <043238f2-3640-b9c7-c86b-28c31e8c44d5@mind.be>
Message-ID: <04969ea8-3890-4d14-3cb5-0e944a872653@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-03-17 23:42, Arnout Vandecappelle wrote:
>  Hi Benoit,
> 
>  Strange timezone you live in, GMT+32 or something like that? :-)
> 
> On 04-03-17 07:04, Beno?t Allard wrote:
>> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> [snip]
>> diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
>> new file mode 100644
>> index 0000000..0a2a32e
>> --- /dev/null
>> +++ b/package/dc3dd/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_DC3DD
>> +	bool "dc3dd"

 Also, it fails to build on musl, and uses threads. Use the test-pkg script to
pre-test on the autobuilder toolchains, it just takes an hour or so on an
average speed computer.


 Regards,
 Arnout

>> +	help
>> +          dc3dd is a patch to the GNU dd program, this version has several
>> +          features intended for forensic acquisition of data. Highlights
>> +          include hashing on-the-fly, split output files, pattern writing, a
> 
>  Help text should wrap at 72 columns where the tab counts for 8, so this is 4
> characters too many...
> 
>> +          progress meter, and file verification.
>> +
>> +          https://sourceforge.net/projects/dc3dd/
>> diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
>> new file mode 100644
>> index 0000000..edd75c2
>> --- /dev/null
>> +++ b/package/dc3dd/dc3dd.hash
>> @@ -0,0 +1,2 @@
>> +# From https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2.646/dc3dd%207.2.646/
>> +sha1 3d3d9ba5f3b18fbf4798e1f3554f2d34d0ce5e2c dc3dd-7.2.646.zip
> 
>  If only a weak hash is available upstream, please add a locally calculated sha256.
> 
>> diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
>> new file mode 100644
>> index 0000000..5a25bee
>> --- /dev/null
>> +++ b/package/dc3dd/dc3dd.mk
>> @@ -0,0 +1,19 @@
>> +################################################################################
>> +#
>> +# dc3dd
>> +#
>> +################################################################################
>> +
>> +DC3DD_VERSION = 7.2.646
> 
>  There is a version 7.2.641 which is identical except that it has an older (!)
> Changelog, and a different version number...
> 
>> +DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).zip
> 
>  and that version has a proper tar.xz.
> 
>> +DC3DD_SITE = http://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION)/dc3dd%20$(DC3DD_VERSION)
>> +DC3DD_LICENSE = GPLv3
> 
>  I didn't do a full fossology but it looks like all files have the 'or later'
> clause, so it's GPLv3+
> 
>> +DC3DD_LICENSE_FILES = COPYING
>> +
>> +define DC3DD_EXTRACT_CMDS
>> +        $(UNZIP) -d $(@D)/.. $(DL_DIR)/$(DC3DD_SOURCE) || true
> 
>  || true? You want to succeed in case of failure?
> 
>  Also, we normally extract within $(@D) and then move the result. Cfr. e.g. espeak.
> 
>> +        chmod a+x $(@D)/configure
>> +        chmod a+x $(@D)/build-aux/install-sh
> 
>  The tar.xz has execute permission set on all files. Not sure if that's an
> improvement :-)
> 
> 
>  Regards,
>  Arnout
> 
>> +endef
>> +
>> +$(eval $(autotools-package))
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
