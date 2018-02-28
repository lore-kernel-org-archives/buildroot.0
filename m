From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 22:00:31 -0600
Subject: [Buildroot] [NEXT 06/26] boa: add CPE id
In-Reply-To: <20180227231718.090c22ef@windsurf.lan>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231718.090c22ef@windsurf.lan>
Message-ID: <CANQCQpbM3VHid2rGTFAA=HwkhsUfmHRbGw9EDtT2dPUWwQRDog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 27, 2018 at 4:17 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 26 Feb 2018 20:10:21 -0600, Matt Weber wrote:
>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>> ---
>>  package/boa/boa.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/boa/boa.mk b/package/boa/boa.mk
>> index d8bcaa1..1ded702 100644
>> --- a/package/boa/boa.mk
>> +++ b/package/boa/boa.mk
>> @@ -8,7 +8,7 @@ BOA_VERSION = 0.94.14rc21
>>  BOA_SITE = http://www.boa.org
>>  BOA_LICENSE = GPL-2.0+
>>  BOA_LICENSE_FILES = COPYING
>> -
>> +BOA_CPE_ID = $(BOE_NAME):$(BOE_NAME):$(BOE_VERSION)
>
> Typo: BOE -> BOA
>
> Also, please keep an empty line before BOA_INSTALL_TARGET_CMDS.
>

Noted, will fix in v2

[snip]
> There is clearly a pattern, no?
>
> Does it make sense to define in the infra:
>
> $(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)
> $(2)_CPE_ID_NAME ?= $$($(2)_NAME)
> $(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
> $(2)_CPE_ID ?= $($(2)_CPE_ID_VENDOR):$($(2)_CPE_ID_NAME):$($(2)_CPE_ID_VERSION)
>
> With this, in many packages, you can avoid <pkg>_CPE_ID completely. In
> a few other packages you'll have to do:
>
> LIBZLIB_CPE_ID_VENDOR = gnu
> LIBZLIB_CPE_ID_NAME = zlib
>

Where it gets difficult is when a package has multiple CPEs so that
you catch all possible combinations that could be relevant for the
package.  Eventually there shouldn't be multiple once the dictionary
at NIST is cleaned up......

One thing I didn't think about with the multiple CPEs is the logic to
detect if a CPE needs updating in the CPE dictionary.  We'd have to
look at all possible CPE id options to see if any match.  This may
lead to us wanting to push to update the primary CPE ID sooner then
later and align all our packages to use it instead of supporting
multiple.  Then we could use the logic of having all packages set the
LIBZLIB_CPE_ID_VENDOR and key off that to know we report that packages
info.

> The drawback is obviously that all packages will suddenly have a
> <pkg>_CPE_ID value, even if this value may potentially be incorrect
> because it hasn't been checked. And this may be a real problem, so
> probably your solution is better, I just wanted to point out the
> (admittedly limited) duplication.

Yeah, eventually I'd argue we could revert back to infra logic and
clean it all up once there is a baseline or majority of packages with
valid CPE IDs.    However for now, I default those we don't have to
unknown so it's clear for a developer to go research or request a new
CPE.

Matt
