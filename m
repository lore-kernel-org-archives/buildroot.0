From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 8 Oct 2013 10:12:13 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] ngrep: fix static linking issue with
 libpcre
In-Reply-To: <52532B99.20204@mind.be>
Message-ID: <93031320.8180859.1381219933227.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 07/10/2013 23:46, Arnout Vandecappelle a ?crit :
>  Hi Romain,
> 
> On 10/06/13 21:59, Romain Naour wrote:
>>
>> -lpcre must be placed in LIBS
>> So, use EXTRA_LIBS variable instead of LDFLAGS
> 
>  Ideally, the commit message should explain why it should be placed in LIBS instead of LDFLAGS.

Ok, I'll be more verbose.
The reason why is that libraries must be placed after object files.

> 
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> ---
>>   package/ngrep/ngrep-1.45-configure-extra-lib.patch | 22 ++++++++++++++++++++++
>>   package/ngrep/ngrep.mk                             |  3 ++-
>>   2 files changed, 24 insertions(+), 1 deletion(-)
>>   create mode 100644 package/ngrep/ngrep-1.45-configure-extra-lib.patch
>>
>> diff --git a/package/ngrep/ngrep-1.45-configure-extra-lib.patch b/package/ngrep/ngrep-1.45-configure-extra-lib.patch
>> new file mode 100644
>> index 0000000..aeb6a39
>> --- /dev/null
>> +++ b/package/ngrep/ngrep-1.45-configure-extra-lib.patch
>> @@ -0,0 +1,22 @@
>> +
>> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> +---
>> + configure | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/configure b/configure
>> +index 621f1be..bd5649f 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -3533,7 +3533,7 @@ fi
>> +
>> + EXTRA_DEFINES=""
>> + EXTRA_INCLUDES=""
>> +-EXTRA_LIBS=""
>> ++EXTRA_LIBS ?= ""
> 
>  This is a non-Posix bashism. You'd need something like
> 
> EXTRA_LIBS=${EXTRA_LIBS:-}

Ok, thanks for the tips.

> 
>  However, why not just use the LIBS environment variable? Oh, looks like the Makefile.in is broken as well and should be patched to use @LIBS@ (which
> also removes the need for this EXTRA_LIBS hack).

I tested this but -lpcap appears twice in LIBS, but it fix the build.

> 
>  Is this project still maintained upstream? If not, don't bother creating upstreamable patches. If it is still maintained, a proper upstreamable patch
> could change configure.in to use PKG_CHECK_MODULES for libpcreposix.

It seems not maintained anymore, the last release was published in 2006 and the last commit in sourceforge is dated 2008.

Also, Gentoo seems to have a patch for this problem.
http://ftp.eenet.ee/gentoo-portage/net-analyzer/ngrep/files/ngrep-1.45.patch

Maybe just patch Makefile.in to add -lpcre beside -lpcap ?

Best regards,
Romain

> 
>  Regards,
>  Arnout
> 
>> +
>> +
>> +
>> +--
>> +1.8.4
>> +
>> diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
>> index 99b8f46..1501dab 100644
>> --- a/package/ngrep/ngrep.mk
>> +++ b/package/ngrep/ngrep.mk
>> @@ -8,7 +8,8 @@ NGREP_VERSION = 1.45
>>   NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
>>   NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
>>   NGREP_INSTALL_STAGING = YES
>> -NGREP_CONF_ENV = LDFLAGS="-lpcre"
>> +NGREP_CONF_ENV = EXTRA_LIBS="-lpcre"
>> +
>>   NGREP_CONF_OPT =  \
>>       --with-pcap-includes=$(STAGING_DIR)/usr/include \
>>       --enable-pcre \
>>
> 
> 

-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
