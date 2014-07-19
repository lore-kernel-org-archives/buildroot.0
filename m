From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 19 Jul 2014 16:06:48 +0200
Subject: [Buildroot] [PATCH 05/11] dialog: Patch incorrect use of
	toupper()
In-Reply-To: <534667FF.8050807@mind.be>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-5-git-send-email-paul@crapouillou.net>
 <20140403213256.GE17328@free.fr> <533E5510.6040800@mind.be>
 <CAAXf6LUcspf0U_GUd0X3QQd+3Qb_Gj_G0hq+MjPO5iLQ5Vw5Xg@mail.gmail.com>
 <534667FF.8050807@mind.be>
Message-ID: <CAAXf6LUyRK=5v3w_Bir8SNxWjMPGF5yZjY=3Ktq_hsqruCcTRg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Apr 10, 2014 at 11:44 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 10/04/14 10:40, Thomas De Schampheleire wrote:
>> Hi,
>>
>> On Fri, Apr 4, 2014 at 8:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On 03/04/14 23:32, Yann E. MORIN wrote:
>>>> Paul, All,
>>>>
>>>> On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
> [snip]
>>>> However, this change is still corect, since it makes it explicit that we
>>>> want an unsigned char.
>>>
>>>  But then we should change all the packages that use toupper and
>>> tolower... (and also isdigit and isalnum and ...).
>>>
>>>  Basically, if toupper() asserts in this case, it's a bug in the
>>> toolchain, not in the package.
>>
>> I wouldn't classify it as a bug in the toolchain, but rather as an
>> unfortunate API choice in toupper and friends, or alternatively as an
>> unfortunate failing of the C specification to explicitly define 'char'
>> as being signed or unsigned.
>
>  Yeah, the bane of backward compatibility... Some of these functions
> existed before there were prototypes in C.
>
>
>  Still, I'd say that not allowing a negative signed char value for these
> functions is incorrect. uClibc at least _tries_ to handle it:

The man page of toupper says: (Linux man-pages)

 "If c is not an unsigned char value, or EOF, the behavior of these
functions is undefined."

According to me, the patch (http://patchwork.ozlabs.org/patch/336778/)
is a valid one. The dialog sources should only call toupper with an
unsigned char. There are different ways to fixing this, but the one
proposed in the patch seems fine.

As mentioned before, the statements made by the submitter are correct:
MIPS does indeed have a signed-char by default, it will do
sign-extension on the implicit cast from char to int.

Hence:

Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Best regards,
Thomas
