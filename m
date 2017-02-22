From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Feb 2017 17:56:46 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-02-21
In-Reply-To: <20170222072902.D25702294C@mail.free-electrons.com>
References: <20170222072902.D25702294C@mail.free-electrons.com>
Message-ID: <20170222165645.GA12810@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> This is the list of Buildroot build failures that occured on
> 2017-02-21, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
> 
> Build failures related to your architectures:
> 
>         m68k |              berkeleydb-5.3.28 | http://autobuild.buildroot.net/results/f894e906ee1360da1fba7ca09c9d8837ea420011
>         m68k |              berkeleydb-5.3.28 | http://autobuild.buildroot.net/results/40423aa6c8f6fe66c771cca3e09b21e15525eb5f

Patch sent.

>         or1k |                 xfsprogs-4.8.0 | http://autobuild.buildroot.net/results/3fe0d96cf13af12b0051a95f7865d4e38f4a78af

I do not think this is particular specific to or1k.
Xfsprogs is linked statically. BR2_PACKAGE_GETTEXT is enabled.
Util-linux and libblkid/libuuid enable libintl functionality.
When xfsprogs statically link libblkid/libuuid references to libintl
are not resolved and the linking fails. Xfsprogs does not use
pkg-config so the Libs.private entries for uuid.pc/blkid.pc are
ignored. I tried to convince the xfsprogs buildsystem to add -lintl 
in this case.
LIBS="-lintl" helps to get through the configure phase, but not to
finally link all xfsprogs applications.

I have no clue how to manage this in a elegant way without patching
the Makefiles/buildrules/buildmacros :(

Any ideas?

best regards
 Waldemar 
 
