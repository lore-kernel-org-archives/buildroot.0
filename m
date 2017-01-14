From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sat, 14 Jan 2017 17:15:08 +0100
Subject: [Buildroot] host-nodejs build error
Message-ID: <d3aef230-deff-d2e5-ac94-4d09e2d1f7d5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

i'm trying to build nodejs (with the current Buildroot master), and when
icu is enabled, the build of host-nodejs fails with:

> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/numfmt.o:
> In function `icu_58::NumberFormat::format(icu_58::StringPiece const&,
> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
> const':
> numfmt.cpp:(.text+0x14a2): undefined reference to
> `icu_58::Formattable::setDecimalNumber(icu_58::StringPiece, UErrorCode&)'
> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/decimfmt.o:(.rodata._ZTVN6icu_5813DecimalFormatE[_ZTVN6icu_5813DecimalFormatE]+0x98):
> undefined reference to
> `icu_58::NumberFormat::format(icu_58::StringPiece,
> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
> const'
> /home/zgyarmati/projects/buildroot-upstream/buildroot/output/build/host-nodejs-6.9.4/out/Release/obj.host/icutools/deps/icu-small/source/i18n/rbnf.o:(.rodata._ZTVN6icu_5821RuleBasedNumberFormatE[_ZTVN6icu_5821RuleBasedNumberFormatE]+0x98):
> undefined reference to
> `icu_58::NumberFormat::format(icu_58::StringPiece,
> icu_58::UnicodeString&, icu_58::FieldPositionIterator*, UErrorCode&)
> const'
> collect2: error: ld returned 1 exit status

It seems that the compiler picks up the previously built and installed
host-icu version (which has the version 58.2 in Buildroot), but thetries
to link to the small-icu bundled with nodejs source tree (which ships
the icu version 57).

To reproduce the issue, just enable the icu and the nodejs packages and
run a build.

Did anybody see this issue before? My guess now is that adding
'--with-intl=none' to the host-node config flags would solve this (as
according to my current understanding, the i18n support not actually
used in the host nodejs), but i still have run a test build...


Thanks, regards

-- 
Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170114/c9d3a637/attachment.asc>
