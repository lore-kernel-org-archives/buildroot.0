From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 08:45:36 +0200
Subject: [Buildroot] [PATCH 05/11] dialog: Patch incorrect use of
	toupper()
In-Reply-To: <20140403213256.GE17328@free.fr>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-5-git-send-email-paul@crapouillou.net>
 <20140403213256.GE17328@free.fr>
Message-ID: <533E5510.6040800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/14 23:32, Yann E. MORIN wrote:
> Paul, All,
> 
> On 2014-04-03 23:01 +0200, Paul Cercueil spake thusly:
>> On some platforms (e.g. MIPS), the "char" type is signed by default.
>> The problem is that toupper() takes an int as argument: a signed
>> char then gets sign-extended to 32bit, which causes an assertion
>> failure as toupper() verifies that its argument fits in 8 bits.
> 
> I could not vefrify the assertion that MIPS has signed chars.

 I think char is signed on all platforms. At least, it is on all
platforms I regularly use.

> 
> However, this change is still corect, since it makes it explicit that we
> want an unsigned char.

 But then we should change all the packages that use toupper and
tolower... (and also isdigit and isalnum and ...).

 Basically, if toupper() asserts in this case, it's a bug in the
toolchain, not in the package.


 Regards,
 Arnout

> 
>> Signed-Off-By: Paul Cercueil <paul@crapouillou.net>
>> Acked-By: Maarten ter Huurne <maarten@treewalker.org>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Regards,
> Yann E. MORIN.
> 
>> ---
>>  package/dialog/dialog-toupper.patch | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>  create mode 100644 package/dialog/dialog-toupper.patch
>>
>> diff --git a/package/dialog/dialog-toupper.patch b/package/dialog/dialog-toupper.patch
>> new file mode 100644
>> index 0000000..3fe0e19
>> --- /dev/null
>> +++ b/package/dialog/dialog-toupper.patch
>> @@ -0,0 +1,13 @@
>> +diff --git a/dlg_keys.h b/dlg_keys.h
>> +index 6a96c0f..b7b42d9 100644
>> +--- a/dlg_keys.h
>> ++++ b/dlg_keys.h
>> +@@ -31,7 +31,7 @@
>> + #define dlg_toupper(ch) towupper((wint_t)ch)
>> + #define dlg_isupper(ch) iswupper((wint_t)ch)
>> + #else
>> +-#define dlg_toupper(ch) toupper(ch)
>> ++#define dlg_toupper(ch) toupper((unsigned char)(ch))
>> + #define dlg_isupper(ch) (isalpha(ch) && isupper(ch))
>> + #endif
>> + 
>> -- 
>> 1.9.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
