From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Wed, 12 Jul 2017 08:55:31 -0700
Subject: [Buildroot] [PATCH] package/qt5: bump latest version to 5.9.1
In-Reply-To: <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
References: <1499796056-841-1-git-send-email-joshua.henderson@microchip.com>
 <7248234a-60d3-3bf5-0954-ff0442609136@mind.be>
Message-ID: <69cf264e-bb78-3823-e165-5a3378806741@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On 07/11/2017 05:45 PM, Arnout Vandecappelle wrote:
>  Hi Joshua,
> 
>  Quick review before you resubmit.
> 
>  When you resubmit, make sure you send it together with the qt5wayland change as
> one series, since that patch depends on this one.

There is no logical reason why the qt5wayland patch should depend on this.  However,
it accidentally and technically does (i.e. hash file) and maybe some compilation
issues with 5.8.0.  I think it makes most sense to keep that separate, but at the
same time it probably doesn't make sense to spend effort on it for 5.8.0 seeing that
this patch is trying to remove it.  So you're spot on, that should go in the series.

> 
> 
> On 11-07-17 20:00, Joshua Henderson wrote:
>> Qt 5.9 is a Long Term Support version [1].
>>
> 
>  You should keep the original author of this patch, as well as their
> Signed-off-by statements. You lost that now, but you can set it back with "git
> --amend --author='Brent Sink <brents_3@hotmail.com>'"

I am the original author of this patch since 5.9.0-beta, with contributions from
Julien and also some preliminary changes based on Julien's feedback.  Whatever needs
to happen I'm fine with it, and I do realize I'm causing some mess by posting this
late.  Is the general rule that if somebody else hits the mailing list first they
should be the "author" of a similar patch?  How does this work?

> 
>> This removes the following patch only for 5.9.1 that have been upstreamed:
>> - qt5webkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch [2]
>>
>> [1] https://www.qt.io/qt5-9/
>> [2] https://github.com/qt/qtwebkit/commit/548380af096f8277e460383c81a4ecdf2b77523f
>>
>> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
>> Cc: Julien Corjon <corjon.j@ecagroup.com>
>> Cc: Brent Sink <brents_3@hotmail.com>
>>
>> ---
> 
>  Please keep a log of the changes from previous versions of this patch below the
> --- line. Also, mark the patch as v4, by passing "-v4" on the git format-patch
> command line.
> 

OK. Can you please point me to the previous other 2 versions?

>>
>> Notes:
>>
>> Some license file changes are involved, a new dependency on pcre2, and some
>> filename changes.  qt5webkit popped back into the picture for 5.9.1 after
>> being absent for 5.9.0 "officially."
> 
>  All this should be in the commit message, not just in the notes.
> 
>  Also, it would be nice if you could add hashes for the license files. But that
> should be a separate patch then.

I do think this is a separate patch issue.  Worth noting that next version will
finish up several missed license file changes that happened in 5.9.0.

> 
>>
>> QT5_SNAPSHOTS_SITE is not currently used with this commit, and it's URL points
>> to a non-existent location.
> 
>  Then it's better to remove it (and mention that in the commit log).
> 

OK.

>>  .../qt5webkit/0002-Remove-TEXTREL-tag-in-x86.patch | 85 ----------------------
>>  .../5.6.2/0002-Remove-TEXTREL-tag-in-x86.patch     | 85 ++++++++++++++++++++++
> 
>  Please add the -M option to git format-patch, so this is detected as a rename only.

This is my error.

> 
>  Also, why are the other two patches in qt5webkit not moved? Do they still apply
> to 5.9.1?

Yes.

>> index 63c7f8f..5932d41 100644
>> --- a/package/qt5/qt5base/Config.in
>> +++ b/package/qt5/qt5base/Config.in
>> @@ -1,9 +1,12 @@
>>  config BR2_PACKAGE_QT5BASE
>>  	bool "qt5base"
>>  	select BR2_PACKAGE_ZLIB
>> -	select BR2_PACKAGE_PCRE
>> -	select BR2_PACKAGE_PCRE_16
>> -	select BR2_PACKAGE_PCRE_UTF
>> +	select BR2_PACKAGE_PCRE if BR2_PACKAGE_QT5_VERSION_5_6
>> +	select BR2_PACKAGE_PCRE_16 if BR2_PACKAGE_QT5_VERSION_5_6
>> +	select BR2_PACKAGE_PCRE_UTF if BR2_PACKAGE_QT5_VERSION_5_6
>> +	select BR2_PACKAGE_PCRE2 if BR2_PACKAGE_QT5_VERSION_LATEST
>> +	select BR2_PACKAGE_PCRE2_16 if BR2_PACKAGE_QT5_VERSION_LATEST
>> +	select BR2_PACKAGE_PCRE2_32 if BR2_PACKAGE_QT5_VERSION_LATEST
> 
>  Are you sure it needs pcre2_32 now?

No. :)  So, I originally had a separate pcre2 patch that was a bit different than
the one that got upstreamed.  This is fallout from that I believe.

>> +ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
>> +#  * -system-pcre because pcre is mandatory to build Qt, and we
>> +#    want to use the one packaged in Buildroot
>> +#    with Qt5.9 pcre should be > 10.20 (pcre2)
>> +QT5BASE_CONFIGURE_OPTS += -system-pcre
> 
>  So this option no longer exists in 5.9.1? Then it should be removed from line
> 26, as well as the comment there.
> 

I will double check with 5.9.1, but this was originally found to be removed in
some version of QT between 5.8.0 and 5.9.1.

Josh
