From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 May 2016 22:10:53 +0200
Subject: [Buildroot] [PATCH 16/34] reproducibility/lzo: forbid lzo with
 reproducible builds
In-Reply-To: <20160507222556.0b498615@free-electrons.com>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-16-git-send-email-gilles.chanteperdrix@xenomai.org>
 <20160507222556.0b498615@free-electrons.com>
Message-ID: <99723b97-bc2d-c63b-6601-b7ed2987fa20@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/16 22:25, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 30 Apr 2016 09:49:12 +0200, Gilles Chanteperdrix wrote:
>> The lzo archive contains a timestamp.
>
> Missing Signed-off-by line.
>
>> ---
>>  fs/tar/Config.in | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/fs/tar/Config.in b/fs/tar/Config.in
>> index 63663ec..7e4b603 100644
>> --- a/fs/tar/Config.in
>> +++ b/fs/tar/Config.in
>> @@ -33,6 +33,7 @@ config BR2_TARGET_ROOTFS_TAR_LZMA
>>
>>  config BR2_TARGET_ROOTFS_TAR_LZO
>>  	bool "lzo"
>> +	depends on !BR2_REPRODUCIBLE
>>  	help
>>  	  Do compress the tarball with lzop.
>>
>> @@ -43,6 +44,12 @@ config BR2_TARGET_ROOTFS_TAR_XZ
>>
>>  endchoice
>>
>> +if BR2_REPRODUCIBLE
>> +
>> +comment "lzo compression is only available with non-reproducible builds"
>> +
>> +endif
>
> When we are in such situations, we normally do:
>
> comment "blablabla"
> 	depends on BR2_REPRODUCIBLE
>
> however, in this specific case, I would simply not bother adding a
> comment. If we start adding a comment for everything that is not
> suitable for reproducible builds, we're going to add hundreds of them I
> believe.

  IMHO, it should be different: things that are not reproducible should not be 
excluded, but instead a comment should be shown to warn the user the build is 
not reproducible. Perhaps like for legacy: a config option that is not 
reproducible selects BR2_NOT_REPRODUCIBLE (a blind option), and at the bottom of 
the top level menu we add a comment that depends on BR2_REPRODUCIBLE && 
BR2_NOT_REPRODUCIBLE. It will be a bit tricky to find out exactly which option 
is the one that triggers this comment, but it's doable by searching for 
BR2_NOT_REPRODUCIBLE and seeing which one in the long list of selectors is y.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
