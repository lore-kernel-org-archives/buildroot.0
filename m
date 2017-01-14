From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 14 Jan 2017 19:47:26 +0100
Subject: [Buildroot] host-nodejs build error
In-Reply-To: <94b39784-d710-99ac-f65c-41e4d26ed4fc@zonque.org>
References: <d3aef230-deff-d2e5-ac94-4d09e2d1f7d5@gmail.com>
 <94b39784-d710-99ac-f65c-41e4d26ed4fc@zonque.org>
Message-ID: <4af28c7c-8c20-f3f6-adb0-c9520f249af2@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel & All,


On 01/14/2017 05:42 PM, Daniel Mack wrote:
> Hi,
>
> On 01/14/2017 05:15 PM, Zoltan Gyarmati wrote:
>> i'm trying to build nodejs (with the current Buildroot master), and when
>> icu is enabled, the build of host-nodejs fails with:
>>
>>> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/numfmt.o:
>>> In function `icu_58::NumberFormat::format(icu_58::StringPiece const&,
>>> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
>>> const':
>>> numfmt.cpp:(.text+0x14a2): undefined reference to
>>> `icu_58::Formattable::setDecimalNumber(icu_58::StringPiece, UErrorCode&)'
>>> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/decimfmt.o:(.rodata._ZTVN6icu_5813DecimalFormatE[_ZTVN6icu_5813DecimalFormatE]+0x98):
>>> undefined reference to
>>> `icu_58::NumberFormat::format(icu_58::StringPiece,
>>> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
>>> const'
>>> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/rbnf.o:(.rodata._ZTVN6icu_5821RuleBasedNumberFormatE[_ZTVN6icu_5821RuleBasedNumberFormatE]+0x98):
>>> undefined reference to
>>> `icu_58::NumberFormat::format(icu_58::StringPiece,
>>> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
>>> const'
>>> collect2: error: ld returned 1 exit status
>> It seems that the compiler picks up the previously built and installed
>> host-icu version (which has the version 58.2 in Buildroot), but thetries
>> to link to the small-icu bundled with nodejs source tree (which ships
>> the icu version 57).
>>
>> To reproduce the issue, just enable the icu and the nodejs packages and
>> run a build.
>>
>> Did anybody see this issue before? My guess now is that adding
>> '--with-intl=none' to the host-node config flags would solve this (as
>> according to my current understanding, the i18n support not actually
>> used in the host nodejs), but i still have run a test build...
> I have the same issue, and fixed it in my local tree by dropping
> --shared-zlib from package/nodejs/nodejs.mk. I didn't post a patch yet
> because I don't really understand the root cause and I had no time yet
> to investigate.
>
> [My rough guess was that this has to do with cyclic dependencies and the
> linker picking up the objects in the wrong order. After all, the object
> it complains about is present in the archive, and the removal of
> --shared-zlib fixes the issue by accident. But I might be wrong.]
>
> Could you try if that helps your build as well?

indeed, removing  --shared-zlib fixes (or at least works around) the
issue, but on the other hand with '--with-intl=none' the host-nodejs
also builds properly.

Actually I think adding the '--with-intl=none' is a better solution (as
it's explicitly targeting the issue and also saves some build time)
unless we find a proof that the host-nodejs needs the i18n support.
Could you please also test this on your build config?

Thx,

Zoltan Gyarmati
https://zgyarmati.de



>
>
> Thanks,
> Daniel
>


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170114/53e1f306/attachment.asc>
