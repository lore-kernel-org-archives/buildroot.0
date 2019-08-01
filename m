From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 19:55:57 +0200
Subject: [Buildroot] [PATCH v2] qemu: fix host virtfs option
In-Reply-To: <20190801170924.22435-1-vincent.stehle@arm.com> ("Vincent
 =?utf-8?Q?Stehl=C3=A9=22's?= message of "Thu, 1 Aug 2019 19:09:24 +0200")
References: <20190801180239.262e5f6e@windsurf.home>
 <20190801170924.22435-1-vincent.stehle@arm.com>
Message-ID: <87r264vkgi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Stehl? <vincent.stehle@arm.com> writes:

 > Fix the build of host-qemu with virtfs enabled: fix a typo in makefile
 > conditional and add a dependency on host-libcap.

 > The virtfs configuration option was added by commit e0f49e648401
 > ("package/qemu: add option to enable virtual filesystem in host qemu").

 > Signed-off-by: Vincent Stehl? <vincent.stehle@arm.com>
 > Cc: Etienne Carriere <etienne.carriere@linaro.org>

 > ---
 > Changes v1 -> v2:
 >   - Forcibly disable virtfs when config option is =n rather than letting
 >     qemu auto-detect (as per Thomas' feedback)

 >  package/qemu/qemu.mk | 5 ++++-
 >  1 file changed, 4 insertions(+), 1 deletion(-)

 > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
 > index 73e0778d73..2c11f64ad0 100644
 > --- a/package/qemu/qemu.mk
 > +++ b/package/qemu/qemu.mk
 > @@ -271,8 +271,11 @@ HOST_QEMU_OPTS += --enable-vde
 >  HOST_QEMU_DEPENDENCIES += host-vde2
 >  endif
 
 > -ifdef ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
 > +ifeq ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
 >  HOST_QEMU_OPTS += --enable-virtfs
 > +HOST_QEMU_DEPENDENCIES += host-libcap

I was going to say that we also need host-attr, but looking closer at
the configure step I see that the xattr support in glibc is also
accepted.

Committed, thanks.

-- 
Bye, Peter Korsgaard
