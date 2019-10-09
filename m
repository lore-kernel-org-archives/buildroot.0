From: Michael Walle <michael@walle.cc>
Date: Wed, 09 Oct 2019 18:04:30 +0200
Subject: [Buildroot] [PATCH v2 3/9] package/libavl: add package
In-Reply-To: <20191009142545.15c32ee6@windsurf>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
 <20191009112656.21232-4-heiko.thiery@gmail.com>
 <20191009142545.15c32ee6@windsurf>
Message-ID: <e9a70a36afb69b1f999d0894665041b7@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Actually, I've prepared that package.

Am 2019-10-09 14:25, schrieb Thomas Petazzoni:
> On Wed,  9 Oct 2019 13:26:50 +0200
> heiko.thiery at gmail.com wrote:
> 
>> From: Michael Walle <michael@walle.cc>
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
>> ---
>>  package/Config.in                      |  1 +
>>  package/libavl/0001-fix-makefile.patch | 49 
>> ++++++++++++++++++++++++++
>>  package/libavl/Config.in               | 13 +++++++
>>  package/libavl/libavl.hash             |  5 +++
>>  package/libavl/libavl.mk               | 43 ++++++++++++++++++++++
>>  5 files changed, 111 insertions(+)
>>  create mode 100644 package/libavl/0001-fix-makefile.patch
>>  create mode 100644 package/libavl/Config.in
>>  create mode 100644 package/libavl/libavl.hash
>>  create mode 100644 package/libavl/libavl.mk
> 
> And entry to the DEVELOPERS file needs to be added.

I've added myself.

>> diff --git a/package/libavl/0001-fix-makefile.patch 
>> b/package/libavl/0001-fix-makefile.patch
>> new file mode 100644
>> index 0000000000..6cc96e5f74
>> --- /dev/null
>> +++ b/package/libavl/0001-fix-makefile.patch
>> @@ -0,0 +1,49 @@
>> +makefile: fix compilation and installation
>> +
>> +This was originally taken from:
>> +https://sources.debian.org/data/main/liba/libavl/0.3.5-4/debian/patches/fix-makefile
>> +
>> +Unfortunately, the URL does not end in ".patch", therefore we cannot
>> +use it in the FOO_PATCH variable directly.
>> +
>> +Signed-off-by: Michael Walle <michael@walle.cc>
> 
> We need your Signed-off-by below this one.

So do Heiko still need his s-o-b?

> 
>> +
>> +--- a/GNUmakefile
>> ++++ b/GNUmakefile
>> +@@ -6,7 +6,8 @@
>> + LDCONFIG ?= /sbin/ldconfig
>> +
>> + # Some suggestions: (-mcpu= generates i386 compatible code)
>> +-CFLAGS ?= -O2 -fomit-frame-pointer -pipe -mcpu=i686 -w
>> ++CFLAGS ?= -O2 -pipe -Wall -Werror
>> ++CFLAGS += -fPIC
> 
> So this change is not really useful, because you anyway override
> CFLAGS. But if that's the patch as it is in Debian, please keep it
> as-is.
> 
> 
>> diff --git a/package/libavl/libavl.mk b/package/libavl/libavl.mk
>> new file mode 100644
>> index 0000000000..ad561c43bf
>> --- /dev/null
>> +++ b/package/libavl/libavl.mk
>> @@ -0,0 +1,43 @@
>> +################################################################################
>> +#
>> +# libavl
>> +#
>> +################################################################################
>> +
>> +LIBAVL_VERSION = 0.3.5
>> +LIBAVL_SITE = http://ftp.debian.org/debian/pool/main/liba/libavl
> 
> URLs on ftp.debian.org are unfortunately not stable. We use
> snapshot.debian.org instead. Do a "git grep snapshot.debian.org" in
> Buildroot to see how other packages fetching from the Debian archive
> are doing this.

Ahh I see. Will be fixed in the next version. I'll also use the snapshot 
url in the .hash comment.

>> +LIBAVL_SOURCE = libavl_$(LIBAVL_VERSION).orig.tar.gz
>> +LIBAVL_LICENSE = LGPL-2.0+
>> +LIBAVL_LICENSE_FILES = COPYING
>> +LIBAVL_INSTALL_STAGING = YES
>> +
>> +LIBAVL_CFLAGS = -fPIC
> 
> Please use:
> 
> LIBAVL_CFLAGS = $(TARGET_CFLAGS) -fPIC

will be fixed in the next version.

> 
>> +HOST_LIBAVL_CFLAGS = -fPIC
> 
> HOST_LIBAVL_CFLAGS = $(HOST_CFLAGS) -fPIC

dito

[..snip..]

> For the host build/installation, semantically speaking, the correct
> thing is:
> 
> 	prefix=$(HOST_DIR)
> 
> Indeed, we don't have any "usr" in $(HOST_DIR), and prefix indicates
> where the software will be executing from.

dito

-michael
