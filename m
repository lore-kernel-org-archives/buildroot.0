From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Thu, 3 Oct 2019 09:28:22 +0100
Subject: [Buildroot] [PATCH 3/3] pkgconf: Configure using
 pkgconf-personality
In-Reply-To: <20191002202252.GJ10860@scaer>
References: <20191001124132.107700-1-thomas.preston@codethink.co.uk>
 <20191001124132.107700-3-thomas.preston@codethink.co.uk>
 <ed2e5703-e1df-5d4c-f29f-2fde4ba96ffc@codethink.co.uk>
 <20191002202252.GJ10860@scaer>
Message-ID: <81087355-77e9-68f1-a92f-cdef0ac569d2@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/2019 21:22, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2019-10-02 09:14 +0100, Thomas Preston spake thusly:
>> On 01/10/2019 13:41, Thomas Preston wrote:
>>> The correct way to configure pkgconf when cross-compiling is to use
>>> pkgconf-personality, rather than using environment variables. The
>>> personality is selected with a symbolic link mechanism, which we now use
>>> in the pkg-config wrapper script.
>>>
>>> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
>>> ---
>>>  package/pkgconf/pkg-config.in      | 11 +----------
>>>  package/pkgconf/pkgconf.mk         | 12 +++++++++++-
>>>  package/pkgconf/target.personality |  5 +++++
>>>  3 files changed, 17 insertions(+), 11 deletions(-)
>>>  create mode 100644 package/pkgconf/target.personality
>>>
>>> diff --git a/package/pkgconf/pkg-config.in b/package/pkgconf/pkg-config.in
>>> index 894069c492..51db4d87e1 100644
>>> --- a/package/pkgconf/pkg-config.in
>>> +++ b/package/pkgconf/pkg-config.in
>>> @@ -1,12 +1,3 @@
>>>  #!/bin/sh
>>>  PKGCONFDIR=$(dirname $0)
>>> -DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib
>>> -DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/include
>>> -DEFAULT_PKG_CONFIG_LIBDIR=${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/lib/pkgconfig:${PKGCONFDIR}/../@STAGING_SUBDIR@/usr/share/pkgconfig
>>> -DEFAULT_PKG_CONFIG_SYSROOT_DIR=${PKGCONFDIR}/../@STAGING_SUBDIR@
>>> -
>>> -PKG_CONFIG_SYSTEM_LIBRARY_PATH=${PKG_CONFIG_SYSTEM_LIBRARY_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_LIBRARY_PATH}} \
>>> -	PKG_CONFIG_SYSTEM_INCLUDE_PATH=${PKG_CONFIG_SYSTEM_INCLUDE_PATH:-${DEFAULT_PKG_CONFIG_SYSTEM_INCLUDE_PATH}} \
>>> -	PKG_CONFIG_LIBDIR=${PKG_CONFIG_LIBDIR:-${DEFAULT_PKG_CONFIG_LIBDIR}} \
>>> -	PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR:-${DEFAULT_PKG_CONFIG_SYSROOT_DIR}} \
>>> -	exec ${PKGCONFDIR}/pkgconf @STATIC@ "$@"
>>> +exec ${PKGCONFDIR}/@GNU_TARGET_NAME at -pkg-config @STATIC@ "$@"
>>
>> In fact, according to @kaniini (pkgconf maintainer), we can do away with this
>> wrapper script entirely and let the default symlink `pkg-config -> pkgconf`
>> load the default.personality. Which can be configured for the buildroot target.
> 
> We've already tried to look into the personality feature in the past,
> and we concluded back then that we could not easily use it. I don't
> remember everything about the reasons, but at least one issue is that
> packages do not expect the TUPPLE-pkg-config mechanism, and most do just
> call 'pkg-config', so we'd still need to keep our pkg-config wrapper
> anyway. As such, using the personality was not so much interesting...
> 

You can set a default.personality, which is used for the base pkg-config
link, so you could have:

	     pkg-config: default.personality
	host-pkg-config: host.personality

However, you cannot set --static in the pkgconf-personality file (yet...),
which rules out using them for now.
