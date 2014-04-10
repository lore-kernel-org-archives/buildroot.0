From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Apr 2014 10:40:51 +0200
Subject: [Buildroot] [PATCH 05/11] dialog: Patch incorrect use of
	toupper()
In-Reply-To: <533E5510.6040800@mind.be>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-5-git-send-email-paul@crapouillou.net>
 <20140403213256.GE17328@free.fr> <533E5510.6040800@mind.be>
Message-ID: <CAAXf6LUcspf0U_GUd0X3QQd+3Qb_Gj_G0hq+MjPO5iLQ5Vw5Xg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Apr 4, 2014 at 8:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/04/14 23:32, Yann E. MORIN wrote:
>> Paul, All,
>>
>> On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
>>> On some platforms (e.g. MIPS), the "char" type is signed by default.
>>> The problem is that toupper() takes an int as argument: a signed
>>> char then gets sign-extended to 32bit, which causes an assertion
>>> failure as toupper() verifies that its argument fits in 8 bits.
>>
>> I could not vefrify the assertion that MIPS has signed chars.
>
>  I think char is signed on all platforms. At least, it is on all
> platforms I regularly use.

This is not correct.
MIPS and x86 have signed char as default, while ARM and PPC have
unsigned char by default.
Take into account that the compiler can be told to switch the default,
using -fsigned-char or -funsigned-char.


>>
>> However, this change is still corect, since it makes it explicit that we
>> want an unsigned char.
>
>  But then we should change all the packages that use toupper and
> tolower... (and also isdigit and isalnum and ...).
>
>  Basically, if toupper() asserts in this case, it's a bug in the
> toolchain, not in the package.

I wouldn't classify it as a bug in the toolchain, but rather as an
unfortunate API choice in toupper and friends, or alternatively as an
unfortunate failing of the C specification to explicitly define 'char'
as being signed or unsigned.

Best regards,
Thomas
