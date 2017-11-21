From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 21 Nov 2017 21:16:06 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171118223206.069b771a@gmx.net>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
 <20171118223206.069b771a@gmx.net>
Message-ID: <20171121201605.tzmasudql66iruxa@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> >  If the *.mk is expanded in alphabetical order, pkg-toolchain-external.mk will
> > always come before toolchain-external.mk. Otherwise it is possible (depending on
> > the state of hash tables or inode numbers or whatever) that
> > toolchain-external-custom.mk gets included first.

> According to this [1] it is a change from the used gnu-make version (on Tumbleweed
> GNU Make 4.2.1 is used)?
I found by bisecting that our bug is caused by this change in make:
4fd5672 ("Use Jenkins hash.")
https://git.savannah.gnu.org/cgit/make.git/commit/?id=4fd56724ad281498d3c8b27a4b25b4070f6e4e65
It's a version after last release (4.2.1).
I wonder whether it's a bug in make (I guess so) and whether we should report it
(probably).

As 4.2.1 compiled from source works, I don't know what broke it for 4.2.1 from openSUSE. I
expected this patch, but that is working.
https://build.opensuse.org/package/view_file/Base:System/make/make-sorted-glob.patch?expand=1

I tested Peter's patch with broken make versions, fixes them.

Kind regards,
Petr

> Regards,
> Peter

> [1] https://stackoverflow.com/questions/40558385/gnu-make-wildcard-no-longer-gives-sorted-output-is-there-any-control-switch
