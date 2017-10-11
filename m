From: Henrique Marks <henrique.marks@datacom.ind.br>
Date: Wed, 11 Oct 2017 19:25:22 -0300 (BRT)
Subject: [Buildroot] pre-built binary packages
In-Reply-To: <20171011235642.610fdc3d@windsurf.lan>
References: <8AE4BE7D9622DF41B76E1AD887AA1A477BB220F1@MARCM-SBS2011.marcmltd.local>
 <20171011151137.469e7fd6@windsurf.lan>
 <572050367.13476787.1507757774068.JavaMail.zimbra@datacom.ind.br>
 <20171011235642.610fdc3d@windsurf.lan>
Message-ID: <516314793.13478025.1507760722546.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
>> Here in Datacom we use "binary artifacts": when we build a package,
>> we make a tarball of the artifacts. When we want to build the
>> package, we try to use the tarball first, if the version (in the
>> tarball) matches the package version.
>> 
>> We have not contributed this solution to buildroot because it doesn't
>> seem to be possible to do this in a generic way. We have this binary
>> artifact generation for our internal packages (and all of them use
>> cmake to build). I think it is the only patch to buildroot that we
>> consider to be "eternal".
>> 
>> You can do the same for any package: you can control what's installed
>> in staging and target, and create a tarball containing these folders
>> and the stamp files. Then, use this Binary, instead of the source,
>> when the binary can be used (same source version, for instance).
>> 
>> So, a compilation in our systems always starts with a "build form
>> binaries" and then "rebuild some parts from source". That's way we
>> would like the python script that implements show-<pkg>-rrdepends to
>> be accepted upstream: combined with binary artifacts, it is possible
>> to build fast (from binaries) and rebuild fast (from source).
> 
> The problem is that you don't have any reliable way to know if your
> binary artifacts are valid for a given build or not.
> 
> Let's say you have a binary artifact of Qt5. But that artifact was
> created with a given set of Qt5 configuration options. If you change
> any Qt5 configuration option in Buildroot, then your binary artifact
> should no longer be used.
> 
> The situation becomes worse with optional dependencies. You have built
> package FOO, which optionally depends on BAR, but BAR was disabled. You
> create a binary artifact of FOO, and re-use it to avoid rebuilding.
> Later on, you enable BAR. How do you notice that your binary artifact
> of FOO is no longer correct and should be rebuilt ?
> 
> So yes, you can use binary artifact, but only if you are very, very,
> very, very, very careful, and you have a full and complete
> understanding of what you're doing. You can shoot yourself in the foot
> very easily.
> 
> Best regards,
> 

Yes, that's why it is not "upstreamable".

We have an integration process, that publish new binary artifacts for all packages and all platforms. It is extremely controlled.

But, i disagree about "shooting yourself in the foot easily": it never happened, in some YEARS using it. Or we are very special (very smart) or it is not so hard. The second option is the right one.

I would say to Marc try it. An example (qt5base.mk)

define QT5BASE_INSTALL_STAGING_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
        $(QT5_LA_PRL_FILES_FIXUP)
endef

define QT5BASE_INSTALL_TARGET_EXAMPLES
        if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
                mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
                cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
        fi
endef

define FAKE_STAGING
define FAKE_TARGET

and

use this FAKE_STAGING in place of (@D) in the STAGING part and FAKE_TARGET in the TARGET part. Something like this:

define QT5BASE_INSTALL_STAGING_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
        $(TARGET_MAKE_ENV) $(MAKE) -C $(FAKE_STAGING) install
        $(QT5_LA_PRL_FILES_FIXUP)
endef

define QT5BASE_INSTALL_TARGET_EXAMPLES
        if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
                mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
                cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
                mkdir -p $(FAKE_TARGET_DIR)/usr/lib/qt/examples ; \
                cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(FAKE_TARGET)/usr/lib/qt/examples ; \
        fi
endef

When you build, you will have these artifacts in the fake staging and target. Create a tarball (in the recipe, when building from source), and use the tarball (in the recipe, when building from binary), and that's it (put the stamp files in the tarball also, of course).

-- 
Dr. Henrique Marks
henrique.marks at datacom.ind.br
R. Am?rica, 1000 - Eldorado do Sul - RS
CEP: 92990-000 - Brasil
Fone: +55 51 3933 3000 - Ramal 3466
