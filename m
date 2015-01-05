From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Jan 2015 16:12:30 +0000
Subject: [Buildroot] [PATCH v2] gnupg2: fix linking with intl
In-Reply-To: <20150105163720.7b0efdf2@free-electrons.com>
References: <1418299611-50833-1-git-send-email-Vincent.Riera@imgtec.com>	<20141211195331.48f6f7c4@free-electrons.com>	<548B0998.5000001@imgtec.com>	<20141217095737.564714af@free-electrons.com>	<54AA99FA.5010405@imgtec.com>
 <20150105163720.7b0efdf2@free-electrons.com>
Message-ID: <54AAB7EE.40209@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 01/05/2015 03:37 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Mon, 5 Jan 2015 14:04:42 +0000, Vicente Olivert Riera wrote:
> 
>>> This problem was related to static linking, but the
>>> BR2_PREFER_STATIC_LIB option has been renamed to BR2_STATIC_LIBS (with
>>> a bogus Config.in.legacy handling done by me). So if you took the old
>>> config file, BR2_PREFER_STATIC_LIB was discarded, and you were doing a
>>> shared library build instead of a static library build, which explains
>>> why the problem was not appearing anymore.
>>
>> You were right. So now I was able to reproduce the problem, and taking
>> into account that it only happens for static builds, I think I could
>> change the patch to be like this:
>>
>> ifeq ($(BR2_PACKAGE_GETTEXT),y)
>> GNUPG2_DEPENDENCIES += gettext
>> ifneq ($(BR2_SHARED_LIBS),y)
>> GNUPG2_CONF_ENV += LIBS=-lintl
>> endif
>> endif
>>
>> What do you think?
> 
> I don't remember the entire context. Do you have a minimal defconfig
> that exhibits the problem?

Sure. Here you have it:

BR2_mipsel=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.11.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_LARGEFILE=y
BR2_TOOLCHAIN_EXTERNAL_INET_IPV6=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_TARGET_OPTIMIZATION="-pipe"
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_GNUPG2=y

it fails for both BR2_STATIC_LIBS and BR2_SHARED_STATIC_LIBS. That's why
I proposed to use...

ifneq ($(BR2_SHARED_LIBS),y)

...in the patch.

Regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
