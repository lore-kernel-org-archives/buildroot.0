From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 00:19:30 +0100
Subject: [Buildroot] [PATCH 1/2 v2] package/util-linux: libuuid needs
	-lintl
In-Reply-To: <cb66bb193b20ce08d5184a4eae854e9a0fa384f6.1417386541.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 30 Nov 2014 23:31:36 +0100")
References: <cover.1417386541.git.yann.morin.1998@free.fr>
 <cb66bb193b20ce08d5184a4eae854e9a0fa384f6.1417386541.git.yann.morin.1998@free.fr>
Message-ID: <87d284i8e5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When gettext is needed (with locales), libuuid needs to be linked
 > against -lintl.

 > In dynamic link, this is solved via the DT_NEEDED ELF tag, but for
 > static links, it does not get pulled in automatically.

 > Fix that by adding a Libs.private section to uuid.pc, but only if
 > it needed.

 > First part at fixing:
 >     http://autobuild.buildroot.net/results/c46/c467aeec258909bb82eda77123803944f97d8df8/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Baruch Siach <baruch@tkos.co.il>

 > ---
 > Changes v1 -> v2:
 >   - typo  (Baruch)
 > ---
 >  package/util-linux/util-linux.mk | 8 ++++++++
 >  1 file changed, 8 insertions(+)

 > diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
 > index 6ecd16d..dc10193 100644
 > --- a/package/util-linux/util-linux.mk
 > +++ b/package/util-linux/util-linux.mk
 > @@ -128,6 +128,14 @@ endif
 
 >  UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
 
 > +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE)$(BR2_PACKAGE_UTIL_LINUX_LIBUUID),yy)
 > +define UTIL_LINUX_TWEAK_UUID_PC
 > +	$(SED) '/Libs\.private: .*/d' $(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
 > +	printf "Libs.private: -lintl\n" >>$(STAGING_DIR)/usr/lib/pkgconfig/uuid.pc
 > +endef

As discussed on IRC, I don't think the SED line is needed - But lets
leave it here to be on the safe side.

Committed, thanks.

-- 
Bye, Peter Korsgaard
