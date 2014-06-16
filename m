From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Jun 2014 20:54:44 +0200
Subject: [Buildroot] [PATCH 1/2] support/script/scancpan: populates
 Config.in with homepage
In-Reply-To: <539F3B3D.9000401@mind.be>
References: <1402851561-23157-1-git-send-email-francois.perrad@gadz.org>
 <539F3B3D.9000401@mind.be>
Message-ID: <539F3D74.4000605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/14 20:45, Arnout Vandecappelle wrote:
> On 06/15/14 18:59, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Scratch that, I have a comment:

> 
>  Regards,
>  Arnout
> 
>> ---
>>  support/scripts/scancpan | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/support/scripts/scancpan b/support/scripts/scancpan
>> index d8723f3..bf0aaa5 100755
>> --- a/support/scripts/scancpan
>> +++ b/support/scripts/scancpan
>> @@ -577,6 +577,7 @@ while (my ($distname, $dist) = each %dist) {
>>      mkdir $dirname unless -d $dirname;
>>      if ($need_target{$distname} && ($force || !-f $cfgname)) {
>>          my $abstract = $dist->{abstract};
>> +        my $homepage = $dist->{resources}->{homepage} || qq{https://metacpan.org/release/${distname}};
>>          say qq{write ${cfgname}} unless $quiet;
>>          open my $fh, q{>}, $cfgname;
>>          say {$fh} qq{config BR2_PACKAGE_${brname}};
>> @@ -585,8 +586,10 @@ while (my ($distname, $dist) = each %dist) {
>>              my $brdep = brname( fsname( $dep ) );
>>              say {$fh} qq{\tselect BR2_PACKAGE_${brdep}};
>>          }
>> -        say {$fh} qq{\thelp} if $abstract;
>> +        say {$fh} qq{\thelp};
>>          say {$fh} qq{\t  ${abstract}} if $abstract;
>> +        say {$fh} qq{\t  } if $abstract;

 There shouldn't be any leading whitespace here, so just make it:

         say {$fh} qq{\t  ${abstract}\n} if $abstract;

(if that is perlish enough).

>> +        say {$fh} qq{\t  ${homepage}};
>>          close $fh;
>>      }
>>      if ($force || !-f $mkname) {
>>
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
