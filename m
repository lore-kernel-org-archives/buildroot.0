From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 22:22:17 -0600
Subject: [Buildroot] [NEXT 02/26] cpe-info: update manual for new pkg
 vars
In-Reply-To: <20180227224343.14ad0df8@windsurf.lan>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-3-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227224343.14ad0df8@windsurf.lan>
Message-ID: <CANQCQpaZySBwhoqJESrGOde25Qs6Nn=odRLShCg3DbzDAxQjLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 27, 2018 at 3:43 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 26 Feb 2018 20:10:17 -0600, Matt Weber wrote:
>> Provide guidance on setting up the <pkgname>_CPE_ID
>> and <pkgname>_CVE_PATCHED variables.
>> ---
>>  docs/manual/adding-packages-generic.txt | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
>> index 63ea51b..635c5d2 100644
>> --- a/docs/manual/adding-packages-generic.txt
>> +++ b/docs/manual/adding-packages-generic.txt
>> @@ -453,6 +453,21 @@ information is (assuming the package name is +libfoo+) :
>>    FLAT binary format is only 4k bytes. If the application consumes more stack,
>>    append the required number here.
>>
>> +* +LIBFOO_CPE_ID+ is a space-separated list of the package's Common Product
>> +  Enumeration (CPE) identification string(s).
>
> So you can have mutiple entries in this list ? In which cases ?

Yeah, there is a trend toward a single but at this point (at least
where I currently work) we don't take the chance of missing a miss
mapped CVE because someone updated the old one.  Eventually this will
end up as a single ID longterm.

Few I've ran into so far: gzip, e2fsprogs, util-linux, hostapd,
wpa_supplicant, libzip, nginx

>
>> +  +make cpe-info+ copies all of these into a +cpe-manifest.csv+ file.
>> +  This variable is optional. If it is not defined, +unknown+ will appear in
>> +  the +CPI ID+ field of the manifest file for this package.
>
> Side question: is this manifest.csv file generated in some standardized
> format, or is it just some CSV format you can up with, just like we did
> for legal-info ?

CSV similar to legal-info with enough metadata to go produce a CPE if
the ID is set to unknown.

From your other email about using the infra, maybe we still build the
CPE ID in the pkg .mk but I could add a infra helper to build the
default pkg name and version piece to simplify the duplication.  Maybe
one for that and another for the default vendor, name and version
where they just match the buildroot values.

>
>> +  To identify a package's possible CPE(s), the National Vunerability
>> +  Database can be searched at https://nvd.nist.gov/products/cpe/search.
>> +
>> +* +LIBFOO_CVE_PATCHED+ is a space-separated list of the package's Common
>> +  Vunerability Enumeration (CVE) identification strings.  This list
>> +  represents patches applied to the package beyond the current version,
>> +  which may fix CVEs.
>
> I find this description a bit unclear. Indeed LIBFOO_CVE_PATCHED
> doesn't "represents patches". Instead it "Enumerates CVEs that are
> fixed by patches added in Buildroot". We can perhaps expand and say
> that it allows the CPE reporting mechanism to know that a given CVE is
> fixed, even if Buildroot is not using an upstream release that has the
> CVE fixed.

My original statement is unclear, I'll update per the suggestion.

Matt
