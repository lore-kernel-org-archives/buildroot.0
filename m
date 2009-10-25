From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Oct 2009 22:40:56 +0100
Subject: [Buildroot] [RFC] Package infrastructure: make variables or make
	targets ?
Message-ID: <20091025224056.59c9a6ef@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm currently working on improving the package infrastructure for
Buildroot. Basically, the idea is to :

 1. Generalize the Makefile.autotools.in infrastructure into something
    that can be used for any type of package (not limited to packages
    built using autotools). The advantages over the current
    situation are mainly :

     * Several steps can be automated: download, extraction, patch, etc.
     * The infrastructure would hide the gory details of the stamp
       files, ensuring a more coherent handling of the build process
       throughout our package set
     * The ability to easily add pre/post operations at the various
       steps (configure, compile, install, etc.)

    Of course, this infrastructure would still let the package .mk file
    do a lot of things : specify how the package must be configured,
    built and installed.

 2. Rework the Makefile.autotools.in infrastructure so that it inherits
    from the generic package infrastructure.

I've already started prototyping a solution, but I'm facing a choice on
which I'd like to have the community opinion. Usually, I don't like
talking without showing patches, but as this choice is fairly intrusive
in the design of the new infrastructure, I don't want to start the
wrong way.

The choice is on how the individual packages .mk files should specify
the operations that must be performed at the configure, build and
install steps. We have two choices :

 1. Use make variables, such as :

======================================================================
define ICU_CONFIGURE
 $(TARGET_CONFIGURE_OPTS) \
 $(TARGET_CONFIGURE_ARGS) \
 $(TARGET_CONFIGURE_ENV) \
 ./configure \
                --target=$(GNU_TARGET_NAME) \
                --host=$(GNU_TARGET_NAME) \
                --build=$(GNU_HOST_NAME) \
                --prefix=/usr \
                --mandir=/usr/man \
                --infodir=/usr/info \
                --enable-samples
endef

define ICU_COMPILE
 make -C $(@D)/$(ICU_SUBDIR)
endef

$(eval $(call PKGTARGETS,package,icu,target))
======================================================================

    These variables are defined *before* the call to $(eval
    $(call ...)). I find this approach fairly clean. This approach
    also allows to add several hooks as a Pre/Post operation by doing
    something like : 

======================================================================
define MYPKG_PRE_CONFIGURE_DO_THIS
 foobar
endef

MYPKG_PRE_CONFIGURE_HOOKS += MYPKG_PRE_CONFIGURE_DO_THIS
======================================================================

    This approach is the one used by OpenWRT. The only drawback of this
    approach is that since the variables are defined *before* calling
    the generating function $(eval $(call ...)), we don't have access
    to any variable that could be defined by the generating function.
    So, for example, the ICU_COMPILE variable must use
    $(@D)/$(ICU_SUBDIR) as the directory for the sources, instead of
    something like $(ICU_SRCDIR) that could be defined by the package
    infrastructure. In OpenWRT, they solved this problem by having a
    "include package.mk" after the package definition (name, version,
    URL, etc.), but before the definition of the different steps. But
    in our case, this means having two $(eval $(call ...)).

 2. Use make targets, as we do today for the hooks. The make targets
    must be defined *after* the call to $(eval $(call ...)). For zlib,
    it would look like :

======================================================================
$(eval $(call PKGTARGETS,package,zlib,target))

$(ZLIB_TARGET_CONFIGURE):
        (cd $(PKGSRCDIR); rm -rf config.cache; \
                $(TARGET_CONFIGURE_ARGS) \
                $(TARGET_CONFIGURE_OPTS) \
                CFLAGS="$(TARGET_CFLAGS) $(ZLIB_PIC)" \
                ./configure \
                $(ZLIB_SHARED) \
                --prefix=/usr \
                --exec-prefix=$(STAGING_DIR)/usr/bin \
                --libdir=$(STAGING_DIR)/usr/lib \
                --includedir=$(STAGING_DIR)/usr/include \
        )
        touch $@

$(ZLIB_TARGET_BUILD):
        $(MAKE) -C $(PKGSRCDIR) all libz.a
        touch $@
======================================================================

    The advantage is that the package infrastructure can pass variables
    to these make targets (here PKGSRCDIR). However, the package
    infrastructure is much harder to write, we cannot have several
    hooks registered for the same Pre/Post operation (which makes the
    inheritance of the autotools infrastructure more difficult), and I
    find it strange to have some definitions *before* the $(eval
    $(call ...)) and some others *after*.

Thanks for your input,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
