From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Mar 2013 16:12:22 +0100
Subject: [Buildroot] [git commit] libcap: Add optional support for
	libattr capabilities
In-Reply-To: <CAG2jQ8it65FVV8zQJ+mSUqMpSQ1LCQ=K8ojA71n83T=XigYnfg@mail.gmail.com>
 (Markos Chandras's message of "Tue, 19 Mar 2013 15:01:07 +0000")
References: <20130319121032.26CD49AE30@busybox.osuosl.org>
 <CAG2jQ8it65FVV8zQJ+mSUqMpSQ1LCQ=K8ojA71n83T=XigYnfg@mail.gmail.com>
Message-ID: <87txo7v2y1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:

 Markos> On 19 March 2013 12:10, Peter Korsgaard <jacmet@sunsite.dk> wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=1bf3d6f8cf3a2dca9ce1c6f3e68b077724f21db6
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> libcap can optionally link to libattr to support extra
 >> file capabilities. Link to this library and pull it as
 >> dependency if BR2_PACKAGE_ATTR is selected.
 >> 
 >> [Peter: use LIBCAP_ prefix on variable]
 >> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
 >> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 >> ---
 >> package/libcap/libcap.mk |   18 +++++++++++++-----
 >> 1 files changed, 13 insertions(+), 5 deletions(-)
 >> 
 >> diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
 >> index dcd3a18..6adac73 100644
 >> --- a/package/libcap/libcap.mk
 >> +++ b/package/libcap/libcap.mk
 >> @@ -15,19 +15,27 @@ LIBCAP_LICENSE_FILES = License
 >> LIBCAP_DEPENDENCIES = host-libcap
 >> LIBCAP_INSTALL_STAGING = YES
 >> 
 >> +ifeq ($(BR2_PACKAGE_ATTR),y)
 >> +       LIBCAP_DEPENDENCIES += attr
 >> +       LIBCAP_HAVE_LIBATTR = yes
 >> +else
 >> +       LIBCAP_HAVE_LIBATTR = no
 >> +endif
 >> +
 >> define LIBCAP_BUILD_CMDS
 >> $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 >> -               LIBATTR=no BUILD_CC="$(HOSTCC)" BUILD_CFLAGS="$(HOST_CFLAGS)"
 >> +               LIBATTR=$(LIBCAP_HAVE_LIBATTR) BUILD_CC="$(HOSTCC)" \
 >> +               BUILD_CFLAGS="$(HOST_CFLAGS)"
 >> endef
 >> 
 >> define LIBCAP_INSTALL_STAGING_CMDS
 >> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(STAGING_DIR) \
 >> -               prefix=/usr lib=lib install
 >> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
 >> +               DESTDIR=$(STAGING_DIR) prefix=/usr lib=lib install
 >> endef
 >> 
 >> define LIBCAP_INSTALL_TARGET_CMDS
 >> -       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=no DESTDIR=$(TARGET_DIR) \
 >> -               prefix=/usr lib=lib install
 >> +       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
 >> +               DESTDIR=$(TARGET_DIR) prefix=/usr lib=lib install
 >> endef
 >> 
 >> # progs use fork()
 >> _______________________________________________
 >> buildroot mailing list
 >> buildroot at busybox.net
 >> http://lists.busybox.net/mailman/listinfo/buildroot

 Markos> Peter,

 Markos> After this commit I am seeing this problem

 Markos> Applying libcap-2.22-build-system.patch using patch:
 Markos> patching file libcap/Makefile
 Markos> patching file Make.Rules
 Markos> make: *** No rule to make target `host-attr', needed by `host-libcap-depends'.

 Markos> I am not sure what tirggers it. Any ideas? host-attr shouldn't be
 Markos> needed as I removed that from  LIBCAP_DEPENDENCIES

It's because HOST_LIBCAP_DEPENDENCIES defaults to the value of
LIBCAP_DEPENDENCIES, so you need to explicitly set it to the empty
string.

Didn't you see this problem with your version as well? As far as I can
see it isn't caused by my rename.

-- 
Bye, Peter Korsgaard
