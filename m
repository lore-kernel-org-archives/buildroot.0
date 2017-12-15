From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Dec 2017 21:22:46 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171129211926.GA16373@x230>
References: <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
 <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
 <20171116072948.smctbcvxwkxgqoah@x230>
 <d13312cf-ae70-92fd-8819-a86c79d1723b@mind.be>
 <20171118223206.069b771a@gmx.net>
 <20171121201605.tzmasudql66iruxa@dell5510>
 <20171125150144.GC2798@scaer>
 <d76cd131-a5ec-631d-4c8b-4bb3d09fd2ca@mind.be>
 <20171129211926.GA16373@x230>
Message-ID: <20171215202245.y74stbkfdaysy3hp@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> > > So, this is a change in behaviour, and should be reported upstream as a
> > > bug. Will you do so?

TL;DR: No I don't, IMHO it's not a bug in make.

4fd5672 [1] which broke buildroot unified behaviour on different os, which is good. Since
this revision it behaves nearly the same as 3.81.  It's only coincidence that make from
current openSUSE Tumbleweed with make-sorted-glob.patch patch [2] behaves the same (this
patch is completely different from [1]).


I did comparison of make of these git versions: 3.81, 3.82, 4.2.1, 0ca3108 (last working
version on buildroot before fix b9d2d4cb4e), 4fd5672 (version which broke buildroot
b9d2d4cb4e~), 48c8a11 (current master) with this simple "project":

$ for i in a b c d; do touch $i.mk; sleep 1; done

$ cat > Makefile << EOF
$(info make: $(shell which make))
$(info make -v: $(shell make -v))

$(foreach i, $(sort $(wildcard *.mk)), $(info SORT $i))
$(foreach i, $(wildcard *.mk), $(info NOSORT $i))
include $(wildcard *.mk)
EOF


make version       | 3.81 | 3.82 | 4.2.1 | 4.2.1+[2] | 0ca3108 | 4fd5672
------------------------------------------------------------------------
wildcard the same  | yes  |  no  |  no   |    no     |   no    |   no
as sorted wildchard|      |      |       |           |
------------------------------------------------------------------------
wildcard the same  | yes  |  no  |  no   |    yes    |   no    |   yes
on different OS    |      |      |       |           |         |
------------------------------------------------------------------------
Breaks buildroot   |  no  |  no  |  no   |    yes    |   no    |   yes

NOTES:
wildcard changed in 3.82 and 4fd5672.
Behaviour on 48c8a11 (current master) is the same as on 4fd5672.
"4.2.1+[2]" is 4.2.1 + make-sorted-glob.patch patch [2].

[2] https://build.opensuse.org/package/view_file/Base:System/make/make-sorted-glob.patch?expand=1
[2] https://git.savannah.gnu.org/cgit/make.git/commit/?id=4fd56724ad281498d3c8b27a4b25b4070f6e4e65


Kind regards,
Petr
