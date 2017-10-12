From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 12 Oct 2017 17:24:05 +0200
Subject: [Buildroot] pre-built binary packages
In-Reply-To: <516314793.13478025.1507760722546.JavaMail.zimbra@datacom.ind.br>
References: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
 <20171011151137.469e7fd6@windsurf.lan>
 <572050367.13476787.1507757774068.JavaMail.zimbra@datacom.ind.br>
 <20171011235642.610fdc3d@windsurf.lan>
 <516314793.13478025.1507760722546.JavaMail.zimbra@datacom.ind.br>
Message-ID: <4b3756cb-23ec-48d2-63dc-0e2399c6f8ac@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi all,

On 12-10-17 00:25, Henrique Marks wrote:
[snip]
>> Let's say you have a binary artifact of Qt5. But that artifact was
>> created with a given set of Qt5 configuration options. If you change
>> any Qt5 configuration option in Buildroot, then your binary artifact
>> should no longer be used.

 If I understand Henrique correctly, what they do in such a case is that they
"manually" remove the artifact in that case, and additionally remove any package
that depends on qt5 with
make qt5-rrdepends | sed -s 's/$/-artifact.tar.gz/' | xargs rm -f

 So if you follow the rules (manually clean the artifacts and their dependencies
whenever you change anything), it works fine.

 It is of course a problem when there is a dependency that Buildroot doesn't
know about. But that will be solved with per-package staging.


>> The situation becomes worse with optional dependencies. You have built
>> package FOO, which optionally depends on BAR, but BAR was disabled. You
>> create a binary artifact of FOO, and re-use it to avoid rebuilding.
>> Later on, you enable BAR. How do you notice that your binary artifact
>> of FOO is no longer correct and should be rebuilt ?

 This one is covered by bar-rrdepends, because after the config change foo will
be in bar-rrdepends. What doesn't work, however, is the reverse: you enable
openssl and botan, you build. Then you realize you don't need openssl so you
remove it and do a clean rebuild. Now botan-rrdepends does NOT contain openssl,
so the botan artifact will be reused. You start botan and it doesn't find
openssl.so...


>> So yes, you can use binary artifact, but only if you are very, very,
>> very, very, very careful, and you have a full and complete
>> understanding of what you're doing. You can shoot yourself in the foot
>> very easily.
>>
>> Best regards,
>>
> 
> Yes, that's why it is not "upstreamable".
> 
> We have an integration process, that publish new binary artifacts for all packages and all platforms. It is extremely controlled.
> 
> But, i disagree about "shooting yourself in the foot easily": it never happened, in some YEARS using it. Or we are very special (very smart) or it is not so hard. The second option is the right one.

 First of all, you are smart because you do properly clean artifacts when needed
(except in the cases I mentioned, but perhaps you cover even those). Second, I
think that when you do have an accident, you will indeed know what was the
problem and fixed it by just removing the artifact. It's so easy you hardly
would have noticed.


 There is one more element that is tricky that Thomas didn't mention:
STAGING_DIR is full of absolute paths, so you must always build in the same
directory. Sometimes it works because almost everything is installed in
$(STAGING_DIR)/usr/lib, but there is a reasonable risk that you get into trouble
when you change the build directory.


> I would say to Marc try it. An example (qt5base.mk)
> 
> define QT5BASE_INSTALL_STAGING_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>         $(QT5_LA_PRL_FILES_FIXUP)
> endef
> 
> define QT5BASE_INSTALL_TARGET_EXAMPLES
>         if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
>                 mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
>                 cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
>         fi
> endef
> 
> define FAKE_STAGING
> define FAKE_TARGET
> 
> and
> 
> use this FAKE_STAGING in place of (@D) in the STAGING part and FAKE_TARGET in the TARGET part. Something like this:
> 
> define QT5BASE_INSTALL_STAGING_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(FAKE_STAGING) install
>         $(QT5_LA_PRL_FILES_FIXUP)

 You'll want to do the QT5_LA_PRL_FILES_FIXUP as well, no?

> endef
> 
> define QT5BASE_INSTALL_TARGET_EXAMPLES
>         if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
>                 mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
>                 cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
>                 mkdir -p $(FAKE_TARGET_DIR)/usr/lib/qt/examples ; \
>                 cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(FAKE_TARGET)/usr/lib/qt/examples ; \
>         fi
> endef

 You don't even need to do this. Just replace the definition of STAGING_DIR and
TARGET_DIR:

GLOBAL_STAGING_DIR = $(HOST_DIR)/$(STAGING_SUBDIR)
STAGING_DIR = $(if $(PKG),$($(PKG)_STAGING_DIR),$(GLOBAL_STAGING_DIR))

 Then add an install-staging-end and install-target-end step that makes a
tarball of $($(PKG)_STAGING_DIR) and extracts it into $(GLOBAL_STAGING_DIR).

 There's one problem with this global approach: there are some packages that do
tricky things, like installing stuff in host-dir during target-install.So these
will have to be worked around.

 The good news is that Thomas is (AFAIU) paid to do exactly that right now.

 Regards,
 Arnout


> When you build, you will have these artifacts in the fake staging and target. Create a tarball (in the recipe, when building from source), and use the tarball (in the recipe, when building from binary), and that's it (put the stamp files in the tarball also, of course).


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
