From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Apr 2016 22:24:22 +0200
Subject: [Buildroot] [PATCH v3 1/1] ipmitool: fix musl build
In-Reply-To: <1460401961.2407.7.camel@embedded.rocks>
References: <1460282611-13740-1-git-send-email-joerg.krause@embedded.rocks>
 <570A7914.9050609@mind.be> <1460401961.2407.7.camel@embedded.rocks>
Message-ID: <570D5976.60701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/16 21:12, J?rg Krause wrote:
> On So, 2016-04-10 at 18:02 +0200, Arnout Vandecappelle wrote:
>> On 04/10/16 12:03, J?rg Krause wrote:
>>>
>>> Add two patches to fix musl build and one patch to make the package
>>> autoreconfigurable.
>>>
>>> The first patch avoids the redefinition of wchar_t by using
>>> autoconf to check
>>> for the type wchar_t. Patching configure.ac requires to set
>>> AUTORECONF = YES
>>> and add a post extract hook to create some missing files needed by
>>> autorefonf.
>>>
>>> The second patch adds missing header include of <linux/params.h>
>>> needed for the
>>> macro EXEC_PAGESIZE defined in the Linux Kernel headers.
>>>
>>> The third patch adds 'foreign' to 'AUTOMAKE_OPTIONS' to make the
>>> package
>>> autoreconfigurable.
>>>
>>> All patches send upstream:
>>> https://sourceforge.net/p/ipmitool/mailman/message/35004226/
>>> https://sourceforge.net/p/ipmitool/mailman/message/35004225/
>>> https://sourceforge.net/p/ipmitool/mailman/message/35004711/
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/75f/75fd6f1be0271bb15078c62f
>>> 3effdbb67ac07427/
>>> http://autobuild.buildroot.net/results/cac/cacf8179a9c8142eef695624
>>> 62d3c3b0b20c2879/
>>> http://autobuild.buildroot.net/results/c10/c1045882947ff7150c750088
>>> ae1981bd99134c54/
>>> http://autobuild.buildroot.net/results/6a7/6a770f8a3dddb15ba4d95555
>>> e74b198799278dcf/
>>> .. and more.
>>>
>>> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>>> ---
>>> Changes v2 -> v3:
>>>    - use the Automake foreign strictness instead of using a hook to
>>> add files
>>>      needed to make the package autoreconfigurable (Thomas
>>> Petazzoni)
>>>
>>> Changes v1 -> v2:
>>>    - use autoconf to check for wchar_t instead of using non-
>>> standardized GNU C
>>>      extension macro __WCHAR_TYPE__ (Arnout Vandecappelle)
>>>    - improve commit messages
>>>
>>> ---
>>>    .../ipmitool/0001-Avoid-wchar_t-redefinition.patch | 60
>>> ++++++++++++++++++++++
>>>    ...-Add-missing-linux-param.h-header-include.patch | 39
>>> ++++++++++++++
>>>    .../0003-Make-the-package-autoreconfigurable.patch | 38
>>> ++++++++++++++
>>>    package/ipmitool/ipmitool.mk                       |  3 ++
>>>    4 files changed, 140 insertions(+)
>>>    create mode 100644 package/ipmitool/0001-Avoid-wchar_t-
>>> redefinition.patch
>>>    create mode 100644 package/ipmitool/0002-Add-missing-linux-
>>> param.h-header-include.patch
>>>    create mode 100644 package/ipmitool/0003-Make-the-package-
>>> autoreconfigurable.patch
>>>
>>> diff --git a/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
>>> b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
>>> new file mode 100644
>>> index 0000000..b782318
>>> --- /dev/null
>>> +++ b/package/ipmitool/0001-Avoid-wchar_t-redefinition.patch
>>> @@ -0,0 +1,60 @@
>>> +From c6fe3990713fe3d2be7a285982a0690af93cc8a7 Mon Sep 17 00:00:00
>>> 2001
>>> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
>>> +Date: Sat, 2 Apr 2016 19:45:14 +0200
>>> +Subject: [PATCH 1/2] Avoid wchar_t redefinition
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=UTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +The musl C library does not define _WCHAR_T. Use autoconf to check
>>> for wchar_t.
>>> +
>>> +Upstream status: Pending
>>> +https://sourceforge.net/p/ipmitool/mailman/message/35004226/
>>> +
>>> +Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>>> +---
>>> + configure.ac             | 2 ++
>>> + src/plugins/imb/imbapi.h | 7 ++++++-
>>> + 2 files changed, 8 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/configure.ac b/configure.ac
>>> +index b92c8a4..71cb4d4 100644
>>> +--- a/configure.ac
>>> ++++ b/configure.ac
>>> +@@ -22,6 +22,8 @@ AC_CHECK_HEADERS([stdlib.h string.h sys/ioctl.h
>>> sys/stat.h unistd.h paths.h])
>>> + AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h
>>> sys/socket.h])
>>> + AC_CHECK_HEADERS([sys/byteorder.h byteswap.h])
>>> +
>>> ++AC_CHECK_TYPES([wchar_t])
>>> ++
>>> + AC_C_CONST
>>> + AC_C_INLINE
>>> + AC_C_BIGENDIAN
>>> +diff --git a/src/plugins/imb/imbapi.h b/src/plugins/imb/imbapi.h
>>> +index 74975c6..b862445 100644
>>> +--- a/src/plugins/imb/imbapi.h
>>> ++++ b/src/plugins/imb/imbapi.h
>>> +@@ -35,6 +35,11 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
>>> SUCH DAMAGE.
>>> +  *---------------------------------------------------------------
>>> -------*/
>>> + #ifndef	_WINDEFS_H
>>> + #define	_WINDEFS_H
>>> ++
>>> ++#if HAVE_CONFIG_H
>>> ++# include <config.h>
>>> ++#endif
>>> ++
>>> + #ifndef FALSE
>>> + #define FALSE   0
>>> + #endif
>>> +@@ -46,7 +51,7 @@ SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
>>> SUCH DAMAGE.
>>> + #endif
>>> + #ifndef WIN32
>>> + /* WIN32 defines this in stdio.h */
>>> +-#ifndef _WCHAR_T
>>> ++#if !defined(_WCHAR_T) && !defined(HAVE_WCHAR_T)
>>    The check for _WCHAR_T is redundant and potentially wrong (if
>> autoconf didn't
>> detect wchar_t and _WCHAR_T is still defined, something is amiss.
>> It's probably
>> better to terminate with a compiler error then).
>>
>>    That said, if upstream has accepted the patch as is, it's better to
>> keep it
>> this way.
>
> Until now there is no feedback on upstream about this issue. I guess
> this piece of code is just a copy & paste from the stdlib.h. You're
> probably right about the redundancy. Shall I make a v4 which only
> checks for HAVE_WCHAR_T?

  Yeah, I think that's better. And of course propose your new version upstream 
as well.


>
>>>
>>> + #define _WCHAR_T
>>    Why is this needed? I can't see how this could ever lead to
>> something good...
>> But I guess that's upstream's problem.
>
> It's not needed. I agree, it's upstreams problem :-)

  Perhaps propose an additional patch upstream that removes that define. But for 
buildroot we don't need that.

  Regards,
  Arnout

>
> Best regards
> J?rg Krause
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
