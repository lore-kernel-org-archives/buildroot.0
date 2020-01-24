From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Fri, 24 Jan 2020 11:31:04 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump to version 12.14.1
In-Reply-To: <CADvTj4qNBoJBm1nPfKJ+=0qBWda+-XSU2LQ=FD0WHaYHF-_TsQ@mail.gmail.com>
References: <20200121023242.94475-1-james.hilliard1@gmail.com>
 <b25a1221-50a0-4915-9b73-1b304f033f87@codethink.co.uk>
 <CADvTj4qNBoJBm1nPfKJ+=0qBWda+-XSU2LQ=FD0WHaYHF-_TsQ@mail.gmail.com>
Message-ID: <791e6cb2-07c0-3da5-76a4-749a598adab4@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,
Thanks for getting back to me.

On 23/01/2020 21:03, James Hilliard wrote:
> I thought that issue was caused by the ICU 65.1 bump, not the nodejs bump.
> 
> I have a pending pull request to nodejs that might fix this issue by
> the way https://github.com/nodejs/node/pull/31433.
> 

It looks more like a header conflict to me - nodejs should be using the
bundled icu-small but buildroot makes it use the host-icu package headers.
Maybe the discrepancy is because of the ICU 65.1 bump though...

Unfortunately I'm unable to reliably reproduce it with different combinations
of the the following conditions:
- Upstream
- Reverted ae1efb62e7 package/nodejs: bump to version 12.14.1
- Reverted e2a2fab11b package/icu: bump to version 65-1

But I still see it sometimes...

>> In file included from ../deps/icu-small/source/i18n/unicode/decimfmt.h:39:0,
>>                  from ../deps/icu-small/source/i18n/number_types.h:11,
>>                  from ../deps/icu-small/source/i18n/number_decimalquantity.h:14,
>>                  from ../deps/icu-small/source/i18n/numparse_types.h:11,
>>                  from ../deps/icu-small/source/i18n/number_currencysymbols.cpp:12:
>> /home/br-user/output/host/include/unicode/numfmt.h:271:27: error:   overriding ?virtual icu_65::NumberFormat* icu_65::NumberFormat::clone() const?
>>      virtual NumberFormat* clone() const = 0;
>>                            ^~~~~
> 

All the headers are from icu-small except unicode/numfmt.h, which is from
buildroot output/host.

This is one of the build commands:

/home/br-user/output/host/bin/ccache /usr/bin/g++ \
	-o /home/br-user/output/build/host-nodejs-12.14.0/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/zonemeta.o ../deps/icu-small/source/i18n/zonemeta.cpp '-DV8_DEPRECATION_WARNINGS' '-DV8_IMMINENT_DEPRECATION_WARNINGS' '-DU_I18N_IMPLEMENTATION=1' '-DU_ATTRIBUTE_DEPRECATED=' '-D_CRT_SECURE_NO_DEPRECATE=' '-DU_STATIC_IMPLEMENTATION=1' '-DUCONFIG_NO_SERVICE=1' '-DU_ENABLE_DYLOAD=0' '-DU_HAVE_STD_STRING=1' '-DUCONFIG_NO_BREAK_ITERATION=0' \
	-I/home/br-user/output/host/include \
	-I/home/br-user/output/host/include/openssl \
	-I../deps/icu-small/source/i18n \
	-I../deps/icu-small/source/common  \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m32 \
	-Wno-deprecated-declarations \
	-Wno-strict-aliasing \
	-O3 \
	-fno-omit-frame-pointer \
	-fno-exceptions \
	-std=gnu++1y \
	-frtti-MMD \
	-MF /home/br-user/output/build/host-nodejs-12.14.0/out/Release/.deps//home/br-user/output/build/host-nodejs-12.14.0/out/Release/obj.target/icui18n/deps/icu-small/source/i18n/zonemeta.o.d.raw \
	-I/home/br-user/output/host/include \
	-O2 \
	-I/home/br-user/output/host/include \
	-c

There's a few things fishy;
1. Three instances of `-I/home/br-user/output/host/include`
2. The -MF argument is wrong, looks like an absolute path got copied
   somewhere it shouldn't have.

What we want is for `-I../deps/icu-small/source/i18n` to take priority
so that the bundled icu-small is used instead of the host-icu package
headers.
