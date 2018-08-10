From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 11:31:22 -0700
Subject: [Buildroot] [PATCH 4/4] scancpan: skip Dist::Zilla
In-Reply-To: <CAB0FRstkkWvw2-c6CEpxxHUTzTwQcKFcz-6Zf4o+vEyeM=AE6Q@mail.gmail.com>
References: <20180810151345.17792-1-chrismcc@gmail.com>
 <CAB0FRstkkWvw2-c6CEpxxHUTzTwQcKFcz-6Zf4o+vEyeM=AE6Q@mail.gmail.com>
Message-ID: <CALURroSaFUGAUyNyrhrT04GZC730g_1yauvTaG_5MdkwJ-Kh8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 10, 2018 at 11:12 AM, Fran?ois Perrad <francois.perrad@gadz.org>
wrote:

>
>
> 2018-08-10 17:13 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:
>
>> skip Dist::Zilla when finding dependancies
>>
>> ---
>>
>> Dist::Zilla will pull in lots of unneeded dependancies
>> ./utils/scancpan Class-Load will bring in ~250 perl-foo packages
>>
>>
> A better job will be done by :
>
> --- a/utils/scancpan
> +++ b/utils/scancpan
> @@ -595,6 +595,7 @@ sub fetch {
>              # we could use the host Module::CoreList data, because host
> perl and
>              # target perl have the same major version
>              next if ${$dep}{phase} eq q{develop};
> +            next if ${$dep}{phase} eq q{x_Dist_Zilla};
>              next if !($test && $top) && ${$dep}{phase} eq q{test};
>              my $distname = $mcpan->module( $modname )->{distribution};
>              if (${$dep}{phase} eq q{runtime}) {
> --
>

I'm far from a perl expert, I'll redo it this way.  Thanks



Fran?ois
>
>
>> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>> ---
>>  utils/scancpan | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/utils/scancpan b/utils/scancpan
>> index da8e7b91ac..1dbda7261f 100755
>> --- a/utils/scancpan
>> +++ b/utils/scancpan
>> @@ -590,6 +590,7 @@ sub fetch {
>>              next if $modname eq q{perl};
>>              next if $modname =~ m|^Alien|;
>>              next if $modname =~ m|^Win32|;
>> +           next if $modname =~ m|^Dist::Zilla|;
>>              next if !($test && $top) && $modname =~ m|^Test|;
>>              next if Module::CoreList::is_core( $modname, undef, $] );
>>              # we could use the host Module::CoreList data, because host
>> perl and
>> --
>> 2.14.4
>>
>>
>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180810/2fc0c4fc/attachment.html>
