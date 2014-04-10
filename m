From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Apr 2014 11:44:31 +0200
Subject: [Buildroot] [PATCH 05/11] dialog: Patch incorrect use of
	toupper()
In-Reply-To: <CAAXf6LUcspf0U_GUd0X3QQd+3Qb_Gj_G0hq+MjPO5iLQ5Vw5Xg@mail.gmail.com>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-5-git-send-email-paul@crapouillou.net>
 <20140403213256.GE17328@free.fr> <533E5510.6040800@mind.be>
 <CAAXf6LUcspf0U_GUd0X3QQd+3Qb_Gj_G0hq+MjPO5iLQ5Vw5Xg@mail.gmail.com>
Message-ID: <534667FF.8050807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/04/14 10:40, Thomas De Schampheleire wrote:
> Hi,
> 
> On Fri, Apr 4, 2014 at 8:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 03/04/14 23:32, Yann E. MORIN wrote:
>>> Paul, All,
>>>
>>> On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
[snip]
>>> However, this change is still corect, since it makes it explicit that we
>>> want an unsigned char.
>>
>>  But then we should change all the packages that use toupper and
>> tolower... (and also isdigit and isalnum and ...).
>>
>>  Basically, if toupper() asserts in this case, it's a bug in the
>> toolchain, not in the package.
> 
> I wouldn't classify it as a bug in the toolchain, but rather as an
> unfortunate API choice in toupper and friends, or alternatively as an
> unfortunate failing of the C specification to explicitly define 'char'
> as being signed or unsigned.

 Yeah, the bane of backward compatibility... Some of these functions
existed before there were prototypes in C.


 Still, I'd say that not allowing a negative signed char value for these
functions is incorrect. uClibc at least _tries_ to handle it:

[libc/misc/ctype/ctype.c]
#ifdef __UCLIBC_HAS_CTYPE_SIGNED__

#if EOF >= CHAR_MIN
#define CTYPE_DOMAIN_CHECK(C) \
        (((unsigned int)((C) - CHAR_MIN)) <= (UCHAR_MAX - CHAR_MIN))
#else
#define CTYPE_DOMAIN_CHECK(C) \
        ((((unsigned int)((C) - CHAR_MIN)) <= (UCHAR_MAX - CHAR_MIN)) ||
((C) == EOF))
#endif

#else  /* __UCLIBC_HAS_CTYPE_SIGNED__ */

#if EOF == -1
#define CTYPE_DOMAIN_CHECK(C) \
        (((unsigned int)((C) - EOF)) <= (UCHAR_MAX - EOF))
#else
#define CTYPE_DOMAIN_CHECK(C) \
        ((((unsigned int)(C)) <= UCHAR_MAX) || ((C) == EOF))
#endif

#endif /* __UCLIBC_HAS_CTYPE_SIGNED__ */



 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout@mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
