From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Oct 2017 00:08:43 +0200
Subject: [Buildroot] [Patch v3 1/2] meson: new package
In-Reply-To: <20171024185704.GA14724@itchy>
References: <20171011065005.9235-1-eric.le.bihan.dev@free.fr>
 <20171011065005.9235-2-eric.le.bihan.dev@free.fr>
 <cc27e1eb-8ea7-6e2a-6748-748c017b25b2@mind.be> <20171024185704.GA14724@itchy>
Message-ID: <ab1019d9-ebf2-0708-c623-c35701023131@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-10-17 20:57, Eric Le Bihan wrote:
> Hi!
> 
> On 17-10-11 23:04:56, Arnout Vandecappelle wrote:
>> On 11-10-17 08:50, Eric Le Bihan wrote:
>>> This new package provides the host variant of the Meson Build System, an
>>> open source build system meant to be both extremely fast, and as user
>>> friendly as possible.
>>>
>>> More precisely, Meson creates configuration files for the Ninja build
>>> system.
>>>
>>> Besides building Meson, it generates a configuration file
>>> ("$(HOST_DIR)/etc/meson/cross-compilation.conf") to be used when
>>> cross-compiling a Meson-based project.
>>>
>>> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>>> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>>> ---
>>>  package/meson/cross-compilation.conf.in | 17 +++++++++++++++++
>>>  package/meson/meson.hash                |  2 ++
>>>  package/meson/meson.mk                  | 31 +++++++++++++++++++++++++++++++
>>>  3 files changed, 50 insertions(+)
>>>  create mode 100644 package/meson/cross-compilation.conf.in
>>>  create mode 100644 package/meson/meson.hash
>>>  create mode 100644 package/meson/meson.mk
>>>
>>> diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
>>> new file mode 100644
>>> index 0000000000..84b399f51f
>>> --- /dev/null
>>> +++ b/package/meson/cross-compilation.conf.in
>>> @@ -0,0 +1,17 @@
>>> +# Note: Buildroot's and Meson's terminologies differ about the meaning
>>> +# of 'build', 'host' and 'target':
>>> +# - Buildroot's 'host' is Meson's 'build'
>>> +# - Buildroot's 'target' is Meson's 'host'
>>> +
>>> +[binaries]
>>> +c = '@TARGET_CROSS at gcc'
>>> +cpp = '@TARGET_CROSS at g++'
>>> +ar = '@TARGET_CROSS at ar'
>>> +strip = '@TARGET_CROSS at strip'
>>> +pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
>>> +
>>> +[host_machine]
>>> +system = 'linux'
>>> +cpu_family ='@TARGET_ARCH@'
>>
>>  Does meson have the same definition of ARCH as we do? Does it support all our
>> ARCHes?
> 
> It goes well with the usual suspects (arm, mips, ppc, x86, ...) but I'll
> have to check for sparc, sh4 and xtensa. If needed, how should I add a
> restriction, given that there is no Config.in.host?

 Just add a Config.in.host that has BR2_PACKAGE_HOST_MESON_ARCH_DEPENDS and a
blind BR2_PACKAGE_HOST_MESON.

[snip]
> BTW, the value of the "c_args" parameter in the "properties" section of the
> cross-compilation configuration file is formatted as follow:
> 
> ```
> [properties]
> c_args = ['foo', 'bar', 'baz']

 Argh!

> ```
> 
> $(TARGET_CFLAGS) is a string like "foo bar baz". To convert it, is
> the following OK?
> 
> ```
> qlist = $(shell echo $(1) | sed -e "s/[^ ][^ ]*/'&',/g")
> 
> sed -e "s;@TARGET_CFLAGS@;$(call qlist,$(TARGET_CFLAGS));g" \
>         $(HOST_MESON_PKGDIR)/cross-compilation.conf.in \
>         > $(HOST_DIR)/etc/meson/cross-compilation.conf

 Unfortunately that's not enough since TARGET_CFLAGS might contain something
like -DFOO='"bar baz"' and your sed would break the quotes.

 What you need is:

sed -e "s%@TARGET_CFLAGS@%`printf '"%s", ' $(TARGET_CFLAGS)`%g" \
...

 Note that I used % here: we use various different delimiters for sed at the
moment, and ; is NOT one of them, so let's not add it now :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
