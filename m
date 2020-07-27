From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 11:59:24 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/systemd: add an option
 BR2_PACKAGE_SYSTEMD_GUEST
In-Reply-To: <20200621080000.180089-7-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 21 Jun 2020 09:59:59 +0200")
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-7-francois.perrad@gadz.org>
Message-ID: <87k0ypuvlv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > this option allows a systemd tailored for a guest/container
 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/systemd/Config.in  | 14 ++++++++++----
 >  package/systemd/systemd.mk |  6 +++++-
 >  2 files changed, 15 insertions(+), 5 deletions(-)

 > diff --git a/package/systemd/Config.in b/package/systemd/Config.in
 > index dd3b8c534..a8595dce8 100644
 > --- a/package/systemd/Config.in
 > +++ b/package/systemd/Config.in
 > @@ -35,10 +35,10 @@ menuconfig BR2_PACKAGE_SYSTEMD
 >  	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 >  	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 >  	select BR2_PACKAGE_UTIL_LINUX_FSCK
 > -	select BR2_PACKAGE_KMOD
 > -	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # kmod-tools
 > -	select BR2_PACKAGE_KMOD_TOOLS
 > -	select BR2_TARGET_TZ_INFO
 > +	select BR2_PACKAGE_KMOD if !BR2_PACKAGE_SYSTEMD_GUEST
 > +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if !BR2_PACKAGE_SYSTEMD_GUEST # kmod-tools
 > +	select BR2_PACKAGE_KMOD_TOOLS if !BR2_PACKAGE_SYSTEMD_GUEST

If kmod isn't REQUIRED, then I am fine with only pulling it in depending
on BR2_PACKAGE_KMOD, E.G. for a non-modular kernel.

 > +	select BR2_TARGET_TZ_INFO if !BR2_PACKAGE_SYSTEMD_GUEST

This I don't get. Why would the timezone info not be needed in a guest?

Docker at least afaik doesn't do anything special to expose timezone to
guests:

date
Mon Jul 27 11:57:54 CEST 2020

docker run --rm -it debian:latest date
Mon Jul 27 09:57:56 UTC 2020

Care to send a patch to just make kmod optional instead of this _GUEST
option?

-- 
Bye, Peter Korsgaard
