From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Thu, 17 Sep 2015 18:16:42 +0300 (IDT)
Subject: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
 runtime
In-Reply-To: <20150917150112.GR11632@tarshish>
References: <1442501193-6059-1-git-send-email-yba@tkos.co.il>
 <20150917150112.GR11632@tarshish>
Message-ID: <alpine.DEB.2.02.1509171814510.13941@orcam81.orcam.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,
See inlines...

On Thu, 17 Sep 2015, Baruch Siach wrote:

> Date: Thu, 17 Sep 2015 18:01:12 +0300
> From: Baruch Siach <baruch@tkos.co.il>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/2] Add dependency on bash to gzip for
>     runtime
> 
> Hi Yonatan,
>
> On Thu, Sep 17, 2015 at 05:46:32PM +0300, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> The GNU gzip package provides eleven executable files, all but one of
>> which are bash shell scripts. If we allow inclusion of gzip without
>> bash, then on executing commands such as lxc-checkconfig that actually
>> use these shell scripts, you will get errors like 'zgrep: not found',
>> even though the zgrep executable is in PATH.
>
> Which /bin/sh shell show this problem?
>
> On my host the command
>
>   busybox sh /bin/zgrep pattern file.gz
>
> and also
>
>   dash /bin/zgrep pattern file.gz
>
> work as expected.

You tested *all* of the scripts or just this one? What if ash breaks even 
*one*?

  - yba


> baruch
>
>> This patch also sharpens up the help text and eliminates the claim to
>> provide gzcat.
>>
>> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
>> ---
>>  package/gzip/Config.in |   13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/package/gzip/Config.in b/package/gzip/Config.in
>> index a251425..9e2dc0d 100644
>> --- a/package/gzip/Config.in
>> +++ b/package/gzip/Config.in
>> @@ -1,11 +1,14 @@
>>  config BR2_PACKAGE_GZIP
>>  	bool "gzip"
>> -	depends on BR2_USE_WCHAR
>> +	depends on BR2_USE_WCHAR && BR2_PACKAGE_BASH
>>  	help
>> -	  Standard GNU compressor. Provides things like gzip,
>> -	  gunzip, gzcat, etc...
>> +	  The GNU implementation of gzip (http://www.gzip.org).
>> +	  Provides: gunzip, gzexe, gzip, zcat, zcmp, zdiff, zforce,
>> +	  zgrep, zless, zmore, and znew. All of the executables except
>> +	  gzip are Bourne-Again shell scripts. Busybox provides a gzip
>> +	  applet.
>>
>>  	  http://www.gnu.org/software/gzip/gzip.html
>>
>> -comment "gzip needs a toolchain w/ wchar"
>> -	depends on !BR2_USE_WCHAR
>> +comment "gzip needs bash and a toolchain w/ wchar"
>> +	depends on !BR2_USE_WCHAR || !BR2_PACKAGE_BASH
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
