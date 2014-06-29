From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 Jun 2014 15:46:28 +0200
Subject: [Buildroot] [PATCH] dhcpcd: fix build with ccache
In-Reply-To: <CAMo8BfL+StF+xmjn_xvdT+Hp7LauXWS-uBR9DLs9omv65-RYQw@mail.gmail.com>
References: <d3257052bc958700588f.1403443612@localhost>
 <CAMo8BfL+StF+xmjn_xvdT+Hp7LauXWS-uBR9DLs9omv65-RYQw@mail.gmail.com>
Message-ID: <CAAXf6LWd=QiJ3RneqR-nba8YagfOWFTSNa0o-xwc+ujwnJUL1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Jun 26, 2014 at 7:45 PM, Max Filippov <jcmvbkbc@gmail.com> wrote:
> Hi,
>
> On Sun, Jun 22, 2014 at 5:26 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> After the bump to dhcpcd 6.4.0, building dhcpcd with ccache fails at the
>> configure step:
>>
>> Using compiler .. <buildroot>/output/host/usr/bin/ccache <buildroot>/output/host/usr/bin/i686-pc-linux-gnu-gcc
>> <buildroot>/output/host/usr/bin/ccache <buildroot>/output/host/usr/bin/i686-pc-linux-gnu-gcc is not an executable
>> make: *** [<buildroot>/output/build/dhcpcd-6.4.0/.stamp_configured] Error 1
>>
>> This patch backports an upstream patch to fix this issue.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>  package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch |  32 ++++++++++++++
>>  1 files changed, 32 insertions(+), 0 deletions(-)
>>
>> diff -r a59338f65a46 -r d3257052bc95 package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch
>> --- /dev/null   Thu Jan 01 00:00:00 1970 +0000
>> +++ b/package/dhcpcd/dhcpcd-0001-fix-build-with-ccache.patch    Sun Jun 22 15:22:35 2014 +0200
>> @@ -0,0 +1,32 @@
>> +configure: support builds using ccache
>> +
>> +The configure script checks whether CC is executable by means of a check
>> +'type $CC'. However, when using ccache, CC is normally set to "ccache gcc"
>> +(using the appropriate paths). Such a compound string is not recognized by
>> +type, however, and thus configure bails out.
>> +
>> +This patch changes the check 'type $CC' with a compile test.
>> +
>> +Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> +
>> +Upstream status: another implementation was submitted, modified by
>> +maintainer Roy, then simplified based on my suggestion. This patch is a fold
>> +of the two upstream patches:
>> +http://roy.marples.name/projects/dhcpcd/info/5f4bf91142fceac502c478886aeb5079a184bb43
>> +http://roy.marples.name/projects/dhcpcd/info/26bc10be2405659bdf31d690a72d377d6b67ebd4
>> +
>> +diff -r 66c8bdc88858 configure
>> +--- a/configure        Sat Jun 21 16:54:30 2014 +0200
>> ++++ b/configure        Sun Jun 22 15:20:25 2014 +0200
>> +@@ -272,8 +272,9 @@
>> + fi
>> +
>> + echo "Using compiler .. $CC"
>> +-if ! type "$CC" >/dev/null 2>&1; then
>> +-      echo "$CC is not an executable"
>> ++if ! echo "int main(void) { return 0; }" | $CC -x c -o /dev/null - 2>/dev/null
>
> This test fails when executed with otherwise working gcc for xtensa,
> at the linking step linker needs to be able to read the object it creates.
> Please see the following thread:
> http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/87809
>
> The first quoted fix applied alone works just fine, so I'd suggest reverting the
> simplification part of this fix.

I just submitted a patch to do exactly this. Thanks for reporting!

Best regards,
Thomas
