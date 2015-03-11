From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 11 Mar 2015 07:06:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <CAMQcK5Kz4_vyCVv3Xq9Sms7UWd2Qjew1c60bXZzkfn6f40QeNg@mail.gmail.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <CAMQcK5Kz4_vyCVv3Xq9Sms7UWd2Qjew1c60bXZzkfn6f40QeNg@mail.gmail.com>
Message-ID: <20150311050652.GB2177@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On Tue, Mar 10, 2015 at 06:41:39PM -0500, Ryan Barnett wrote:
> > +1. You enabled +PACKAGE_OPENSSH+ to have a SSH server running on your
> > +   board. But you figure out that +sshd+ does not run well on your
> > +   target's architecture. Thus you decide to disable +PACKAGE_OPENSSH+
> > +   and enable +PACKAGE_DROPBEAR+ instead. You run +make+, +openssh+
> > +   gets built and installed. Problem: +openssh+ files are still present
> > +   in +output/target+!
> 
> One case that comes to mind here is that will this ensure that
> packages are installed in the correct order with dependencies? I am
> not exactly sure how the dependencies for packages works, but if you
> remove all the '.stamp_target_install' will that ensure that all the
> packages get installed in the correct order?
> 
> Busybox is the package that comes to my mind first that we need to
> ensure the installation order. From testing your scenario outlined
> above it appears that busybox gets installed before even dropbear
> would get built which would ensure that any full version of busybox
> would get install correctly over the symlinks to busybox.

The package dependencies system should ensure the right installation order. 
The following excerpts from package/pkg-generic.mk demonstrate that:

$(2)_TARGET_INSTALL_TARGET =    $$($(2)_DIR)/.stamp_target_installed

...

$(1):                   $(1)-install

...

$(1)-install:           $(1)-install-staging $(1)-install-target $(1)-install-images

...

$(1)-install-target:            $$($(2)_TARGET_INSTALL_TARGET)

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
