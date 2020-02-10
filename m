From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Feb 2020 14:14:08 +0100
Subject: [Buildroot] [PATCH 2/3] package/automake: also include
 autoconf-archive in search paths
In-Reply-To: <122439f4768d20854faa230c873ea664@walle.cc>
References: <cover.1581261155.git.yann.morin.1998@free.fr>
 <e78e62c9d171941a0c8c8a93ba73d3edade4a9b1.1581261155.git.yann.morin.1998@free.fr>
 <20200209152441.GP23769@scaer> <d1521ad22c5023eb516919647f00798f@walle.cc>
 <122439f4768d20854faa230c873ea664@walle.cc>
Message-ID: <3dad5906-9e8a-a682-e0af-cbabf1f2331c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/02/2020 14:09, Michael Walle wrote:
> Am 2020-02-10 14:06, schrieb Michael Walle:
>> Hi Yann,
>>
>> Am 2020-02-09 16:24, schrieb Yann E. MORIN:
>>> All,
>>>
>>> On 2020-02-09 16:12 +0100, Yann E. MORIN spake thusly:
>>>> Since d255b67972 (autotools: do not overwrite first include path), the
>>>> ordering of include paths has changed: the system directories are
>>>> specified with explicit options passed to autoreconf, which means that
>>>> any directory specified in the package _AUTORECONF_OPTS are no longer
>>>> first:
>>>>
>>>> ? - in package/autoconf/autoconf.mk, we define AUTORECONF as:
>>>> ??? AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I
>>>> "$(ACLOCAL_HOST_DIR)"
>>>>
>>>> ? - in package/pkg-autotools.mk, we call AUTORECONF with:
>>>> ??? $($(PKG)_AUTORECONF_ENV) $(AUTORECONF) $($(PKG)_AUTORECONF_OPTS)
>>>>
>>>> For a package that needs autoconf-archive, this means that it has to
>>>> provide a custom include directive, in its own _AUTORECONF_OPTS. This in
>>>> turn means that this directory becomes the first, and goes directly
>>>> opposite to what d255b67972 was supposed to accomplish.
>>>>
>>>> However, the path to the autoconf archive macro directory is mnot
>>>> searched by default either, so a package has no way to add such an
>>>> aclocal include directive.
>>>>
>>>> We can only add it in the global search directory, and we do so only for
>>>> those packages that have autoconf-archive in their dependencies.
>>>>
>>>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>>>> Cc: Michael Walle <michael@walle.cc>
>>>> Cc: Heiko Thiery <heiko.thiery@gmail.com>
>>>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>>> Cc: Peter Korsgaard <peter@korsgaard.com>
>>>> ---
>>>> ?package/automake/automake.mk | 8 +++++++-
>>>> ?1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
>>>> index 89dcaa1293..238116cb94 100644
>>>> --- a/package/automake/automake.mk
>>>> +++ b/package/automake/automake.mk
>>>> @@ -33,5 +33,11 @@ $(eval $(host-autotools-package))
>>>> ?AUTOMAKE = $(HOST_DIR)/bin/automake
>>>> ?ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
>>>> ?ACLOCAL = $(HOST_DIR)/bin/aclocal
>>>> -ACLOCAL_PATH = $(ACLOCAL_DIR):$(ACLOCAL_HOST_DIR)
>>>> +ACLOCAL_PATH = $(subst $(space),:,$(strip \
>>>> +??? $(ACLOCAL_DIR) \
>>>> +??? $(ACLOCAL_HOST_DIR) \
>>>> +??? $(if $(filter host-autoconf-archive,$($(PKG)_FINAL_ALL_DEPENDENCIES)),\
>>>> +??????? $(HOST_DIR)/share/autoconf-archive \
>>>> +??? ) \
>>>> +))
>>>
>>> This makes check-package whine because it is not indented. Sigh...
>>> Indenting with a TAB fixes the check-package error, and is still a
>>> working fix.
>>
>> This makes me wonder why these are installed into share/autoconf-archive
>> instead of $(ACLOCAL_HOST_DIR) in the first place. Eg. on my debian system
>> all the macros of autoconf-archive are installed to /usr/share/aclocal.
> 
> Ok, to answer this myself:
> ?
> https://git.buildroot.net/buildroot/commit/?id=2c490f00c8d8a7d34ed6da9130cef8a5e97cef56
> 
> 
> Still, maybe this has changed over time and there is no such bug anymore?

 No, such issues in packages are unavoidable. autoconf-macros routinely breaks
"API", which is OK because it's assumed to be vendored into the package source code.

 I believe Debian never uses it when a package is built, so they don't have that
problem.


 Regards,
 Arnout
