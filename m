From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Aug 2018 00:52:11 +0200
Subject: [Buildroot] [RFC PATCH 1/2] scancpan: support more licenses
In-Reply-To: <20180813211659.GG7915@scaer>
References: <20180813131135.32651-1-chrismcc@gmail.com>
 <20180813131135.32651-2-chrismcc@gmail.com>
 <20180813185453.5b8bae4a@windsurf>
 <CALURroRRC9sPBLeAuv4=0XOwgGvnEZchKU03xxPtgn0Uheik3Q@mail.gmail.com>
 <20180813211659.GG7915@scaer>
Message-ID: <22f25d06-9990-f00d-8028-efaef267300f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-08-18 23:16, Yann E. MORIN wrote:
> Christopher, All,
> 
> On 2018-08-13 10:35 -0700, Christopher McCrory spake thusly:
>> On Mon, Aug 13, 2018 at 9:54 AM, Thomas Petazzoni < [1]thomas.petazzoni@bootlin.com> wrote:
>>   > +? ? ? ? $license =~ s|lgpl|LGPL-2.1|;
>>   Just "lgpl" always means it's LGPL-2.1 ?
>> Apparently
> 
> IANAL...
> 
> Usually, if any license of the GPL familly is used without any version
> specified, then it means just any version can be used:

 But that is not the case here. In this case, it's most likely an incomplete
manifest, not a package that is actually under any GPL version.

 So instead, scancpan should issue a warning.

 I have the feeling that the licenses mentioned in perl packages are not very
reliable, unless it is "perl".

> 
>     https://www.gnu.org/licenses/gpl.html
> 
>     14. Revised Versions of this License.
> 
>     [...]  If the Program does not specify a version number of the GNU
>     General Public License, you may choose any version ever published
>     by the Free Software Foundation.
> 
> Similar clauses can be had for each license. So I doubt 'lgpl' would
> stand for LGPL-2.1.
> 
> Besides, see below...
> 
>>   > +? ? ? ? $license =~ s|bsd|BSD|;
>>   "BSD" is not a license. There are several different BSD licenses.
>>   Though with just "bsd" as an initial information, there's not much you
>>   can do :-/
>>
>> yea :(
>> AFAICT, this is the source from Base.pm
> 
> What 'Base.pm' are you talink about? On my Ubuntu 17.10, I get:
> 
>     $ apt-file search /Base.pm |wc -l
>     191
> 
>> ? my %licenses = (
>> ??? perl???????? => 'Perl_5',
>> ??? apache?????? => 'Apache_2_0',
>> ??? apache_1_1?? => 'Apache_1_1',
>> ??? artistic???? => 'Artistic_1',
>> ??? artistic_2?? => 'Artistic_2',
>> ??? lgpl???????? => 'LGPL_2_1',
>> ??? lgpl2??????? => 'LGPL_2_1',
>> ??? lgpl3??????? => 'LGPL_3_0',
>> ??? bsd????????? => 'BSD',
>> ??? gpl????????? => 'GPL_1',
>> ??? gpl2???????? => 'GPL_2',
>> ??? gpl3???????? => 'GPL_3',
>> ??? mit????????? => 'MIT',
>> ??? mozilla????? => 'Mozilla_1_1',
>> ??? restrictive? => 'Restricted',
>> ??? open_source? => undef,
>> ??? unrestricted => undef,
>> ??? unknown????? => undef,
>> ? );
>>
>> ?# TODO - would be nice to not have these here, since they're more
>> ? # properly stored only in Software::License
>> ? my %license_urls = (
>> ??? perl???????? => 'http://dev.perl.org/licenses/',
>> ??? apache?????? => 'http://apache.org/licenses/LICENSE-2.0',
>> ??? apache_1_1?? => 'http://apache.org/licenses/LICENSE-1.1',
>> ??? artistic???? => 'http://opensource.org/licenses/artistic-license.php',
>> ??? artistic_2?? => 'http://opensource.org/licenses/artistic-license-2.0.php',
>> ??? lgpl???????? => 'http://opensource.org/licenses/lgpl-license.php',
>> ??? lgpl2??????? => 'http://opensource.org/licenses/lgpl-2.1.php',
>> ??? lgpl3??????? => 'http://opensource.org/licenses/lgpl-3.0.html',
>> ??? bsd????????? => 'http://opensource.org/licenses/bsd-license.php',
>> ??? gpl????????? => 'http://opensource.org/licenses/gpl-license.php',
>> ??? gpl2???????? => 'http://opensource.org/licenses/gpl-2.0.php',
>> ??? gpl3???????? => 'http://opensource.org/licenses/gpl-3.0.html',
>> ??? mit????????? => 'http://opensource.org/licenses/mit-license.php',
>> ??? mozilla????? => 'http://opensource.org/licenses/mozilla1.1.php',
>> ??? restrictive? => undef,
>> ??? open_source? => undef,
>> ??? unrestricted => undef,
>> ??? unknown????? => undef,
>> ? );
> 
> And at the same time, still on my Ubuntu 17.10, I was looking at
> /usr/share/perl/5.26.0/CPAN/Meta/Converter.pm, which has;
> 
>     # The "old" values were defined by Module::Build, and were often vague.
>     # I have
>     # made the decisions below based on reading Module::Build::API and how
>     # clearly
>     # it specifies the version of the license.
>     my %license_map_2 = (
>       (map { $_ => $_ } @valid_licenses_2),
>       apache      => 'apache_2_0',  # clearly stated as 2.0
>       artistic    => 'artistic_1',  # clearly stated as 1
>       artistic2   => 'artistic_2',  # clearly stated as 2
>       gpl         => 'open_source', # we don't know which GPL; punt
>       lgpl        => 'open_source', # we don't know which LGPL; punt
>       mozilla     => 'open_source', # we don't know which MPL; punt

 That sounds correct :-)

 Regards,
 Arnout

>       perl        => 'perl_5',      # clearly Perl 5
>       restrictive => 'restricted',
>     );
> 
> So... The resolution is not that clear-cut IMNSHO...
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
