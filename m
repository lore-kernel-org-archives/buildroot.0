From: Daniel Mack <daniel@zonque.org>
Date: Sat, 14 Jan 2017 17:42:28 +0100
Subject: [Buildroot] host-nodejs build error
In-Reply-To: <d3aef230-deff-d2e5-ac94-4d09e2d1f7d5@gmail.com>
References: <d3aef230-deff-d2e5-ac94-4d09e2d1f7d5@gmail.com>
Message-ID: <94b39784-d710-99ac-f65c-41e4d26ed4fc@zonque.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 01/14/2017 05:15 PM, Zoltan Gyarmati wrote:
> i'm trying to build nodejs (with the current Buildroot master), and when
> icu is enabled, the build of host-nodejs fails with:
> 
>> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/numfmt.o:
>> In function `icu_58::NumberFormat::format(icu_58::StringPiece const&,
>> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
>> const':
>> numfmt.cpp:(.text+0x14a2): undefined reference to
>> `icu_58::Formattable::setDecimalNumber(icu_58::StringPiece, UErrorCode&)'
>> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/decimfmt.o:(.rodata._ZTVN6icu_5813DecimalFormatE[_ZTVN6icu_5813DecimalFormatE]+0x98):
>> undefined reference to
>> `icu_58::NumberFormat::format(icu_58::StringPiece,
>> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
>> const'
>> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/rbnf.o:(.rodata._ZTVN6icu_5821RuleBasedNumberFormatE[_ZTVN6icu_5821RuleBasedNumberFormatE]+0x98):
>> undefined reference to
>> `icu_58::NumberFormat::format(icu_58::StringPiece,
>> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
>> const'
>> collect2: error: ld returned 1 exit status
> 
> It seems that the compiler picks up the previously built and installed
> host-icu version (which has the version 58.2 in Buildroot), but thetries
> to link to the small-icu bundled with nodejs source tree (which ships
> the icu version 57).
> 
> To reproduce the issue, just enable the icu and the nodejs packages and
> run a build.
> 
> Did anybody see this issue before? My guess now is that adding
> '--with-intl=none' to the host-node config flags would solve this (as
> according to my current understanding, the i18n support not actually
> used in the host nodejs), but i still have run a test build...

I have the same issue, and fixed it in my local tree by dropping
--shared-zlib from package/nodejs/nodejs.mk. I didn't post a patch yet
because I don't really understand the root cause and I had no time yet
to investigate.

[My rough guess was that this has to do with cyclic dependencies and the
linker picking up the objects in the wrong order. After all, the object
it complains about is present in the archive, and the removal of
--shared-zlib fixes the issue by accident. But I might be wrong.]

Could you try if that helps your build as well?


Thanks,
Daniel
