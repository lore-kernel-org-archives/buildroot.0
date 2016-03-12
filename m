From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 12 Mar 2016 18:58:16 +0100
Subject: [Buildroot] [V2 1/2] scancpan: handle recommended dependencies
 as optional packages
In-Reply-To: <20160305164158.5e7eca18@free-electrons.com>
References: <1453409093-22012-1-git-send-email-francois.perrad@gadz.org>
 <20160305164158.5e7eca18@free-electrons.com>
Message-ID: <CAB0FRsvpFBhyRs5Y3ZuX2DV-Y79coZGnrupRo51izsMZ4H3wiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-03-05 16:41 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> Sorry for the slow answer.
>
> On Thu, 21 Jan 2016 21:44:52 +0100, Francois Perrad wrote:
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> As usual, this patch would highly benefit from a more detailed commit
> log. I've already asked you this hundreds of times: whenever a patch is
> not just a simple version bump, it *MUST* have a commit log.
>
>> -            next if !$recommend && ${$dep}{relationship} ne q{requires};
>>              my $distname = $mcpan->module( $modname )->{distribution};
>>              if (${$dep}{phase} eq q{runtime}) {
>> -                $runtime{$distname} = 1;
>> +                if (${$dep}{relationship} eq q{requires}) {
>> +                    $runtime{$distname} = 1;
>> +                }
>> +                else {
>> +                    $optional{$distname} = 1 if $recommend;
>> +                }
>
> So, if I understand well, if -recommend was passed you used to handle
> "recommend" dependencies expressed on CPAN as "generate the Buildroot
> packages for them, but don't create any dependency on them".
>
> And now, the idea is that if you pass -recommend, in additional to
> generating the Buildroot packages, it would also add some code in the
> Buildroot package to optionally depend on them. Is this correct ?
>
> Unfortunately, it doesn't seem to work for me. I've tested with this
> patch applied, and then:
>
> ./output/host/usr/bin/perl ./support/scripts/scancpan -recommend IO-Stream
>

Works for me. Try with the flag -f in order to override existing files.

Fran?ois

> According to
> https://metacpan.org/source/POWERMAN/IO-Stream-v2.0.2/META.yml,
> IO-Stream has a "recommends" on Data::Alias. I can indeed see scancpan
> creating the perl-data-alias package, but perl-io-stream doesn't
> contain any optional dependency on it. Am I doing something wrong? Is
> there something missing in your script. Here is the generated
> perl-io-stream.mk:
>
> PERL_IO_STREAM_VERSION = v2.0.2
> PERL_IO_STREAM_SOURCE = IO-Stream-$(PERL_IO_STREAM_VERSION).tar.gz
> PERL_IO_STREAM_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PO/POWERMAN
> PERL_IO_STREAM_DEPENDENCIES = host-perl-module-build-tiny perl-anyevent perl-ev
> PERL_IO_STREAM_LICENSE = MIT
> PERL_IO_STREAM_LICENSE_FILES = LICENSE
>
> $(eval $(perl-package))
>
>
>> @@ -683,6 +693,15 @@ while (my ($distname, $dist) = each %dist) {
>>          say {$fh} qq{${brname}_LICENSE = ${license}} if $license && $license ne q{unknown};
>>          say {$fh} qq{${brname}_LICENSE_FILES = ${license_files}} if $license_files;
>>          say {$fh} qq{};
>> +        foreach (sort @{$deps_optional{$distname}}) {
>> +            next if grep { $_ eq $distname; } @{$deps_runtime{$_}};     # avoid cyclic dependencies
>> +            my $opt_brname = brname( $_ );
>> +            my $opt_fsname = fsname( $_ );
>> +            say {$fh} qq{ifeq (\$(BR2_PACKAGE_PERL_${opt_brname}),y)};
>> +            say {$fh} qq{${brname}_DEPENDENCIES += ${opt_fsname}};
>> +            say {$fh} qq{endif};
>> +            say {$fh} qq{};
>
> So in Perl, dependencies are not runtime dependencies, but really build
> time dependencies ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
