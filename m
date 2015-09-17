From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 18 Sep 2015 00:39:16 +0300
Subject: [Buildroot] sysvinit-2.88 build is failing for ARM64
In-Reply-To: <20150917230753.2ad46e4c@free-electrons.com>
References: <ec4144432f3279ce0594dd6adbd847f5e4a7fb13.1442482205.git.jpinto@synopsys.com>
 <55FA95DB.80408@synopsys.com> <20150917103540.GO11632@tarshish>
 <55FA986B.9080208@synopsys.com> <55FA9C24.2060901@synopsys.com>
 <20150917111217.GP11632@tarshish>
 <20150917230753.2ad46e4c@free-electrons.com>
Message-ID: <20150917213916.GW11632@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Sep 17, 2015 at 11:07:53PM +0200, Thomas Petazzoni wrote:
> On Thu, 17 Sep 2015 14:12:17 +0300, Baruch Siach wrote:
> > On Thu, Sep 17, 2015 at 11:55:32AM +0100, Joao Pinto wrote:
> > > The library is checked as:
> > > ifneq ($(wildcard $(SYSROOT)/usr/lib*/libcrypt.a),)
> > > 
> > > And the library is located at:
> > > output/host/usr/aarch64-buildroot-linux-gnu/sysroot/usr/lib/aarch64-linux-gnu/libcrypt.a
> > > 
> > > Maybe for ARM64 we have to make an extra check?
> > 
> > This check is from package/sysvinit/0001-fix-libcrypt-test.patch. You'll 
> > probably need to adjust that patch to match this Linaro toolchain.
> 
> In fact, this path-based check is really crappy. I believe it's a lot
> better to ask gcc directly:
> 
> HAS_LIBCRYPT=$(shell f=`mktemp` && echo 'int main(void) {}' | $(CC) -o $$f -xc - -lcrypt >/dev/null 2>&1 && echo y && rm -f $$f)

Why not use /dev/null for gcc output instead of a temporary file? Something 
like:

HAS_LIBCRYPT=$(shell echo 'int main(void) {}' | $(CC) -o /dev/null -xc - -lcrypt >/dev/null 2>&1 && echo y)

baruch

> ifeq ($(HAS_LIBCRYPT),y)
> SULOGINLIBS += -lcrypt
> endif

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
