From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Jan 2017 18:12:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/sngrep: needs ncurses
 form/menu/panel libraries
References: <20170128165745.5149-1-bernd.kuhls@t-online.de>
 <20170129143037.130cb2e3@free-electrons.com>
Message-ID: <mck1mdxd4l.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 29 Jan 2017 14:30:37 +0100 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sat, 28 Jan 2017 17:57:45 +0100, Bernd Kuhls wrote:
>> Please see configure checks for the various ncurses libraries:
>> 
>> form https://github.com/irontec/sngrep/blob/master/configure.ac#L90
>> 
>> menu https://github.com/irontec/sngrep/blob/master/configure.ac#L94
>> 
>> panel https://github.com/irontec/sngrep/blob/master/configure.ac#L86
>> 
>> Fixes
>> http://autobuild.buildroot.net/
results/3a4/3a4751fcc6184d562df80d1cd6bf53e788e21392/
>> 
>> Signed-off-by: Bernd Kuhls
>> <bernd.kuhls@t-online.de>
> 
> I don't yet understand those build failures. Indeed, locally, I'm able
> to build the following defconfig, which has form/menu/panel disabled,
> but sngrep builds fine:

Hi,

you are right, your defconfig works because BR2_PACKAGE_NCURSES_WCHAR is 
disabled. All autobuilder failures occur with BR2_PACKAGE_NCURSES_WCHAR=y.

sngrep.mk contains --disable-unicode due to problems while detecting 
ncurses.h, see commit log for details:
https://git.buildroot.net/buildroot/commit/package/sngrep?
id=bf09290977a5b43f53479dd52777fde0bb20bf5a

Using --disable-unicode forces the configure script to check for the 
ncurses libs without "w" in their name only:
https://github.com/irontec/sngrep/blob/master/configure.ac#L77, but they 
are not present with BR2_PACKAGE_NCURSES_WCHAR=y leading to the configure 
error seen by the autobuilders.

Quick fix: depends on !BR2_PACKAGE_NCURSES_WCHAR

Regards, Bernd
