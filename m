From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Aug 2016 13:52:40 -0700
Subject: [Buildroot] [PATCH] pinentry: fix build issue with gcc 5.x
In-Reply-To: <20160820222720.51b932bf@free-electrons.com>
References: <1471701636-30275-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <EB15F48B-6DC4-4D66-882B-C2173F06427C@gmail.com>
 <20160820222720.51b932bf@free-electrons.com>
Message-ID: <8E37DE0B-D3DF-4383-88D5-6E162B6930CF@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 20, 2016, at 1:27 PM, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> Hello,
> 
> On Sat, 20 Aug 2016 13:19:02 -0700, Khem Raj wrote:
> 
>>> +# pinentry uses some std::string functionality that needs C++11
>>> +# support when gcc >= 5.x. This should be removed when bumping
>>> +# pinentry, since newer versions no longer use std::string.
>>> +ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
>>> +PINENTRY_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
>>> +endif
>> 
>> Should this package be restricted to gcc5 and newer only, I assume
>> it will break with gcc 4.x too and c++11 may not be there, gcc5 atleast
>> has the support its just not default
> 
> We have lots of gcc 4.x toolchains, and we haven't had any build
> failure. I believe it builds fine with gcc 4.x.
> 
> The code requiring C++11 that causes the build failure with gcc 5.x is
> in libstdc++ itself. As I discussed with Yann on IRC, I don't really
> understand why some code in libstdc++ uses C++11, without gcc 5.x
> defaulting to C++11.
> 
> Maybe you have a clue?


it could be due to dual ABI in libstdc++ may be passing _GLIBCXX_USE_CXX11_ABI=0
is enough for such apps.

see https://gcc.gnu.org/onlinedocs/libstdc++/manual/using_dual_abi.html

for further reading.

You could also configure your libstdc++ to default to old ABI but I would not
recommend that.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160820/c7a25ad2/attachment.asc>
