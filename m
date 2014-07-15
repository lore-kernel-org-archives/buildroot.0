From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:33:20 +0200
Subject: [Buildroot] [PATCH] Add target-clean makefile target
In-Reply-To: <CA+TH9Vmp+-+Dgqh-BVR6-aUB3w5w_ccy0=3Mw_KMKciyRyD1rA@mail.gmail.com>
References: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
 <20140715225415.08f5a5a6@free-electrons.com>
 <CA+TH9Vmp+-+Dgqh-BVR6-aUB3w5w_ccy0=3Mw_KMKciyRyD1rA@mail.gmail.com>
Message-ID: <20140715233320.46a95f1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Tue, 15 Jul 2014 23:07:30 +0200, Angelo Compagnucci wrote:

> > Thanks for this patch. However, until now, we've always rejected
> > similar patches, because they are potentially dangerous for users.
> > Users might be lead to think that they can do some changes in
> > "menuconfig", then do "make target-clean all" and get the updated
> > rootfs without rebuilding everything. This is obviously completely
> > wrong if the configuration of some packages is changed, if some
> > libraries are added/removed from the build, etc.
> 
> I think it hurts so much to buildroot not having a clean way to
> rebuild the rootfs after a changing.

There is a clean way:

	make clean all

That's the only way that is 100% guaranteed to give the correct result.
Any other solution requires the user to have some deep understanding of
what (s)he is doing.

> If this patch it's  naive, probably a corrected procedure should be
> documented somewhere.
> 
> Instead I think this patch is very useful (I use it everyday!), the
> caveats should be documented in a proper place in the manual. Honestly
> I haven't found a case in which cleaning and rebuilding rootfs this
> way crashed my rootfs, but I admit that I'm not so confident with
> buildroot internals.

Scenario:

  1/ make menuconfig
  2/ Enable BR2_PACKAGE_GIT and BR2_PACKAGE_OPENSSL
  3/ Run make, use your rootfs, you're happy
  4/ make menuconfig
  5/ Disable BR2_PACKAGE_OPENSSL
  6/ Since you don't want to rebuild everything, you just run your new
     "make target-clean" thing.
  7/ Run your rootfs, and now Git fails to work, because it is linked
     against OpenSSL, but OpenSSL isn't installed in the rootfs.

(7) is due to the fact that Git was not rebuilt, so it still believes
that OpenSSL support is available. The scenario above is fairly simple,
but there are many, many more similar but more subtle scenarios to
screw things up.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
