From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 10 Mar 2018 20:30:55 -0300
Subject: [Buildroot] Unable to build Buildroot
References: <20180309191151.GA11285@pema>
Message-ID: <5aa46aaf74feb_16e6139a304805b4@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I add Mario Lang to CC.

On Fri, Mar 09, 2018 at 04:11 PM, Sh?rab wrote:

[snip]
> Baruch Siach (2018/03/08 15:13 +0200):
[snip]
>> 
>> Your host seems to have glibc 2.27 installed. In this version glibc added 
>> copy_file_range() which collides with a local definition of the same symbol in 
>> e2fsprogs. This issue is fixed in e2fsprogs commit 01551bdba1 (misc: rename 
>> copy_file_range to copy_file_chunk), which is included in version 1.43.8. The 
>> latest Buildroot release, 2018.02, has 1.43.9.
> 
> Okay thanks a lot!
> 
> I am facing another problemnow which may be slightly off-topic here but
> let me try.
> 
> The buildroot I am using is a submoduleof this repository:
> 
> https://github.com/mlang/brlpi

which is using a development version of Buildroot between 2017.11 and 2018.02:
2017.11-354-g85e08bf

> 
> Although I did makeclean etc., the buildroot submodule was not updated
> and I was not able to find a way to ask git to update it through a
> submodule subcommand.

It seems to me the Makefile for brlpi does the right thing for:
1) make clean
  - deinit the submodule buildroot
  - remove the Buildroot output dirs 
2) make
  - init/update the submodule buildroot
  - configure the builds as out-of-tree
    (http://nightly.buildroot.org/#_building_out_of_tree)
  - call make inside the output dirs

But if it fails for you, you could create an "issue" in brlpi github page.

> 
> So I went to the buildroot subdirectory, did a git fetch and then
> checked out 2018.02, which worked.

So you are working to update the Buildroot version for a br2-external.
It's possible you need to do other changes to the br2-external as well.

> 
> But then when I tried to run make cleand and make again to rebuild my
> image,
> 
> quickly I got the following error message:
> 
> umask 0022 && make -C /home/shindere/src/brlpi/buildroot O=/home/shindere/src/brlpi/brlpi0w/.
> /home/shindere/src/brlpi/package/brltty/brltty.mk:104: *** Package
> 'brltty' defined a second time in
> '/home/shindere/src/brlpi/package/brltty/'; previous definition was in

This is the package defined by the br2-external.

> 'package/brltty/'. Arr?t.

This is the package defined by Buildroot.
It was not there in commit 85e08bf, but it is there at 2018.02 as the patch
sent by Mario adding the package was applied.

> 
> I'm sory but I have no idea how to deal with this. Any suggestion would
> be welcome.

Tips:
 - read the br2-external section in the manual:
   http://nightly.buildroot.org/#customize
 - check the diff between the two brltty packages (the one from Buildroot and
   the one from br2-external);
 - remove the package from br2-external and do a clean build to check. If is
   breaks, you probably will need more changes to the br2-external.

Regards,
Ricardo
